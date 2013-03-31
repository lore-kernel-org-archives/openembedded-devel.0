Received: from mail-vc0-f178.google.com ([209.85.220.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UMHpB-0006pJ-UU
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Mar 2013 14:57:30 +0200
Received: by mail-vc0-f178.google.com with SMTP id hz11so1633999vcb.23
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Mar 2013 05:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=25IhZ2QogTx+xWGYijrPu8+C0hhRbufDzJt476Fo9yk=;
	b=YRUR8VN7VC3jZ5BwNqH9sPlZQPJx6LvE4Y0r/DrBxnIJQXoGhjsxxhRCNuhUsu3ncO
	XUc32IoFSyA2T9MsazMkJzl9Oxds+4rzirKVOVfyoe6Tkwmu1RBN+kA8UGYdvh8MrYXb
	I5fuzMjl6VcFXtktNzI1C9X2p6OyvrvaH7xrUK14Rn8vLuw9Wh6zBdDp1yfIBzT877HV
	QqFMSNrbbNrAZJTHVNId+KJ3d0CTNirjNhtv4SLBw5cxChbzaKyl3UKlU+KwBVw8XauL
	zOC2QC1mlA36IyS+yCywQiezTfeCb0Q+zmZn/iJJef9iN43bqF152ExukG1YlWJgvjvJ
	LJ2w==
MIME-Version: 1.0
X-Received: by 10.58.23.199 with SMTP id o7mr6685889vef.2.1364733622761; Sun,
	31 Mar 2013 05:40:22 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Sun, 31 Mar 2013 05:40:22 -0700 (PDT)
In-Reply-To: <1364584207-3047-4-git-send-email-schnitzeltony@googlemail.com>
References: <1364584207-3047-1-git-send-email-schnitzeltony@googlemail.com>
	<1364584207-3047-4-git-send-email-schnitzeltony@googlemail.com>
Date: Sun, 31 Mar 2013 14:40:22 +0200
Message-ID: <CALbNGRSB4AFAhhhmfD4258dr7OQL2vUN2aZbtEgYvZvv4G0pmg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [meta-xfce 3/4] xfce4-closebutton-plugin: initial add
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
X-List-Received-Date: Sun, 31 Mar 2013 12:57:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Friday, March 29, 2013, Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m>
wrote:
> I do not have the environment and the time to create a tarball, so take
sources
> from my git repo.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../closebutton/xfce4-closebutton-plugin_git.bb    |   22
++++++++++++++++++++
>  1 files changed, 22 insertions(+), 0 deletions(-)
>  create mode 100644 meta-xfce/recipes-panel-plugins/closebutton/
xfce4-closebutton-plugin_git.bb
>
> diff --git a/meta-xfce/recipes-panel-plugins/closebutton/
xfce4-closebutton-plugin_git.bbb/meta-xfce/recipes-panel-plugins/closebutto=
n/
xfce4-closebutton-plugin_git.bb
> new file mode 100644
> index 0000000..cbc7df5
> --- /dev/null
> +++ b/meta-xfce/recipes-panel-plugins/closebutton/
xfce4-closebutton-plugin_git.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "Plugin displaying close button for application currentl=
y
active"
> +SECTION =3D "x11"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db6952d9a47fc2ad0f315510e12904=
55f"
> +
> +inherit xfce-panel-plugin gtk-icon-cache perlnative
> +
> +DEPENDS +=3D "perl-native exo-native libwnck xfconf"
Seems perl-native belongs to exo. Will send v2.

Andreas
> +
> +PV =3D "0.1.0+gitr${SRCPV}"
> +
> +SRC_URI =3D "git://
gitorious.org/xfce/xfce4-closebutton-plugin.git;protocol=3Dgit;branch=3Dmas=
ter"
> +SRCREV =3D "bd76154afe26ba8a5251a1887d88f9d855301850"
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OECONF +=3D "--enable-maintainer-mode"
> +
> +do_configure_prepend() {
> +       NOCONFIGURE=3Dyes ./autogen.sh
> +}
> +
> +FILES_${PN} +=3D "${datadir}/xfce4/closebutton/themes"
> --
> 1.7.4.4
>
>

