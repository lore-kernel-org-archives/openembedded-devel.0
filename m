Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB93DC624DA
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:24 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4056.1788429022298496984
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iYGW68VO;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8525efa7274so1698239b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429022; x=1789033822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rpnr2k4NsCxQGngaRC9fUfWF51MHq4eMCGGb0Nw5nRQ=;
        b=iYGW68VOa4Qr14fQgjIvaFDEXVO5GvcrMnDwAZYdBZPUSswprxsM+QBaa8VJbhy3l9
         t1ihcvdlmCRoix7Ba4HUr4vKSj7+TrnRTTTzIWQvBEdSbV55Za8FWBvv6g2mKf6cMbJs
         B7/hRm1rTyqiFSke1FIt+OuAMZmXtH2mUGHsDHl//KYImH7K30/AuwfqxhZlyv67Gjlg
         /BS95L4lliFtwYIg1O+z/czdcFH6r8t+AKAs2cAA3YQL8OQxESaHVk5w8gFsmCit0EO3
         v3WqirYFyDYME1DrrYQyhLe79hjcYsrWrf6NdkvpKXW8kor4FDf+cndSiL6Qkk/K3wrE
         GJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429022; x=1789033822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rpnr2k4NsCxQGngaRC9fUfWF51MHq4eMCGGb0Nw5nRQ=;
        b=a9uiF4KsvEVpcY/MUHmjLG6uBjukVKKqYJMbv1UN0NSJmcA+mpY9n1ZnnKHK3fF7CA
         /0dWP+OTAVdPmWcEF5XnWd6fIdDGGV0Qo4IsfLVU99OGcgR1D0l7lprK3knsqe/N8l6I
         vfGBSwet3Y9guvIhzTXy8iNGV0nfh1GlAD2/G46hKtEjyrZlBbemdJTv9S531OkyTSmb
         OUbTnJauE5WVAI413TyYK8bx6an4z1OCVNuvYZXBZzQpDmgATCMMUfDLQRwumzhVCDRb
         Z/UTf17UzoaOzOM6iGrByi2ObwJyxGkj+Gc0JCc6Ul+2BhOBtnj12tnuQBEjqWEodofa
         X6Cw==
X-Gm-Message-State: AFuF++lridVrQPFzIUyipHB0wanFesT/3/v7YcibsBgxLFBl1jfV3hNj
	4KY4NZyuZpHy39AXNyWnyz1Oks2pgBzlBeLB5UhciydQwGPtWg9nI6wTQrFdvsU0
X-Gm-Gg: AYBFou1t+NE4bc2abyHm5HkMzmtZhAPs4DwvT7QrxUHE8muWFFpfBLfkyZzL8Sroo1b
	mH3BxVEUBfVMNcJsj6gzpC9R37Uk17blecp1niWM93kkjfepYP/lfsVYXlKQb36rmufTiD9LcO0
	aYnNbb5sqAuCEyaaXhhKgGAciKWi/DkHL+PqG0Ku15OEOxzJWk+PW6HOC0q2XNj4pTiHdR7wFoL
	mMfNv4itQ+Vof87jqRSXpABO/vBZcD61Pt8dihIj0u0uwFVuZzSMsEc4t7uV+VnjE1wFbPLnmby
	tCbgNZKgj0tAAF1iNfdPIPMTIQXdw1xRP53V+NlQeNnVT1XXTA3dQ7DK2K3jbHM7QwLOrd2CvMX
	Wc5h5oHRwrRZYtb1EndN9RSZY5XW5/4Qi2bGmx9HmsA9YHfa9gs6XH2ITqbUqMfw2VHjmUNcNpY
	Z0CNT2i/cTdFVi8gM4r1A3vH5PcuZyzQYvoslr7yuod91GKjkjkKWORV2U5aD1dQJD4wt1gQwo
X-Received: by 2002:a05:6a00:b88:b0:847:93f3:a4b6 with SMTP id d2e1a72fcca58-85ed3d7808fmr15235701b3a.17.1788429021600;
        Thu, 03 Sep 2026 02:50:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 10/22] libheif: patch CVE-2026-32740
Date: Thu,  3 Sep 2026 21:49:41 +1200
Message-ID: <20260903094954.3240723-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129726

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit identified by Debian[1] to the original file which was
renamed by upstream commit[2].

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-32740

[1]https://security-tracker.debian.org/tracker/CVE-2026-32740
[2]https://github.com/strukturag/libheif/commit/f05c61ee8427ac3e39a3e5802a390b5aa99ae281

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libheif/libheif/CVE-2026-32740.patch      | 40 +++++++++++++++++++
 .../libheif/libheif_1.21.2.bb                 |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32740.patch

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32740.patch b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32740.patch
new file mode 100644
index 0000000000..e6ce0e01f4
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-32740.patch
@@ -0,0 +1,40 @@
+From eec74f24bf52764d870988bade74cd35075a09df Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Mon, 18 May 2026 18:03:01 +0200
+Subject: [PATCH] fix integer overflow when computing chroma sizes
+
+CVE: CVE-2026-32740
+Upstream-Status: Backport [https://github.com/strukturag/libheif/commit/6721f307ad684804b735e917dde7d372c5faae31]
+
+Upstream commit[1] renamed libheif/pixelimage.cc as libheif/image/pixelimage.cc
+Backport changes to the original file.
+
+[1] https://github.com/strukturag/libheif/commit/f05c61ee8427ac3e39a3e5802a390b5aa99ae281
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libheif/pixelimage.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libheif/pixelimage.cc b/libheif/pixelimage.cc
+index a8ab7397..da62ea88 100644
+--- a/libheif/pixelimage.cc
++++ b/libheif/pixelimage.cc
+@@ -54,7 +54,7 @@ uint32_t chroma_width(uint32_t w, heif_chroma chroma)
+   switch (chroma) {
+     case heif_chroma_420:
+     case heif_chroma_422:
+-      return (w+1)/2;
++      return w/2 + (w & 1); // note: prevents integer overflow
+     default:
+       return w;
+   }
+@@ -64,7 +64,7 @@ uint32_t chroma_height(uint32_t h, heif_chroma chroma)
+ {
+   switch (chroma) {
+     case heif_chroma_420:
+-      return (h+1)/2;
++      return h/2 + (h & 1); // note: prevents integer overflow
+     default:
+       return h;
+   }
diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
index ba16ee7afe..df7f0c56e1 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master;
            file://CVE-2026-3949.patch \
            file://CVE-2026-32738.patch \
            file://CVE-2026-32739.patch \
+           file://CVE-2026-32740.patch \
            "
 
 SRCREV = "62f1b8c76ed4d8305071fdacbe74ef9717bacac5"

