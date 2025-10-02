Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77081CCD188
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:47 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.7963.1759409977706501766
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dmj7saAN;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so144022166b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409976; x=1760014776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ooP01UTJ2wkbQyOjwvF6A+OYep8EDJ5W6RzD+Ujye9A=;
        b=Dmj7saANLDOiK6i91MxD2idhZ6nUsHYu/pg45xFeaiTH67Nb2U2WJfLyOTSz0MXcAi
         t1fIro788/ceLJGWivKb8xC6xQuhp66wsM/jbBHTNpVzS9JsgXdMA1bguShRckjzKQk2
         OBrMXOZeE1way4FdNPZ7W5I+7qVoagOqBjuop0yKgm5x1W3ZgTWvgnAGPe4KUpXTKFkp
         aB8wX4fKeJ1o9UXDaGQyXgbzIcEKOqnym5dRvxEbQ8go8N4T2WzE9ffK/YfxziFQQ9dn
         cOx2Ik+k0gOK2a5AqO8p4Wye8E/MqMzYFc7y3Cv5L3RbgMLsJiTx0nkIocUn+I36RuI1
         qjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409976; x=1760014776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ooP01UTJ2wkbQyOjwvF6A+OYep8EDJ5W6RzD+Ujye9A=;
        b=Qs7HAQIfIoXtXfgAtAwxpEYkbv4ahfCbuBGCaNQK0cfm9VaPv9AhRmvMnBg1Q6+1E+
         ASoECTHXKLW7h2hQfPY0HfRBBlhXn35NY3zM0jEJwqgy/piVuKnYpsEC9aBqghr3Pgtq
         D5x9eDC2lhDzk+CX3cVHjSrc6zNJ3EVyqPPLHA1dQVI6Vt5fTqJXohImzpUzyTm9t3LN
         Ycl0Q1gtRW7l6SIxGC17ANexZOrA0/4SeJkETc0gjtbm/BEdU1Ddx3TXbfs4XlCtzDtM
         Fhbm6JzHFLJp67ok/v/lgjFJpQxv/26d7ny8Jao2+pC6aHsQjvSB+LCy2Us6n0co9nHI
         tMKg==
X-Gm-Message-State: AOJu0YySw4T/Z9ZGQwmKypHfaUUqS7sRniWyQZs4CmIBh5VrhByNJRSI
	Pd0L1T17x9WCnkFpA3z87Evs9vvpGq8aNIqBRkFxWLk8rkBcqpzZH3YvmBViqA==
X-Gm-Gg: ASbGncv27NWY4MeHZpA9cVcCkBqUM6TLT3LZXOdNjqJ/TNZ2A4jdvDsehQJiQLQFSSn
	CfmMFtwmg1n92Mrz3vSZ5Zgqn+ECAYtEUGQtd3q3OGsoKORwAaTh1Wzu9sipEcbmFI5mE6wu28r
	Fntaz7XoceF8TilgyAC0cBLum8IR+Hq1ZE0y5vC3+Wg+KcERRyZ0aV9Y99cXV2o5S5z6gjcQpkT
	aN7zu8q38kA6E51QCB5n6Wa7Zt+K/rujmmilkeTYcjXR00Ok0mwAFmUZvbVmRjSo3MYWVqQS/xD
	Fh2oCt48ctvzZA5uH8dM0mL4foW70CZLH44h4sGnaVmGvgWQRRymT0qOqxJIX5nCOFxm6RD6E7Y
	iZR6Wc04MdHSyK5nm0K7xXx5LatgE81ic0d2Y8ysQW+Yl
X-Google-Smtp-Source: AGHT+IFpCd7jRBys9hqoAfdEBMkVxuuWZWcEJ1KWcbJqHCypdH4UFD3SQ6tgom2baIWDlJPb1fSuhA==
X-Received: by 2002:a17:907:94c4:b0:b3e:babd:f257 with SMTP id a640c23a62f3a-b46e4b8f4dbmr938309566b.10.1759409975794;
        Thu, 02 Oct 2025 05:59:35 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:35 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 11/26] procmail: patch CVE-2014-3618
Date: Thu,  2 Oct 2025 14:59:11 +0200
Message-ID: <20251002125926.2624522-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120180

From: Peter Marko <peter.marko@siemens.com>

Take patch from Debian.
https://sources.debian.org/data/main/p/procmail/3.22-20%2Bdeb7u1/debian/patches/CVE-2014-3618.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8378820dab0b6955fb0e2b27f24a1626f9124e5b)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../procmail/procmail/CVE-2014-3618.patch     | 29 +++++++++++++++++++
 .../recipes-support/procmail/procmail_3.22.bb |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch

diff --git a/meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch b/meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch
new file mode 100644
index 0000000000..b041924361
--- /dev/null
+++ b/meta-oe/recipes-support/procmail/procmail/CVE-2014-3618.patch
@@ -0,0 +1,29 @@
+Description: Fix heap-overflow in formail
+ CVE-2014-3618: Heap-overflow in formail when processing
+ specially-crafted email headers.
+Origin: http://www.openwall.com/lists/oss-security/2014/09/03/8
+Bug-Debian: https://bugs.debian.org/704675
+Bug-Debian: https://bugs.debian.org/760443
+Forwarded: not-needed
+Last-Update: 2014-09-04
+
+CVE: CVE-2014-3618
+Upstream-Status: Inactive-Upstream [lastrelease: 2001]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+--- a/src/formisc.c
++++ b/src/formisc.c
+@@ -84,12 +84,11 @@ normal:	   *target++= *start++;
+ 	case '"':*target++=delim='"';start++;
+       }
+      ;{ int i;
+-	do
++	while(*start)
+ 	   if((i= *target++= *start++)==delim)	 /* corresponding delimiter? */
+ 	      break;
+ 	   else if(i=='\\'&&*start)		    /* skip quoted character */
+ 	      *target++= *start++;
+-	while(*start);						/* anything? */
+       }
+      hitspc=2;
+    }
diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index 2e2735d192..4cfac9b49e 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -12,7 +12,9 @@ SRC_URI = "http://www.ring.gr.jp/archives/net/mail/${BPN}/${BP}.tar.gz \
     file://from-debian-to-fix-compile-errors.patch \
     file://from-debian-to-modify-parameters.patch \
     file://from-debian-to-fix-man-file.patch \
-    file://man-file-mailstat.1-from-debian.patch"
+    file://man-file-mailstat.1-from-debian.patch \
+    file://CVE-2014-3618.patch \
+"
 SRC_URI[md5sum] = "1678ea99b973eb77eda4ecf6acae53f1"
 SRC_URI[sha256sum] = "087c75b34dd33d8b9df5afe9e42801c9395f4bf373a784d9bc97153b0062e117"
 

