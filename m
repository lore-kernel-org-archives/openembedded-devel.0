Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9DBE672FC8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 23:58:20 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id n37so2484718qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:58:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=h6sNzlQenrA+H60ycNpxrLzcpvQxCQMzOErxG49VGpE=;
	b=Pf+sGVP5WL9ZHgJGtImP6kGG+rxgM/7peG/vdGY8fzFoTHwnbuetHBzuTQrDPFv/NG
	8BxoOVmHzD9OQYJWe3V0t5FLExhwvQaNS20ntXexrwdOPdQVJt8XRCJ/4SfbbQfAisje
	okyAB7RCZ+Vix9/WcHlvXuMqLjQbpKzP7rUOptbF/EM6cgVYnANy9RLhF1nAiBxlQqgv
	YADTynKpiT5rWPvy6eiryBE81BjTQsTa33atQpJCudQzPmBPZrN9plMeK9Og8ybYVg/T
	8zJJUKTt/jOyNZ1o79donDSrX8y2pHmMTMlDSW6wU/JSQxHRZ9a70JsJBarKTm5Sbn9z
	JxfQ==
X-Gm-Message-State: AMke39mDhkrF/MASDpWv7IU175Z3rGdkeWyli9HugpEFpKkAG5DYfPuOkufxB7U4DcwPlA==
X-Received: by 10.237.62.25 with SMTP id l25mr18609573qtf.225.1487807901376;
	Wed, 22 Feb 2017 15:58:21 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	e16sm1666353qkj.64.2017.02.22.15.58.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 15:58:20 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 18:58:10 -0500
Message-Id: <1487807890-25247-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-autobahn: remove obsolete recipe
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
X-List-Received-Date: Wed, 22 Feb 2017 23:58:21 -0000

The autobahn recipe does not currently function and is extremely out
of date.  The only known consumer of this was cloudeebus, which is
also being removed.  The new version requires a large number of
dependencies that are not currently in meta-python.  Since there are
no known users, the recipe will be removed for now until other consumers
are identified.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-autobahn_0.8.6.bb     | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-autobahn_0.8.6.bb

diff --git a/meta-python/recipes-devtools/python/python-autobahn_0.8.6.bb b/meta-python/recipes-devtools/python/python-autobahn_0.8.6.bb
deleted file mode 100644
index e64dd8f..0000000
--- a/meta-python/recipes-devtools/python/python-autobahn_0.8.6.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "AutobahnPython provides a WebSocket (RFC6455, Hybi-10 to -17, Hixie-76) framework for creating WebSocket-based clients and servers. \
-AutobahnPython also includes an implementation of WAMP (The WebSockets Application Messaging Protocol), a light-weight,  \
-asynchronous RPC/PubSub over JSON/WebSocket protocol."
-HOMEPAGE = "http://autobahn.ws/python"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = " file://autobahn/__init__.py;beginline=1;endline=17;md5=1fdeccf6e5b70cda64cc1345597c18e3"
-
-SRC_URI[md5sum] = "160429e7fb043940e79aa7f4ebbab57a"
-SRC_URI[sha256sum] = "94ae5c6f37f9fe7c9d3f12c170fcc273afed4104a1c5508b26d6014bb9e6373e"
-
-PYPI_PACKAGE_EXT = "zip"
-inherit pypi setuptools
-
-RDEPENDS_${PN} = "python python-pprint python-twisted-protocols python-netserver python-twisted-web"
-
-- 
2.7.4


