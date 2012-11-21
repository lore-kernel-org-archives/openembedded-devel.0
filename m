Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TbCtK-0003DK-6l
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 17:11:10 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so4824882ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2012 07:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=BdT4d+2Sv31+uEnBjxfZjqQO3luJFg3sRlrPQ0FXIzs=;
	b=LusipSx79unmhgWWVAol5QkY5HA5aE16jqZ7YjyjiRyDurxc8Ac/yLo7WeGW8sD8XX
	0KZHF8Cienirg5JqieUui4w7TA/J3Eilx+hPbY2YD3wGsC4AhHxuRbNmk6Le293GDUp4
	VaAQ3exrQq9iksvDayEWmYOZq8GPxD+YHV2njAe6H5+GcBftw3SRjNnYa3Gj6MVJzuvj
	l4Z+HmWw3bp8FfbfPcfYxFFzpxZQGPKjJuqCpVHSofoV2tnDsn6+QBjFKpVlPsM6XcSN
	8fumQZAHlZGzHAAmqSKps1vJdwns4S0374L+9VWgpSIV0TfZSYfblklWmheN2/zVqUZW
	UB0A==
MIME-Version: 1.0
Received: by 10.50.153.229 with SMTP id vj5mr14160336igb.50.1353513424622;
	Wed, 21 Nov 2012 07:57:04 -0800 (PST)
Received: by 10.64.20.113 with HTTP; Wed, 21 Nov 2012 07:57:04 -0800 (PST)
In-Reply-To: <1353508922-12820-1-git-send-email-koen@dominion.thruhere.net>
References: <1353508922-12820-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 21 Nov 2012 16:57:04 +0100
Message-ID: <CALbNGRRy=E7vVNM0SkJrPi3Pp14bEWJDC6ZS1tk_OLVB1R078Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] gphoto2: fix gettext build error
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
X-List-Received-Date: Wed, 21 Nov 2012 16:11:10 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 21, 2012 at 3:42 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
> index d7f6ac0..27f660b 100644
> --- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
> +++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
> @@ -3,7 +3,7 @@ SECTION = "libs"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=0448d3676bc0de00406af227d341a4d1"
>
> -PR = "r3"
> +PR = "r4"
>
>  DEPENDS = "libtool jpeg virtual/libusb0 libexif"
>
> @@ -26,7 +26,6 @@ inherit autotools pkgconfig gettext lib_package
>  EXTRA_OECONF = " --with-drivers=all udevscriptdir=/lib/udev ac_cv_lib_ltdl_lt_dlcaller_register=yes"
>
>  do_configure_append() {
> -       cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/libgphoto2_port/po/
>         cd ${S}/libgphoto2_port/
>         autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
>         cd ${S}
> --
> 1.7.7.6
>
Could you please add an error log?

Andreas


