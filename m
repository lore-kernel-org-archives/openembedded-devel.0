Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F11FC79FB9
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:16 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7115.1788942734615752633
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pgpUp/DS;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso4755042a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 01:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942734; x=1789547534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVr+OLzK1GjeabwB8Iw8sniW+GAx8IDB6Doo2Tp5Gv0=;
        b=pgpUp/DS+pWE/y7l0uoEG2FE/3ANB9nAK6C8OUuNqmZTg5IwKprn+RIFCn9vBLPxvn
         k/Hltk+m3INxCLbdSY6AkBIJFiEzglGtdHd4Qe0wwrsVXf+NRRKGP2pqnvVl8JeyOVjg
         9RIHhgmhyq/Nlz5Niu9hbcLZHcpBcxhgh7YvriSnSrFdIXU92nbzE2wal0N9NDqQ6NRX
         L80pe5BLhM+7wSxU/RRBB8XqA+2+UWWKixl7Fql9jhvcxgvNFk0VtooZ3V30ywLVfHeb
         dEpaVHxjmykbI+Ct0OwgUhVhAY6fgOhabwyaqg1grgMAytIVnSQcWjkIETOezJNr/nFi
         n5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942734; x=1789547534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QVr+OLzK1GjeabwB8Iw8sniW+GAx8IDB6Doo2Tp5Gv0=;
        b=Fct9Dza0uun4TEkmKnAzv5XsZYS0gBvIu2Md4p0en2urGkefz9ff1Pbo8LIEWCVlP8
         bzFV/l6KdE2fbWkPiFtnbuQEGvVpfQMeOFDQJ7/hKkVdWG6bnn5quMZ3fOhMiLR7FtXR
         tUkqb56DvLRFXPeO0xVwp2JztAZNEKcElGK+cYiLm3bpG5uVESWYk8SV7GAh1uX3dwsH
         9dw9NZqtKUwqx4R11XNXG9pu3DMAeKbRBoGtDJN6Z3oQ1oLJlYv4M/Ir6HX8MVQxkOe7
         xlbndR3DHm4PyjfVsishxINl/Sn+UvYqwXZyriM26iC9/66LVGbOyFJfdg5oY6tyTCvC
         vSKQ==
X-Gm-Message-State: AFuF++mikJH6qVQkWj5dr/q8vu+ciV2Vow/eFXJFu0m9r4PzSJ5vuem0
	YpbDJa96DFswoJgaIhh9JG9frKW30LWywTWKuxSSl3UVKNfK54KPgez1CVGebl96
X-Gm-Gg: AYBFou17HxU2w3vTw7WraD8Dg0IE+HvBb7WTYZNBreO0132KYqB+MN2zvG/ZET3pW9q
	UR2qAWHYbWupH2NE1OfZApcaHVBYuDel5qQxlnoEi5GRjPbt1vHU7053qG5fOw0IKn3fQnyk2IG
	40skl9gkJVe/j6HVDwUWsVqqxcycrMLXcn//HY6pfuIHi74X5+SanaMtLWpAxh1+pop53v53/ti
	cnMoc2onPmBf3zu5DJ9KLaF+RjnW+g9xfF9I0xfonJ1L4WhcPpJntNOzHzDo6//yaW1qBfpShc7
	tMd0PwO6j7lty6Hst6A+IQ3+gnLgzfcB7+LtIyXOPL4ELaUlb2R5CdNyYtAM7JfQvh4IR73T26x
	shwbV3E3r/LQ6YPD02Q7SCAVN6ofxHK5faau/3Jmhm8f8Cyb9XYgW6fVUOBCALerWup1yqKiIMr
	1esTZqVHZMvSdccaiPutr+lX3DMpw4cixOOo5rJRfbMw4VTVOITpRyBFWJh3QO16BxE0E1VXh5k
	SxIfiScW8IR9i7a9dSTP8JQm8rTsd71yC7X
X-Received: by 2002:a17:90b:2d07:b0:398:ceed:6d44 with SMTP id 98e67ed59e1d1-39b262abd26mr49985497a91.25.1788942733788;
        Wed, 09 Sep 2026 01:32:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cfa5c1d17sm788649a91.4.2026.09.09.01.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:32:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 8/15] freerdp3: patch CVE-2026-63633
Date: Wed,  9 Sep 2026 20:31:33 +1200
Message-ID: <20260909083140.2494932-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
References: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 08:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129879

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-63633

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-63633.patch     | 28 +++++++++++++++++++
 .../freerdp/freerdp3_3.24.2.bb                |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-63633.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-63633.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-63633.patch
new file mode 100644
index 0000000000..478df68d50
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-63633.patch
@@ -0,0 +1,28 @@
+From 926fef2224e60a3d6eed66198ebc3eb677d63194 Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Wed, 1 Jul 2026 22:02:25 +0200
+Subject: [PATCH] [codec,dsp] fix opus buffer checks
+
+(cherry picked from commit 0ed1f95d36913581cf31124f94eb5843d4263eae)
+
+CVE: CVE-2026-63633
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/0ed1f95d36913581cf31124f94eb5843d4263eae]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/codec/dsp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libfreerdp/codec/dsp.c b/libfreerdp/codec/dsp.c
+index b0de39a4c..d07c02635 100644
+--- a/libfreerdp/codec/dsp.c
++++ b/libfreerdp/codec/dsp.c
+@@ -680,7 +680,7 @@ static BOOL freerdp_dsp_decode_opus(FREERDP_DSP_CONTEXT* WINPR_RESTRICT context,
+ 
+ 	/* Max packet duration is 120ms (5760 at 48KHz) */
+ 	const size_t max_size = OPUS_MAX_FRAMES * context->common.format.nChannels * sizeof(int16_t);
+-	if (!Stream_EnsureRemainingCapacity(context->common.buffer, max_size))
++	if (!Stream_EnsureRemainingCapacity(out, max_size))
+ 		return FALSE;
+ 
+ 	const opus_int32 frames =
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
index 4ae18651d4..054d90718e 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${
            file://CVE-2026-55194.patch \
            file://CVE-2026-55564.patch \
            file://CVE-2026-55648.patch \
+           file://CVE-2026-63633.patch \
 "
 
 

