Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QIgeI-00084C-P2
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 14:30:18 +0200
Received: by wye20 with SMTP id 20so3325569wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 05:27:36 -0700 (PDT)
Received: by 10.216.254.194 with SMTP id h44mr608088wes.90.1304771256636;
	Sat, 07 May 2011 05:27:36 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id bs4sm2564923wbb.35.2011.05.07.05.27.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 05:27:35 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 May 2011 14:27:32 +0200
Message-Id: <1304771252-27933-1-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH] Connman: add dnsmasq-dbus to RRECOMMENDS to fix DNS proxy
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
X-List-Received-Date: Sat, 07 May 2011 12:30:18 -0000

Connman writes '127.0.0.1' to resolv.conf by default expecting dnsmasq to be there

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/connman/connman.inc     |    2 ++
 recipes/connman/connman_0.73.bb |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/connman/connman.inc b/recipes/connman/connman.inc
index abe8c64..673d509 100644
--- a/recipes/connman/connman.inc
+++ b/recipes/connman/connman.inc
@@ -62,6 +62,8 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
 
 # Package up systemd files
 FILES_${PN} += "${base_libdir}/systemd"
+# Needed when using DNS proxy feature
+RRECOMMENDS_${PN} += "dnsmasq-dbus"
 
 FILES_${PN}-test-utils += "${libdir}/connman/test/*"
 
diff --git a/recipes/connman/connman_0.73.bb b/recipes/connman/connman_0.73.bb
index 3d0815f..a0c21b6 100644
--- a/recipes/connman/connman_0.73.bb
+++ b/recipes/connman/connman_0.73.bb
@@ -1,7 +1,7 @@
 require connman.inc
 # connman requires libXtables now
 DEPENDS += "iptables"
-PR = "r1"
+PR = "r2"
 
 EXTRA_OECONF += "\
   --disable-gtk-doc \
-- 
1.6.6.1



