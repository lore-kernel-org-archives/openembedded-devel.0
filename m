Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sqs2G-0000nj-4Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 22:36:52 +0200
Received: by wibhq4 with SMTP id hq4so2733818wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 13:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=dFc4wQVHTjY8iil0N8C89FrB8uv1NqURuO3G6KxvAwg=;
	b=mHGTljBLW+eTLsBs0A/d3gC1QfB9AnSryIDDANfoG5yvgQPWwi1t+Uxqnc7SdaK4FD
	+lo3HYXRlNF3yCSWc1Bw6YR4DBe8JHDHTAD9/Hl+BcrHsyTyPrkVx9Nq9RCJ3ApIECN6
	8GirWlVMJ0bT7mRZdK3HVnZUEIejYILXrXMXHmdeUzT0k6KkLzhh425zHhBxJFdvOPhW
	LLHk13156A0ZdnbTBQB9tivL5bw3NNrGre+Jl6mxa76fuOkdK3OZyxdQ81r/gXFiAe5S
	+eOeJcOqjPjVocCcR+B466K0lRWF+FKklV+udPGWENrYMBMnmt+SwyPzgDFF+2psnhI1
	EMFw==
Received: by 10.217.2.145 with SMTP id p17mr5132258wes.26.1342470333475;
	Mon, 16 Jul 2012 13:25:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu3sm34240738wib.10.2012.07.16.13.25.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 13:25:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jul 2012 22:25:38 +0200
Message-Id: <1342470338-6747-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <ju1q70$k0a$1@dough.gmane.org>
References: <ju1q70$k0a$1@dough.gmane.org>
Subject: [meta-browser][PATCH] chromium: use COMPATIBLE_HOST instead of COMPATIBLE_MACHINE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2012 20:36:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-browser/chromium/chromium_19.0.1049.3.bb |    6 ++----
 recipes-browser/chromium/chromium_20.0.1086.0.bb |    4 +---
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/recipes-browser/chromium/chromium_19.0.1049.3.bb b/recipes-browser/chromium/chromium_19.0.1049.3.bb
index e657c48..97843a3 100644
--- a/recipes-browser/chromium/chromium_19.0.1049.3.bb
+++ b/recipes-browser/chromium/chromium_19.0.1049.3.bb
@@ -10,10 +10,8 @@ SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P
 	file://softfloat-fix.patch \
 "
 
-# include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
-COMPATIBLE_MACHINE = "(-)"
-COMPATIBLE_MACHINE_armv6 = "(.*)"
-COMPATIBLE_MACHINE_armv7a = "(.*)"
+# include.gypi exists only for armv6 and armv7a
+COMPATIBLE_HOST = "(armv6|armv7).*-linux"
 
 PR = "r1"
 
diff --git a/recipes-browser/chromium/chromium_20.0.1086.0.bb b/recipes-browser/chromium/chromium_20.0.1086.0.bb
index 527f317..d1ae7e5 100644
--- a/recipes-browser/chromium/chromium_20.0.1086.0.bb
+++ b/recipes-browser/chromium/chromium_20.0.1086.0.bb
@@ -8,9 +8,7 @@ SRC_URI = "http://commondatastorage.googleapis.com/chromium-browser-official/${P
 "
 
 # include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
-COMPATIBLE_MACHINE = "(-)"
-COMPATIBLE_MACHINE_armv6 = "(.*)"
-COMPATIBLE_MACHINE_armv7a = "(.*)"
+COMPATIBLE_HOST = "(armv6|armv7).*-linux"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.8.6



