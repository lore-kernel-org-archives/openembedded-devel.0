Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF68DC79FB8
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:05 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7110.1788942720497575157
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dk0+CFd1;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cbee846deecso6474396a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 01:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942719; x=1789547519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IPpmB4dlXBlZBZznBeaFc/JGnnQgD57KMLFFw6ITG1s=;
        b=dk0+CFd1nZacU+zE43IacIeyqDel2NPfohFg45sqYGAswbcfbHGIJ30GyG68VYHwwP
         o/TDRBn+Ozw4/oRJlgMIk3A1zoB+u/0Hg7lG+Pyvxsze3vzT6VAWuanHkfAFMfKZzfAU
         W52lxMBAxzEreVvKxTMpZ/sDEqal7kidcP98F0sSnVNkVl0BEsdZ/0UdG0Y2k2SLJtcB
         5L3Te6ntHO1xg+yqOUp6XP5ioML2kJCDaorOfFxVv74GBloPUfejOI5dkEzVskhewDY4
         V3FajJ/90PO654IZa9eZ52RX6s2P4VumhtWL4Hqzf7bXWk1Fm62m0ekalr9fhU6rhqj0
         PuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942719; x=1789547519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IPpmB4dlXBlZBZznBeaFc/JGnnQgD57KMLFFw6ITG1s=;
        b=V+Wn+rMMS/0xNtNvNac9UPo3+tYRnS1UgnpyKQRIP6kE4p9YHDTkViNE5tyjRFZwVO
         39VKKwWG5n97A5fVocDC4B8+fL1X+Na8JA7FBnC1FTrNuJyGlulC4L5BAyPlZgxFrOd2
         yiwxcBjl0dwF/Z6nPO5pSBFuhlkk6WEcawQEFoAKMx1aqki/Tp7kOhRDP73WjjTDOkNL
         sJ9FZ2AoWXdtIOEwIujoArfoJrIloIMCRUyMCKO/LPQ8fT5PEh/oU+sLSmOI85tpYcpg
         bsPFMmSEAWW2yKsw54ulgliffpTfVAGRWeTKfKdy9k3StwsPyCBw/0uir4/fxGjESMHJ
         a2fg==
X-Gm-Message-State: AFuF++m6ppQBjc0kE8Msg8Uqqn+8fJ6N8CbiY98eh80MZ5UMxz32asKh
	4FDt5JWFawZbKaRPEILCTP8q7XNN8APq551HlacENdgfwLhdIUMpE1IN8umeEw==
X-Gm-Gg: AYBFou3PuQB8RTNdKx8ig0JNlqHzysDLm0x3KGLMxdKfrqWC/bYmxeZuxj1hMBpzUKc
	1pW+NuyXCzx0/MYx+EUkW1YgjDv4RD7tZwVkeZXlyg23yaMO8oe2ZEh0/TbG2io2rzw/+OGQdVl
	OLF00HV8Sf2KHN5KJ+FuBhYCvzxMNiNFGMTxoXUpymODcQ6nzxYZoDoIGqSFLmk27DSEYjftMZE
	i9+UFFIENG6esmZJln5kVQ/Q8tpWgPvMTHX6ZrLQLYB8Tg4q5R0nkbSrq2yfFuCF9s1yPgeFCp8
	o73mpLIpNdihT+fSmytKzKM06CG7NljbY+f2Aba1YXooJR734uYEeOCPfyT3+goDd7vy3rOhWJz
	gcGmMhpLxr751VbsZCR0hl9HDUKHPkGYzOgZLm+M383R3IyrI7Ph7F/UFxTMIr0wzrVh3GajT84
	TldRvj2QfYvR1XVXd2jhDiKxzns/Ssw2ATWCJoI7casFrS1nwcrIRpLGrLwnPb5cn6OGHsUSMKM
	pH58UjpG97dq4JmVT8DbhhhuavaTTm+vw==
X-Received: by 2002:a17:90a:64f:b0:39b:370e:c807 with SMTP id 98e67ed59e1d1-39b370eca6fmr28943799a91.17.1788942719518;
        Wed, 09 Sep 2026 01:31:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cfa5c1d17sm788649a91.4.2026.09.09.01.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 3/15] freerdp3: patch CVE-2026-55192
Date: Wed,  9 Sep 2026 20:31:28 +1200
Message-ID: <20260909083140.2494932-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
References: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 08:32:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129874

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-55192

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-55192.patch     | 79 +++++++++++++++++++
 .../freerdp/freerdp3_3.24.2.bb                |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55192.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55192.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55192.patch
new file mode 100644
index 0000000000..5cb3fe36d5
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55192.patch
@@ -0,0 +1,79 @@
+From 4a8f7a9109a0a2d7c388102d7ad7816d932841c7 Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Thu, 11 Jun 2026 08:47:30 +0200
+Subject: [PATCH] [codec,h264] ensure decoded frame size matches expectations
+
+(cherry picked from commit 0cd45b70bb1fe6befd258ff64c46461947e99adb)
+
+CVE: CVE-2026-55192
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/0cd45b70bb1fe6befd258ff64c46461947e99adb]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/codec/h264_ffmpeg.c     | 4 ++++
+ libfreerdp/codec/h264_mediacodec.c | 5 +++++
+ libfreerdp/codec/h264_mf.c         | 4 ++++
+ libfreerdp/codec/h264_openh264.c   | 4 ++++
+ 4 files changed, 17 insertions(+)
+
+diff --git a/libfreerdp/codec/h264_ffmpeg.c b/libfreerdp/codec/h264_ffmpeg.c
+index 98b8b5e66..5f5e534fa 100644
+--- a/libfreerdp/codec/h264_ffmpeg.c
++++ b/libfreerdp/codec/h264_ffmpeg.c
+@@ -359,6 +359,10 @@ static int libavcodec_decompress(H264_CONTEXT* WINPR_RESTRICT h264,
+ 		iStride[1] = (UINT32)MAX(0, sys->videoFrame->linesize[1]);
+ 		iStride[2] = (UINT32)MAX(0, sys->videoFrame->linesize[2]);
+ 
++		if (sys->videoFrame->width < WINPR_ASSERTING_INT_CAST(int64_t, h264->width))
++			goto fail;
++		if (sys->videoFrame->height < WINPR_ASSERTING_INT_CAST(int64_t, h264->height))
++			goto fail;
+ 		rc = 1;
+ 	}
+ 	else
+diff --git a/libfreerdp/codec/h264_mediacodec.c b/libfreerdp/codec/h264_mediacodec.c
+index ee84f6b84..9e57969ee 100644
+--- a/libfreerdp/codec/h264_mediacodec.c
++++ b/libfreerdp/codec/h264_mediacodec.c
+@@ -360,6 +360,11 @@ static int mediacodec_decompress(H264_CONTEXT* h264, const BYTE* pSrcData, UINT3
+ 				pYUVData[1] = outputBuffer + iStride[0] * sys->outputHeight;
+ 				pYUVData[2] = outputBuffer + iStride[0] * sys->outputHeight +
+ 				              iStride[1] * ((sys->outputHeight + 1) / 2);
++
++				if (sys->outputWidth < h264->width)
++					goto fail;
++				if (sys->outputHeigth < h264->height)
++					goto fail;
+ 				break;
+ 			}
+ 			else if (outputBufferId == AMEDIACODEC_INFO_OUTPUT_FORMAT_CHANGED)
+diff --git a/libfreerdp/codec/h264_mf.c b/libfreerdp/codec/h264_mf.c
+index ca2eaca68..446f08d5e 100644
+--- a/libfreerdp/codec/h264_mf.c
++++ b/libfreerdp/codec/h264_mf.c
+@@ -370,6 +370,10 @@ static int mf_decompress(H264_CONTEXT* h264, const BYTE* pSrcData, UINT32 SrcSiz
+ 		}
+ 
+ 		outputBuffer->lpVtbl->Release(outputBuffer);
++		if (sys->frameWidth < h264->width)
++			goto error;
++		if (sys->frameHeigth < h264->height)
++			goto error;
+ 	}
+ 
+ 	inputSample->lpVtbl->Release(inputSample);
+diff --git a/libfreerdp/codec/h264_openh264.c b/libfreerdp/codec/h264_openh264.c
+index eb8c71310..f4a7e47f0 100644
+--- a/libfreerdp/codec/h264_openh264.c
++++ b/libfreerdp/codec/h264_openh264.c
+@@ -177,6 +177,10 @@ static int openh264_decompress(H264_CONTEXT* WINPR_RESTRICT h264,
+ 	if (!pYUVData[0] || !pYUVData[1] || !pYUVData[2])
+ 		return -2005;
+ 
++	if (pSystemBuffer->iWidth < WINPR_ASSERTING_INT_CAST(int64_t, h264->width))
++		return -2006;
++	if (pSystemBuffer->iHeight < WINPR_ASSERTING_INT_CAST(int64_t, h264->height))
++		return -2007;
+ 	return 1;
+ }
+ 
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
index e014196f18..978f950d8d 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${
            file://CVE-2026-40254-1.patch \
            file://CVE-2026-40254-2.patch \
            file://CVE-2026-55191.patch \
+           file://CVE-2026-55192.patch \
 "
 
 

