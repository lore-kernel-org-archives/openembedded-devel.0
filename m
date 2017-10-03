Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9D9D57782F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 19:57:37 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id f12so750854wra.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 12:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XtvXivw81IiF/8T5GZrFFRz0+JJml/fxPJq6Ivaz/ZI=;
	b=mjx5oAIIDLbn2tU+2uFBcv4U81X7MdvPiKrVlLdP3wtG5gQxVK+3PWAqBmQGV75czY
	maQTn8qgAlWCRflo1WT7m61n4UzlsIa5arQ7Bodbye7MJiUrJpUp8CR7OOFLCIMvfH9G
	soS1pvlHpijllFClg7kgO6PzEjt0HVFjZ3spJLLGMkVQHLX437Dw/8o0aUjNVw9WGskD
	UE8hfd5uqco8pgy8ycXAB+EQ28f4fl87tJIqkhwhs2V2S4Vs9Axo+hDGljkjjaTVvH0K
	EFtdKuOM0V1f51YQ5t6kkiPWoToLOB01UcxXcvh6Y1/+mk59K0roZwHcOa3/VaKA7KSG
	7awA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XtvXivw81IiF/8T5GZrFFRz0+JJml/fxPJq6Ivaz/ZI=;
	b=LobMaGweQpn5qDcj391gP1As6Vb1hq9uDKhUlZwDVikXwu2X5roTxROogmCQIW9oO7
	GIaZKAS8SBPZEDeRAcI2FGsRX6qya7ew1jrM5foKPXa6v4Q+pMkX4gZ7hEws4wjjHv05
	9da9i1GZnMSGDqSSsa1i8/nWu+hJg16wAgNr2ZNNqfv1n+Yhr7/bn0rMO75sRi/uOmef
	m9LyFNqhd85mX583IkEWaa9KLdo0+c23WYtXDiHJIvtvI5yKjcfxKJGoi0ATITojqg2h
	BHrwS6urFB51Qu3gf0TT+XC4qjZ/ANY3d2SjttfL7t5d9h0w3IDp3zhspXZ0hElg3e4d
	nPnQ==
X-Gm-Message-State: AHPjjUgRTWRXhoZTPV7CVb+mIwiqivr1FQmPnweheh2d/NjUTFPNKWjo
	RO1EkNNSQqX9SVcg6fcQS119mryQ
X-Google-Smtp-Source: AOwi7QCTe/jqCMIUEAuDVYmRyEabhuWolqRX8mzHtDOMpEZ6JsrXOieRiqiCe88tJCqeZI5Q29DxYw==
X-Received: by 10.223.186.202 with SMTP id w10mr20133660wrg.132.1507060658445; 
	Tue, 03 Oct 2017 12:57:38 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host184-216-dynamic.24-79-r.retail.telecomitalia.it.
	[79.24.216.184]) by smtp.gmail.com with ESMTPSA id
	b47sm15464496wra.73.2017.10.03.12.57.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Oct 2017 12:57:37 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 21:57:27 +0200
Message-Id: <1507060647-10249-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507060647-10249-1-git-send-email-andrea.adami@gmail.com>
References: <1507060647-10249-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 2/2] initramfs-kexecboot-image: replace deprecated license file
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
X-List-Received-Date: Tue, 03 Oct 2017 19:57:37 -0000

Use '${COMMON_LICENSE_DIR}/MIT' for MIT License.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
index 835b307..2573eb4 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Initramfs image for kexecboot kernel"
 DESCRIPTION = "This image provides kexecboot (linux as bootloader) and helpers."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 inherit image
 
-- 
2.7.4


