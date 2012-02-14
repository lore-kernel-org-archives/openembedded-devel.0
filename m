Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rx6B6-00080V-1Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Feb 2012 01:23:28 +0100
Received: by lahc1 with SMTP id c1so4665567lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2012 16:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ek++T4VondIcU+/vxsYYNihruOUU59QK+slZYKxdifc=;
	b=I8yyZEfRRhZb0RAXsM1++PK6hyUJ1Zl6tk2kNNEmiNGu8fpfsYpEddzRd2As43ZGVj
	ro9gUikX1jI5vOPTk5slbSugCHtkc23/7lNNdrfyQic+asey6CToGug4G9Rvp9H58rjs
	B/fC8LYvdAABMmc5AhXnbsNiO6OKVGfG5RgyE=
MIME-Version: 1.0
Received: by 10.152.127.136 with SMTP id ng8mr12859370lab.16.1329178517789;
	Mon, 13 Feb 2012 16:15:17 -0800 (PST)
Received: by 10.112.108.164 with HTTP; Mon, 13 Feb 2012 16:15:17 -0800 (PST)
In-Reply-To: <1329165082-18663-1-git-send-email-tworaz666@gmail.com>
References: <CALbNGRRXRVVjAN-soiseru_RBJkM0KQMBWnAzfy4Ah4AEDaDZA@mail.gmail.com>
	<1329165082-18663-1-git-send-email-tworaz666@gmail.com>
Date: Tue, 14 Feb 2012 01:15:17 +0100
Message-ID: <CALbNGRSXgOWgYjVnYDJN3jYo7L+erA6Qv_uBsemCc75niR8-vQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/3 v3] xfce4-panel: Remove static version of panel plugins.
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
X-List-Received-Date: Tue, 14 Feb 2012 00:23:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2012 at 9:31 PM, Peter Tworek <tworaz666@gmail.com> wrote:
> They have no actual use and trigger QA warnings.
>
> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> ---
> =A0.../recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb =A0| =A0 =A09 +++++-=
---
> =A01 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb b/me=
ta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
> index 0cd8eba..a2b3ea9 100644
> --- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "GPLv2"
> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D26a8bd75d8f8498bdbbe64a2779=
1d4ee"
> =A0DEPENDS =3D "libxfce4util garcon libxfce4ui xfconf exo gtk+ dbus cairo=
 virtual/libx11 libxml2 libwnck"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0inherit xfce
>
> @@ -19,6 +19,10 @@ python populate_packages_prepend() {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 '${bindir}/*%s*'])
> =A0}
>
> +do_install_append () {
> + =A0 =A0find "${D}/${libdir}/xfce4/panel/plugins" -name '*.a' -exec rm -=
f {} +
> +}
> +
> =A0PACKAGES_DYNAMIC =3D "${PN}-plugin-*"
>
> =A0FILES_${PN} +=3D "${libdir}/xfce4/panel/migrate \
> @@ -27,8 +31,5 @@ FILES_${PN} +=3D "${libdir}/xfce4/panel/migrate \
> =A0FILES_${PN}-dbg +=3D "${libdir}/xfce4/panel/plugins/.debug \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
>
> -FILES_${PN}-dev +=3D "${libdir}/xfce4/panel/plugins/*.*a \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> -
> =A0SRC_URI[md5sum] =3D "9d7bf0503d5867c4044cef04bb5845b1"
> =A0SRC_URI[sha256sum] =3D "66f1266a1242ee5ecada995a4a584dd9802aa24456759b=
40b0c29227c39bed03"
> --
> 1.7.3.4
Acked-by: Andreas M=FCller <schnitzeltony@googlemail.com>


