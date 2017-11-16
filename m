Return-Path: <gizero@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 36A3A787BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 17:15:29 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id a63so1715731wrc.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 09:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JADaPSjTNfLSQAEaYSSOTOd4a0KB4EjpjMPDi7XZ+WQ=;
	b=mOVg+d0rHWCLVeiluO8iLqTQGemxkv/xqTQmqDaNthkl5dO81ucDpS/KjmGb9LOPhs
	NEtQTUQ6511afBO9VAsCIDMcazIcBs8YxwCP0yd6nolL0dS1f9Ha3geqMJvKeqPLQd/e
	/PO5IFlwKXFlqefe7kmIk3dSjPlaICvy0YRUL58t4IYD7/K6FKkiu9I+bQt9UsfbOD71
	MeXg1z5h9F5QW7/B8au/pVGLVzxkrdSXFrdHFMTSikGvV1JVW8sUW/WXJdGvq9z2dRNh
	RSQYBFrxEMdJcQmqyyr8Y31c/xLUv4JDM/Ns6fWsVRzbPmsxx1YpMRJ7uG6AjE/2aFU2
	UJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JADaPSjTNfLSQAEaYSSOTOd4a0KB4EjpjMPDi7XZ+WQ=;
	b=KHxXiWYInGT6BEeNv9lFWY4BHgMpjyuf9ZCGrgG2rcH7GcP9/DlxVcZL/4STPWi1UE
	msKbXbUe+/DR9wSJAjHV5e5A+DCCNDHl3/tIhmV0TxoLHUlP/UTssNKhL/J9b/DC2jUa
	NbF32dKgpuBBh61OzRCUq9tOzkM1aROwTF9OeyWVrgEaL/dAaDjDXRkgY7pq4z9VwEu+
	iI/L9V1T+IoEUqnnDG6JSvHwGDjSKPz/ulL6sp8os3yqSZyEvyfIrNeSRKAhjIsk5UFs
	u2qCRDU1wULHNLAENLKgTpIjPyoJR2LqHkkcOBz0a6JPmcX46Qj5O2/ExA5eXteghW19
	QbNg==
X-Gm-Message-State: AJaThX7tHMvU7sr0M7dt0rqN31J/s1uV+psy70OgucN0sSLJDmAghCto
	5bz0rcDuoGCqJzaWtHpiPk79DA==
X-Google-Smtp-Source: AGs4zMa3bwJfFl10Yc5PYW7d/BxOxJQDkuhdJU4pHnpLoz0N1cPCFdWgd/RyOdihMNDziLE+WVXNbw==
X-Received: by 10.223.175.49 with SMTP id z46mr328671wrc.12.1510852530628;
	Thu, 16 Nov 2017 09:15:30 -0800 (PST)
Received: from gizero-desktop.tw.it
	(host193-245-static.58-79-b.business.telecomitalia.it.
	[79.58.245.193]) by smtp.gmail.com with ESMTPSA id
	y48sm1616015wrb.41.2017.11.16.09.15.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Nov 2017 09:15:29 -0800 (PST)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Nov 2017 18:15:17 +0100
Message-Id: <20171116171517.19632-1-gizero@gmail.com>
X-Mailer: git-send-email 2.15.0
Subject: [meta-oe][PATCH] drop redundant 'inherit allarch' from packagegroups
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
X-List-Received-Date: Thu, 16 Nov 2017 17:15:30 -0000

packagegroup bbclass already takes care of this

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb     | 2 +-
 meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
index 1be7f6aff..53fc159c8 100644
--- a/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
+++ b/meta-oe/recipes-devtools/packagegroups/packagegroup-sdk-target.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 PR = "r1"
 
-inherit packagegroup allarch
+inherit packagegroup
 
 RPROVIDES_${PN} += "packagegroup-native-sdk"
 RREPLACES_${PN} += "packagegroup-native-sdk"
diff --git a/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb b/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
index 632e7d433..3069d2ded 100644
--- a/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
+++ b/meta-oe/recipes-graphics/packagegroups/packagegroup-fonts-truetype.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 PV = "1.0"
 PR = "r2"
 
-inherit packagegroup allarch
+inherit packagegroup
 
 PACKAGES += "\
     ${PN}-core \
-- 
2.15.0


