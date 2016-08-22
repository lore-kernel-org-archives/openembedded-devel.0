Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id DFA86738AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:03:33 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id r128so8984132qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=ZgD+aiwjRxUBNqrom8H2ELW6PRFI44MLuQpnn027wrc=;
	b=zS9RRVWPVp/AfWlR/LOrPrgrGMMlymY2gSUs3e4m+7qlbCmLWML1jSNXIVf9PGfjgV
	VaT9HOpUtwZ9KFaE86VjWYX9VicVB/7MHQDwedcjTmBskCejPe/x4iKrrQ++MyTcpiAN
	Z6n4COzYGwFtaKoc7edWHhqY69KrlczjWYGfnNPMEWuuUFWfFPIJNhxAf2eYR97B020j
	14H6gKBa3ZsH73RD/CkJzYfIL4nUtKbTdX8kKJ6bezjqiLXuTACLuvA6Wk1n+upBVPcT
	WpIOx1Y1zYl53h3S8dmeuD9Sdr713HleL4mdye9h5AXkVP/O91LF46/xgwNduYXeTKOC
	3vbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=ZgD+aiwjRxUBNqrom8H2ELW6PRFI44MLuQpnn027wrc=;
	b=OUhtaz1RiSorezIdgwIEpxA7XhJSaT76kh5N02/E9TmVcJNyxRGAGFaMw9i5a8l/tz
	3OptMd6z7jiFoZQ0TZtqOhrIXNHMqv+mSnQttL8APBhAc7ztATJfFdBOWDqml+SHrgD0
	EAU7pCiQMVOOetX9LKKHP3EuF9tjuRkwKSvgoSqlQoz0zdBvHPOaAPW14tF/6XvhpPUt
	eWKZLmW0liK0FmbmtN/0KXrhONZhcN4nDbaPsMktLxYuOZ/duuihplOfn9BeLRUO52tQ
	4vB4Avlgo+qgDk02atQYE3lfpD2dZ27gBvRf5hRW6H3nHiQbXWo1e0rk9grcofOGzk87
	D/Hw==
X-Gm-Message-State: AEkoouv9URSx3ccHCiVUNEumcIT3qgekrKZV3vJ+agq2I6GefhW6SXHXhyXZGrzRTpTeLw==
X-Received: by 10.55.98.15 with SMTP id w15mr25048080qkb.41.1471892614693;
	Mon, 22 Aug 2016 12:03:34 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	g29sm10452469qtg.12.2016.08.22.12.03.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 12:03:33 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:01:29 -0300
Message-Id: <1471892491-6177-15-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 15/17] python-wcwidth, python3-wcwidth: Add recipe for version 0.1.7
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
X-List-Received-Date: Mon, 22 Aug 2016 19:03:34 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-wcwidth.inc       | 8 ++++++++
 meta-python/recipes-devtools/python/python-wcwidth_0.1.7.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-wcwidth_0.1.7.bb | 2 ++
 3 files changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-wcwidth.inc
 create mode 100644 meta-python/recipes-devtools/python/python-wcwidth_0.1.7.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-wcwidth_0.1.7.bb

diff --git a/meta-python/recipes-devtools/python/python-wcwidth.inc b/meta-python/recipes-devtools/python/python-wcwidth.inc
new file mode 100644
index 0000000..1429450
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-wcwidth.inc
@@ -0,0 +1,8 @@
+SUMMARY = "Library for building powerful interactive command lines in Python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=11fba47286258744a6bc6e43530c32a1"
+
+SRC_URI[md5sum] = "b3b6a0a08f0c8a34d1de8cf44150a4ad"
+SRC_URI[sha256sum] = "3df37372226d6e63e1b1e1eda15c594bca98a22d33a23832a90998faa96bc65e"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-wcwidth_0.1.7.bb b/meta-python/recipes-devtools/python/python-wcwidth_0.1.7.bb
new file mode 100644
index 0000000..ef107c1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-wcwidth_0.1.7.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-wcwidth.inc
diff --git a/meta-python/recipes-devtools/python/python3-wcwidth_0.1.7.bb b/meta-python/recipes-devtools/python/python3-wcwidth_0.1.7.bb
new file mode 100644
index 0000000..5f6259b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-wcwidth_0.1.7.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-wcwidth.inc
-- 
2.1.4


