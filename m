Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 87D216B83C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:55 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so182743eek.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=4dUZpPCZpzB45htG3AYJxL/RhsvLP8c856sn0NJ3YTE=;
	b=ZboEaCJ8YUft8cU4Fnrv5zLd3eMxCjEr/TRFRRaJCR3PtUvYj1pBEiAkJ3D07vFsBb
	mwbe+KagAZJWrLR5yv9b/7cqXxSDrwEyHKFmjiRw32tZ3igRpjwJV45OK40rsXJKI3Ob
	lcwb4JXj7LLf7Mg301juT2JkYaf9BT/d9HawdeJ7mO/xkQd0awlCHvra2N6WIIrIZHtZ
	mA20TJiPHSlpo5wkMgaVYKAO8f78x6mVr4h/Lf5rG8dhsrSrIc1yyFkiEfhPq8sZ7Eak
	c4L++Qxur/PzwmrmbAiO/KxM+8YP9SwK1hHyQgwI4wzfj1x45itN8+oZLrbygz6cMvAE
	5C5Q==
X-Received: by 10.14.175.9 with SMTP id y9mr41018eel.79.1376551195996;
	Thu, 15 Aug 2013 00:19:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm4980860eez.3.2013.08.15.00.19.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:27 +0200
Message-Id: <b63e64d075c9a2f19fb94d658998ea225920eb78.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 47/60] usbmuxd: fix unpackaged files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Aug 2013 07:19:55 -0000

* WARNING: QA Issue: usbmuxd: Files/directories were installed but not shipped
  /usr/lib64
  /usr/lib64/libusbmuxd.so.1.0.8
  /usr/lib64/libusbmuxd.so.2
  /usr/lib64/libusbmuxd.so
  /usr/lib64/.debug
  /usr/lib64/pkgconfig
  /usr/lib64/.debug/libusbmuxd.so.1.0.8
  /usr/lib64/pkgconfig/libusbmuxd.pc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
index 595582a..52bf811 100644
--- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
@@ -17,5 +17,8 @@ S = "${WORKDIR}/git"
 
 FILES_${PN} += "${base_libdir}/udev/rules.d/"
 
+# fix usbmuxd installing files to /usr/lib64 on 64bit hosts:
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[plist] = "-DWANT_PLIST=1,-DWANT_PLIST=0,libplist"
-- 
1.8.3.2


