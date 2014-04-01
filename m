Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id D91FD6FAC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:15:23 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id n12so7818737wgh.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NnqPEj9X3GlskoQ+8ldg80URi6oGtYdhDj/0WdW1yPo=;
	b=WV3XY+hx+9SmLynSEqtQXA9ZjjSe16VRlKtMYJvm4+ew31i2bC6evQG/Q9MiFYkXWs
	vqgV/eJik1RP/W8pGEmQNIw5MkySwkXBNgZkNor6t/frx7NNhuP65MaJDVAauCEqzpwQ
	afPnZyoLCmpaFYfgPwznacpQYbAybdIB4t5uL3OL0Z7SbLmRSpUeqZhkht2GE+ymJD/g
	zMN26SD2IWPR4oEAmvFa5X91YAB7p+JQvOsbGbqUQWOK2ICNvjOVGI9wWKYorff8Fbjc
	zfev6/VAGgQceMRdBZvLjxQ3v8Lgek/YIThntF2fbU1zlNspD3OSxfHS1kYdqHFPhMgg
	KfkQ==
X-Received: by 10.194.120.101 with SMTP id lb5mr6085193wjb.74.1396372524443;
	Tue, 01 Apr 2014 10:15:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	44sm41847932eek.30.2014.04.01.10.15.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:15:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:45 +0200
Message-Id: <1396372434-10710-37-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 37/46] edbus: remove test-gui option
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
X-List-Received-Date: Tue, 01 Apr 2014 17:15:24 -0000

* was removed in:
  commit eeca5e83e550179640bdbc6f71c8b3688944ff4d
  Author: barbieri <barbieri@7cbeb6ba-43b4-40fd-8cce-4c39aea84d33>
  Date:   Fri Feb 26 23:05:02 2010 +0000

    hal: remove pointless test gui.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edbus.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edbus.inc b/meta-efl/recipes-efl/efl/edbus.inc
index ffa1eb2..7b11af5 100644
--- a/meta-efl/recipes-efl/efl/edbus.inc
+++ b/meta-efl/recipes-efl/efl/edbus.inc
@@ -13,11 +13,10 @@ INC_PR = "r0"
 
 SRCNAME = "e_dbus"
 
-EXTRA_OECONF += "--enable-build-test-gui"
 # it needs to be disabled, because creates circular dependency on elementary
 EXTRA_OECONF += "--disable-edbus-performance-test"
 
-PACKAGES =+ "${PN}-enotify ${PN}-edbus ${PN}-enm ${PN}-ehal ${PN}-econnman ${PN}-eofono ${PN}-eukit ${PN}-ebluez ${PN}-test-gui"
+PACKAGES =+ "${PN}-enotify ${PN}-edbus ${PN}-enm ${PN}-ehal ${PN}-econnman ${PN}-eofono ${PN}-eukit ${PN}-ebluez"
 FILES_${PN}-enotify = "${libdir}/libenotify.so.* ${bindir}/e-notify-send"
 FILES_${PN}-edbus = "${libdir}/libedbus.so.*"
 FILES_${PN}-enm = "${libdir}/libenm.so.*"
@@ -26,6 +25,5 @@ FILES_${PN}-econnman = "${libdir}/libeconnman.so.* ${libdir}/libeconnman0_7x.so.
 FILES_${PN}-eofono = "${libdir}/libeofono.so.*"
 FILES_${PN}-eukit = "${libdir}/libeukit.so.*"
 FILES_${PN}-ebluez = "${libdir}/libebluez.so.*"
-FILES_${PN}-test-gui = "${bindir}/e_dbus_hal"
 FILES_${PN} += "${datadir}/e_dbus/logo.png"
 
-- 
1.9.1


