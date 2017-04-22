Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 83F2B60777
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Apr 2017 21:18:33 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v42so7655466wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Apr 2017 14:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ASvQXiZYkCuPngnzHLeyvmAMw5qcC5L9ywmUuuN/36k=;
	b=auD7CG2RojuTZWb/N/fh05goeaBM5JdQOp9oY03C2AFizGMtZbwXQs9YcO3ta6rzPU
	d4QFdnzvADzAslNOOD+LweIbgdSsXO2fkrrlgd5ag8Ht8FztPslkDoFRomCFVtWTC6T4
	cGtKSXteCk4s83IsJfUzeWTsZ7HQy/dydQbaUryxPWQRvzggwb1DeiVgo3oAMV9tDGa1
	FtapRVgJhVIK3jyteu9uAISXVy2R8LPDftA+LNETp4qCfZ3H84WitROJ5v6xybpghMhO
	PsL+FNWzlC8Fo1uI57Lkm8XYZLfXGKDKjVrPRZEFKItHFir0mHR1ZbQt4wEKyUswX4hR
	ocMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ASvQXiZYkCuPngnzHLeyvmAMw5qcC5L9ywmUuuN/36k=;
	b=oYBNRYN11fcdjhs+NebpcSB4c4rG0Vit94KdENnk9pPS9YydYZTAGJC0dVtg5owV1V
	PpvYHs9vaIA7PhGqWUevQUXf86/S5MES9M8QGsk3p5bJTdPcyrDrIVWjCoBaMwzTn84C
	T28KCgy1nX3oyt1mUuHKL9A6fFQc/i8Pz9pVDSu7mtPIrpMdIcO6t37KFmWZnPpgQonF
	InqAXl0OIY1yQOHC20RP7wG+MxOpBTyDl/AsHdTkH9ZtFkWOQz2NNdNZQv1SPKWNMg4f
	CsyqgTwsxqJyWgPpFqT8bA10g1pJAaqhdMRdBVy1qS9OGRJYlM1WXbCgJImYSB1E2Rs3
	kZRg==
X-Gm-Message-State: AN3rC/6TjthGQGlmPpLMaMe7P+NgW6WjTT4M071sJsFsMtcHxxM9XKEg
	LFWB2aXRP9++d59T
X-Received: by 10.223.136.71 with SMTP id e7mr2534739wre.73.1492895914510;
	Sat, 22 Apr 2017 14:18:34 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E94A8E351E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e94a:8e35:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	u66sm6871844wmd.24.2017.04.22.14.18.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Apr 2017 14:18:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Apr 2017 23:18:21 +0200
Message-Id: <20170422211821.6015-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [meta-browser][PATCH] chromium: show progress for do_compile
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
X-List-Received-Date: Sat, 22 Apr 2017 21:18:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This was stolen from meta-oe / meson.bbclass - chromium uses ninja for
build too.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-browser/chromium/chromium-browser.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-browser/chromium/chromium-browser.inc b/recipes-browser/chromium/chromium-browser.inc
index 598e9f2..bf1964f 100644
--- a/recipes-browser/chromium/chromium-browser.inc
+++ b/recipes-browser/chromium/chromium-browser.inc
@@ -203,6 +203,8 @@ do_configure_append() {
 
 }
 
+do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
+
 do_compile() {
         # build with ninja
         ninja -C ${S}/out/${CHROMIUM_BUILD_TYPE} ${PARALLEL_MAKE} chrome chrome_sandbox \
-- 
2.9.3


