Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id D179A7EEBB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:39:31 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id l21so16489614pgm.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 09:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9XtDPz5YmCZLt/AHMQ+vpwfLk/gQ0z4wp6XHunk3zXA=;
	b=kO6kgyNcwpRh+uSNZ1RcxUb32E4v3ydfyBNlDYgcokcBl1kTMNwHB+9qRGPILREIXZ
	RZ6n9z2MHNUcz6FftLP3uuXijU1ph3GWojRijoLVnCBdPZ4IpRZm26Dl31aZgwSER0No
	P4uOyMwL79Q1omcA5yKngmxxpuWDcIfkoXULUgZZDK5t/HgeYNNPC5qMylwurZFcOYSm
	uig0WK7SiRmXO/iiGRF3DTBNmpDSfTm0FhFagsNeXxk2WLYPBeafe+D2JMLqCdDY2UD0
	BriwBdol2yG03CBn9DT2cUSpTsDVrd8G5p6nzCsGnnzylB89F9373aiUeJPZI93H24qj
	HzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9XtDPz5YmCZLt/AHMQ+vpwfLk/gQ0z4wp6XHunk3zXA=;
	b=sG8RWrHFQc1tk1Q1pW6l7dIecX+lBb1WSX9ChH00wad8qjWE9gTr5VkwHfvVaVS+y8
	zARKmQYY+525Pw2rM/8P0NGCUkZ1JUOHdXaej6cZYdPW1dnRuVRjofOYJUnfKkY+4k5W
	enRqDBa6Tp8pgAfcK/xlhNMhBZOeEnQZdtmZRPggFyawxT3l3hfyJgO/XRCW/15K6YWe
	7Y1WK6T5/YeuV7i9JlunxD5sndmCmxhevOrn+grUZuIgsmBUf+U7tEY4wbdbiqtkulIp
	y1oFI4tAgl1ZWxcyXLjjN3TRRlqfy3ywWDPNA79PjVaFpV16a7467OcX6LqX4Du/1ZI+
	kU8Q==
X-Gm-Message-State: APjAAAUyiAoDls6J+FNjl2UnkNkcQDcmGWAI/PLRSJ8UwF0WVNDdyKNf
	ocpe7vZaCMlMOZcs+/PKJ58hbscLb/0=
X-Google-Smtp-Source: APXvYqyByUmqCLva/sf0i6UXuy8Z37RWsq+g46pwV/UPWrPNT7vlajxiTFoU/hEZY36geoBvwrEVjA==
X-Received: by 2002:a63:5045:: with SMTP id q5mr58419393pgl.380.1563727172480; 
	Sun, 21 Jul 2019 09:39:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	35sm38763285pgw.91.2019.07.21.09.39.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 09:39:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 09:39:10 -0700
Message-Id: <20190721163919.32659-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190721163919.32659-1-raj.khem@gmail.com>
References: <20190721163919.32659-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 05/14] firewalld: Update to 0.6.3->0.6.4
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
X-List-Received-Date: Sun, 21 Jul 2019 16:39:31 -0000
Content-Transfer-Encoding: 8bit

Forward port patch to work with 0.6.4 and update the status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...a-separate-directory-outside-the-sou.patch | 19 +++++--------------
 ...{firewalld_0.6.3.bb => firewalld_0.6.4.bb} |  8 ++++----
 2 files changed, 9 insertions(+), 18 deletions(-)
 rename meta-networking/recipes-connectivity/firewalld/{firewalld_0.6.3.bb => firewalld_0.6.4.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch b/meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
index 3f34ff2e4c..28d5902429 100644
--- a/meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
+++ b/meta-networking/recipes-connectivity/firewalld/files/0001-fix-building-in-a-separate-directory-outside-the-sou.patch
@@ -1,10 +1,8 @@
 firewalld: fix building in a separate directory outside the source tree
 
-Upstream-Status: Submitted [https://github.com/firewalld/firewalld/pull/456]
+Upstream-Status: Accepted [https://github.com/firewalld/firewalld/pull/456]
 Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
 
-diff --git a/config/Makefile.am b/config/Makefile.am
-index 7048d2ee..5270d408 100644
 --- a/config/Makefile.am
 +++ b/config/Makefile.am
 @@ -377,11 +377,11 @@ install-config:
@@ -24,8 +22,6 @@ index 7048d2ee..5270d408 100644
  
  uninstall-config:
  	rmdir $(DESTDIR)$(sconfdir)/icmptypes
-diff --git a/doc/xml/Makefile.am b/doc/xml/Makefile.am
-index 8c93ab9c..d0313e3e 100644
 --- a/doc/xml/Makefile.am
 +++ b/doc/xml/Makefile.am
 @@ -69,7 +69,8 @@ edit = sed \
@@ -38,25 +34,23 @@ index 8c93ab9c..d0313e3e 100644
  
  transform-man.xsl: transform-man.xsl.in
  	$(edit) $< >$@
-diff --git a/doc/xml/firewall-cmd.xml.in b/doc/xml/firewall-cmd.xml.in
-index c2606553..24d77858 100644
 --- a/doc/xml/firewall-cmd.xml.in
 +++ b/doc/xml/firewall-cmd.xml.in
-@@ -1,9 +1,9 @@
+@@ -1,10 +1,10 @@
  <?xml version="1.0" encoding="utf-8"?>
  <!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
  [
 -<!ENTITY authors SYSTEM "authors.xml">
 -<!ENTITY seealso SYSTEM "seealso.xml">
 -<!ENTITY notes SYSTEM "notes.xml">
+-<!ENTITY errorcodes SYSTEM "errorcodes.xml">
 +<!ENTITY authors SYSTEM "@SRCDIR@/authors.xml">
 +<!ENTITY seealso SYSTEM "@SRCDIR@/seealso.xml">
 +<!ENTITY notes SYSTEM "@SRCDIR@/notes.xml">
- <!ENTITY errorcodes SYSTEM "errorcodes.xml">
++<!ENTITY errorcodes SYSTEM "@SRCDIR@/errorcodes.xml">
  ]>
  
-diff --git a/doc/xml/firewalld.xml.in b/doc/xml/firewalld.xml.in
-index de802059..3d319b04 100644
+ <!--
 --- a/doc/xml/firewalld.xml.in
 +++ b/doc/xml/firewalld.xml.in
 @@ -1,9 +1,9 @@
@@ -72,6 +66,3 @@ index de802059..3d319b04 100644
  ]>
  
  <!--
--- 
-2.20.1
-
diff --git a/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.3.bb b/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.4.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/firewalld/firewalld_0.6.3.bb
rename to meta-networking/recipes-connectivity/firewalld/firewalld_0.6.4.bb
index e999fa7a5d..5955072f15 100644
--- a/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.3.bb
+++ b/meta-networking/recipes-connectivity/firewalld/firewalld_0.6.4.bb
@@ -4,12 +4,12 @@ BUGTRACKER = "https://github.com/firewalld/firewalld/issues"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "https://github.com/firewalld/firewalld/archive/v${PV}.tar.gz \
-           file://firewalld.init \
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://0001-fix-building-in-a-separate-directory-outside-the-sou.patch \
+           file://firewalld.init \
 "
-SRC_URI[md5sum] = "5ef954d9b6b244ffeabcd226be1867a0"
-SRC_URI[sha256sum] = "039ad56ea6d6553aadf33243ea5b39802d73519e46a89c80c648b2bd1ec78aeb"
+SRC_URI[md5sum] = "e63bdd65a4d2f6338f60b31e91bb5525"
+SRC_URI[sha256sum] = "5a82a72fd9ad4cbbfb805bae615faa9b91a27855245de0fef3bcb06439394852"
 
 # glib-2.0-native is needed for GSETTINGS_RULES autoconf macro from gsettings.m4
 # xmlto-native is needed to populate /etc/xml/catalog.xml in the sysroot so that xsltproc finds the docbook xslt
-- 
2.22.0


