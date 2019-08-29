Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED887F333
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 19:22:17 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id 26so371952pfp.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 12:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vazvWJp9Un5/vzIfclUH+ULn2V+3sfh3OLKHxCyVk0c=;
	b=ayYB8sGJHJt7KVv5Svx1GbuGPYr0gJOQDH2B310vov5iAhuNl/vwqcRafnWxw21Bb+
	HzojD4W/sToHKgXie3VCTHbIeuorwFW4kW6JjTtvt+gR0G8J21+xv/D8JMa5d4pRLPgE
	dfVo9yVUDCOHUjpfF5B2apDwWDx+pvPexX0gEWVtazgmG346VhPg6raLjRRecRUMlUwX
	UVE6nOdxqMKzgnqcFDhXindMnFD033PzGiXRtvvZoDT2tKbbq52LTKTWUKjZq7iPWzd2
	k/ZQ1lmvHqBad0jjjp+eIp9XsU3IbCXofucioWDDj823fjMZrMvr71kNQ8ae+0g+x7Ja
	7VBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vazvWJp9Un5/vzIfclUH+ULn2V+3sfh3OLKHxCyVk0c=;
	b=mW29n3ZMN2soa3gq12bAZCCP0vsEwoePemVBoHeYz/bK8yw7ga7xMn2LJqQcykzj6p
	p7GYhJVdBiPsGTIlNP9gPvNYQgWVea33rNLrg0KMsA0sfd0tWbjtSLNYjnuFnYzPg3J2
	q8Eptmnwg3ayAS718m0Z4LuRJ3mE8IkR7+I247aCoONtMiSkQP4aWf0cUcEcydBMQL9Y
	CDquxWE08HmLCaKNL0go/wQe5lae2WgiOYqk+3Q+quWkvvY/8WKe4L8xsERg2EXJtZTp
	HheI+6Q1k7dlBMH3LKTWnN7qbvS5CQ5FAb59gImE+x5QI4ybbmgNMsz3FDedUL/Bt021
	glWQ==
X-Gm-Message-State: APjAAAXN4JkPTmAi6q3FGhcHYjqgAhENu95u9UzH9FaiFRDKRYmgh2vW
	CDHlzLw/dJWWMi8RY3nn7cX3VCpDytA=
X-Google-Smtp-Source: APXvYqxqq3NlYt4oXxMZtPS+1rEoqRqrxQnsCMQaNp1rWtvOwARTlwPl2LeRGc8zPpyBMysvUc2AYg==
X-Received: by 2002:a65:518a:: with SMTP id h10mr9617388pgq.117.1567106537611; 
	Thu, 29 Aug 2019 12:22:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id s16sm4893281pfs.6.2019.08.29.12.22.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 12:22:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2019 12:22:05 -0700
Message-Id: <20190829192206.1200-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190829192206.1200-1-raj.khem@gmail.com>
References: <20190829192206.1200-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 4/5] linux-atm: Fix build with kernel headers 5.2+
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
X-List-Received-Date: Thu, 29 Aug 2019 19:22:17 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Include-linux-sockios.h-for-SIOCGST.patch | 59 +++++++++++++++++++
 .../linux-atm/linux-atm_2.5.2.bb              |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch
new file mode 100644
index 0000000000..a54869db89
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch
@@ -0,0 +1,59 @@
+From 4456e13880803a300e4b6f263ad22a37481b5df5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Aug 2019 09:33:43 -0700
+Subject: [PATCH] saaldump,atmdump: Include linux/sockios.h for SIOCGSTAMP
+
+In linux kernel commit 0768e17073dc527ccd18ed5f96ce85f9985e9115
+the asm-generic/sockios.h header no longer defines SIOCGSTAMP.
+Instead it provides only SIOCGSTAMP_OLD.
+
+The linux/sockios.h header now defines SIOCGSTAMP using either
+SIOCGSTAMP_OLD or SIOCGSTAMP_NEW as appropriate. This linux only
+header file is not pulled so we get a build failure.
+
+Fixes
+../../../linux-atm-2.5.2/src/maint/atmdump.c:142:18: error: use of undeclared identifier 'SIOCGSTAMP'
+            if (ioctl(s,SIOCGSTAMP,&stamp) < 0) {
+                        ^
+1 error generated.
+make[3]: *** [Makefile:623: atmdump.o] Error 1
+make[3]: *** Waiting for unfinished jobs....
+../../../linux-atm-2.5.2/src/maint/saaldump.c:169:14: error: use of undeclared identifier 'SIOCGSTAMP'
+        if (ioctl(s,SIOCGSTAMP,&stamp) < 0) {
+                    ^
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/maint/atmdump.c  | 2 +-
+ src/maint/saaldump.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/maint/atmdump.c b/src/maint/atmdump.c
+index 8b17826..9e4853b 100644
+--- a/src/maint/atmdump.c
++++ b/src/maint/atmdump.c
+@@ -5,7 +5,7 @@
+ #if HAVE_CONFIG_H
+ #include <config.h>
+ #endif
+-
++#include <linux/sockios.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <unistd.h>
+diff --git a/src/maint/saaldump.c b/src/maint/saaldump.c
+index 83bdde9..69429a8 100644
+--- a/src/maint/saaldump.c
++++ b/src/maint/saaldump.c
+@@ -5,7 +5,7 @@
+ #if HAVE_CONFIG_H
+ #include <config.h>
+ #endif
+-
++#include <linux/sockios.h>
+ #include <stdlib.h>
+ #include <stdarg.h>
+ #include <stdio.h>
+-- 
+2.23.0
+
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index 9ed7ca613b..e594906c33 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${P
            file://0001-ttcp-Add-printf-format-string.patch \
            file://0003-mpoad-Drop-old-hack-to-compile-with-very-old-glibc.patch \
            file://0001-IFNAMSIZ-is-defined-in-net-if.h.patch \
+           file://0001-saaldump-atmdump-Include-linux-sockios.h-for-SIOCGST.patch \
 "
 
 SRC_URI_append_libc-musl = " file://musl-no-on_exit.patch"
-- 
2.23.0


