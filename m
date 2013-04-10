Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPxwZ-0001NF-NZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:32:20 +0200
Received: by mail-ee0-f45.google.com with SMTP id c50so315625eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 09:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=TlLl4zHV8iJQ148OJaWOQ6Ltgnd/5emI89w/DRUlxgA=;
	b=HrChP7JlBvVPPv4LUONGjtGf/yPiqWRLEkHVOcE1eM4lXoslxv8HwniQmlMMbQ6znZ
	KwV2wBF5xZl+SyACQSqhHaqPckVbWxtLw0JteKQ03iklBiuT5hdYMKUf5cY4k23sx7Xc
	lxCD/Woo/+z0M/fX+juGLPN9dxT/Fq5hJngcJ2RUmLA4YBF74au5Jt2pVuSpwMEDORDZ
	WahSvE0IOit7UykBmplonK1nwFQKlGHzKAFGxNhr392mTfp/W7bpYi69ZoGkRmJgAqCU
	5h+335E01KGDwGYs2SYs7sRAnhLcf9KSAaSzS7bLldcmORuuWm4h4wDG9hYWehPytoz8
	yi3w==
X-Received: by 10.14.214.65 with SMTP id b41mr6884961eep.37.1365610498220;
	Wed, 10 Apr 2013 09:14:58 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id d47sm673685eem.9.2013.04.10.09.14.56
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 09:14:57 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Apr 2013 18:14:19 +0200
Message-Id: <1365610462-29689-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
References: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlB88rJGtSdxzT81R5yVJGNkuONjci6D/HDW0ugxfIMJvkrnmCgDAkcKKpOvOpoAKS5vjkz
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 5/8] nodejs4: reinstate installing all the files
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
X-List-Received-Date: Wed, 10 Apr 2013 16:32:23 -0000

Cloud9 needs the headers to build the o3-xml binary, using 0.8.x headers makes it crash.

This installs everything namespaced as 'node4' to avoid collisions.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
index 522b539..58ca135 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
@@ -28,8 +28,20 @@ do_compile () {
 }
 
 do_install () {
-  install -d ${D}${bindir}
-  install -m 0755 build/default/node ${D}${bindir}/node4
-}
+  DESTDIR=${D} oe_runmake install
+
+  # fix namespace conflicts with other nodejs recipes
+  mv ${D}${bindir}/node ${D}${bindir}/node4
+  mv ${D}${bindir}/node-waf ${D}${bindir}/node4-waf
+
+  mv ${D}${includedir}/node ${D}${includedir}/node4
 
+  mv ${D}${libdir}/node ${D}${libdir}/node4
+  mv ${D}${libdir}/pkgconfig/nodejs.pc ${D}${libdir}/pkgconfig/nodejs4.pc
+  sed -i -e s:include/node:include/node4: ${D}${libdir}/pkgconfig/nodejs4.pc
+
+  mv ${D}${datadir}/man/man1/node.1 ${D}${datadir}/man/man1/node4.1
+}
 
+FILES_${PN} += "${libdir}/node4/wafadmin"
+BBCLASSEXTEND = "native"
-- 
1.8.1.4



