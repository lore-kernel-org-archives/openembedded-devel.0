Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0884D7719B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:30:15 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id 78so93383975lfy.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=agAjVE4j0Wq4PklyUi6YX+2QEb/3HGZmqAPFx32V95o=;
	b=NaXTLSnsp1vgUZD/D8y+eo+NGe1VOjDuQwEGfscaazSAN208IQ10vvPfc4Ii2cA9lz
	f1jHFgQMj81XA5x2qYXTRHtFKlRpsZhuWcPJT+mAkSkW8oxqOTG9wIkOYXc0KGgmJ9+e
	79IwQRxIN3jsPAvzgOiNMUllNGZ/3hctZgnBinLbkh6k7wtqk9wsiRtRj1yWQ+ZQObFk
	mW79Jay76tdHQa7rUzXYGvyf/uLJvzEbUGqqojam24/ieDeZr98tC60PSfn3uaho2diC
	JnTem9rNKxD1xbKcUiBo8yZxEuz+pEUL2trcNvwFQQMmv+sH4wNhZBp2kaKPBoEeI0fx
	Gdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=agAjVE4j0Wq4PklyUi6YX+2QEb/3HGZmqAPFx32V95o=;
	b=IunBVOp8RoIYuyOSU9XQinrDepdwhfVQHH+LtVfVUJj/Z3+Nhw8VBYXuNB03a3bqGl
	PAibe+lpz3C6cPnNkiAlw/RpQAa0rRfJElkfgzZ9nnWOeCPp0YQ9T2eLsXDpWFz1153F
	BAqyArzDd0GWEb6HjTY6EGk9Vc6nkxeFR4tRARSiGPfHrocRLqP05yQDdPlN3RSjHL3W
	0KnwAIw3RNv+o96cRU1zFEv6HcoE79IPJY3lymVX2jfBlmNRkYGHrW3DRtfumNMoD/43
	DepeaBlr8jQAHBE3CJG7THuW900IdRqWrynR2ijdUt0F7yf1cuXzb4Y52E5dccIUQ5Rh
	LVqA==
X-Gm-Message-State: AG10YOS1qtcs2PoTD5EaS4Ij3nWU5IjCNL+Dl8Gn2ocLwgl2+PKpVa4sdlAf3Y/gLxayIQ==
X-Received: by 10.25.40.210 with SMTP id o201mr2612731lfo.44.1456147815921;
	Mon, 22 Feb 2016 05:30:15 -0800 (PST)
Received: from localhost (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by smtp.gmail.com with ESMTPSA id i66sm3399805lfg.4.2016.02.22.05.30.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:30:15 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:30:12 +0100
Message-Id: <714f0539a7c5c412491cba40aef377350ece67a5.1456147772.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456147772.git.anders@chargestorm.se>
References: <cover.1456147772.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-python][PATCH 1/1] python-werkzeug: add required RDEPENDS
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
X-List-Received-Date: Mon, 22 Feb 2016 13:30:18 -0000

The following RDEPENDS were necessary to be able to properly
start a simple demo app (and also enable debug traces).

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-python/recipes-devtools/python/python-werkzeug.inc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
index fab5a73..0693b47 100644
--- a/meta-python/recipes-devtools/python/python-werkzeug.inc
+++ b/meta-python/recipes-devtools/python/python-werkzeug.inc
@@ -14,3 +14,17 @@ SRC_URI[md5sum] = "9479bc7ea6a42c2d0d82929d3926df67"
 SRC_URI[sha256sum] = "eb5f700a9bfc96420b055635af9002d3662e43d80c3ffd31f224c25bc0d5f462"
 
 PYPI_PACKAGE = "Werkzeug"
+
+RDEPENDS_${PN} += " \
+    python-difflib \
+    python-email \
+    python-html \
+    python-json \
+    python-netserver \
+    python-numbers \
+    python-pkgutil \
+    python-subprocess \
+    python-threading \
+    python-unixadmin \
+    python-zlib \
+"
-- 
2.7.0


