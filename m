Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RtVpi-0001cy-T7
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 03:58:34 +0100
Received: by lahc1 with SMTP id c1so2130332lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2012 18:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=f8IwZU83s5I/FeLOg68c9PDT5d8RIUWj5vYc0GU2Wk4=;
	b=BPbrudhWYSwhnh4WpqRNzBu3MskoGoRQqysrhX5YXi2r3f8adWuSQkG+rIYC/X9IRe
	KRbFeK6/Jv+6l9ZoVbVMZ32JG5u/ib2k/uAqm08blWZhM+nQlSrtwkqm0GYmFseWqxuv
	1u9bwdmm6KBL2zxpQeANSyPH6En0oSAhD5qLk=
MIME-Version: 1.0
Received: by 10.112.84.1 with SMTP id u1mr2536489lby.35.1328323835868; Fri, 03
	Feb 2012 18:50:35 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Fri, 3 Feb 2012 18:50:35 -0800 (PST)
In-Reply-To: <1328313811-12627-1-git-send-email-tworaz666@gmail.com>
References: <1328313811-12627-1-git-send-email-tworaz666@gmail.com>
Date: Sat, 4 Feb 2012 03:50:35 +0100
Message-ID: <CALbNGRRRH2QCkdpzKyHwdOzd-jPGkV2Fmhff9cD5aVBggoQS7g@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][PATCH] xfce4-power-manager: Add initial recipe for version 1.0.10.
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
X-List-Received-Date: Sat, 04 Feb 2012 02:58:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 4, 2012 at 1:03 AM, Peter Tworek <tworaz666@gmail.com> wrote:
> Run tested on netbook pro.
>
> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> ---
> =A0.../xfce4-power-manager_1.0.10.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 28 ++++++++++++++++++++
> =A01 files changed, 28 insertions(+), 0 deletions(-)
> =A0create mode 100644 meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-po=
wer-manager_1.0.10.bb
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manag=
er_1.0.10.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manag=
er_1.0.10.bb
> new file mode 100644
> index 0000000..4641178
> --- /dev/null
> +++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.0.=
10.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION =3D "Power manager for the Xfce desktop environment"
> +HOMEPAGE =3D "http://goodies.xfce.org/projects/applications/xfce4-power-=
manager"
> +SECTION =3D "x11"
> +
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
> +
> +inherit xfce
> +
> +DEPENDS =3D "gtk+ glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libn=
otify \
> + =A0 =A0 =A0 =A0 =A0 libxrandr virtual/libx11 libxext xfce4-panel"
> +RDEPENDS_${PN} =3D "networkmanager udisks upower polkit"
> +
> +EXTRA_OECONF =3D " \
> + =A0 =A0--enable-polkit \
> + =A0 =A0--enable-network-manager \
networkmanager conflicts with conman. I don't if this makes sense to
use conman with xfce (am using networkmanager too). What happens if
this option is not set?
> + =A0 =A0--enable-panel-plugins \
> + =A0 =A0"
> +
> +PACKAGES +=3D "xfce4-brightness-plugin"
> +FILES_${PN} +=3D "${datadir}/polkit-1"
> +FILES_xfce4-brightness-plugin =3D " \
> + =A0 =A0${libdir}/xfce4/panel-plugins/xfce4-brightness-plugin \
> + =A0 =A0${datadir}/xfce4/panel-plugins/xfce4-brightness-plugin.desktop \
> + =A0 =A0"
> +
> +SRC_URI[md5sum] =3D "38cbd272eb30e36ae538d9f38858bd38"
> +SRC_URI[sha256sum] =3D "80e4bb44f81c485ec09654dde432d6e28667d49a78762563=
2a4413aac30422f0"
> --
> 1.7.3.4
>
>
This was part of my TODO - Thanks. Give it a test next week.

Andreas


