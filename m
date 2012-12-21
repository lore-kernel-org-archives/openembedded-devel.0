Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Tm3OF-00050R-61
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 15:16:16 +0100
Received: by mail-ea0-f182.google.com with SMTP id a14so1942631eaa.41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 06:01:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=O7NK6JGJCQDon5X/TCQ79XJf9ZnSsY3tZaWgODay+Bo=;
	b=HUsPxQF4JoVmWYtGRIID0Zv7gELDgXFYqcQs73ypSU39Qm+UI0RKQAjRchn0vrA3PO
	/cx9+sVngbtNpKCtkL6NfLvw3qPEUuociUnH920fRBUj4/r0xRCdckpP4rsXNrScnX/G
	Zy32MO31Lfg6knOitVxOlLVvvbyIEckllROO5At3exz3ry/3ntdcYHh2tH+pRoqh0fjL
	U3CKDas5TdDLOCwYHCzrjrtD76Qyv9skRTsWy2rep9uOvdWPMS0mMqpaPNdO89WgP5nq
	+fcIbth0XdmPTf8W3lTTdJa+ChKPDs6C3BWl9XX3veGrQsUKYeesdMaSOzr0rAI2/mYu
	epAA==
X-Received: by 10.14.225.72 with SMTP id y48mr31872841eep.46.1356098469466;
	Fri, 21 Dec 2012 06:01:09 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id w44sm21810573eep.6.2012.12.21.06.01.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 06:01:08 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Dec 2012 15:00:47 +0100
Message-Id: <1356098450-27475-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
References: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQklwmQ60aNASzO3C03nfMdpkpXebdOMU7wiqE1Ehjis4LGtWuKNGn5Az1gtNN1B6eS14x3W
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-multimedia][PATCH 3/6] oscam: add svn version
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
X-List-Received-Date: Fri, 21 Dec 2012 14:16:28 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-multimedia/recipes-dvb/oscam/oscam_svn.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta-multimedia/recipes-dvb/oscam/oscam_svn.bb

diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
new file mode 100644
index 0000000..f466aff
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
@@ -0,0 +1,18 @@
+SUMMARY = "OSCam: Open Source Conditional Access Module"
+HOMEPAGE = "http://www.streamboard.tv/oscam/"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "libusb1 openssl"
+
+SRC_URI = "svn://www.streamboard.tv/svn/oscam;module=trunk;protocol=http"
+SRCREV = "7974"
+PV = "1.10+${SRCPV}"
+
+S = "${WORKDIR}/trunk"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DDEFAULT_CS_CONFDIR=${sysconfdir}"
+
-- 
1.7.7.6



