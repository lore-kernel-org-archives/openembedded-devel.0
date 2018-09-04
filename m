Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 82D6274FCB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 18:58:04 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id e11-v6so2062347plb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2018 11:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fjUaEs+/yRs8HZqVvuPuCVj4g7f9m0iNOm8Xrs75izY=;
	b=nMRI9r3Kpg/7XfVbqHNrul+9lnIhwf2POh214unAweSiAktu3i0SEzsj8eUzVnoVN5
	DY2nv4vQeHJiehRiGZacB26Ho3n5wXA7YtF8COSceBN2sQ+xOLCeU+P6bk7SpMEzqiA0
	2ieWmMaYHXhGpPY9Tz+5uUzabCeRpSMVMpjgy2v6NJj+y2xFka4iT5GXlRPHoXniaVCW
	fl0OknL/cDOu/Uuhu0VZv4j55Pp6opfdK96eUsmoTW2l3qJsOXFg1Ovg73A7KWK+POwr
	fb5qMrcrRuWJwWIuDseHZ56Bo/j9OE0h1Wg4SwA9iyRzEOk+AZ0+/plFHgzxWGyCcarf
	9Ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fjUaEs+/yRs8HZqVvuPuCVj4g7f9m0iNOm8Xrs75izY=;
	b=LLBI+y26rj3qsL0CggwKNvKDqluCns0rL71RUG/Rge6oNf7m0ge42XePfKmvYL5WL7
	SBNy9LNnMCW5L1hFEgvV4Q0cDaam0PfH9G6THk7C80NPJzB2UTiZ3+va/5CYZTSNsbdg
	O9FytQ3wvBFG6vyH/LaEKeUyZsEbRB23Ipvc12ExrSCEw/d901EkCwDTpl3Xols5uuUc
	Ht/vj7/SAHkGFOOqLr2c/D1qtTddq+wAZrIU2GAedhF7LQc+WEcXY6KHzUlkCKH44fw5
	uR6lLrZYOizYn41iJmR5Z7cKPreaqU/9xEeGiFjmAy1Yp2nxkvFYeEUCRWauAFd0m23o
	zIZg==
X-Gm-Message-State: APzg51CqeeJA0CsDSAfEW+KzeyjCvp9d/VowUHLNI+gWQFCH1E4fBens
	Mqrvksf+EW9rEB9z//U6lFDrdwjz
X-Google-Smtp-Source: ANB0VdZ/4s4sY7W4+0dm+izW0Rhhbie5szRvAWWoeXHHnuLiqY4d5S7l2Wdak3cXplaV4t7hXr9x+g==
X-Received: by 2002:a17:902:8481:: with SMTP id
	c1-v6mr35063847plo.177.1536087484935; 
	Tue, 04 Sep 2018 11:58:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	v7-v6sm33722784pgh.57.2018.09.04.11.58.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Sep 2018 11:58:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Sep 2018 11:57:45 -0700
Message-Id: <20180904185750.23747-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-oe][PATCH 1/6] jack: Fix build with python 3.7+
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
X-List-Received-Date: Tue, 04 Sep 2018 18:58:04 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../jack/0001-Python-3.7-fixes-2126.patch     | 26 +++++++++++++++++++
 meta-oe/recipes-multimedia/jack/jack_git.bb   |  4 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-Python-3.7-fixes-2126.patch

diff --git a/meta-oe/recipes-multimedia/jack/jack/0001-Python-3.7-fixes-2126.patch b/meta-oe/recipes-multimedia/jack/jack/0001-Python-3.7-fixes-2126.patch
new file mode 100644
index 0000000000..e6021cd706
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/jack/0001-Python-3.7-fixes-2126.patch
@@ -0,0 +1,26 @@
+From 72564b04151b61fa8d954bbb43afc58108ee50ec Mon Sep 17 00:00:00 2001
+From: Thomas Nagy <tnagy@waf.io>
+Date: Mon, 12 Mar 2018 20:42:55 +0100
+Subject: [PATCH] Python 3.7 fixes #2126
+
+Upstream-Status: Backport
+[https://gitlab.com/ita1024/waf/commit/facdc0b173d933073832c768ec1917c553cb369c]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ waflib/Node.py | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/waflib/Node.py b/waflib/Node.py
+index fb3cd273..405a6fec 100644
+--- a/waflib/Node.py
++++ b/waflib/Node.py
+@@ -537,8 +537,6 @@ class Node(object):
+ 					if maxdepth:
+ 						for k in node.ant_iter(accept=accept, maxdepth=maxdepth - 1, pats=npats, dir=dir, src=src, remove=remove):
+ 							yield k
+-		raise StopIteration
+-
+ 	def ant_glob(self, *k, **kw):
+ 		"""
+ 		This method is used for finding files across folders. It behaves like ant patterns:
diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_git.bb
index 11da6b1be0..52559cb367 100644
--- a/meta-oe/recipes-multimedia/jack/jack_git.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
@@ -14,7 +14,9 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "libsamplerate0 libsndfile1 readline"
 
-SRC_URI = "git://github.com/jackaudio/jack2.git"
+SRC_URI = "git://github.com/jackaudio/jack2.git \
+           file://0001-Python-3.7-fixes-2126.patch \
+           "
 SRCREV = "c1647819eed6d11f94b21981d9c869629299f357"
 PV = "1.9.12"
 S = "${WORKDIR}/git"
-- 
2.18.0


