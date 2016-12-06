Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5041660079
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2016 02:36:29 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id e9so18204043pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2016 18:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=avQQLthWfz2FRZB2WokWkQxGH9i+SRNMXaoOIwQsFFs=;
	b=Z5vf4Vx1xWxWCQoDmBT3qpvj6gWRpwb3d7/meM24GipQhXfWBXf9gMvCm3ctkeY0EV
	YrB+PrqevVRbYY/r8sXQ8MVXu4KeL91MStgBJpnqSmkx9+pqT9D/ngK+MPtCmhfoWSNP
	njX/8BhJFJmrTLPEbZHK/nA8dk7/dqEv0pqO4crBTocv/wlYkrUhzAvfCAV7pHLZFEUv
	MSJfvxJ8iz5tBAv1HVbKk0owk2LDroQhbNdZY/YvNfkqdcaGfUQiN3Kj0SLQtAUNIxUo
	E8YrcpOUe64bLWlWZFLMJaKRMIw29gG1czMqANdE6oY0Oq8TiGOyWJakGzragkyEgm9H
	4USQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=avQQLthWfz2FRZB2WokWkQxGH9i+SRNMXaoOIwQsFFs=;
	b=IRVshYU+rksisfQT/omn1qC83ETH5d2/tyaxlV2L8Pd3Bzai9VRaHmMYLfs8agfozQ
	difYJaA40oXSqjrPNMzkI/qosAvGVmXtwEQb8jBX4vTuysOeTD1/nYgmi2p/fzW8k4JU
	98WSeMbnryzcXs6KbmX1okfIJTF1NKt7tBUWAG/iivtlsP8207hvgQjCKYN0UmW0pTtP
	ltzh79c4VZVxtW7JJcDV8VwgZPnsNmVEAtobcIXkn1ax/owg7TOAS5J9ax4bCO5tmcTj
	tNNV+jHAzpALmHCzowqK/uXj9DnzMZIBfA81VaEOygxGe3oEovzeuPHXDIJwRZCDTI8G
	OIyA==
X-Gm-Message-State: AKaTC005KLgRnlVr8N1manGTjog7G3pnzTj6aP0R/tu5VIIaV6QkvC5rQsI0CDFeba+vFQ==
X-Received: by 10.99.178.89 with SMTP id t25mr107280430pgo.131.1480991791389; 
	Mon, 05 Dec 2016 18:36:31 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	64sm30357837pfu.17.2016.12.05.18.36.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 18:36:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Dec 2016 18:36:21 -0800
Message-Id: <20161206023625.12901-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-gnome][PATCH 3/7] libwnck3: Add missing dependency on gnome-common-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2016 02:36:31 -0000

Fixes configure errors
../libwnck-3.20.1/configure: line 13391: syntax error near unexpected token `maximum'
../libwnck-3.20.1/configure: line 13391: `GNOME_COMPILE_WARNINGS(maximum)'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb
index fd4ef69..02149fb 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 BPN = "libwnck"
 
 SECTION = "x11/libs"
-DEPENDS = "intltool-native gtk+3 gdk-pixbuf-native libxres"
+DEPENDS = "intltool-native gnome-common-native gtk+3 gdk-pixbuf-native libxres"
 
 PACKAGECONFIG ??= "startup-notification"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
-- 
2.10.2


