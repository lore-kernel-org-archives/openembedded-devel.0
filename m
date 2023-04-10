Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DA4C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:58:41 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.54244.1681153117622691887
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=NlL2Bgvv;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id ga37so14971334ejc.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 11:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681153116; x=1683745116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GmF7wJYj4uE02ul6k0j7RpcP0vXUhbnV4IT9kqd5KR4=;
        b=NlL2BgvvmiBw2eO5tkvUotN4okAjl4gG+eEm/s0qtxCTd+0+x6DCLHhxLbKXEwjgG9
         p5jYQruMQ5+rmoadn1tcGapAhjRzGpTKF0SbQpzVE6b5I1tI/a/fcOULFCOvar8rB11S
         QRdqoWKSWGjyHMgwCeP2eEObghNljI6ywkZo9tluE8rnYqGkZHH0baQ1HkhE9lnDOpM3
         a1SMOm8zMHADogKxywSdaWBwO2eW6nXYQPjkBMTuTc0CZdFLecoKLiVMaavqjnbyAiH8
         HTq0jpjyVtms3fb356xGI3d4a/n07QHXVhlI+XZSMZimx/FREkNopwBpxku7lnv2hQJ2
         oBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681153116; x=1683745116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GmF7wJYj4uE02ul6k0j7RpcP0vXUhbnV4IT9kqd5KR4=;
        b=RviP2BblynN4V+frBvm60yh4g2+RSqA0CEhNqtipMrAtEOeC1nNbs9p8nCKhyBQLym
         gVO7gBy6yUivolwSiC+WXCYGtjKDLokRryBX3ebfZUKmEYE5nRRRrZaCs2SuKh81AfC8
         JyETCPcMyIbKvdbNMtSR8iBNIwqR1Z/InHGgNbJ+a2A6xYY/1qOH6fVWUUuknOLoBWcq
         BnQdCgEKBFPxrzukLlcXxWMJHAISiJVkRphTiGSkopN/8Wqb4I1301CXyvR4UDt3Gyd/
         cf8wyjkgUn5m7WpOfrm3Ssu49I1usbjbeJQTeHMShKkNyc9dajS7dTUAKMvZZAilZSfU
         ta7w==
X-Gm-Message-State: AAQBX9foUdruWYaq1NGjWneywy9isTATRV33XqavA528clAw4KEFsgDv
	ClthDXYHNUa2cmJv4j3oprZWV43S2xg=
X-Google-Smtp-Source: AKy350YrmIS9Kdnzx7bYkOEDqhmC1CQzeNsKrnqWb1FL0SVDpRUU5mJZF8ZIsdcAX0SdpjoxrrMfrA==
X-Received: by 2002:a17:906:388c:b0:947:4828:4399 with SMTP id q12-20020a170906388c00b0094748284399mr7556734ejd.12.1681153116023;
        Mon, 10 Apr 2023 11:58:36 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id xd4-20020a170907078400b0094a941ad8f0sm1098552ejb.193.2023.04.10.11.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:58:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 1/9] jack: fix compatibility with python-3.11
Date: Mon, 10 Apr 2023 20:58:11 +0200
Message-Id: <20230410185819.2416704-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 18:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102043

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...U-mode-bit-for-opening-files-in-pyth.patch | 52 +++++++++++++++++++
 .../recipes-multimedia/jack/jack_1.19.20.bb   |  4 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch

diff --git a/meta-oe/recipes-multimedia/jack/jack/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch b/meta-oe/recipes-multimedia/jack/jack/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch
new file mode 100644
index 0000000000..d3b203111f
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/jack/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch
@@ -0,0 +1,52 @@
+From 415d50fc56b82963e5570c7738c61b22f4a83748 Mon Sep 17 00:00:00 2001
+From: Daan De Meyer <daan.j.demeyer@gmail.com>
+Date: Mon, 11 Jul 2022 00:56:28 +0200
+Subject: [PATCH] Remove usage of 'U' mode bit for opening files in python
+
+The 'U' mode bit is removed in python 3.11. It has been
+deprecated for a long time. The 'U' mode bit has no effect
+so this change doesn't change any behavior.
+
+See https://docs.python.org/3.11/whatsnew/3.11.html#changes-in-the-python-api
+
+Upstream-Status: Submitted [https://github.com/jackaudio/jack2/pull/884]
+---
+ waflib/ConfigSet.py | 2 +-
+ waflib/Context.py   | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/waflib/ConfigSet.py b/waflib/ConfigSet.py
+index b300bb56..84736c9c 100644
+--- a/waflib/ConfigSet.py
++++ b/waflib/ConfigSet.py
+@@ -312,7 +312,7 @@ class ConfigSet(object):
+ 		:type filename: string
+ 		"""
+ 		tbl = self.table
+-		code = Utils.readf(filename, m='rU')
++		code = Utils.readf(filename, m='r')
+ 		for m in re_imp.finditer(code):
+ 			g = m.group
+ 			tbl[g(2)] = eval(g(3))
+diff --git a/waflib/Context.py b/waflib/Context.py
+index 9fee3fa1..761b521f 100644
+--- a/waflib/Context.py
++++ b/waflib/Context.py
+@@ -266,7 +266,7 @@ class Context(ctx):
+ 				cache[node] = True
+ 				self.pre_recurse(node)
+ 				try:
+-					function_code = node.read('rU', encoding)
++					function_code = node.read('r', encoding)
+ 					exec(compile(function_code, node.abspath(), 'exec'), self.exec_dict)
+ 				finally:
+ 					self.post_recurse(node)
+@@ -662,7 +662,7 @@ def load_module(path, encoding=None):
+ 
+ 	module = imp.new_module(WSCRIPT_FILE)
+ 	try:
+-		code = Utils.readf(path, m='rU', encoding=encoding)
++		code = Utils.readf(path, m='r', encoding=encoding)
+ 	except EnvironmentError:
+ 		raise Errors.WafError('Could not read the file %r' % path)
+ 
diff --git a/meta-oe/recipes-multimedia/jack/jack_1.19.20.bb b/meta-oe/recipes-multimedia/jack/jack_1.19.20.bb
index 452f066559..ea8c0f385a 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.19.20.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.19.20.bb
@@ -14,7 +14,9 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "libsamplerate0 libsndfile1 readline"
 
-SRC_URI = "git://github.com/jackaudio/jack2.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/jackaudio/jack2.git;branch=master;protocol=https \
+    file://0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch \
+"
 SRCREV = "a2fe7ec2fdbd315f112c8035282d94a429451178"
 
 S = "${WORKDIR}/git"
-- 
2.40.0


