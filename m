Return-Path: <tom@harbortronics.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 351D273042
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Mar 2017 00:47:56 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id s67so25752527pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Mar 2017 16:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=harbortronics.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=O+FtdhWlwvMYCE47dZ/ijuEe8HggprwIBKJrv/Tw1DE=;
	b=hCFWDGiADcuFBdD/5jRoFTjMeMw4WtwQz/qW1XAoxSJS5tAUzkFeIfstS9PHoAPE6N
	lkUIO7NPRn1knO2yRmhbK5tAGUlZYGpZ0soDoRp9P2kupI1hG8ACsBafiKb8yBlM6Jqr
	eQb2AVQLROjRQaeeGj7rGFpA3z+73X6gdHGC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O+FtdhWlwvMYCE47dZ/ijuEe8HggprwIBKJrv/Tw1DE=;
	b=hXdCKS9UwAz6mTvwhjOBpif9S6hWmHxQ2Zw3FGPcjWCvXCYFdMEAXUyHbyNjync4IU
	2OGQX+3Ncxq638rmCC49R40a9YvfBiYSjVGV0diFRP2h/y4z6GXPbuxHvSIp/hnd+ZEC
	Qz4eC3DpgVzTiPPwzA1u/53A7G4eIBAKNEQgHqU9OzGif2IWyCIGmNEKzHum4UXdZ7b1
	2bL2Ngdxiu2St5MH/gIZHWRsTGBhYaXcUV8Nn+F1dNfAYzXKua3EPnzezF7kgkzP/qSK
	CH1maFubnOciRbvH8EPclqwQx7JrKOEuAspfZ4lxn30JRsDk9mookrrYkx0ox8QI6eYR
	M1ig==
X-Gm-Message-State: AMke39mgwz3XLR/JG3SDUpgctqO3GIqSuSdIbzE3V47OTZIv1OQUipFkiK/cNnvuuFsgPQ==
X-Received: by 10.99.108.74 with SMTP id h71mr11862798pgc.99.1488415677612;
	Wed, 01 Mar 2017 16:47:57 -0800 (PST)
Received: from yocto-dev.harbortronics.com (174-21-50-42.tukw.qwest.net.
	[174.21.50.42]) by smtp.gmail.com with ESMTPSA id
	67sm12751635pfd.120.2017.03.01.16.47.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Mar 2017 16:47:56 -0800 (PST)
From: Tom Hayward <tom@harbortronics.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Mar 2017 16:47:47 -0800
Message-Id: <1488415667-57394-1-git-send-email-tom@harbortronics.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-filesystems][PATCH] fuse-exfat: fix mount detection of mount.exfat
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
X-List-Received-Date: Thu, 02 Mar 2017 00:47:57 -0000

When package was switched to autotools, "DESTDIR=${D}/${base_sbindir}" was
removed from the recipe. This left the installation target as sbindir
(/usr/sbin/). This breaks `mount -t exfat /dev/sda1 /media/sda1`, because
mount only searches for mount.exfat in /sbin/, /sbin/fs.d/, and /sbin/fs/.

With sbindir = "${base_sbindir}", mount.exfat is installed at /sbin/mount.exfat
where mount can find it.
---
 meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
index 639e33c..0db1252 100644
--- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
@@ -18,3 +18,4 @@ SRC_URI[md5sum] = "fca71e6598f79d037a3c7c969cb5710c"
 SRC_URI[sha256sum] = "f2e06eba5a21c621aac1d6da21b12a5a324fdd1e20f9c8acd357dd463c2355d9"
 
 S = "${WORKDIR}/${PN}-${PV}"
+sbindir = "${base_sbindir}"
-- 
1.7.10.4


