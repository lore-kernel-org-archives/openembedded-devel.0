Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U2r7z-0002BW-LL
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 23:36:37 +0100
Received: by mail-ea0-f182.google.com with SMTP id a12so314103eaa.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Feb 2013 14:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=f9gF7RbmvB/vGKo6RaNhb2bVFQ0bjroLhRP8Ig0ON1Q=;
	b=kmidageyeSfcURnBUn+hMifAshSCPHhEDvEYjaGIzU3i9W2ovmXpf6Uc5h/vGCvx3y
	rtzLx828w3n1fDU6txkGuqy2gkshsS5wUv+RUYJVtTNy5NA55qGCs8cFo0MqbqF8DaUk
	Rf6vt4Je9Ti5T5V/Vp8frV5yrsIRno9YOva5V58GOOcFALx5qTFSYZ6Kt0A6IfGuq0EJ
	oOebjn3kHPMmtZKfrhokz5R6re+O0Nk257k2HgcYMKlW9KmrRumKwmgP+EM7MP/Z4xN1
	0byGi90xRairG7yJm6X9yQt/db6uTX1C5suC5Rg2QmDSaia+4wqqluhE8sDfCbbhtLUq
	Nmzg==
X-Received: by 10.14.173.69 with SMTP id u45mr89086338eel.21.1360102843557;
	Tue, 05 Feb 2013 14:20:43 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id q5sm33901931eep.11.2013.02.05.14.20.42
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 14:20:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Feb 2013 23:18:43 +0100
Message-Id: <1360102723-27891-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
References: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe-meta-systemd 5/5] xinput-calibrator: do not RDEPEND xterm
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
X-List-Received-Date: Tue, 05 Feb 2013 22:36:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This does not break automatic calibration (at first start or plugin of new
device). For manual recalibration we assume a terminal is installed and avoid
multiple terminals for most images.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xinput-calibrator/xinput-calibrator_git.bb     |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 8ef774b..d2c40e2 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f340
 DEPENDS = "virtual/libx11 libxi"
 
 PV = "0.7.5+git${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 inherit autotools
 
@@ -57,4 +57,3 @@ do_install_append() {
 }
 
 FILES_${PN} += "${sysconfdir}/xdg/autostart ${systemd_unitdir}/system"
-RDEPENDS_${PN} = "xterm"
-- 
1.7.6.5



