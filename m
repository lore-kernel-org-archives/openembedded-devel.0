Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.900.1795831135728322674
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 17:58:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=WImTgzUI;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+dickson.wu.certik.com@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 87D5E41619;
	Sat, 28 Nov 2026 01:52:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795830744;
	b=WWYQoSNa01VbG0oUzCfI4I7AtjLIBItP2d8fGBSK5Gmtm7GlvXAvhSN65D9CQ+Iwrko2
	 zbbpN9eF5bQiuEK3oL/BDZv2D4bf3EERhZ/HvG0eooebkpRMyAA81Y1j/pYOVV3HfhWUZ
	 f7aJhmDgZGR6mTsjYUtpVjD6t7IM/XoRSKF4Ank0md5P4GyD6gq2xHHddMx2cGFmVlman
	 dG69KiTpj3bPzWxz1w1MD8PY0vEl+Z7kT1OglCnk857Ujn+SxDQExPEq3GT92JdPdMwrJ
	 7rU8ZCm3btAY2Jzlx49rzgz7BHqlaOnnwkCCcdcYJveLHUHnArrC4AdiH4flv4WauTQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795830744;
	h=DKIM-Signature:Received:MIME-Version:Content-Type:Message-Id:
	 References:In-Reply-To:From:Date:Subject:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tvR/H6nMWnrlNVCaed7zmyxOzlY8skc8BvyY+xwEaV4=;
	b=PMCHpKz8+yk2Ud42LOllJdRu3szaMvzAjpO1w42ALDuQUNby6kjIX00At1yuQfqa0AbK
	 SU+FP3X3l0PnnM/GQVqU4NdaLMkta7QsxDKcXf4P1xlV7OTspshlp3mY4nRwdn/qQpQ6A
	 h4mQ+0QFnJI2EcMBmfy7lfjqlSaUqRumpB1xu7whW9cvb+raPKQiyzgNnOYdDJTdUnnx6
	 7VxMJRQlwgTruKH+vBzrWnmLkr5qiMz0sglyE9yACWmgwaQYBN91Mq1iytPcT7IwsWYwE
	 ekzPvkf3CLiQzV6JGbz58KxpJpEXw4Mo8tu9FaAgjxuftqQz7EauHckSgPuAAIK/b4w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7CBD71F00897;
	Sat, 28 Nov 2026 01:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795830744;
	bh=tvR/H6nMWnrlNVCaed7zmyxOzlY8skc8BvyY+xwEaV4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:Reply-To;
	b=WImTgzUIufw7ODy1KYsfBa9n2sC9XzzGHQHb4Yb27yHDRIsH2EF4ZWwUMenEa0arB
	 ZTUUh1obVImqlD/MNxd7qKz35MMFDI05OzrlitGPi5SLn0/b9Np+bSvIx+nksiyaKI
	 hk3k0eWSdXBwPWKGkNZdVMaOA7NFhJTUr+QdKW76Gh59vHaEbITb4S7m63Dcp9MbmS
	 lHSR6gk0QwtcWgavh2gbFNC7nIV+OgctY0fYaYC8IA67R0583FgbbSbL6a7UBAoRMz
	 jeo3OQ/aOBSS+hyz1stDO+w9mwQPWsFNtWlADmiILoOJs0YDG4fREDG5aWPEW0IJYb
	 USBAuI+6rbOPQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0EB454DF01;
	Sat, 28 Nov 2026 01:52:23 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <20261128-pillow-sg-v1-1-cbcff72e5e81@certik.com>
References: <20261128-pillow-sg-v1-0-cbcff72e5e81@certik.com>
In-Reply-To: <20261128-pillow-sg-v1-0-cbcff72e5e81@certik.com>
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Fri, 27 Nov 2026 10:05:10 +0000
Subject: [meta-python][scarthgap][PATCH 1/4] python3-pillow: patch CVE-2026-112398 and CVE-2026-112403
To: openembedded-devel@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795830619; l=3396;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=fSK/UbSd/igxvmXLDrbSB6iHAn64lqj+LFzXum8JMyo=;
 b=aAf/AJrlIJrgHcJNHcwE/8U0pZm1DUFoh3CmKePXz3q91ypgUaNnjLpUqW4pOU76DbRvekhS1
 4vtlNMfpsL+BEspgpZobRt+orkwMwEc66YRC/FgijA5PaZg1mtqQpV8
X-Developer-Key: i=dickson.wu@certik.com; a=ed25519;
 pk=fxH7FS4FdojeJSGLJzgKdfO51Rvr4EW30yinj2mc1vg=
X-Endpoint-Received: by B4 Relay for dickson.wu@certik.com/dickson-b4 with
 auth_id=1647
X-Original-From: Dickson Wu <dickson.wu@certik.com>
Reply-To: dickson.wu@certik.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2026 03:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133390

From: Dickson Wu <dickson.wu@certik.com>

Reject JPEG streams whose scanlines are wider or have more components
(#10131).

Upstream commit:
https://github.com/python-pillow/Pillow/commit/242a059aedc1935097d9aa1dc3f099750467ba75

AI-Generated: OpenAI Codex, gpt-6.2-sol
Signed-off-by: Dickson Wu <dickson.wu@certik.com>
---
 .../CVE-2026-112398_CVE-2026-112403.patch     | 37 +++++++++++++++++++
 .../python/python3-pillow_10.3.0.bb           |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112398_CVE-2026-112403.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112398_CVE-2026-112403.patch b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112398_CVE-2026-112403.patch
new file mode 100644
index 000000000..eb5d8cf99
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112398_CVE-2026-112403.patch
@@ -0,0 +1,37 @@
+From 242a059aedc1935097d9aa1dc3f099750467ba75 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <3112309+radarhere@users.noreply.github.com>
+Date: Tue, 6 Oct 2026 16:25:03 +1100
+Subject: [PATCH] Reject JPEG streams whose scanlines are wider or have more
+ components (#10131)
+
+Co-authored-by: Andrew Murray <radarhere@users.noreply.github.com>
+Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
+Co-authored-by: Jeffrey 'Alex' Clark <aclark@aclark.net>
+
+CVE: CVE-2026-112398 CVE-2026-112403
+Upstream-Status: Backport [https://github.com/python-pillow/Pillow/commit/242a059aedc1935097d9aa1dc3f099750467ba75]
+Backport note: Omit upstream test changes in Tests/test_file_jpeg.py.
+Signed-off-by: Dickson Wu <dickson.wu@certik.com>
+---
+diff --git a/src/libImaging/JpegDecode.c b/src/libImaging/JpegDecode.c
+index 116ffd8df49..476197370e9 100644
+--- a/src/libImaging/JpegDecode.c
++++ b/src/libImaging/JpegDecode.c
+@@ -241,6 +241,17 @@ ImagingJpegDecode(Imaging im, ImagingCodecState state, UINT8 *buf, Py_ssize_t by
+                 break;
+             }
+ 
++            /* The scanline buffer was sized from the tile extents and the
++               unpacker, not from the JPEG header, so make sure the lines
++               libjpeg is about to produce actually fit in it. */
++            if (context->cinfo.output_width > (JDIMENSION)state->xsize ||
++                (size_t)context->cinfo.output_components * context->cinfo.output_width >
++                    (size_t)state->bytes) {
++                jpeg_destroy_decompress(&context->cinfo);
++                state->errcode = IMAGING_CODEC_BROKEN;
++                return -1;
++            }
++
+             state->state++;
+             /* fall through */
+ 
diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
index 240fec967..844892f0c 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.3.0.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https
            file://CVE-2026-59198.patch \
            file://CVE-2026-59204.patch \
            file://CVE-2026-112393.patch \
+           file://CVE-2026-112398_CVE-2026-112403.patch \
            "
 SRCREV = "5c89d88eee199ba53f64581ea39b6a1bc52feb1a"
 

