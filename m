Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UQb7h-0002U1-R0
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 12:22:28 +0200
Received: by mail-ee0-f53.google.com with SMTP id c13so1143681eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 03:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=TlLl4zHV8iJQ148OJaWOQ6Ltgnd/5emI89w/DRUlxgA=;
	b=PKxBqXXV53obvIO4cY/q/OmIseBrxmRerjakkSsYYp3W5fJOHhCWenJ5tRIUVwLqhQ
	kOH3MmwJWWjctXEiXxwnff5XEESOoDKGQeAzqNqHXlGYkxRRq4zn88TU41U8+UR2GJv6
	Nl5xDNk5Me3Ga3Mg4H1A996AyO9frZrx51SnhstXFHgi7uxeB0x70Cp+jMiwfYcHrWNU
	bbiOr08+TjmnOWLGYHHtbRGpyQDahYY5OmS6wqvRPXdkTwI3xnAklU8O7CbG5MH4RP0i
	bHPyzDpwGsRqfY8SHGfZdvHkB7dRV8B80FYB9H15SAvTXJAkPi2rhTN/QDVlLF7VbTuk
	U/mQ==
X-Received: by 10.15.76.132 with SMTP id n4mr26604006eey.16.1365761101799;
	Fri, 12 Apr 2013 03:05:01 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id ca4sm10203666eeb.15.2013.04.12.03.05.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 03:05:00 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Apr 2013 12:04:45 +0200
Message-Id: <1365761087-1229-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365761087-1229-1-git-send-email-koen@dominion.thruhere.net>
References: <1365761087-1229-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnvrZWnagzsQThYM0luMscoJWN7OwXh1OYnilLdOzR6w89pSfj1N+3xWlHkyiGqfDyKmYiz
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv3 3/5] nodejs4: reinstate installing all the files
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
X-List-Received-Date: Fri, 12 Apr 2013 10:23:31 -0000
X-List-Received-Date: Fri, 12 Apr 2013 10:23:31 -0000

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



