Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6AD986011F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Sep 2018 00:35:44 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id f38-v6so12802333edd.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Sep 2018 17:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=K6jQ89gDL5bjkfnmBJB3ZSJnqASCUFzO+PfcZnllk+k=;
	b=Hd5s0aOcBUhwa3/kNoBSOqD/+ETVesjZAYMISAefbhz51Rm9ezQ80lfTe8cdB6SQR8
	yx7Kgglb9iXKNB+G3vaIA93yJpHhfXiG013iVkHvwIXVA3twQhViXfwy8E5QSb8dXYD4
	AyrRtZsTstWlRb5AD0ERpZsUekNu4BRZZ7W1mnF+DSU4VX68yRq5X6fT/jVZogZTSRMj
	To/0qfK2XqMBBxHVJI9bxkH1muVdS1cHV3yYNxjQOz4XifY1qbmgJNwgOi78ZbqON6mH
	DTYj4UnuOZ/1Vw3KwEwblONhTP5AUBTIQaaKq4JF4hoOeLcsvv5PLrR7naPuTnHtMvlb
	e42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K6jQ89gDL5bjkfnmBJB3ZSJnqASCUFzO+PfcZnllk+k=;
	b=q12PfPpCWh53vk+woueAEXKmvn6rMsdrXTOm9B9qa1eucZrlDzzscJ18Cvdp1UF9Mm
	wnkspymhhuDFXtOv7qhLYLVVqS1D+4YREzAB5zpTpw6JPvcEDQKwxgtoLAAqZcKYQrLT
	RDN1GdHpWPJwmJXqAzTrpqFrBXiWeVxL8AIgRcjQPa8I3Z2RBJQ5SGqJUvU8oS1qgPNr
	n3nWdZgp/FNcbpHsYUAsqFpQm/Ls3pfxKul6FI5B1rJyjUPZOfjSnHW59UBX+JEdoZqP
	7ML9BgBoHEUsapBPqQ8c1E9kdXTx1VC4xVU0y5X1yoonPDPrzQvaJ3HtDgZBC+gZ1NwR
	JEaQ==
X-Gm-Message-State: APzg51AClYHywTep6xY38WlINIH2A+Nu5MvOR2svBebKL9T3MbXIJxXa
	Nh/0vgpkCOPJGCAlbxb2EtNIS+0Ygb807Q==
X-Google-Smtp-Source: ANB0VdaeHYpRIOVfpMw3LGp8eIuJ6NBpJeZ9SANroB2gJoM65hqOKof7XbkxtNy7N0kCn6tjiHzMXA==
X-Received: by 2002:a50:ed1a:: with SMTP id
	j26-v6mr28648731eds.29.1535934944664; 
	Sun, 02 Sep 2018 17:35:44 -0700 (PDT)
Received: from localhost.localdomain ([145.130.96.189])
	by smtp.gmail.com with ESMTPSA id
	a19-v6sm10751635edd.69.2018.09.02.17.35.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Sep 2018 17:35:44 -0700 (PDT)
From: Leon Woestenberg <leon@sidebranch.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Sep 2018 02:35:37 +0200
Message-Id: <1535934937-30606-1-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 2.7.4
Subject: [openembedded-core][PATCH] kernel.bbclass: do not deploy fitImage; kernel-fitimage.bbclass does that.
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
X-List-Received-Date: Mon, 03 Sep 2018 00:35:44 -0000

kernel-fitimage.bbclass replaces an occurance of "fitImage" in
KERNEL_IMAGETYPE_FOR_MAKE by an image type that is buildable for the
architecture (such as zImage). The kernel-fitimage.bbclass packs that
image as sub-image in a flattened image tree image (fitImage) and
deploys this fitImage along with the image tree source file (.its).

kernel-fitimage.bbclass does not alter KERNEL_IMAGETYPES, which thus
also contains "fitImage", which kernel.bbclass will also deploy
redundantly with different naming.

The result is a dual deployment with slightly different naming,
each with a set of symlinks.

The solution chosen is to have fitImage deployment be handled by
kernel-fitimage.bbclass, and have kernel.bbclass ignore fitImage
types during deployment.

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 meta/classes/kernel.bbclass | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b341733..fd43ecd 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -675,8 +675,10 @@ kernel_do_deploy() {
 	fi
 
 	for type in ${KERNEL_IMAGETYPES} ; do
-		base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} $deployDir/${base_name}.bin
+		if [ "$type" != "fitImage" ]; then
+			base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} $deployDir/${base_name}.bin
+		fi
 	done
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}/lib
@@ -685,21 +687,25 @@ kernel_do_deploy() {
 	fi
 
 	for type in ${KERNEL_IMAGETYPES} ; do
-		base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
-		symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
-		ln -sf ${base_name}.bin $deployDir/${symlink_name}.bin
-		ln -sf ${base_name}.bin $deployDir/${type}
+		if [ "$type" != "fitImage" ]; then
+			base_name=${type}-${KERNEL_IMAGE_BASE_NAME}
+			symlink_name=${type}-${KERNEL_IMAGE_SYMLINK_NAME}
+			ln -sf ${base_name}.bin $deployDir/${symlink_name}.bin
+			ln -sf ${base_name}.bin $deployDir/${type}
+		fi
 	done
 
 	cd ${B}
 	# Update deploy directory
 	for type in ${KERNEL_IMAGETYPES} ; do
-		if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
-			echo "Copying deploy ${type} kernel-initramfs image and setting up links..."
-			initramfs_base_name=${type}-${INITRAMFS_BASE_NAME}
-			initramfs_symlink_name=${type}-initramfs-${MACHINE}
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.initramfs $deployDir/${initramfs_base_name}.bin
-			ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
+		if [ "$type" != "fitImage" ]; then
+			if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
+				echo "Copying deploy ${type} kernel-initramfs image and setting up links..."
+				initramfs_base_name=${type}-${INITRAMFS_BASE_NAME}
+				initramfs_symlink_name=${type}-initramfs-${MACHINE}
+				install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.initramfs $deployDir/${initramfs_base_name}.bin
+				ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
+			fi
 		fi
 	done
 }
-- 
2.7.4


