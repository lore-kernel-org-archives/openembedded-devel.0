Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD17CA5FB3
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:57:33 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1460.1790722652716052143
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XTk/35dm;
 spf=pass (domain: gmail.com, ip: 74.125.229.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b3e517e6dso618509eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722652; x=1791327452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jR6gwmmSEGXCxsY4mzH5gLBtjbDU/2N0BEEAT0DNtWA=;
        b=XTk/35dm3CseC/EsPYRHhqnGTlcuSprVcUWA/5vRdhUZcS7ZN5PueX7vjLQbKRe2rC
         N+29FdYwyFqYsSgLgV9O13s2LyH1mWia4wuYyA5kWTzU/E+0PVCZ2k6ZqBCEN3D3/p0Z
         qQeLXkKeFcnHuiagQylzizusT/Z7SuReM9/9w54GiYPptHhPHUtqFCY+2tgjajmjG7Lc
         Xxc06yYp5IhHG+IkaL7daIsVGx6jPzb55utEhfTkxTqTxvqfBndC2V5YN5yEIGfx/IHt
         sHVehiv4sj+piYrkd6KoKvdZctLAjnLMZFcam4h4WTQFCExapyn8ySspDmt6vx4hBxGm
         408Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722652; x=1791327452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jR6gwmmSEGXCxsY4mzH5gLBtjbDU/2N0BEEAT0DNtWA=;
        b=Kckai0tQvBYwixB/CWREEhZWnzMh0ur3PnG99ImJNeUnxJkUKMt4pFoD3eTe1oGXk1
         4GmNwbmyMfW9EDYqUn3SaqEGzzc9dbiOyZVu0ksgx/uftUjoXq3Z1OFx7ZG5rwludxIB
         xAoUbE0ofX49HQtyw5sCBTchx7UHLYhTqoMMW9U6InTq3VXiEIBd3ZnK8J/qIw82LlQQ
         azb/ZPI6ogArA9b/PJA1qp5oBEV1Vkg4VNzElK/7pbnNM6+i3xhaQTsiAc6kRafiA8QC
         Aj4kHhQUDqtQLN50XTRDhNiKYR+LXLKaYLNZpRTbhyNQM/Ks6WppdE/O8iuHKTgEBkhq
         f1kQ==
X-Gm-Message-State: AFuF++lmxCD+98YIg71rKY/QQcQuizZ2CHllrqLskckymzdtGR6tOLgm
	tiTsVx0FZNyOourZVj+to7EqmT6757E1T8mWxqec30UywoPnAIBEwRe04CQ4QVDWak4=
X-Gm-Gg: AYBFou0kztsin+sdbNBL2PEIw5oBvBTgTFIde2Ot8KefVzhrdhjvz38TQp5NLH70LFh
	R8zEGbQcmq60PPr9LcXg9P8/WHhMjho8RdnaDGcTtf+sAjew9KWgh4HsrkA6hUMKb/E9WCdqqEZ
	hX844SVCkYMmXeOA6WF0Q/ZQ+u2zNc3+4h9zugzVUeyJLhLVNWLQ/U4C/EUxtZ3Gg4acaPeViAG
	CasIwOu6p/OI8W8ZkaLRW7/fTzfFsra82CI7LBXADxWLETTL5M3WfL2LMY/eybl2cjZ8oxeYHeM
	9A/XzkhMDBHQAg/Iv7sCLAvD9nZJTX4yxnKJ3VHdWXxG9vakWNcrCpYXiyT7n1ZrQqo8FG6r+0V
	9wn/FfBdiVjO9jp89KKZeT3PY+e7Rofdt3GxD6LTjIS0IbC9N7ZurLu2ce1sV1CAeGZ0Rl/xdb3
	sA0HBEFo4CnWCvNOxLuo+gJoJdSBX5HkAWqaasavrcnYLmJ5qwz46qaEz8aFJvBVDc6xcExfAJE
	S/EPv23nkkFTn7nKOy8uu0ygb4kBtIg0//IWg3BOzjD/v6FHwICoirLqCwS2wA+WYEBrzMZrUCO
	ecMY7OtFwob9fZEP4ZWn10FfwoSQQ3K/CKMtoAD6k7tUrlKcbYP9RhWjZMHGjplxzGBLPqhivVU
	+BpLhh14sORCsmePNg3Bj3rQifaxyh+R10zMaS816ivvVwtZ/1JxEJdXwbdiqXpxj17oMm1g8dF
	cKgd2SX4MgVadmed0L6aLdQ7GwQByE9rl72zR1GA==
X-Received: by 2002:a05:693c:37c3:b0:346:d790:9e10 with SMTP id 5a478bee46e88-34c6519fad1mr1238005eec.39.1790722652011;
        Tue, 29 Sep 2026 15:57:32 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 05/26] tinycompress: use unsigned int instead of glibc-only uint
Date: Tue, 29 Sep 2026 15:57:02 -0700
Message-ID: <20260929225723.1046705-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130492

sofprobeclient uses the bare 'uint' typedef, which is a glibc/BSD
extension musl doesn't provide. Use 'unsigned int' instead.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...use-unsigned-int-instead-of-the-bare.patch | 40 +++++++++++++++++++
 .../tinycompress/tinycompress_1.2.16.bb       |  4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/tinycompress/files/0001-sofprobeclient-use-unsigned-int-instead-of-the-bare.patch

diff --git a/meta-multimedia/recipes-multimedia/tinycompress/files/0001-sofprobeclient-use-unsigned-int-instead-of-the-bare.patch b/meta-multimedia/recipes-multimedia/tinycompress/files/0001-sofprobeclient-use-unsigned-int-instead-of-the-bare.patch
new file mode 100644
index 0000000000..7a3fb61160
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/tinycompress/files/0001-sofprobeclient-use-unsigned-int-instead-of-the-bare.patch
@@ -0,0 +1,40 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 01:54:51 +0000
+Subject: [PATCH] sofprobeclient: use unsigned int instead of the bare uint
+ typedef
+
+uint is a legacy BSD/glibc typedef from <sys/types.h> that is only
+exposed under glibc's _DEFAULT_SOURCE feature-test macro. musl does
+not expose it by default, so probes_demux.c fails to build with
+"use of undeclared identifier 'uint'". Rather than relying on a
+feature-test macro that differs between libc implementations, use
+the portable "unsigned int" spelling directly.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/utils/sofprobeclient/probes_demux.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/utils/sofprobeclient/probes_demux.c b/src/utils/sofprobeclient/probes_demux.c
+index 1111111..2222222 100644
+--- a/src/utils/sofprobeclient/probes_demux.c
++++ b/src/utils/sofprobeclient/probes_demux.c
+@@ -318,7 +318,7 @@
+
+ int parser_parse_data(struct dma_frame_parser *p, size_t d_len)
+ {
+-	uint i = 0;
++	unsigned int i = 0;
+
+ 	p->len = p->start + d_len;
+ 	/* processing all loaded bytes */
+@@ -383,7 +383,7 @@
+ 		}
+ 		/* data copying section */
+ 		if (p->total_data_to_copy > 0) {
+-			uint data_to_copy;
++			unsigned int data_to_copy;
+
+ 			/* check if there is enough bytes loaded */
+ 			/* or copy partially if not */
diff --git a/meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.16.bb b/meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.16.bb
index 50ebdd67ee..52c771f993 100644
--- a/meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.16.bb
+++ b/meta-multimedia/recipes-multimedia/tinycompress/tinycompress_1.2.16.bb
@@ -6,6 +6,8 @@ LICENSE = "BSD-3-Clause OR LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf9105c1a2d4405cbe04bbe3367373a0"

 SRCREV = "6b064c5b614bde950560a345ca0702e76668bdab"
-SRC_URI = "git://github.com/alsa-project/tinycompress.git;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/alsa-project/tinycompress.git;branch=master;protocol=https;tag=v${PV} \
+           file://0001-sofprobeclient-use-unsigned-int-instead-of-the-bare.patch \
+           "

 inherit autotools pkgconfig

