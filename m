Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Td4aD-0008Ra-4k
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 20:43:09 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6307277eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 11:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=SSuBuamb2D2OPRcRtbtVoTx1tRSoDl5MqilwCNQm7yA=;
	b=Tbr96Pjkbbvqq4Q8XW9ou+OTlgLrjBtI+r87ZgIU3SJJ0hrXudpcWr2LT3PHRg3Kvo
	1/+jX4KWuY0V1qF8ppmciD1Zdt7r6bfhyC15vg72R4t5lcFGTArdl66tW5QpiImJz5x5
	Vpraup8QVlhlCHt6DXAORF2AKaAs6070VrqSikqBgUdVaJnoWG+yke7LepfnelATX2Iq
	88LZUYBktDY+2G8VNsT4LMm7rNXo+sC4Bw9b2HUKqDt7bOJeUpCGTpFLMXdE4Pi9lTnb
	wnFtNedfg3XeC26hRst8x437edLwLrvbPcTzM87HOsksjx62FRohDfK1ZSyq9SVyOzNt
	F9RQ==
Received: by 10.14.173.65 with SMTP id u41mr3108903eel.13.1353958139435;
	Mon, 26 Nov 2012 11:28:59 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e7sm35939157eep.1.2012.11.26.11.28.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Nov 2012 11:28:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Nov 2012 20:28:53 +0100
Message-Id: <1353958133-27074-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [meta-oe][PATCH] systemd-systemctl-native: fix FILESPATH to find systemctl
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
X-List-Received-Date: Mon, 26 Nov 2012 19:43:09 -0000

* BPN is not enough and PN was removed in
  http://git.openembedded.org/openembedded-core/commit/?id=fb359583b659cda643973fa285002aaffb729a51

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb b/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb
index 5940584..c9c3317 100644
--- a/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb
+++ b/meta-systemd/recipes-core/systemd/systemd-systemctl-native.bb
@@ -3,10 +3,13 @@ DESCRIPTION = "Wrapper to enable of systemd services"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r6"
+PR = "r7"
 
 inherit native
 
+# BPN is not enough in this case
+FILESPATH = "${FILE_DIRNAME}/${PN}/"
+
 SRC_URI = "file://systemctl"
 
 do_install() {
-- 
1.8.0



