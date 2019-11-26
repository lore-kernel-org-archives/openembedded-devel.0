Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3599F7FC93
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 19:49:11 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id a10so8755816pju.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Nov 2019 11:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dQ3LdSTVglWa2umfDwdzLZsnfNNaVMLn8PmH23CizPw=;
	b=O806L5xV5qEoqM8PQGQ4IaMLiqmlCRO2fVmh/VZm9rFrbePLXXghNTvZ6iIHRwpiXo
	zVPmY5UG0bXxsKpFghReyFknHpuQhC7szNiDVofOglFdc0aqGg7Tnr9tD4t38SyPK2Mi
	Q7Ut8lwd3Y8D13vMfW/id//zaa19H1VqrnBBK8gofXgB8mHfZ6Cc1MZOqkjM4ybuRUm+
	vODhIDDZOsjGUuTrPKj8IMmpbV2l5nVNM5XcoTmfiOu98c2WEeIMWISwRreb7Zugufcb
	JbM1NK7D6WyMK5DD2HLZl0iCWLecehGO2d5H7MJNAoQIoQF9KwnMTSyqi/fM6J614uC5
	LLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dQ3LdSTVglWa2umfDwdzLZsnfNNaVMLn8PmH23CizPw=;
	b=HKZJ0Fh2t7X3xlMqCIjovVnZAx6UW6q/ZRFeY7uOLZiWNafwo6jtJJHmg+d23uPjwv
	ok3xabqMYOFZCp4U2wog0w3BfqyFa8f2NHHUTCYIpdnaUXbmMAiBtfNQfYmywXvNI8lj
	mp0yzDYCwSaPuPdDPjSJNtlm8Weu3l7ZAcy8F2S2t3nX3+8n/X1vpqW2AAN+QfdkElEe
	zA5mDyWcG4DXS1Cm+6qXEf9VYRXc/FutF2zKM+a2fDHGHpdVXa9inHriacG0QC4psukZ
	nvTdujANfKoal5NGipmvNDH4UBAvYXNKOi9f4DAmdmO4Mka1Fjqz4nBb6ERH8J6mIkI/
	eL8A==
X-Gm-Message-State: APjAAAUoHyq9GBBsKBL0/hGO6Cd3V5Rxe0i2pX9BAhq6+il/0C7rCN5m
	95RZKJVppMQYnN1qL6tEM3k86k/VcTg=
X-Google-Smtp-Source: APXvYqy7jIGk7U4JupPn2NKoJw9s1EzUcRVDi5s9xu0P575Njc5Xb1XiTXzfTZHYSqYq19+4FW6AfQ==
X-Received: by 2002:a17:90a:868b:: with SMTP id
	p11mr1090416pjn.60.1574797751785; 
	Tue, 26 Nov 2019 11:49:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::e439])
	by smtp.gmail.com with ESMTPSA id
	b17sm13971474pfr.17.2019.11.26.11.49.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 26 Nov 2019 11:49:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Nov 2019 11:48:58 -0800
Message-Id: <20191126194858.2002923-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191126194858.2002923-1-raj.khem@gmail.com>
References: <20191126194858.2002923-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] jack: Replace using python2 with python3 during build
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
X-List-Received-Date: Tue, 26 Nov 2019 19:49:11 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...waf-Use-Python-3-instead-of-Python-2.patch | 24 +++++++++++++++++++
 meta-oe/recipes-multimedia/jack/jack_git.bb   |  4 +++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-waf-Use-Python-3-instead-of-Python-2.patch

diff --git a/meta-oe/recipes-multimedia/jack/jack/0001-waf-Use-Python-3-instead-of-Python-2.patch b/meta-oe/recipes-multimedia/jack/jack/0001-waf-Use-Python-3-instead-of-Python-2.patch
new file mode 100644
index 0000000000..9a2f07d3be
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/jack/0001-waf-Use-Python-3-instead-of-Python-2.patch
@@ -0,0 +1,24 @@
+From fac214660ba173043fc19a5e81f9312e0466c0e2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 26 Nov 2019 11:44:50 -0800
+Subject: [PATCH] waf: Use Python 3 instead of Python 2
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ waf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/waf b/waf
+index a2efc852..037d20b1 100755
+--- a/waf
++++ b/waf
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # encoding: latin-1
+ # Thomas Nagy, 2005-2018
+ #
+-- 
+2.24.0
+
diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_git.bb
index 9f7d5b0b61..dc30ceb461 100644
--- a/meta-oe/recipes-multimedia/jack/jack_git.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
@@ -14,7 +14,9 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "libsamplerate0 libsndfile1 readline"
 
-SRC_URI = "git://github.com/jackaudio/jack2.git"
+SRC_URI = "git://github.com/jackaudio/jack2.git \
+           file://0001-waf-Use-Python-3-instead-of-Python-2.patch \
+"
 SRCREV = "37250ff470277f9947fbf3ba738f943053e30525"
 PV = "1.9.13"
 S = "${WORKDIR}/git"
-- 
2.24.0


