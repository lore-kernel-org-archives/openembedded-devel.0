Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 83C256FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 17:35:21 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id k67so147481919wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 10:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Cv5YJN3GsNM8t6XrutATKWnFKjEBqzcMIBePv/Z6x4I=;
	b=eUBOb7l+EUR5QyA5+7/LsPucXAnlDILpCVeIvNp9uXm3ZE5Vzh1KKFCuthdn53Gykh
	6JdBvTI10YpqrBcrpIB8Ksh8D5jaubefrgJStQYWh/nonq4WOmIXB0e23XhGC0gNW1Bd
	qIbIpAM/JBpsvjpDJ7DAgAy2G6KSjQnSGNy5vOAevhvW2U0oyo5JA4i5BVZ+Wufk0XTI
	nze1dvSXm1pK42pE9TVdPr0380RNfcdGoCbokL6BBc5x0tKYtUlcw+clBYAL3EON+3zI
	KCtQ35p/GHrbUmokBCFmBW6gUYybp6BJHUotgp/qECJBrPsaDhrCBM9axHXjuOZXDmXi
	c6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Cv5YJN3GsNM8t6XrutATKWnFKjEBqzcMIBePv/Z6x4I=;
	b=IjHY7XOgV01c4JhhN1ccv9sUBTaacc8X0zcSTI38JpccKCT1K++32UvfaNRr8SqZ9e
	NB8gxuzZGVQqazqkg7qhM+ApGOAdFchbnwQyeFGpwRZyt36C6zFm02G2J8Vg/NnI7t/B
	d8Uf53UKTO0bT5I5HjAh6WVkDEJe6G1XILAtZrKQrUeZNV8Y+JNtqjl/UXxcovOQs9P7
	IvJnee3sFVp8K3xDqCoKPLMnptiziu/l53B1MbuQAejk5shkZm+IvOCqHINPXi8JL0FJ
	6Y9RWuoNDX1jcSfN9E9BtZIfZMQN3+QfnQkJumyRjSFKZrQQSKxeZf/UmCDigzoHzG+B
	DJyw==
X-Gm-Message-State: AIVw111BNawhNnPLeM83Zqixa+jIpIoo2i930K2iJgEKWwXXNiRyrpMt
	B+yrJI89HtZkMhnD
X-Received: by 10.223.147.132 with SMTP id 4mr7858540wrp.107.1499708122105;
	Mon, 10 Jul 2017 10:35:22 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E9066A861E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e906:6a86:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	z195sm11980102wmz.28.2017.07.10.10.35.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 10:35:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jul 2017 19:35:06 +0200
Message-Id: <20170710173507.3843-5-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170710173507.3843-1-schnitzeltony@googlemail.com>
References: <20170710173507.3843-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] abiword: update 3.0.1 -> 3.0.2
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
X-List-Received-Date: Mon, 10 Jul 2017 17:35:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch was a backport now included upstream

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-13754-Fix-build-on-gcc-6-default-to-C-11.patch | 74 ----------------------
 .../abiword/{abiword_3.0.1.bb => abiword_3.0.2.bb} |  5 +-
 2 files changed, 2 insertions(+), 77 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/0002-Bug-13754-Fix-build-on-gcc-6-default-to-C-11.patch
 rename meta-gnome/recipes-gnome/abiword/{abiword_3.0.1.bb => abiword_3.0.2.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword/0002-Bug-13754-Fix-build-on-gcc-6-default-to-C-11.patch b/meta-gnome/recipes-gnome/abiword/abiword/0002-Bug-13754-Fix-build-on-gcc-6-default-to-C-11.patch
deleted file mode 100644
index 595ee8e..0000000
--- a/meta-gnome/recipes-gnome/abiword/abiword/0002-Bug-13754-Fix-build-on-gcc-6-default-to-C-11.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From a83e6f50dbd5efa16fb39efe32b9de370f103130 Mon Sep 17 00:00:00 2001
-From: Hubert Figuiere <hub@figuiere.net>
-Date: Sat, 23 Jan 2016 20:46:02 +0000
-Subject: [PATCH] Bug 13754 - Fix build on gcc-6 (default to C++11).
-
-This is debian bug https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=811381
-
-git-svn-id: svn+ssh://svn.abisource.com/svnroot/abiword/trunk@35182 bcba8976-2d24-0410-9c9c-aab3bd5fdfd6
-
-Upstream-Status: Backport
----
- plugins/collab/backends/service/xp/RealmProtocol.cpp | 4 ++--
- plugins/collab/backends/service/xp/soa_soup.cpp      | 2 +-
- plugins/latex/xp/ie_exp_LaTeX.cpp                    | 2 +-
- plugins/xslfo/xp/ie_exp_XSL-FO.cpp                   | 2 +-
- 4 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/plugins/collab/backends/service/xp/RealmProtocol.cpp b/plugins/collab/backends/service/xp/RealmProtocol.cpp
-index fb426eb..347a49c 100644
---- a/plugins/collab/backends/service/xp/RealmProtocol.cpp
-+++ b/plugins/collab/backends/service/xp/RealmProtocol.cpp
-@@ -6,8 +6,8 @@ namespace protocolv1 {
- 
- #define MAX_PACKET_DATA_SIZE 64*1024*1024
- 		
--#define RPV1_PACKET_NONEXISTENT -2
--#define RPV1_PACKET_VARIABLE -1
-+#define RPV1_PACKET_NONEXISTENT uint32_t(-2)
-+#define RPV1_PACKET_VARIABLE uint32_t(-1)
- 	
- static uint32_t body_size[6] = {
- 	RPV1_PACKET_NONEXISTENT, /* 0: reserved */
-diff --git a/plugins/collab/backends/service/xp/soa_soup.cpp b/plugins/collab/backends/service/xp/soa_soup.cpp
-index 4b81735..f4f5134 100644
---- a/plugins/collab/backends/service/xp/soa_soup.cpp
-+++ b/plugins/collab/backends/service/xp/soa_soup.cpp
-@@ -163,7 +163,7 @@ namespace soup_soa {
- 	
- 	static bool _invoke(const std::string& /*url*/, const soa::method_invocation& /*mi*/, SoaSoupSession& sess, std::string& result) {
- 		if (!sess.m_session || !sess.m_msg )
--			return soa::GenericPtr();
-+			return false;
- 
- 		guint status = soup_session_send_message (sess.m_session, sess.m_msg);
- 		if (!(SOUP_STATUS_IS_SUCCESSFUL (status) ||
-diff --git a/plugins/latex/xp/ie_exp_LaTeX.cpp b/plugins/latex/xp/ie_exp_LaTeX.cpp
-index 7aaf3a9..8bcc250 100644
---- a/plugins/latex/xp/ie_exp_LaTeX.cpp
-+++ b/plugins/latex/xp/ie_exp_LaTeX.cpp
-@@ -1330,7 +1330,7 @@ void s_LaTeX_Listener::_outputData(const UT_UCSChar * data, UT_uint32 length)
- 	m_pie->write(sBuf.c_str(),sBuf.size());
- }
- 
--#define SUB(a,who) case a: subst = "\\(\\"who"\\)"; return true;
-+#define SUB(a,who) case a: subst = "\\(\\" who"\\)"; return true;
- #define SUBd(a,who) case a: subst = who; return true;
- static bool _convertLettersToSymbols(char c, const char *& subst)
- {
-diff --git a/plugins/xslfo/xp/ie_exp_XSL-FO.cpp b/plugins/xslfo/xp/ie_exp_XSL-FO.cpp
-index cc5e4e6..957226e 100644
---- a/plugins/xslfo/xp/ie_exp_XSL-FO.cpp
-+++ b/plugins/xslfo/xp/ie_exp_XSL-FO.cpp
-@@ -1451,7 +1451,7 @@ void s_XSL_FO_Listener::_openSection(PT_AttrPropIndex api)
- 	{ \
- 		UT_UTF8String esc = szValue; \
- 		esc.escapeXML(); \
--		buf += " "x"=\""; \
-+		buf += " " x"=\""; \
- 		buf += esc.utf8_str(); \
- 		buf += "\""; \
- 	}
--- 
-2.5.5
-
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
rename to meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
index 34fc97d..2a13e48 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
@@ -28,13 +28,12 @@ RCONFLICTS_${PN} = "${PN}-embedded"
 SRC_URI = " \
     http://www.abisource.com/downloads/${BPN}/${PV}/source/${BP}.tar.gz \
     file://0001-plugins-aiksaurus-Makefile.am-remove-uncomplete-opti.patch \
-    file://0002-Bug-13754-Fix-build-on-gcc-6-default-to-C-11.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c5edcc3ccd864b19004d14e9c1c9a26a"
 
-SRC_URI[md5sum] = "f3f8052e7b4979a43b75775a381e6cb8"
-SRC_URI[sha256sum] = "e094f6fbf0afc5c5538b4894888e7c346f8ee8f49c9d24821dd696d0734865c6"
+SRC_URI[md5sum] = "cda6dd58c747c133b421cc7eb18f5796"
+SRC_URI[sha256sum] = "afbfd458fd02989d8b0c6362ba8a4c14686d89666f54cfdb5501bd2090cf3522"
 
 #want 3.x from 3.x.y for the installation directory
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
-- 
2.9.4


