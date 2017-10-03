Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 941E77782F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 19:57:34 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id f12so750784wra.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 12:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LEBGA3jAOIapmOK/KuAgDgaZNB8X7lxlPy/VCIUxm8M=;
	b=Ian3DHRSoppKyVUL9vGEFtRzc9SIICh9dbm7h7nxqYrnFjWWA9e7wbF/ZlEnJepIQO
	VCJYyW0HgHFuXRvDAF4JfzqOHENun/IwIwBnHNCH4ePYg26iaKQCND6fraZPARebXC39
	z7qc4AWefxFqg9uJ3ZC4bNJda2kFgWSb+y/XXNPv6qX42KNaacqQvMPo08GkyzSoRP8F
	+qQFd3lmeclaPDVgYj2zEHKFYlyw5FI8KWEMa+h9EbllPDjAmXW0ndONK499ZptO95if
	HQ1zA5Fl/0TPXiv0U3CcAp5EK+a0FeY38Ly+xG0U/jCVvzH0DMOEbGCJbedUctlf43L9
	pdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LEBGA3jAOIapmOK/KuAgDgaZNB8X7lxlPy/VCIUxm8M=;
	b=kwpITFzNQETtwdddVeMPRegGl78tDgGMP3yYFhKO6Uk7sQrLVP3AiTL59/gOd9EzVm
	IK5w1U4bwvBPsu0lAa2gP4sQdYa9UqtdIFZXRoQ5EcAWtrhAQt8WzV8JDzezF5KGvjGa
	j8uym0DHSpa7YUrCD1Gqca9RPVUuAWorBq29hG9HEl+rug/NdsRPedPkWOxDfAzAOAkl
	w8RajvTkS7Jmhc2w+3x5lx29ed4xc6AiKOAw/Y5ku3M4hHFUeYBxvU4iDY3WvxtomxMP
	d5ZevC2CamG0bx1U9/2CRSEcx/0LKFgQSWo46R+9UBb6z2tqqpiCvv58nZCqfCUwX1Qn
	rMvw==
X-Gm-Message-State: AMCzsaXbueGtckXeDuvrm3/IZHbxSilCR3effeF7oDWQGUCbXfryBbMU
	qMV09K1AfEfRXFrJDsi7e0fG3TRI
X-Google-Smtp-Source: AOwi7QBU0qvzX5s0XUo/xiuMpTwA7KMcnKrBQD4Ggn9xKmd3TbX0azb3nOA4Pu0AOTRSRIkFSQQsEA==
X-Received: by 10.223.157.30 with SMTP id k30mr7150052wre.159.1507060655225;
	Tue, 03 Oct 2017 12:57:35 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host184-216-dynamic.24-79-r.retail.telecomitalia.it.
	[79.24.216.184]) by smtp.gmail.com with ESMTPSA id
	b47sm15464496wra.73.2017.10.03.12.57.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Oct 2017 12:57:34 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 21:57:26 +0200
Message-Id: <1507060647-10249-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH 1/2] initramfs-debug: replace deprecated license file
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
X-List-Received-Date: Tue, 03 Oct 2017 19:57:34 -0000

Use '${COMMON_LICENSE_DIR}/MIT' for MIT License.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/initrdscripts/initramfs-debug_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-bsp/initrdscripts/initramfs-debug_1.0.bb b/meta-initramfs/recipes-bsp/initrdscripts/initramfs-debug_1.0.bb
index b7defff..667690f 100644
--- a/meta-initramfs/recipes-bsp/initrdscripts/initramfs-debug_1.0.bb
+++ b/meta-initramfs/recipes-bsp/initrdscripts/initramfs-debug_1.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Extremely basic live image init script"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 SRC_URI = "file://init-debug.sh"
 
 S = "${WORKDIR}"
-- 
2.7.4


