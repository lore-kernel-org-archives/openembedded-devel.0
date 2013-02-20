Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1U8IdQ-0000Ge-4M
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Feb 2013 23:59:32 +0100
Received: by mail-gh0-f175.google.com with SMTP id g18so1133594ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 14:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=kaF9KLS2rciRPlly2TIprtjDIx76HjmB/aiXx6M8eAY=;
	b=hiGosS6qzF3dDhwRwVXGAlOKS77yJEz58Xdmap6mygzvdpmKvoer/WfOBiR+pUianm
	3uOxhsTorkuJDWikxT/0Dvc/nSFXuAWItviRQOasnYeVKm2rwaQS0w4ROzED+6fPWtuP
	HT60VhOBG4J6oLNdCujdmSPssM3VnYogQR5Y32cKenXCjfuFkdniPq3j5/YuORuBM7ez
	3hkjQ5Ev9AYNyTkiV+hxULqrvhn/ZNfoUrwieo2XS8CQ+oNt5oG0IuMXpNY8jh6V8J6d
	/5my6defLskpr3m7ZlFwl9AfCbuYPsGfuD2pouQ0H7GPr8QHP36jNBcTd9I0GgxV/J+6
	/ATA==
X-Received: by 10.101.132.8 with SMTP id j8mr12054306ann.68.1361400200380;
	Wed, 20 Feb 2013 14:43:20 -0800 (PST)
Received: from mlabs-ftonello.masimolabs.com
	(wsip-70-183-20-162.oc.oc.cox.net. [70.183.20.162])
	by mx.google.com with ESMTPS id t8sm71094336anj.2.2013.02.20.14.43.18
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Feb 2013 14:43:19 -0800 (PST)
From: eu@felipetonello.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2013 14:43:15 -0800
Message-Id: <1361400195-4717-1-git-send-email-ftonello@cercacor.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQn+sX+s4Tk7aNHWjqrJcJMENBc7HjK2J/nPAd0Q8eIzq5IA7J8XHp/tOJrOPV9oA/ZV6gNQ
Cc: "Felipe F. Tonello" <ftonello@cercacor.com>
Subject: [meta-networking][PATCH] macchanger: added 1.5.0 recipe
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
X-List-Received-Date: Wed, 20 Feb 2013 22:59:32 -0000

From: "Felipe F. Tonello" <ftonello@cercacor.com>

This is a useful utility to manipulate the mac address of a device.

Signed-off-by: Felipe F. Tonello <ftonello@cercacor.com>
---
 .../recipes-support/macchanger/macchanger_1.5.0.bb |   25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb

diff --git a/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
new file mode 100644
index 0000000..0d78c34
--- /dev/null
+++ b/meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Tool to view/change network interface MAC addresses"
+DESCRIPTION = "A GNU/Linux utility for viewing/manipulating the MAC address of network interfaces."
+HOMEPAGE = "http://www.alobbs.com/macchanger"
+LICENSE  = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+PR = "r0"
+
+SRC_URI  = "${GNU_MIRROR}/macchanger/${PN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "79b7cdaeca3d8ebafa764c4b0dd03ab7"
+SRC_URI[sha256sum] = "d44bfa27cb29c5a718627cb3ef3aa42eb5130426545eb2031120826cd73fa8fe"
+
+FILES_${PN} = " \
+  ${bindir}/${PN} \
+  ${datadir}/${PN}/wireless.list \
+  ${datadir}/${PN}/OUI.list \
+"
+
+FILES_${PN}-doc = " \
+  ${datadir}/info \
+  ${datadir}/man \
+"
+
+inherit autotools
\ No newline at end of file
-- 
1.7.9.5



