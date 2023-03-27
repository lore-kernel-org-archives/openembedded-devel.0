Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73130C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 15:51:20 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web11.39286.1679932180816557123
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 08:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=YakYqMek;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: kieran.bingham@ideasonboard.com)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 074CFAEC;
	Mon, 27 Mar 2023 17:49:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1679932178;
	bh=8rrxPUn77TB/AUWarNuTvHBK4OgMX4ZyiYI5uFgKxFE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YakYqMekSA61Xc0S94jfN53DAjIDyjjIICjjdj5RSylH0BAuVUJqT8vTmMqN36EzS
	 jpc0Bg6XE/BjlllRbynwtm24MC83yoQ7QIQNlVWd2l9u7enJALCRkJPkknUUSjRmjS
	 4I3C7+oxuaTkIiwPGW+OjJLI0oJDMygp9EINPqgI=
MIME-Version: 1.0
In-Reply-To: <20230325061639.8856-1-f_l_k@t-online.de>
References: <20230325061639.8856-1-f_l_k@t-online.de>
Subject: Re: [meta-multimedia][PATCH] libcamera: update 0.0.1 -> 0.0.4
From: kieran.bingham@ideasonboard.com
Cc: Markus Volk <f_l_k@t-online.de>
To: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Date: Mon, 27 Mar 2023 16:49:35 +0100
Message-ID: <167993217536.765114.1846701853726561760@Monstersaurus>
User-Agent: alot/0.10
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 15:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101788

Hi Markus,

Quoting Markus Volk (2023-03-25 06:16:39)
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...le_sink.cpp-Avoid-dangling-reference.patch | 46 -------------------
>  ...{libcamera_0.0.1.bb =3D> libcamera_0.0.4.bb} |  7 +--
>  2 files changed, 2 insertions(+), 51 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamer=
a/0001-file_sink.cpp-Avoid-dangling-reference.patch

I don't think this has been fully resolved yet, so I suspect you need to
keep this patch to be able to build with gcc-13.

From what I recall, we're waiting to identify if this will be fixed by
GCC before it's released.

--
Kieran


>  rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.0.1.bb =
=3D> libcamera_0.0.4.bb} (89%)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-=
file_sink.cpp-Avoid-dangling-reference.patch b/meta-multimedia/recipes-mult=
imedia/libcamera/libcamera/0001-file_sink.cpp-Avoid-dangling-reference.patch
> deleted file mode 100644
> index 5aa6ee8d3..000000000
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-file_si=
nk.cpp-Avoid-dangling-reference.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 0e97896e6a09957f27125957d00b5150ec90b2e9 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 24 Jan 2023 01:18:25 -0800
> -Subject: [PATCH] file_sink.cpp: Avoid dangling-reference
> -
> -Fixes following errors with gcc-13
> -
> -../git/src/cam/file_sink.cpp:92:45: error: possibly dangling reference t=
o a temporary [-Werror=3Ddangling-reference]
> -   92 |                 const FrameMetadata::Plane &meta =3D buffer->met=
adata().planes()[i];
> -      |                                             ^~~~
> -../git/src/cam/file_sink.cpp:92:81: note: the temporary was destroyed at=
 the end of the full expression '(& buffer->libcamera::FrameBuffer::metadat=
a())->libcamera::FrameMetadata::planes().libcamera::Span<const libcamera::F=
rameMetadata::Plane>::operator[](i)'
> -   92 |                 const FrameMetadata::Plane &meta =3D buffer->met=
adata().planes()[i];
> -      |                                                                 =
                ^
> -cc1plus: all warnings being treated as errors
> -
> -Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcam=
era-devel/2023-January/036575.html]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/cam/file_sink.cpp | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/cam/file_sink.cpp b/src/cam/file_sink.cpp
> -index 45213d4a..897c4b37 100644
> ---- a/src/cam/file_sink.cpp
> -+++ b/src/cam/file_sink.cpp
> -@@ -89,13 +89,13 @@ void FileSink::writeBuffer(const Stream *stream, Fra=
meBuffer *buffer)
> -       Image *image =3D mappedBuffers_[buffer].get();
> -=20
> -       for (unsigned int i =3D 0; i < buffer->planes().size(); ++i) {
> --              const FrameMetadata::Plane &meta =3D buffer->metadata().p=
lanes()[i];
> -+              unsigned int bytesused =3D buffer->metadata().planes()[i]=
.bytesused;
> -=20
> -               Span<uint8_t> data =3D image->data(i);
> --              unsigned int length =3D std::min<unsigned int>(meta.bytes=
used, data.size());
> -+              unsigned int length =3D std::min<unsigned int>(bytesused,=
 data.size());
> -=20
> --              if (meta.bytesused > data.size())
> --                      std::cerr << "payload size " << meta.bytesused
> -+              if (bytesused > data.size())
> -+                      std::cerr << "payload size " << bytesused
> -                                 << " larger than plane size " << data.s=
ize()
> -                                 << std::endl;
> -=20
> ---=20
> -2.39.1
> -
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.4.bb
> similarity index 89%
> rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.=
bb
> rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.4.bb
> index 46f058f2e..cbcc33aa4 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.4.bb
> @@ -8,12 +8,9 @@ LIC_FILES_CHKSUM =3D "\
>      file://LICENSES/LGPL-2.1-or-later.txt;md5=3D2a4f4fd2128ea2f65047ee63=
fbca9f68 \
>  "
> =20
> -SRC_URI =3D " \
> -        git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps=
;branch=3Dmaster \
> -        file://0001-file_sink.cpp-Avoid-dangling-reference.patch \
> -"
> +SRC_URI =3D "git://git.libcamera.org/libcamera/libcamera.git;protocol=3D=
https;branch=3Dmaster"
> =20
> -SRCREV =3D "a83aed77df1258e469c0eb42d9cb4f1938db53f2"
> +SRCREV =3D "6cf637eb253a68edebe59505bea55435fafb00cd"
> =20
>  PE =3D "1"
> =20
> --=20
> 2.34.1
>=20
>

