Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B58F165CBA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Sep 2016 22:36:45 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a6so210355wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2016 15:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=dYNCgj1Nsk/SXjB90wEEzvjlg6vbb+lQnFYLi0dgfGU=;
	b=HwXn4eZvf/Wf0x3Etj2dfpbQWjOgHAGl5VyQy0FBv49inFqPU3vG2VW4SwzyDhL1ws
	OXS22JApuxn+tcmCjRTy8rWg+kfni9O05MXKquyXv0GEKAXdaRPmM5Jto6ZLyz4gZQ1e
	KvXoBoDJ2W8vEa3gJO0kB97PJt/kR+aoDeIVvPn+LMQaW9O3KJDQagJyBDcpaHiiJP1f
	pcJqPkSFK6luRAvK2NHuQwXBJGDQAqxFu+C9wf1A/TQHcrkSrBj6uufvNHWAFGCKV9uS
	tBSAvkzV/S60AczGvRncRBkx4Zgeh8V9AGfQHeYDPJ7OBZtlICUhXAz2+FhM2evmkTQO
	XKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dYNCgj1Nsk/SXjB90wEEzvjlg6vbb+lQnFYLi0dgfGU=;
	b=Q/gXco/AFL+pDGKg+EIoKvNZqCSfe0Jmn31BKkgvGvojslRT1IADZG9vndYRw91R0h
	HOJiyMhJFflz1+m4y31bMx4krfFP98PvtjhLnkY1LUH+Gx7Et6HnRyRFG3BnkMxKkTS8
	lCpr7SqwAL4YO55vsCU5q7Dgpdb6xCdQO9mB9VSsaOU2264BkZrz8gDPPm/oseGOy+cO
	lIJtAGkqmV0eX0AWmfQkO2zlQhUodfA4cbr7PKffux4pgskClSsqabdYztaKQ+Jcpqbt
	5T+9zdIRDtSDVjo5SLTO53mzy5PY00kphql2VprcBd7yJ6JdV6QZN4ThoZhfqha1GdpK
	wZJw==
X-Gm-Message-State: AE9vXwNhELJNB2sG4YW94znVE6QcJv7+5zzfVycB7c5HkM1QOUgOBWkYQKKtrRMHEJqc4w==
X-Received: by 10.28.65.84 with SMTP id o81mr535318wma.83.1473374205819;
	Thu, 08 Sep 2016 15:36:45 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3574.dip0.t-ipconnect.de.
	[91.10.53.116]) by smtp.googlemail.com with ESMTPSA id
	d62sm267938wmd.7.2016.09.08.15.36.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Sep 2016 15:36:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Sep 2016 00:36:23 +0200
Message-Id: <1473374183-3022-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1473374183-3022-1-git-send-email-schnitzeltony@googlemail.com>
References: <1473374183-3022-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] abiword: unblacklist and fix
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
X-List-Received-Date: Thu, 08 Sep 2016 22:36:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* gtkmathview is building again
* fic ccompile with gcc-6

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-13754-Fix-build-on-gcc-6-default-to-C-11.patch | 74 ++++++++++++++++++++++
 meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb  |  3 +-
 2 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/abiword/abiword/0002-Bug-13754-Fix-build-on-gcc-6-default-to-C-11.patch

diff --git a/meta-gnome/recipes-gnome/abiword/abiword/0002-Bug-13754-Fix-build-on-gcc-6-default-to-C-11.patch b/meta-gnome/recipes-gnome/abiword/abiword/0002-Bug-13754-Fix-build-on-gcc-6-default-to-C-11.patch
new file mode 100644
index 0000000..595ee8e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/abiword/abiword/0002-Bug-13754-Fix-build-on-gcc-6-default-to-C-11.patch
@@ -0,0 +1,74 @@
+From a83e6f50dbd5efa16fb39efe32b9de370f103130 Mon Sep 17 00:00:00 2001
+From: Hubert Figuiere <hub@figuiere.net>
+Date: Sat, 23 Jan 2016 20:46:02 +0000
+Subject: [PATCH] Bug 13754 - Fix build on gcc-6 (default to C++11).
+
+This is debian bug https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=811381
+
+git-svn-id: svn+ssh://svn.abisource.com/svnroot/abiword/trunk@35182 bcba8976-2d24-0410-9c9c-aab3bd5fdfd6
+
+Upstream-Status: Backport
+---
+ plugins/collab/backends/service/xp/RealmProtocol.cpp | 4 ++--
+ plugins/collab/backends/service/xp/soa_soup.cpp      | 2 +-
+ plugins/latex/xp/ie_exp_LaTeX.cpp                    | 2 +-
+ plugins/xslfo/xp/ie_exp_XSL-FO.cpp                   | 2 +-
+ 4 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/plugins/collab/backends/service/xp/RealmProtocol.cpp b/plugins/collab/backends/service/xp/RealmProtocol.cpp
+index fb426eb..347a49c 100644
+--- a/plugins/collab/backends/service/xp/RealmProtocol.cpp
++++ b/plugins/collab/backends/service/xp/RealmProtocol.cpp
+@@ -6,8 +6,8 @@ namespace protocolv1 {
+ 
+ #define MAX_PACKET_DATA_SIZE 64*1024*1024
+ 		
+-#define RPV1_PACKET_NONEXISTENT -2
+-#define RPV1_PACKET_VARIABLE -1
++#define RPV1_PACKET_NONEXISTENT uint32_t(-2)
++#define RPV1_PACKET_VARIABLE uint32_t(-1)
+ 	
+ static uint32_t body_size[6] = {
+ 	RPV1_PACKET_NONEXISTENT, /* 0: reserved */
+diff --git a/plugins/collab/backends/service/xp/soa_soup.cpp b/plugins/collab/backends/service/xp/soa_soup.cpp
+index 4b81735..f4f5134 100644
+--- a/plugins/collab/backends/service/xp/soa_soup.cpp
++++ b/plugins/collab/backends/service/xp/soa_soup.cpp
+@@ -163,7 +163,7 @@ namespace soup_soa {
+ 	
+ 	static bool _invoke(const std::string& /*url*/, const soa::method_invocation& /*mi*/, SoaSoupSession& sess, std::string& result) {
+ 		if (!sess.m_session || !sess.m_msg )
+-			return soa::GenericPtr();
++			return false;
+ 
+ 		guint status = soup_session_send_message (sess.m_session, sess.m_msg);
+ 		if (!(SOUP_STATUS_IS_SUCCESSFUL (status) ||
+diff --git a/plugins/latex/xp/ie_exp_LaTeX.cpp b/plugins/latex/xp/ie_exp_LaTeX.cpp
+index 7aaf3a9..8bcc250 100644
+--- a/plugins/latex/xp/ie_exp_LaTeX.cpp
++++ b/plugins/latex/xp/ie_exp_LaTeX.cpp
+@@ -1330,7 +1330,7 @@ void s_LaTeX_Listener::_outputData(const UT_UCSChar * data, UT_uint32 length)
+ 	m_pie->write(sBuf.c_str(),sBuf.size());
+ }
+ 
+-#define SUB(a,who) case a: subst = "\\(\\"who"\\)"; return true;
++#define SUB(a,who) case a: subst = "\\(\\" who"\\)"; return true;
+ #define SUBd(a,who) case a: subst = who; return true;
+ static bool _convertLettersToSymbols(char c, const char *& subst)
+ {
+diff --git a/plugins/xslfo/xp/ie_exp_XSL-FO.cpp b/plugins/xslfo/xp/ie_exp_XSL-FO.cpp
+index cc5e4e6..957226e 100644
+--- a/plugins/xslfo/xp/ie_exp_XSL-FO.cpp
++++ b/plugins/xslfo/xp/ie_exp_XSL-FO.cpp
+@@ -1451,7 +1451,7 @@ void s_XSL_FO_Listener::_openSection(PT_AttrPropIndex api)
+ 	{ \
+ 		UT_UTF8String esc = szValue; \
+ 		esc.escapeXML(); \
+-		buf += " "x"=\""; \
++		buf += " " x"=\""; \
+ 		buf += esc.utf8_str(); \
+ 		buf += "\""; \
+ 	}
+-- 
+2.5.5
+
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
index 49a2a2f..5052b36 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
@@ -13,6 +13,7 @@ RCONFLICTS_${PN} = "${PN}-embedded"
 SRC_URI = " \
     http://www.abisource.com/downloads/${BPN}/${PV}/source/${BP}.tar.gz \
     file://0001-plugins-aiksaurus-Makefile.am-remove-uncomplete-opti.patch \
+    file://0002-Bug-13754-Fix-build-on-gcc-6-default-to-C-11.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c5edcc3ccd864b19004d14e9c1c9a26a"
@@ -122,5 +123,3 @@ python populate_packages_prepend () {
 }
 
 FILES_${PN}-plugin-openxml += "${datadir}/${PN}-${SHRT_VER}/omml_xslt"
-
-PNBLACKLIST[abiword] ?= "Depends on broken gtkmathview"
-- 
2.5.5


