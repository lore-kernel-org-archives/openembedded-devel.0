Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D153EC4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 10:28:19 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.5574.1665484096285381097
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Oct 2022 03:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MMSM+Q4x;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id qw20so29768690ejc.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Oct 2022 03:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/cc7ZDsVzspWCtxZCVscVix9uAb3TksnmqbTqSytHfc=;
        b=MMSM+Q4xGvqpBZD5hH0VzInYYjR4Czae+SAMXYJLnc+wU8jSx4ELRBnDTlVO4Q1TL9
         uh5SZns2tHhbATcpOBoJXuKx3ytwZceKGcDwdfL2Wz3oMFSNQ+HHX0oY2sMRDQ3JMCWh
         MM+9I2H1a/hiydM+XesxpaqKuJTNS6UHFNR81EU243pasbD5Qmcn2k/Qa9cRsg4R+rGs
         vc6NQZ3epMHEK0ybH0gJvQUAX140s07tx/TAtPo/1sSpyHGW/POcx1Cew2BEQu6s65Bl
         vY6nhbt7ylcacYp4s53mt+jJyD/M1E8Q8fkY7Rz2+DjPyr9d/SXs8Sz2RPoOWDS8glIW
         +uAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cc7ZDsVzspWCtxZCVscVix9uAb3TksnmqbTqSytHfc=;
        b=e0e+xe7J3mnMi1vuzjf+Pxi7t8CO9ddS3i0N1xzTtQNUtiR5uRBEgOloako0BIPkng
         SBwtPtldgqxGYiGzpEd2qfr2l6+JhVm5uc0UQIdB4baqYsXmhBs6KRYs35BUjRsauPkX
         PP1vaJqLtAP6/JPpHX/+GUnFxoRjkZ+9sSWDB87V4e28wdvSWtvMPofEXv7Co/9qzWyr
         70z74bCYc/Hvj+RcG+lMg8xNoW9scUhFfppdbW7oq1qvj9coeHbgFI/FURXZNxXi6p5Z
         M1rReCm0OcK5Qk0TerjfV9U1J5FLuddkeqGFW+aLclM6UFYePzLteba+0b9EvqLc2doB
         EU1w==
X-Gm-Message-State: ACrzQf2++oS2isdTSnz9hr01zlNZDr3PCqe+/geH4vhBq2lUO10fu5+2
	ithLdOb0nPqt4ovkX3ALEc95VWK2yImDTg==
X-Google-Smtp-Source: 
 AMsMyM74kfZ33jQxxzyPJJwBvIjc7mcfbQEFJYPvkAUYk9ayn6a5qBBJJCG0r7ofROa6KgAI8zW6PA==
X-Received: by 2002:a17:907:7635:b0:78d:c5e9:3e57 with SMTP id
 jy21-20020a170907763500b0078dc5e93e57mr5695316ejc.204.1665484094580;
        Tue, 11 Oct 2022 03:28:14 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 us3-20020a170906bfc300b0074134543f82sm6748241ejb.90.2022.10.11.03.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 03:28:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] jack: fix compatibility with python-3.11
Date: Tue, 11 Oct 2022 12:28:08 +0200
Message-Id: <20221011102808.695829-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Oct 2022 10:28:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99138

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...U-mode-bit-for-opening-files-in-pyth.patch | 52 +++++++++++++++++++
 .../recipes-multimedia/jack/jack_1.19.21.bb   |  4 +-
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
diff --git a/meta-oe/recipes-multimedia/jack/jack_1.19.21.bb b/meta-oe/recipes-multimedia/jack/jack_1.19.21.bb
index c9496233f6..808b8259f0 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.19.21.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.19.21.bb
@@ -14,7 +14,9 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "libsamplerate0 libsndfile1 readline"
 
-SRC_URI = "git://github.com/jackaudio/jack2.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/jackaudio/jack2.git;branch=master;protocol=https \
+    file://0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch \
+"
 SRCREV = "6b3c96d8aeef8aeb4b20f3aa647e6d01b4000ff8"
 
 S = "${WORKDIR}/git"
-- 
2.38.0


