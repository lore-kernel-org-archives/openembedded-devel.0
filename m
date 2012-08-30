Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T75ti-0005LC-ST
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2012 16:39:06 +0200
Received: by eekb57 with SMTP id b57so642284eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2012 07:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Giu11QZWTM7BKbp10Swv0ubvwpphSZ4Q0CCowGnzkmQ=;
	b=e23WFPr4ATAEcCmBxhvPkf4Vv2G6J/wf/dA967otgHYyxprhVEnyF0mBBS3C/tHdO2
	RCHTrlk600Ux5n6Oph5Nw+8WdhluUQCeYW+nUumlEWjGVgCapp4FWlhXnt/CByD6Xn8w
	0R3dNGrhiBwF4bHM/ZFbw73xoK31NtN+ou7HocOAXI1d48zXSsWfuDIztXre79AAhPGu
	VEVnfXCcopzxL4nDghJYyh5S9f5NlnPnJkKFS2/9FqWAWW6E9edMMDgUvx56uIgCZkRi
	KHyte1oeIVmVs0K6oM3EetcqRjXVGDdVMIABPX+GMGecukOKYOe3/eONGCUbMKeGuN6z
	Lg4g==
Received: by 10.14.184.133 with SMTP id s5mr6842896eem.31.1346336811694;
	Thu, 30 Aug 2012 07:26:51 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id r45sm5395495eem.6.2012.08.30.07.26.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 07:26:50 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Aug 2012 16:26:45 +0200
Message-Id: <1346336805-10333-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlpbSxSz0S0vFqX/HQhDdXwOcs46snnWvd0qJilDBAsnz0URvFh0OM+CJ1NErMjta0ZxnXA
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] usbmuxd 1.08: add recipe to talk to iDevices
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
X-List-Received-Date: Thu, 30 Aug 2012 14:39:07 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb

diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
new file mode 100644
index 0000000..bb92941
--- /dev/null
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "This daemon is in charge of multiplexing connections over USB to an iPhone or iPod touch."
+LICENSE = "GPLv3 & GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=ebb5c50ab7cab4baeffba14977030c07 \
+                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LGPLv2.1;md5=6ab17b41640564434dda85c06b7124f7"
+
+DEPENDS = "udev libusb1"
+
+inherit cmake pkgconfig gitpkgv
+
+PKGV = "${GITPKGVTAG}"
+
+SRCREV = "919587580c5e77f3936f3432115d2e10c7bac7c5"
+SRC_URI = "git://git.sukimashita.com/usbmuxd.git;protocol=http"
+
+S = "${WORKDIR}/git"
+
+FILES_${PN} += "${base_libdir}/udev/rules.d/"
+
-- 
1.7.10



