Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id AF5346F92A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:26 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id x13so7847634wgg.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=somCJsZFn5fWEvO/8F6YRRsVc0Hz5bEz8dRPnDcFYYU=;
	b=X097otCB+W87DVr7vPNGpb5idPuCU7mQyf60zyCdKieUJ/jPWPqy/2emgujuiVagnn
	ToDdCvPKlrqBfaqx9ZMuOk4z0mFNdGGTcabxiloo1WuBEHkiDm0JzTe/FKS/hxxNLlVr
	50VwzRKYZZI+ZU4IQenNoGwwAYZ6/F89spk7uUD3bL11bn973M1eT9QjQ6jkXPv7TuwL
	uSUwmUmdlXfIninBdIp+sjUCgUWQBUetuwOGMvd5MUMlPZvyPySyMecmONvCVQ/VWOSM
	STpwChJ5fIWScHDQ1cQ300S7Ibp2rFOwTr9LfiO3/hhBPFFzqJzs+QNoWslsj64p3JZm
	aUaA==
X-Received: by 10.194.174.42 with SMTP id bp10mr15506471wjc.57.1396372467022; 
	Tue, 01 Apr 2014 10:14:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z48sm41850916eel.27.2014.04.01.10.14.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:22 +0200
Message-Id: <1396372434-10710-14-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 14/46] tracker: inherit only gnomebase, fix QA warn
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:28 -0000

* fixes configure was passed unrecognised options: --disable-schemas-install
* fixes QA warning:
  tracker-0.14.2: tracker: Files/directories were installed but not shipped
    /usr/lib/tracker-0.14/writeback-modules/libwriteback-taglib.so
    /usr/lib/tracker-0.14/writeback-modules/libwriteback-taglib.la

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/tracker/tracker_0.14.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/tracker/tracker_0.14.2.bb b/meta-oe/recipes-support/tracker/tracker_0.14.2.bb
index fc6db4b..7c989c6 100644
--- a/meta-oe/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-oe/recipes-support/tracker/tracker_0.14.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://projects.gnome.org/tracker/"
 
 PR = "r7"
 
-inherit autotools pkgconfig gnome gettext gsettings systemd
+inherit autotools pkgconfig gnomebase gettext gsettings systemd
 
 VER_DIR = "${@gnome_verdir("${PV}")}"
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/tracker/${VER_DIR}/tracker-${PV}.tar.xz \
@@ -60,6 +60,8 @@ FILES_${PN} += "${datadir}/dbus-1/ \
 
 FILES_${PN}-dev += "${libdir}/tracker-${VER_DIR}/*.la \
                     ${libdir}/tracker-${VER_DIR}/*.so \
+                    ${libdir}/tracker-${VER_DIR}/*/*.so \
+                    ${libdir}/tracker-${VER_DIR}/*/*.la \
                     ${libdir}/tracker-${VER_DIR}/extract-modules/*.la"
 
 FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a"
-- 
1.9.1


