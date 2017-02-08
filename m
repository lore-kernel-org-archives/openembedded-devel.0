Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 53D6571DB8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 23:42:02 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 194so16102162pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 15:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ObktIlsql5LKkDXpnaBmrb9XfKLdioX6cvPKmli7XR4=;
	b=rhxXMnYl2JCsaYupBdCelmV8/Xycd0LMFCjcS2OrgCH3EIZUccbnNl1kvLHYLHvDIV
	Uv5mOgHPmx9+LEgBpX4rx11tqDhIBkf9y4h6RXmeZw1nJs4mGUxwHqsVs/Igj7yuox5f
	fKGT7bLeOJ+MvDTpQ9nkrmlPGBwtxQiwv+tX50mytKcvsjY4lZh526TdqNQbQwrGb4I4
	RgGaNx8RovisjgP5OC9pYO1V8d9Z2BOsDCvLv0Q/M6h4sKwwgMwAwijxu9+n1K4kW3qB
	oNLMzaDx420glOroGX6aWTpdl+w2ZKnUJK2ZOmPUQVcgtW8kls6SMaN0cEEwLTnaiyDa
	Ps0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ObktIlsql5LKkDXpnaBmrb9XfKLdioX6cvPKmli7XR4=;
	b=j9jLUF1Zr8rlcX9NhwyDhNwSFNHAHN6A0rg7FKrzNUpBX5ARrty/ouuudQE4WTAk01
	dyChWejleTyYUHTgb5xFWSemDX4Rg4Ydax9hhsJopylpV+N/ffrLr6+GjlbdOHtYQa/p
	WrSoH2miodY9kIFnQZCqmPcfR5usHpw8z/pqx2NsQ0oRyDuUgwZjSzq8pcyazGj2Zion
	DkfRifqdxhZRkSOmukp5J0RurRj6tbxAV0aGsSYzYdmSie4hGeJpA7fHRo7RbE8xGFW/
	8h7MWNJ4Jf4xc56tpDk7yvzqmjmdo6pJjH75iLFvDPIB+iMzIY5NN47yPiSiFZW7qBan
	CsOg==
X-Gm-Message-State: AMke39lZdV0THJvZEd/2lEyqh3GgNjo8Uw55j4pZSuMS4+u786zOaISuYTxFohMaJWPKjA==
X-Received: by 10.84.224.134 with SMTP id s6mr180462plj.49.1486597323485;
	Wed, 08 Feb 2017 15:42:03 -0800 (PST)
Received: from akuster-ThinkPad-X240.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	75sm22968823pfp.80.2017.02.08.15.42.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 15:42:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com, joe_macdonald@mentor.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:42:02 -0800
Message-Id: <1486597322-1483-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] tcpdump: update to 4.9.0 for security fixes
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
X-List-Received-Date: Wed, 08 Feb 2017 23:42:05 -0000

From: Armin Kuster <akuster@mvista.com>

CVE included in this release:
CVE-2016-7922 CVE-2016-7923 CVE-2016-7924 CVE-2016-7925
CVE-2016-7926 CVE-2016-7927 CVE-2016-7928 CVE-2016-7929
CVE-2016-7930 CVE-2016-7931 CVE-2016-7932 CVE-2016-7933
CVE-2016-7934 CVE-2016-7935 CVE-2016-7936 CVE-2016-7937
CVE-2016-7938 CVE-2016-7939 CVE-2016-7940 CVE-2016-7973
CVE-2016-7974 CVE-2016-7975 CVE-2016-7983 CVE-2016-7984
CVE-2016-7985 CVE-2016-7986 CVE-2016-7992 CVE-2016-7993
CVE-2016-8574 CVE-2016-8575 CVE-2017-5202 CVE-2017-5203
CVE-2017-5204 CVE-2017-5205 CVE-2017-5341 CVE-2017-5342
CVE-2017-5482 CVE-2017-5483 CVE-2017-5484 CVE-2017-5485
CVE-2017-5486

updated add-ptest patch to apply to Makefile.in

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../tcpdump/tcpdump/add-ptest.patch                | 25 ++++++++++------------
 .../tcpdump/{tcpdump_4.8.1.bb => tcpdump_4.9.0.bb} |  6 ++++--
 2 files changed, 15 insertions(+), 16 deletions(-)
 rename meta-networking/recipes-support/tcpdump/{tcpdump_4.8.1.bb => tcpdump_4.9.0.bb} (90%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
index 358f605..196cec7 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
+++ b/meta-networking/recipes-support/tcpdump/tcpdump/add-ptest.patch
@@ -10,11 +10,11 @@ Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
  Makefile.in | 10 +++++++++-
  1 file changed, 9 insertions(+), 1 deletion(-)
 
-diff --git a/Makefile.in b/Makefile.in
-index 8c35a45..4fb8ae6 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -428,9 +428,17 @@ distclean:
+Index: tcpdump-4.9.0/Makefile.in
+===================================================================
+--- tcpdump-4.9.0.orig/Makefile.in
++++ tcpdump-4.9.0/Makefile.in
+@@ -436,9 +436,17 @@ distclean:
  	    tests/failure-outputs.txt
  	rm -rf autom4te.cache tests/DIFF tests/NEW
  
@@ -25,14 +25,11 @@ index 8c35a45..4fb8ae6 100644
  	(cd tests && ./TESTrun.sh)
  
 +install-ptest:
-+	cp -r tests			$(DESTDIR) 
-+	cp -r config.h			$(DESTDIR)
-+	install -m 0755 Makefile 	$(DESTDIR)
-+	ln -sf /usr/sbin/tcpdump	$(DESTDIR)/tcpdump
++	cp -r tests                     $(DESTDIR)
++	cp -r config.h                  $(DESTDIR)
++	install -m 0755 Makefile        $(DESTDIR)
++	ln -sf /usr/sbin/tcpdump        $(DESTDIR)/tcpdump
 +
- tags: $(TAGFILES)
- 	ctags -wtd $(TAGFILES)
+ extags: $(TAGFILES)
+ 	ctags $(TAGFILES)
  
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.0.bb
similarity index 90%
rename from meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
rename to meta-networking/recipes-support/tcpdump/tcpdump_4.9.0.bb
index 35a5cfe..43e388c 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.8.1.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.0.bb
@@ -12,8 +12,10 @@ SRC_URI = " \
     file://add-ptest.patch \
     file://run-ptest \
 "
-SRC_URI[md5sum] = "32f57943649f276e09236ba66622bb0c"
-SRC_URI[sha256sum] = "20e4341ec48fcf72abcae312ea913e6ba6b958617b2f3fb496d51f0ae88d831c"
+
+SRC_URI[md5sum] = "2b83364eef53b63ca3181b4eb56dab0c"
+SRC_URI[sha256sum] = "eae98121cbb1c9adbedd9a777bf2eae9fa1c1c676424a54740311c8abcee5a5e"
+
 export LIBS=" -lpcap"
 
 inherit autotools-brokensep ptest
-- 
2.7.4


