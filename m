Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oghzx-0007S4-UF
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 19:43:34 +0200
Received: by fxm12 with SMTP id 12so2596704fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 10:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=KU+aaWqDkXfNodq1U0k+saH1ioFCNgPCOIM/7HnhSs0=;
	b=qf0k2SaGLVDPsQbuqDS6/tQHsYBbBtJ1JaW7gLpOXD1gw/fPU5wVHIH49lGVHmcdbO
	GRXlkIEGLWhRXTnFcf0vphvQh26Cl55JwTqmYOwV6TlvBpCCPYCfa277QtmPihSEW4qx
	g/+XxCq8apaS68Bc/yANx9RwjmxM5rx+Rk2rQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=n9hEFpNqc3opG0J0KKZy0A0GS1ULO9CSx9kA6hgrBJ9W3P39hdBSaAPNTEP5k+EihT
	h9L9RqT4T1ipnQ8h/kUPjgE3Rc5n6GHR34XW7g437qs0UCPCkDO7opGCYWz0PEzp+yzb
	29wd4jmBb9XkGQ0QpiiMI6gsnl//nxiNOGqh4=
MIME-Version: 1.0
Received: by 10.103.108.3 with SMTP id k3mr1034368mum.41.1280943800960; Wed, 
	04 Aug 2010 10:43:20 -0700 (PDT)
Received: by 10.102.213.28 with HTTP; Wed, 4 Aug 2010 10:43:20 -0700 (PDT)
In-Reply-To: <1280926084-7605-1-git-send-email-henri.bragge@dcombus.com>
References: <AANLkTik=Xm39yJcLnLH12heRyvS0gUEvSwFCJMBtWeLi@mail.gmail.com>
	<1280926084-7605-1-git-send-email-henri.bragge@dcombus.com>
Date: Wed, 4 Aug 2010 19:43:20 +0200
Message-ID: <AANLkTinnz+cB5Au1hMsniwFbCSjo-EaNWoR=9Xae4krA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2 1/2] recipe for gsnmp-0.3.0
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
X-List-Received-Date: Wed, 04 Aug 2010 17:43:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/4 Henri Bragge <henri.bragge@dcombus.com>

> Signed-off-by: Henri Bragge <henri.bragge@dcombus.com>
> ---
>  recipes/gsnmp/gsnmp_svn.bb |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/gsnmp/gsnmp_svn.bb
>
> diff --git a/recipes/gsnmp/gsnmp_svn.bb b/recipes/gsnmp/gsnmp_svn.bb
> new file mode 100644
> index 0000000..3a2ac09
> --- /dev/null
> +++ b/recipes/gsnmp/gsnmp_svn.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION =3D "SNMP library written on top of glib and gnet."
> +SECTION =3D "libs/network"
> +LICENSE =3D "GPLv2"
> +DEPENDS =3D "glib-2.0 gnet"
> +SRCREV =3D "3372"
> +PV =3D "0.3.0+svnr${SRCREV}"
> +PR =3D "r0"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI =3D "svn://
> cnds.eecs.jacobs-university.de/svn/schoenw/src/gsnmp;module=3Dtrunk;proto=
=3Dhttps
> "
> +S =3D "${WORKDIR}/trunk"


tried to build this, stranded at this:

NOTE: Fetch svn://
cnds.eecs.jacobs-university.de/svn/schoenw/src/gsnmp;module=3Dtrunk;proto=
=3Dhttps
Error validating server certificate for '
https://cnds.eecs.jacobs-university.de:443':
 - The certificate is not issued by a trusted authority. Use the
   fingerprint to validate the certificate manually!
Certificate information:
 - Hostname: cnds.eecs.jacobs-university.de
 - Valid: from Tue, 22 Sep 2009 08:07:16 GMT until Sun, 21 Sep 2014 08:07:1=
6
GMT
 - Issuer: IRC-IT, Jacobs University Bremen gGmbH, DE
 - Fingerprint: a3:ed:4f:1d:a7:3b:dc:99:aa:0f:cb:d7:d3:19:f5:b0:ef:1c:06:00
(R)eject, accept (t)emporarily or accept (p)ermanently? svn: OPTIONS of '
https://cnds.eecs.jacobs-university.de/svn/schoenw/src/gsnmp/trunk': Server
certificate verification failed: issuer is not trusted (
https://cnds.eecs.jacobs-university.de)
NOTE: Task failed: Fetch failed: Fetch command export HOME=3D/home/frans;
export SSH_AUTH_SOCK=3D/tmp/ssh-iwZKs1963/agent.1963; export
PATH=3D/home/frans/oe/tmp_angstrom/sysroots/i686-linux/usr/armv7a/bin:/home=
/frans/oe/tmp_angstrom/sysroots/i686-linux/usr/sbin:/home/frans/oe/tmp_angs=
trom/sysroots/i686-linux/usr/bin:/home/frans/oe/tmp_angstrom/sysroots/i686-=
linux/sbin:/home/frans/oe/tmp_angstrom/sysroots/i686-linux//bin:/home/frans=
/oe/bitbake/bin:/home/frans/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/=
usr/X11R6/bin:/usr/games:/opt/kde3/bin:/usr/lib/mit/bin:/usr/lib/mit/sbin:/=
opt/gnome/bin:/usr/lib/qt3/bin:/home/frans/bin:.;
/usr/bin/env svn co -r 3372
https://cnds.eecs.jacobs-university.de/svn/schoenw/src/gsnmp/trunk@3372trun=
k
failed with signal 1, output:
Error validating server certificate for '
https://cnds.eecs.jacobs-university.de:443':
 - The certificate is not issued by a trusted authority. Use the
   fingerprint to validate the certificate manually!
Certificate information:
 - Hostname: cnds.eecs.jacobs-university.de
 - Valid: from Tue, 22 Sep 2009 08:07:16 GMT until Sun, 21 Sep 2014 08:07:1=
6
GMT
 - Issuer: IRC-IT, Jacobs University Bremen gGmbH, DE
 - Fingerprint: a3:ed:4f:1d:a7:3b:dc:99:aa:0f:cb:d7:d3:19:f5:b0:ef:1c:06:00
(R)eject, accept (t)emporarily or accept (p)ermanently? svn: OPTIONS of '
https://cnds.eecs.jacobs-university.de/svn/schoenw/src/gsnmp/trunk': Server
certificate verification failed: issuer is not trusted (
https://cnds.eecs.jacobs-university.de)

NOTE: oestats: task failed, see
http://tinderbox.openembedded.net/packages/668019/
ERROR: TaskFailed event exception, aborting


No idea what the policy on this is, but I'm not too eager to add all kind o=
f
certificates to my system

Frans

