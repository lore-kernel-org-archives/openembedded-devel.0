Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2251B6CA74
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 21:28:06 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so4166873eaj.25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 14:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=C0NK7N3/n19SJIZ3D1HxFRKQyOntamxj8mcDrL3ljMA=;
	b=rS1CP3S7h0yej+yjEtim2SvzD5joZ5R4mH25j6XrXhwu96XjrRmQnpDv7SQGzQ6E4d
	KqLkOSm9xggWjDm3qVwLKlcXNY+5BPOz1rsaRnxiMaHUQj/OncmH6+FamiIvIkPqW1vq
	CPKbF2R8Y03NYlpH+WT5FVnoMW31LiKw9Qa6rNmP3b8C9rfRkEYaRQIpI7JyHirHLoSy
	ubPa8QnzzqmLQYPUCgi5iUqpajOChu7XfgJ/7tqnX1XhJn5wO42J/djqIKeo5GlMizK3
	15zAWdyMLIMtArRcEpMNA4WUL3lXrau/dTT8HpvIa/nDVV1rsmhbAE+pVyf9zrWJUvzT
	5DLw==
X-Received: by 10.14.108.9 with SMTP id p9mr3838272eeg.8.1381872488658;
	Tue, 15 Oct 2013 14:28:08 -0700 (PDT)
Received: from mizar.localdomain ([95.237.174.211])
	by mx.google.com with ESMTPSA id s3sm7854328eeo.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 14:28:08 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 23:28:04 +0200
Message-Id: <1381872484-17568-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] motorola-ezx-base.inc: remove -n from EXTRA_IMAGECMD_jffs2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Oct 2013 21:28:08 -0000

because it is already in IMAGE_CMD_jffs2 as default
in image_types.bbclass

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/motorola-ezx-base.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/motorola-ezx-base.inc b/conf/machine/include/motorola-ezx-base.inc
index d6bb42d..0bb9a5b 100644
--- a/conf/machine/include/motorola-ezx-base.inc
+++ b/conf/machine/include/motorola-ezx-base.inc
@@ -24,7 +24,7 @@ PREFERRED_PROVIDER_virtual/kernel ?= "openezx-kernel"
 
 IMAGE_FSTYPES ?= "jffs2"
 JFFS2_ERASEBLOCK = "0x20000"
-EXTRA_IMAGECMD_jffs2 = "--pad=14680064 --little-endian --eraseblock=${JFFS2_ERASEBLOCK} -n"
+EXTRA_IMAGECMD_jffs2 = "--pad=14680064 --little-endian --eraseblock=${JFFS2_ERASEBLOCK}"
 
 # In order to enable UIBIFS add "uibi and ubifs"
 #IMAGE_FSTYPES += "ubi ubifs"
-- 
1.8.1.5


