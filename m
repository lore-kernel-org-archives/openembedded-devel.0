Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0910C6FFC8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 12:09:24 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 12so25031238uas.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 04:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=kHi0zYjasGg8ntgf5XFDNUazPiQeDY44xDtvTapuZKk=;
	b=WLeqrKW1aP7wUNcQw62dtS9l+pWJNVRART47wEgTeBkC5Pmo0AzmwdJTDjmka+uJFC
	waqZj89XDjI65ZEZrQ2azW42Zgt+PcdoVDvLuVWkda+s9fpXKYov2DeF1WIuRLZZjWPS
	2rC2yLOqi+1/JjTdiMh8uifajkJYtRdnIFuLqdgdPwurC57cSw8lkPPfTlhA945E3gTl
	X8VCm6Lwd8XxchyUeCiuR1ZyMHONLy7+KPGss8BEVYvV/2BMn+V13j9l7kpB8hr5pFuq
	0gF3/6DdAJ8B34om961DN4+OE8k2kL/cNDtfldsUlvpP7W+7uu8brRAqQDtYQ9Kv0vUB
	iHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=kHi0zYjasGg8ntgf5XFDNUazPiQeDY44xDtvTapuZKk=;
	b=h3R8Cb6Hcg243V+g4zKGzmYYVc/vpoPoMnuKLfMdOUYyU1RLRMJ7Kia3jGzTYP5faI
	PpF8Yd10JjwtAZTbeUBT9DzsfRpUbUFqr2SAjQcBEcLdFlQRhEkWeMPy5oWA20ZeJI8I
	HwmoAVnE906kcxwlraQwOIaAzxv3Dm8XKrmZmp/XFMiA7Vbkza/3F1eayImO2eN3moK/
	BTd6sWwr/fGAPhS4/B5uzSKkbv9ImDwkUxQxeCGdmM2zgijAbbJSKPCIZfUkkiRqUISA
	GnH2YGShoeR2bzj0CXVP2F6rYsWOKGfSQ55bpeoTmv+EE9PSp5ZJvT0j7kQ6kdBj8W9m
	QgjA==
X-Gm-Message-State: AKaTC01CjaFtVGzvu0kgyoCpPYA2PG6V6//NRnWF5yeeudS0J5LOqBHgAjVdoiY75Pd42Ft5HvWEXNy3m4PB5w==
X-Received: by 10.176.82.71 with SMTP id j7mr5344047uaa.77.1479730165723; Mon,
	21 Nov 2016 04:09:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.36.211 with HTTP; Mon, 21 Nov 2016 04:09:25 -0800 (PST)
In-Reply-To: <1478025042-25619-2-git-send-email-schnitzeltony@googlemail.com>
References: <1478025042-25619-1-git-send-email-schnitzeltony@googlemail.com>
	<1478025042-25619-2-git-send-email-schnitzeltony@googlemail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 21 Nov 2016 13:09:25 +0100
Message-ID: <CALbNGRS0CDcX7MhAgjJnY_xDYpnPSg8yT9YYQs85e2JjkMBU3A@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gstreamer: fix rare but annoying build errors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Nov 2016 12:09:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 1, 2016 at 7:30 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> same as:
>
> commit 63707b56b5352ed72f1c5291967455b78f50fb7d
> Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> Date:   Sun Oct 2 22:16:52 2016 +0200
>
> gst-plugins-base: fix rare but annoying build errors
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  ...2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch | 32 ++++++++++++++++=
++++++
>  .../gstreamer-0.10/gstreamer_0.10.36.bb            |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst=
reamer-0.10.36/0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
>
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-=
0.10.36/0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch b/meta=
-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36/0002-gst-gl=
ib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
> new file mode 100644
> index 0000000..8db3966
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer-0.10.36=
/0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS.patch
> @@ -0,0 +1,32 @@
> +From 4b145ceb22bbce7ba6e209c6ab61f2d5867e69f9 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Tue, 1 Nov 2016 19:02:30 +0100
> +Subject: [PATCH] gst-glib2.m4: don't do crazy things to GLIB_CFLAGS
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +we are definitely not one of those poor souls mentioned
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> +---
> + common/m4/gst-glib2.m4 | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/common/m4/gst-glib2.m4 b/common/m4/gst-glib2.m4
> +index b01f02f..4569ae5 100644
> +--- a/common/m4/gst-glib2.m4
> ++++ b/common/m4/gst-glib2.m4
> +@@ -69,7 +69,6 @@ AC_DEFUN([AG_GST_GLIB_CHECK],
> +   fi
> +
> +   dnl for the poor souls who for example have glib in /usr/local
> +-  AS_SCRUB_INCLUDE(GLIB_CFLAGS)
> +
> +   AC_SUBST(GLIB_EXTRA_CFLAGS)
> + ])
> +--
> +2.5.5
> +
> diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_=
0.10.36.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.=
10.36.bb
> index e3bd5e5..512a28f 100644
> --- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36=
.bb
> +++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36=
.bb
> @@ -16,6 +16,7 @@ SRC_URI =3D "http://gstreamer.freedesktop.org/src/gstre=
amer/gstreamer-${PV}.tar.bz
>             file://gst-inspect-check-error.patch \
>             file://0001-baseparse-Fix-self-comparison-always-evaluates-to=
-tr.patch \
>             file://0001-parse-make-grammar.y-work-with-Bison-3.patch \
> +           file://0002-gst-glib2.m4-don-t-do-crazy-things-to-GLIB_CFLAGS=
.patch \
>  "
>
>  SRC_URI[md5sum] =3D "a0cf7d6877f694a1a2ad2b4d1ecb890b"
> --
> 2.5.5
>

ping

