Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE10CCC6B08
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 12:07:20 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5486.1791893236718230665
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 05:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=N0PTi+cR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20261013120713a7aa267e060002071a-kl3ojh@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20261013120713a7aa267e060002071a
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 13 Oct 2026 14:07:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=bL/9Gd7cVE2AosNBUD7rjOx2aW7LHUKxO6jv2M9pZw0=;
 b=N0PTi+cRQm5Z8yz23VlyAicJ48dDQzA6uMtLR+R0l6to46BCLUqBFVZal+ssvbYhgl68UI
 uK/OX0dA9Jj+/aaMEI8C385CMZ/RpIE3GPhFF8gEODOMKfxuivzUA24urfEHkLHyiiRkxBJN
 fStTvFWNDw/r9VNQVZpoBD+X5cNhuRsO7MJo/+cew1dFgpKc/Qnd/ExP8H7PpRh0RGN2ERaG
 mM3p9Tli+pW6yWLqG6gyB44l7YmOjBTcqcNDiswhNU5K7eXLdglzBMj7lVzbbeAJJmgtmyTw
 GivVqRImvK9EPKi8aVkW7kztgpefGE0R7ME+hvbmaJbThDOVW/t7EbXw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH] python3-thrift: upgrade 0.22.0 -> 0.25.0
Date: Tue, 13 Oct 2026 14:07:08 +0200
Message-ID: <20261013120708.531626-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 12:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130864

From: Peter Marko <peter.marko@siemens.com>

This upgrade includes fix for 61 CVEs, many of them are for python.
Add a dependency missing at least since 0.20.0 for code:

lib/py/src/server/TProcessPoolServer.py:from multiprocessing import Process, Value, Condition

Release announcement: [1]
Release notes: [2]

[1] https://lists.apache.org/thread/prryfzdozvt6t02c9k5jf46or3m7ctzy
[2] https://github.com/apache/thrift/blob/v0.25.0/CHANGES.md

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{python3-thrift_0.24.0.bb => python3-thrift_0.25.0.bb}     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-connectivity/python-thrift/{python3-thrift_0.24.0.bb => python3-thrift_0.25.0.bb} (80%)

diff --git a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.25.0.bb
similarity index 80%
rename from meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb
rename to meta-python/recipes-connectivity/python-thrift/python3-thrift_0.25.0.bb
index 257122b784..ba4bd647a7 100644
--- a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.24.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.25.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python bindings for the Apache Thrift RPC system"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
 
-SRC_URI[sha256sum] = "9ef601c49e988475ff0e741d8e1b45feec23b48514e524341efc274191f1789c"
+SRC_URI[sha256sum] = "e85615ae9245f5622a5e36a9d2d867e1e7b17a8ca467b257dece5dc1642ccd73"
 
 inherit pypi python_setuptools_build_meta
 
@@ -13,6 +13,7 @@ PYPI_ARCHIVE_NAME_PREFIX = "python-"
 
 RDEPENDS:${PN} += "\
     python3-logging \
+    python3-multiprocessing \
     python3-scons \
     python3-stringold \
     python3-threading \

