Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id D0B8977D4C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 21:33:33 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u36so14124824pgn.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nnNijRrH0ZEs6bQRNWq/JMh8Mk1U6WrQMwNojjZa+v8=;
	b=aw0AAhkT+cmSPhNgcrLljFmSOV89mRI261uJ+9moPIAYm8Oknda7uCmEM5nF2Xgbwn
	7O/nLF6CVITzjbUJbMbxTXCAHHBgt4kysaZUlUU5LFNwTGqxqsG9o/9LFN4Yxz+tTXTa
	aLs/yHvsjJy1jtdzhuF+t2bUEHnG41sl1A1aM+hu0S18GeaPlwgrAqB/UErg9Rni96Ow
	M4BW3OxCLCTaLW9w4B85gya2N+PmwgfH6vWii/K7Hw+/W+AowxFpJQGx06/XfIFP2ETx
	ltMf/NiMa2gWG+1rZD4ueClPYs+celsgWRrei38PE6uTzE8HzvbyhCx1dpzZ80UBHtcH
	jhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nnNijRrH0ZEs6bQRNWq/JMh8Mk1U6WrQMwNojjZa+v8=;
	b=KF4syb8x1udMx5JdjQRH/lC4CCmFNC+T5Cya6MBo5F9CcWy7R6q4jdoWE1B8rN2aUZ
	gEzeHwO4G+H2f8P15T9Sa6DEZsly23kPgwO+iNlCw5bNU39CYxAIctfwAxagHzuwAbi9
	bzQsNhtvf9WXtP72aiOTTObvTh2yO8u6SI5ztSAWwMzIOz12VjJr0axj5wiXgH08auIm
	BDhuzYbmhafP6mJrwcqoUi5P/SqIu3MG4QGA/zIVcB51WfFNyXjp97dxQp08idYcqQib
	LAI9e9E+HgCYmuFj29rLOlxwmw3CtcCl00iq4HcUhVueXrTttG9dIyfq9/Aq7tkz3ZGy
	mSig==
X-Gm-Message-State: AIVw112PG+QS+VRwchaJet2tbekbH15/TRIvlXh4yFGj7V2t5YhSCmCl
	CWNYaGLRfTwP13U0
X-Received: by 10.98.93.136 with SMTP id n8mr46624889pfj.211.1499722414772;
	Mon, 10 Jul 2017 14:33:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	d89sm25285128pfl.7.2017.07.10.14.33.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 14:33:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jul 2017 14:33:24 -0700
Message-Id: <20170710213324.43346-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-browser][PATCH] chromium: Do not enforce gold as default linker
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
X-List-Received-Date: Mon, 10 Jul 2017 21:33:34 -0000

Provide a knob USEGOLD however to enable it if desired

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>
---
 recipes-browser/chromium/chromium-browser.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium-browser.inc b/recipes-browser/chromium/chromium-browser.inc
index 094a3d3..1e4fb1e 100644
--- a/recipes-browser/chromium/chromium-browser.inc
+++ b/recipes-browser/chromium/chromium-browser.inc
@@ -200,7 +200,12 @@ python add_ozone_wayland_patches() {
     d.appendVar('SRC_URI', ' ' + d.getVar('OZONE_WAYLAND_EXTRA_PATCHES', False))
 }
 
-USEGOLD ?= "-Dlinux_use_gold_flags=1"
+# uncomment below or set it in a bbappend if you want to use gold linker
+# to link chromium irrespective of system linker, gold speeds up linking
+# chromium ( 8mins to < 2mins on a decent xeon system)
+#
+#USEGOLD = "-Dlinux_use_gold_flags=1"
+USE_GOLD ??= ""
 
 EXTRA_OEGYP = " \
 	-Dangle_use_commit_id=0 \
-- 
2.13.2


