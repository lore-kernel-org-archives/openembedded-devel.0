Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQ02w-0001r2-BK
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 May 2011 18:37:58 +0200
Received: by fxm19 with SMTP id 19so1698982fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 May 2011 09:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=DTDKXQDwJNW+5j1FGtNhAS8P/fG8ojMW4//4eTIm5rA=;
	b=rCkA2p/1mwPeSq9OuUII9gBe29PBpIIpH4sbUOc0C3pLXge2E8ge33QYE/LOgNScDU
	ZOB8ixwbI4jFPi8Az8+73YpbdPYdb/cx5Qc4qakdLCetCRNKv8hPHNgOjlotPx3tmhnR
	icbZ7xAUBuW+/7VQ7uXwWjKcQM3aycEdgL2sc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=J0rpd8vIw2JDm5hg+q56aeLU9qZqoxX+5eTdP4iE/DLKapvp3Ebo7WsIBGTSxCuGJa
	HyETps9pI9l5L8qeXZ/6E8vLHbgZKE0DkEhzxFmtqzgZW1yijRfbKhHXTwy//gNxE1LE
	uA8pHvu1r9FarahN+8guCfJeS4IzivwnxLQXM=
Received: by 10.223.13.207 with SMTP id d15mr2647803faa.38.1306513766367;
	Fri, 27 May 2011 09:29:26 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id m26sm732295fab.34.2011.05.27.09.29.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 09:29:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 May 2011 18:29:14 +0200
Message-Id: <1306513754-31678-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [meta-oe][PATCH] connman: add gnutls to depends and move iptables dependency also to .inc file
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
X-List-Received-Date: Fri, 27 May 2011 16:37:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/connman/connman.inc   |    2 +-
 .../recipes-connectivity/connman/connman_0.73.bb   |    2 --
 2 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/connman/connman.inc b/meta-oe/recipes-connectivity/connman/connman.inc
index 0a662d8..7edef34 100644
--- a/meta-oe/recipes-connectivity/connman/connman.inc
+++ b/meta-oe/recipes-connectivity/connman/connman.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=4b55b550fa6b33cc2055ef30dd262b3e"
 
 # we need to define the depends here, the dynamic stuff is too late
-DEPENDS  = "libnl wpa-supplicant dbus glib-2.0 ppp busybox dhcp resolvconf bluez4"
+DEPENDS  = "libnl wpa-supplicant dbus glib-2.0 ppp busybox dhcp resolvconf bluez4 iptables gnutls"
 
 EXTRA_OECONF += "\
     ac_cv_path_WPASUPPLICANT=/usr/sbin/wpa_supplicant \
diff --git a/meta-oe/recipes-connectivity/connman/connman_0.73.bb b/meta-oe/recipes-connectivity/connman/connman_0.73.bb
index 3d0815f..6ef4302 100644
--- a/meta-oe/recipes-connectivity/connman/connman_0.73.bb
+++ b/meta-oe/recipes-connectivity/connman/connman_0.73.bb
@@ -1,6 +1,4 @@
 require connman.inc
-# connman requires libXtables now
-DEPENDS += "iptables"
 PR = "r1"
 
 EXTRA_OECONF += "\
-- 
1.7.5.rc3



