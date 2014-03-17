Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4A3F46AB7D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 08:39:35 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id id10so5265149vcb.26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 01:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ZsTFyl3qG0emcZr8+upI4ODYV5gIjwxCuvWO+rcbjNg=;
	b=avlhQS0RDpVzuhAsEU6u5zvffEqqyIf+JFs0QDKAjX/5rj5ASTm8mSlELN7tTm4sT/
	1jcwp5GwT156gi6MAILIZaUKVCw2Bu86z79C95qiq20TPVPU7bPBGkaQZ/Aq2HVcz48g
	htnAdfT8lMxS94qIE0fec+Ca/kH/WYbNvZ6ijAZk/SB3CZOD+a5m5AckH190EoJSgbfT
	ycDTl+xqbUQJmtsWybRaWJl9HkDgh1iD0cPPcbAKfV3AWYrOte0PmZtL4y/itHbThXb0
	8eF2+QTwQtO+z1WVxKCTdqLlyf42vaPbpGQCIUuFbvs6TREk3qr/5+v7Q42d7z9kV3//
	pPSA==
MIME-Version: 1.0
X-Received: by 10.221.22.71 with SMTP id qv7mr26323vcb.34.1395045576423; Mon,
	17 Mar 2014 01:39:36 -0700 (PDT)
Received: by 10.52.120.4 with HTTP; Mon, 17 Mar 2014 01:39:36 -0700 (PDT)
In-Reply-To: <1395016995-19191-1-git-send-email-stephen.arnold42@gmail.com>
References: <1395016995-19191-1-git-send-email-stephen.arnold42@gmail.com>
Date: Mon, 17 Mar 2014 09:39:36 +0100
Message-ID: <CALbNGRQHS16u634VZgjk4nHy=LiRowK2pc1J1xW6eXNDds_7Xg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH v2 1/1] recipes-xfce/libxfce4ui: build fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Mar 2014 08:39:36 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 17, 2014 at 1:43 AM, Stephen Arnold
<stephen.arnold42@gmail.com> wrote:
> From: "Stephen Arnold" <stephen.arnold42@gmail.com>
>
> libxfce4ui build fixes:
>  - updated depends
>  - set SRCREV to 4.10.0 tag
AFAICR this will break xfce4-settings see commit
b3a2a01b40affbedc2b0951f7180c1212d24d532.
>  - added missing inherit
>  - added pre-config task
>
> Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
>
> ---
>  .../recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb   | 23 ++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
> index cc63a9f..b17ebc1 100644
> --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
> +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
> @@ -2,23 +2,28 @@ SUMMARY = "Xfce4 Widget library and X Window System interaction"
>  SECTION = "x11/libs"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
> -DEPENDS = "gtk+ intltool libxfce4util startup-notification xfconf glade3"
> +DEPENDS = "perl-native glib-2.0 gtk+ intltool libxfce4util xfconf xfce4-dev-tools virtual/libx11 libsm libice"
>
> -inherit xfce
> +inherit autotools gettext xfce
>
>  SRC_URI = " \
>      git://git.xfce.org/xfce/libxfce4ui;protocol=git \
>      file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch \
> -    file://0002-configure.ac.in-remove-optional-gtk3-support.patch \
>  "
> -SRCREV = "530b72f50fcbd8cb4b970fcc97be0321bf78183e"
> -PV = "4.10.0+git${SRCPV}"
> +
> +SRCREV = "cf85eac7804e09b24f3e8fb4165f60b1c9f8cf49"
> +PV = "4.10.0"
>  S = "${WORKDIR}/git"
>
> -EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[gladeui] = "--enable-gladeui,--disable-gladeui,glade3"
> +PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
> +
> +EXTRA_OECONF += "--enable-maintainer-mode --disable-debug --with-vendor-info=${DISTRO}"
>
> -do_configure_prepend() {
> -       NOCONFIGURE=yes ./autogen.sh
> +do_patch_extra() {
> +    sed -i /GTK3/d ${S}/configure.ac.in
> +    NOCONFIGURE=yes ./autogen.sh
>  }
>
>  FILES_${PN}-dbg += "${libdir}/glade3/modules/.debug"
> @@ -27,3 +32,5 @@ FILES_${PN}-dev += "${libdir}/glade3/modules/*.la \
>  PACKAGES += "${PN}-glade"
>  FILES_${PN}-glade = "${libdir}/glade3 \
>                       ${datadir}/glade3"
> +
> +addtask do_patch_extra before do_configure after do_patch
why not do_configure_prepend?

You say 'build fixes'. Could you append a log showing why these
changes are necessary?

Andreas

