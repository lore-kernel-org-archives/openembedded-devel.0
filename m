Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rtkqw-0000sW-9q
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 20:00:50 +0100
Received: by lbol12 with SMTP id l12so755731lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Feb 2012 10:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=I6o/YmrKXb/wro8Sc3bbVZJ5Nn++sSQAhy3b/ev7/tg=;
	b=tekkgSsFTKsXD8jQEVB7Czl4DrPhZnO/UEwUpGkbw6CvAibmXdA/B22BPYFdAOyfB1
	kSshroPHnlJu084C+RRfN6B9JnwHDeRCZ6dDG1U2hZ5f6zkYcdGLpf9Wb0uqLE4WBkfo
	E91t8XHSqpepAQT6e5L5VYnYRTkTWMsDP8kQU=
MIME-Version: 1.0
Received: by 10.112.27.165 with SMTP id u5mr3039518lbg.48.1328381571443; Sat,
	04 Feb 2012 10:52:51 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Sat, 4 Feb 2012 10:52:51 -0800 (PST)
In-Reply-To: <1328380249-11697-2-git-send-email-tworaz666@gmail.com>
References: <1328380249-11697-1-git-send-email-tworaz666@gmail.com>
	<1328380249-11697-2-git-send-email-tworaz666@gmail.com>
Date: Sat, 4 Feb 2012 19:52:51 +0100
Message-ID: <CALbNGRSDEbmPKJi1CDNk1ifoLdG2x9C6q6d6pzo=X-NCFtMagQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][PATCH 1/3] xfconf: Update to latest stable version 4.8.1.
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
X-List-Received-Date: Sat, 04 Feb 2012 19:00:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 4, 2012 at 7:30 PM, Peter Tworek <tworaz666@gmail.com> wrote:
> http://git.xfce.org/xfce/xfconf/tag/?id=3Dxfconf-4.8.1
>
> Run tested on netbook pro.
>
> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> ---
> =A0meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb | =A0 15 ---------------
> =A0meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb | =A0 13 +++++++++++++
> =A02 files changed, 13 insertions(+), 15 deletions(-)
> =A0delete mode 100644 meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb
> =A0create mode 100644 meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb
>
> diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb b/meta-xfce/re=
cipes-xfce/xfconf/xfconf_4.8.0.bb
> deleted file mode 100644
> index 65efffd..0000000
> --- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.0.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -DESCRIPTION =3D "Xfce configuration daemon and utilities"
> -SECTION =3D "x11/wm"
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
> -DEPENDS =3D "dbus-glib libxfce4util perl-native"
> -
> -PR =3D "r0"
> -
> -inherit xfce
> -
> -FILES_${PN} +=3D "${libdir}/xfce4/xfconf/xfconfd \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/dbus-1/services/org.xfce.Xfco=
nf.service"
> -
> -SRC_URI[md5sum] =3D "0f11ed1ec7789c5c4c3fcc7cdb3c2940"
> -SRC_URI[sha256sum] =3D "e071d55982238f997a691ff4bb08ef39e4c86bae31cf69b6=
666bc0cdadd1b85d"
> diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb b/meta-xfce/re=
cipes-xfce/xfconf/xfconf_4.8.1.bb
> new file mode 100644
> index 0000000..51df2ee
> --- /dev/null
> +++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.8.1.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "Xfce configuration daemon and utilities"
> +SECTION =3D "x11/wm"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
> +DEPENDS =3D "dbus-glib libxfce4util perl-native"
> +
> +inherit xfce
> +
> +FILES_${PN} +=3D "${libdir}/xfce4/xfconf/xfconfd \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/dbus-1/services/org.xfce.Xfco=
nf.service"
> +
> +SRC_URI[md5sum] =3D "70b4185aa7eed8a85f015f16c5c86d36"
> +SRC_URI[sha256sum] =3D "9860737539fab2b852e8c07c50c205a5fbe894b08bcb4488=
a70e3fd6c75993cb"
> --
> 1.7.3.4
>
Have same here but did not send because of following issue: After
setting up 1st session (panels / plugins...). and closing session in
the 2nd session panel is gone. Restarting manual causes annoying error
messages. How did you test this one?

Andreas


