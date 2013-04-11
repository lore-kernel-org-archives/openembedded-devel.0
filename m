Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UQFIF-0007io-Ud
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 13:03:53 +0200
Received: by mail-ea0-f175.google.com with SMTP id r16so664917ead.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 03:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=TlLl4zHV8iJQ148OJaWOQ6Ltgnd/5emI89w/DRUlxgA=;
	b=M0Ygh8MQb1tN+dnnqVZnEUqhOsgo8VOUdehDb2SVu/r0L0FD5g2FAvSwmxjCfqbW1+
	fx3zM+/ee6CkCcSUPU3uHnjMx1QxnrC6nNpaxf+KwqSESrkqh5Tqt26xrlLbZvlkH/ap
	ARjgWWG+k2gttzAVlUpg+AUdBWNNGnwkmc4nkMbZHJuAKE0GGcHe1rCCPV7sdU91eLRR
	0APmBjdQ66aJOEoswUD472zA056vXa0+1keoyfTg2GC+7lpXOFRsLBUNaMOrqB0j8FVj
	USSUFxGe/edwHX6ZmB29mYVngnIs3VOz7LIkumy9VYUVpMHwlFgH2P85TFZ0sOc+5lzL
	/bHA==
X-Received: by 10.14.202.71 with SMTP id c47mr15563614eeo.39.1365677189189;
	Thu, 11 Apr 2013 03:46:29 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id a41sm4946895eei.4.2013.04.11.03.46.27
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 03:46:28 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Apr 2013 12:46:02 +0200
Message-Id: <1365677165-9296-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365677165-9296-1-git-send-email-koen@dominion.thruhere.net>
References: <1365677165-9296-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkgCHNlfJOFHhHhLUVrrO3/9Y/kn1z1WREvoeoebPw/W/Fuxbiom+If6bmaJaD9i/52RAF0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv2 5/8] nodejs4: reinstate installing all the files
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
X-List-Received-Date: Thu, 11 Apr 2013 11:03:56 -0000

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



