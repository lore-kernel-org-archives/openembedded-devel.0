Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FD7FCB613
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 15:06:20 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71238.1772809571388850700
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 07:06:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fuz/NsMN;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48372efa020so83210785e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 07:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772809570; x=1773414370; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qeyuoKWIUarf7339bnStNHyb/wbcV6dqRKtpbyCf59w=;
        b=fuz/NsMN/MuIb05gTp75fZsMp6McKIE/L6MhGvTHGb+1feU5863wz4ROZEJ72OUXkk
         PtardF6zEpzwfkogBk/YQW2eOvDwuLatNEmfw9zjSJR2jnfk5OOS9JARGhMaJYrn76m1
         sxFQK6nRwZ93BqA7XOq0FtPOLgJFRp4UVi85NrlTXpKe5x5Kvdme7l8w8m1mMrnxv0dk
         2ObJBQw8Aax3nc/LNxw7CDOnvLY3h0AkzMuoqQ85rQHv/VbMhE4PBBu3/VUS5/gYYiVr
         +6oiTQZbiE5X02maYaRPIlnn3B/UInVFrBqmQpCY8ZnJm9iXHccsm77/3KmY1MalFIat
         2snA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809570; x=1773414370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qeyuoKWIUarf7339bnStNHyb/wbcV6dqRKtpbyCf59w=;
        b=oL6aBVsTuuOs8TTKHK8JgfwTc5+TJS9nOMvUujznDB/BfGeXMSVomNs6G+nkI3JU9o
         L9yb9sw6vIPQSWaE8SonCQWdJw1DhRL2WGoo4/1gDMAV8VhRmE50XJdll4OlFq8qbx4M
         fC0W6SdDX7mSaS0+E7Gj9YpdYlJsMfFy/Vep03+x0nqarrVf5936+bkG1+qGqQf2G2W0
         FG4yuldXXm2Hvi0jp3ch/lVlBf+06o2ZpkgR4YDJA2T940PoJiELu7Y+CISSiNm8APQx
         sr78s8hVQJOWO34P4xWx4WzRHtKzv4fk56SsnqH8DgrxV7ye8PSZv+cSp75oY9dCxEM4
         hVxg==
X-Gm-Message-State: AOJu0YywYfzqpd3KE/86VZ53SglMFEZPa/OXKYZGvxki/Nabw3gppPdX
	v/M7dWlfHimg+wPsqCFQRjmO/wmKWViFKu036CjyavhHv6dVJ6EsCEE/gWOh8g==
X-Gm-Gg: ATEYQzxhrDJcXhMz2Tl/NSYegpzPTd6Q6V7WqAUGOJGH2H/6ru1qpTBsx1cO/I1qMxm
	RYt9ealjnr3ZpezDxCD0yQp5zoucGOSK5L56XUjMsgUFuXFD0EX8h6Qm3BDyPW7o1Cmt2PYmnR8
	1pjeAwtFQLF6TdqXlGOx2/F2Rv3QGgnTQp8MaDQUUWcwC55DbjO2dxBi3sTH6x6dJQs8tF7Hkzq
	0mQQgOJJW2isWsTmqwvtFPxtWp9bz5k8+96YqbFsgbP8JTNAdZl2bP/UyIjdXSXFXbitoDV8fGa
	yPnpmiFfLIh9FKiTM78ip6rkZZ818NQSALHdq7frwclHAVAMNXtpUc6gCJlTSL/YBfn+eWWgPx3
	FjnwHfaf8rxQohZHqWd/sX+pks99PB+q/c6ayvVwtRAOL41Yhdg8UC4WjDPzuXBsWifkK/3Yv6c
	NGSjUVIfrUzBAfQmiYZNXV
X-Received: by 2002:a05:600c:8b61:b0:483:702d:2df with SMTP id 5b1f17b1804b1-485269840cbmr36248625e9.32.1772809569594;
        Fri, 06 Mar 2026 07:06:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm38990205e9.6.2026.03.06.07.06.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:06:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 09/11] imagemagick: patch CVE-2026-25796
Date: Fri,  6 Mar 2026 16:06:00 +0100
Message-ID: <20260306150602.616834-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306150602.616834-1-skandigraun@gmail.com>
References: <20260306150602.616834-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 15:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124913

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25796

Backport the patch that mentions the related Github advisory[1]
in its commit message.

[1]: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-g2pr-qxjg-7r2w

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2026-25796.patch          | 41 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.2-13.bb       |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25796.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25796.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25796.patch
new file mode 100644
index 0000000000..aa77f22066
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25796.patch
@@ -0,0 +1,41 @@
+From 0564895c393d0aa21578739ad3126a447a4beace Mon Sep 17 00:00:00 2001
+From: Dirk Lemstra <dirk@lemstra.org>
+Date: Fri, 6 Feb 2026 21:10:47 +0100
+Subject: [PATCH] Prevent memory leak in early exits (GHSA-g2pr-qxjg-7r2w)
+
+CVE: CVE-2026-25796
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/93ad259ce4f6d641eea0bee73f374af90f35efc3]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/stegano.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/coders/stegano.c b/coders/stegano.c
+index 9f5eb6b80..b68d6ce6d 100644
+--- a/coders/stegano.c
++++ b/coders/stegano.c
+@@ -150,15 +150,22 @@ static Image *ReadSTEGANOImage(const ImageInfo *image_info,
+     return(DestroyImage(image));
+   watermark->depth=MAGICKCORE_QUANTUM_DEPTH;
+   if (AcquireImageColormap(image,MaxColormapSize,exception) == MagickFalse)
+-    ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
++    {
++      watermark=DestroyImage(watermark);
++      ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
++    }
+   if (image_info->ping != MagickFalse)
+     {
++      watermark=DestroyImage(watermark);
+       (void) CloseBlob(image);
+       return(GetFirstImageInList(image));
+     }
+   status=SetImageExtent(image,image->columns,image->rows,exception);
+   if (status == MagickFalse)
+-    return(DestroyImageList(image));
++    {
++      watermark=DestroyImage(watermark);
++      return(DestroyImageList(image));
++    }
+   for (y=0; y < (ssize_t) image->rows; y++)
+   {
+     q=QueueAuthenticPixels(image,0,y,image->columns,1,exception);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
index 8c1e8eb926..bb1272d512 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2026-25638.patch \
            file://CVE-2026-25794.patch \
            file://CVE-2026-25795.patch \
+           file://CVE-2026-25796.patch \
            "
 
 SRCREV = "dd991e286b96918917a3392d6dc3ffc0e6907a4e"

