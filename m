Received: from [206.46.173.15] (helo=vms173015pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M4M4S-0004nV-2m
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 23:33:00 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJL00EIBQ6Y5D6O@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	13 May 2009 16:25:59 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 94A6C14AF5F; Wed,
	13 May 2009 17:25:46 -0400 (EDT)
Date: Wed, 13 May 2009 17:25:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090513212546.GF32320@denix.org>
References: <1242247998-30548-1-git-send-email-clarson@mvista.com>
MIME-version: 1.0
In-reply-to: <1242247998-30548-1-git-send-email-clarson@mvista.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] bitbake.conf, freeze.inc: Add version lockdown	implementation and use it by default.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 May 2009 21:33:00 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline
Content-transfer-encoding: quoted-printable

On Wed, May 13, 2009 at 01:53:18PM -0700, Chris Larson wrote:
> For each recipe which completes a task successfully, this emits the curre=
nt
> version into ${TMPDIR}/versions.conf as a PREFERRED_VERSION line.
> ${TMPDIR}/versions.conf and conf/versions.conf are automatically included,
> in that order, in subsequent builds, to provide more deterinistic builds =
by
> default, and to let the user make the lockdown persist via a simple cp
> command.
>=20
> Assuming that the latest ncurses in the recipes is 5.7, and that 5.7 is
> preferred over 5.3 by default given any distro version preferences, if th=
ey
> exist, the following are examples of its behavior:
>=20
> $ rm -rf tmp
> $ bitbake ncurses-5.3
> $ bitbake -c clean ncurses
> $ bitbake ncurses # builds ncurses 5.3
>=20
> $ cp tmp/versions.conf conf/
> $ rm -rf tmp
> $ bitbake ncurses # builds ncurses 5.3

Very nice! Let me try it here...

> Signed-off-by: Chris Larson <clarson@mvista.com>
> ---
>  conf/bitbake.conf |    1 +
>  conf/freeze.inc   |   71 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 72 insertions(+), 0 deletions(-)
>  create mode 100644 conf/freeze.inc
>=20
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index f7df60c..9b6ffcc 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -618,6 +618,7 @@ OVERRIDES =3D "local:${MACHINE}:${DISTRO}:${TARGET_OS=
}:${TARGET_ARCH}:build-${BUIL
>  ##################################################################
> =20
>  require conf/collections.inc
> +require conf/freeze.inc
>  include conf/site.conf
>  include conf/auto.conf
>  include conf/local.conf
> diff --git a/conf/freeze.inc b/conf/freeze.inc
> new file mode 100644
> index 0000000..82acebf
> --- /dev/null
> +++ b/conf/freeze.inc
> @@ -0,0 +1,71 @@
> +# Recipe version "freeze" aka lockdown implementation.
> +#
> +# For each recipe which completes a task successfully, this emits the cu=
rrent
> +# version into ${TMPDIR}/versions.conf as a PREFERRED_VERSION line.
> +# ${TMPDIR}/versions.conf and conf/versions.conf are automatically inclu=
ded,
> +# in that order, in subsequent builds, to provide more deterinistic buil=
ds by
> +# default, and to let the user make the lockdown persist via a simple cp
> +# command.
> +#
> +# Assuming that the latest ncurses in the recipes is 5.7, and that 5.7 is
> +# preferred over 5.3 by default given any distro version preferences, if=
 they
> +# exist, the following are examples of its behavior:
> +#
> +# $ rm -rf tmp
> +# $ bitbake ncurses-5.3
> +# $ bitbake -c clean ncurses
> +# $ bitbake ncurses # builds ncurses 5.3
> +#
> +# $ cp tmp/versions.conf conf/
> +# $ rm -rf tmp
> +# $ bitbake ncurses # builds ncurses 5.3
> +
> +__FREEZEFN ?=3D "versions.conf"
> +__FREEZEFILE =3D "${TMPDIR}/${__FREEZEFN}"
> +__FREEZELINE =3D 'PREFERRED_VERSION_%s =3D "%s"'
> +__FREEZELINERE =3D '^PREFERRED_VERSION_(.*) =3D "(.*)"$'
> +
> +include ${__FREEZEFILE}
> +include conf/${__FREEZEFN}
> +
> +def freeze_add(d):
> +    fn =3D d.getVar("__FREEZEFILE", 1)
> +    f =3D open(fn, "a")
> +    f.write("%s\n" % (d.getVar("__FREEZELINE", 1) % (d.getVar("PN", 1), =
d.getVar("PV", 1))))
> +    f.close()
> +
> +def freeze_finish(d):
> +    import re
> +
> +    # Cleaning up the freezefile
> +    freezefile =3D d.getVar("__FREEZEFILE", 1)
> +    verdata =3D {}
> +
> +    try:
> +        f =3D open(freezefile, "r")
> +    except (OSError, IOError):
> +        pass
> +
> +    regexp =3D re.compile(d.getVar("__FREEZELINERE", 1))
> +    for line in f:
> +        m =3D regexp.match(line)
> +        verdata[m.group(1)] =3D m.group(2)
> +    f.close()
> +
> +    fl =3D d.getVar("__FREEZELINE", 1)
> +    f =3D open(freezefile, "w")
> +    f.writelines([("%s\n" % (fl % (pn, pv))) for (pn, pv) in verdata.ite=
ms()])
> +    f.close()
> +
> +addhandler freeze_eventhandler
> +python freeze_eventhandler () {
> +    from bb.event import BuildCompleted
> +    from bb.build import TaskSucceeded
> +
> +    if isinstance(e, TaskSucceeded):
> +        freeze_add(e.data)
> +    elif isinstance(e, BuildCompleted):
> +        freeze_finish(e.data)
> +}
> +
> +# vim: set ft=3Dbitbake fenc=3Dutf-8 sts=3D4 sw=3D4 et :
> --=20
> 1.6.2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


