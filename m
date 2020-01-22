Return-Path: <ticotimo@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id C72E97FD75
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 15:22:54 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id w2so5292pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 07:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ca7vEZTqBsNcCfpjbMrTB6SySRSmy1XFg5pgNS17dpI=;
	b=KQ5zNS5k8cDKq72H8Wr3GPZZi53qkgmi21SMqIWI8rekyriNaFfvHiDff1xUOanWPX
	fuktLrbZup99BhW87ufhl8VKnaceuO8h7ec++OVXhGoGbI6qLX0Q5TXIES4XVkH2tCTl
	x3RrVOu9XONxNqh8V0OAi4+kLD9Lbe3+oLFu64pVp5kLAAwKLlXZONl5UEcquWZEEyZF
	JXB0b5hqA7V2iy7dpcRsIDi6nKKIYdFrmIWF9Gx52FKQrZ/dBHBU5vSyBeLO7BBpnRoS
	b7vnWItvjHf0LM9bmLJB3bQRoMOrP2is1aM5NXJ4Fe5fQ51RbVzZIUfSiw1kPJXQ+lN2
	IXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ca7vEZTqBsNcCfpjbMrTB6SySRSmy1XFg5pgNS17dpI=;
	b=gtqy+RoPFAJ9/zw3q4p5sQ0NJ2hr/bb80zKpFVOAaucxin/gP4xIvo7UIH99ske9TQ
	YS8Qh0jvvRXvG8QrwrBsYoA26jbwjT1BDMBa2k2n78hT/PuTObdBHgawZ7xzrpmVpCXX
	eYq89YrEtejihrK7bAcMv4t7ILYVL4s/uOoiOjSdYYukGhLxT21M4Xj0Ag5Gr2r3c6I4
	YNGTUmZIDBdy68tfMJel2v1rTPSQqiihDbcSd0nDpdVNf1R55kzKav5pGA821ptYeb3Y
	98FdV+NtyI6w2q9XR5o8FhI2tevnmi0bMIjTD0xBN1ShXytFsi58jXDcBupoZfavBQkl
	hfVg==
X-Gm-Message-State: APjAAAUliAFsYkWhRm6fybFnpRCNyfwDZQvcKRDfbdPtpblaE5it6uxn
	f8GpD0XuRyL7P8dwns24aB1bwhxl/RE=
X-Google-Smtp-Source: APXvYqz8orQ/caWHD1pDxRv4pmrw6nj1Z47rKgGvoaKfgBvHk88sa0n16Z8GLruYYe4q28pOvi5Tnw==
X-Received: by 2002:a62:2cc1:: with SMTP id s184mr3164645pfs.111.1579706575681;
	Wed, 22 Jan 2020 07:22:55 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:b92a:2299:32b4:21fd])
	by smtp.gmail.com with ESMTPSA id
	e2sm47792199pfh.84.2020.01.22.07.22.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 07:22:55 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 07:22:29 -0800
Message-Id: <20200122152229.17802-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] packagegroup-meta-python2: add -wrapt, -deprecated
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
X-List-Received-Date: Wed, 22 Jan 2020 15:22:54 -0000
Content-Transfer-Encoding: 8bit

Update the packagegroup with newly added recipes

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-core/packagegroups/packagegroup-meta-python2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-meta-python2.bb b/recipes-core/packagegroups/packagegroup-meta-python2.bb
index 41ba3abd..95f9c02f 100644
--- a/recipes-core/packagegroups/packagegroup-meta-python2.bb
+++ b/recipes-core/packagegroups/packagegroup-meta-python2.bb
@@ -57,7 +57,8 @@ RDEPENDS_packagegroup-meta-python2 = "\
     python-aws-iot-device-sdk-python python-constantly python-bitarray python-flask-wtf \
     python-parse-type python-ipaddress python-dbus python-cpuset python-distutils-extra \
     python-futures python-jsmin python-pygobject python-pytoml python-six python-which \
-    python-netifaces python-configargparse python-sqlparse python-soupsieve \
+    python-netifaces python-configargparse python-sqlparse python-soupsieve python-wrapt \
+    python-deprecated \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "python-pam pamela", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python-systemd", "", d)} \
 "
-- 
2.25.0


