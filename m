Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Si2Cw-0007AW-7I
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 13:39:22 +0200
Received: by eekd49 with SMTP id d49so542740eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2012 04:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=TPM0bGGRPe0upl9WHyFOwYZGAv/3GSTsWTQTBlGJlhY=;
	b=oh1j5ubhMWzuIanGqsMGj7KZdKpaAljpdMlbJNiHcRmgfJD1FNjdmwLGyfThclqBYh
	39aQtu29NE14PScaxvw78+2TfQuL3RJTx05AhSp30aPuSfWemy1SPqNFxKKVzpnoTiNC
	9jPAVBNVw386rK7Km15yIWtKgb2fPl68/mBB4YaDQCLXy6sg80YbvrsVi2bmtnDperwF
	UKfqFv9C/bpouFEemnyWUpDHJ7whOTC7YYHIkYp7aX3uQyw8HMJaaZ4D5dhTdNB/MGm6
	K8VsyaUvYr876pIV/iJ3Qx2dtgmeUrH7BEZtITLVeALnNRTBoDnm3vdogUgHk08cZkFW
	kJoQ==
Received: by 10.14.100.205 with SMTP id z53mr367956eef.39.1340364515153;
	Fri, 22 Jun 2012 04:28:35 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id t3sm111875286eeb.15.2012.06.22.04.28.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jun 2012 04:28:34 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jun 2012 13:28:28 +0200
Message-Id: <1340364508-8832-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1340364508-8832-1-git-send-email-koen@dominion.thruhere.net>
References: <1340364508-8832-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQld3JXlDbQ0FsSqNLbVxKAdpcWFNuG2WhRJei/DeS04iJJdrEO134mHpy7yQRarcRewIh62
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 2/2] cheese: add 2.30.1
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
X-List-Received-Date: Fri, 22 Jun 2012 11:39:22 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb

diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
new file mode 100644
index 0000000..d6d61fd
--- /dev/null
+++ b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Take photos and videos with your webcam, with fun graphical effects"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
+
+DEPENDS = "gtk+ gstreamer gst-plugins-base libcanberra udev librsvg gnome-desktop eds-dbus"
+
+inherit gnome
+
+SRC_URI[archive.md5sum] = "1599fded8a1797ea51fb010af4e6c45b"
+SRC_URI[archive.sha256sum] = "48f03470c6f527caa0e3b269d3afcff86ae0939a74f66ce030d4eed3bc3cbd9a"
+
+FILES_${PN} += "${datadir}/dbus-1"
+RRECOMMENDS_${PN} = "gst-plugins-good-meta gst-plugins-base-meta"
+
-- 
1.7.10



