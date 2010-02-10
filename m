Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NfIwH-00068X-GQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 21:13:36 +0100
Received: by fxm25 with SMTP id 25so402472fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 12:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=9ELgUrOvcxWCHyxMTGmMmJ30EYLbKia+4XQF5p2aCeE=;
	b=R2If5eh7HhoDJWEye5222zFHms5bnUkoEg9b1fbDOruNvq7MYHYKAzy/42JICBnDMv
	A0sKjK5IM2OU5klWqaVupk3qPnDSWXLScJc1aqXIhawD1UJoiORMTK093xPql/CcYvUW
	IrMRUjKcoUKZSJgE7+Sx6gjdr4UIXqS3hG/Uk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Xqyn64hbiEK+S/qcawyMb5p/HMZmWrz3ERoCw1LOpmvWy18cz/yiQ07PBQRjDuBp2F
	GrE1XbhtbuBjDC/CUY68bKVgfGC4fJVf6CzmkDzPKdGNgRkEoqe4RFCb5foZxPNCUBDe
	nTfYyD+8pQDe6du5e1DT+DaVZJYxePcms7fq4=
Received: by 10.223.74.154 with SMTP id u26mr918456faj.47.1265832656893;
	Wed, 10 Feb 2010 12:10:56 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id p9sm2614428fkb.44.2010.02.10.12.10.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 12:10:55 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NfIvm-0005CU-6W; Wed, 10 Feb 2010 21:13:02 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Feb 2010 21:12:57 +0100
Message-Id: <1265832780-19939-6-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>
References: <1265832780-19939-1-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-2-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-3-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-4-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-5-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 5/8] busybox: use .tar.bz2
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
X-List-Received-Date: Wed, 10 Feb 2010 20:13:36 -0000

Switch to new-style checksums and remove all checksums for tarballs from
checksums.ini

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 conf/checksums.ini                |   60 -------------------------------------
 recipes/busybox/busybox.inc       |    1 -
 recipes/busybox/busybox_1.11.3.bb |    4 ++-
 recipes/busybox/busybox_1.13.2.bb |    4 ++-
 recipes/busybox/busybox_1.14.3.bb |    6 ++--
 recipes/busybox/busybox_1.15.3.bb |    4 ++-
 recipes/busybox/busybox_1.2.1.bb  |    7 ++++-
 recipes/busybox/busybox_1.2.2.bb  |    7 ++++-
 recipes/busybox/busybox_1.3.1.bb  |    6 +++-
 recipes/busybox/busybox_1.7.2.bb  |    4 ++-
 recipes/busybox/busybox_1.9.2.bb  |    4 ++-
 11 files changed, 35 insertions(+), 72 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 15eb19c..075b5eb 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -3682,18 +3682,6 @@ sha256=e4f5bc9be311a746bd37f5607d3c225462d7d9294e8b3c692f9a39717b65d843
 md5=c17e047d1a6a3f3188de929dc8582e01
 sha256=58eb43e7e781a6b61e452fa36fa03198ef44c742da80c8a1b60be073e4ab949b
 
-[http://www.busybox.net/downloads/busybox-1.00.tar.gz]
-md5=fa62459e098fc00b22772aaf2e75bc98
-sha256=f3e1592607d42cab45387790af0cb0fea2d061f70f8679672a4397bcfe3562e5
-
-[http://www.busybox.net/downloads/busybox-1.01.tar.gz]
-md5=63041103f88192d209f6b1d7944fd118
-sha256=1d7c1b1931549ac294f438c50148da052f69f501676ba361034ef72b111605d3
-
-[http://www.busybox.net/downloads/busybox-1.11.0.tar.gz]
-md5=2e5b08cd8a76daf4a185c69b8070797f
-sha256=458e4f20723a1527be0b563896b2d314bf2bb0063d5627f0c6536ed07f544771
-
 [http://busybox.net/downloads/fixes-1.11.1/busybox-1.11.1-basename.patch]
 md5=f7780f73d3338b17d5f2eedbe76132de
 sha256=0f3129eff8420f2e3da237a95dbb6234ef380ac4343cb192eccd69fe8c840c7b
@@ -3702,14 +3690,6 @@ sha256=0f3129eff8420f2e3da237a95dbb6234ef380ac4343cb192eccd69fe8c840c7b
 md5=fb01aea02faf4c5107292454745806ff
 sha256=6a045d34561b8548ae08ca7d0803d77fc2b70bdfc61793aa0a99e59a91059443
 
-[http://www.busybox.net/downloads/busybox-1.11.1.tar.gz]
-md5=9c9f06c2d949c6de844c7bed8eb47064
-sha256=cf3957b4548df051cd0971d179cb92dc0fcab3839977ddb70aae81c14cd04b03
-
-[http://www.busybox.net/downloads/busybox-1.11.3.tar.gz]
-md5=d113f2777e4f508faa8b674ece87a37b
-sha256=f2b433270f22aad86f61cef61d95338aaa63dbe2f9468b9ed5defd1c01c9645f
-
 [http://busybox.net/downloads/fixes-1.13.2/busybox-1.13.2-depmod.patch]
 md5=7c9dfb5dcd66a1d6e837e72ad0cb05d4
 sha256=35e3854599a074ce1b47872ab1b97a625ed7d1ab3345b918f7f60524f5e390c5
@@ -3730,30 +3710,6 @@ sha256=ba540cad8a029ff2eec7b078e31a308f408c074a13160aa7eba80f5ca18ee703
 md5=90d093817855bc63ad16fbb8524f80df
 sha256=9427fa9b45f3c322bf4fe2463c99c972e6ae03df630899b38be4f29133708a0e
 
-[http://www.busybox.net/downloads/busybox-1.13.2.tar.gz]
-md5=aeb526108f13b91c02b115c8d86f9659
-sha256=03fc9dbdc6f44afd2da55c0ab36646d2d063708cc35f3f4569b913b064f11d83
-
-[http://www.busybox.net/downloads/busybox-1.14.3.tar.gz]
-md5=dfb197b8de260ff284f7222ed23614fe
-sha256=b5a0c76d414cca97fb21622a5d09fa5a58f59890f5c9ce4f8b851c4e8b73a163
-
-[http://www.busybox.net/downloads/busybox-1.15.3.tar.gz]
-md5=f24d830f292d1ad27910ef226d6b2ef8
-sha256=dd8e07708d380a44cddaccce731c0e39f4d47ad921ab886644b6258fdf80b590
-
-[http://www.busybox.net/downloads/busybox-1.2.0.tar.gz]
-md5=6af69ebbbf8adc874ccb6d67dca95df5
-sha256=df6e3b0079194251a2ff68d7be7b06025c79f4fe62f4a73158ee52ff4bc515a0
-
-[http://www.busybox.net/downloads/busybox-1.2.1.tar.gz]
-md5=b9c853b2c453e80381077288f40035b3
-sha256=984b7974670d4f0291094ea2a36ee21fe46591f36cb51f95292dbe143c1eeab4
-
-[http://www.busybox.net/downloads/busybox-1.5.0.tar.gz]
-md5=158ccadd830fe6cb3d21a109f398e037
-sha256=08ef1e87c7198fb6d7c0a5f830fc2d99e5fd077dbb7d4ca1b66117ae924f6df3
-
 [http://busybox.net/downloads/fixes-1.7.2/busybox-1.7.2-ash.patch]
 md5=4149857c0b2c7f3d52a1f2cec5d7778d
 sha256=73706e7d77144a6270da02ede61cde3c2e3b0e716d879737ac9d478b29233ba9
@@ -3770,26 +3726,10 @@ sha256=5117584a563c512b68cd9678d3cf54e6186f5a062836398791385f8ed73cca86
 md5=c211189556c59a2665af45bffe5a5878
 sha256=f44c3c2d7d9b3fc8a5f9fb6ac587ae4170d2515d72f9e76deb8c071ce9847abe
 
-[http://www.busybox.net/downloads/busybox-1.7.2.tar.gz]
-md5=34c76dc55004d8d5dcea884e0e99bc21
-sha256=e0eb7d59ba996a58608999998ad630c67b93c05af4eafea29770c4839c0e5461
-
-[http://www.busybox.net/downloads/busybox-1.8.2.tar.gz]
-md5=12851f4844bcda78ef4ba9168e16cc56
-sha256=3400bf837d214adc8522d1e78bae936c0c2cde2127ab1ee095587b946a6b5131
-
 [http://busybox.net/downloads/fixes-1.9.1/busybox-1.9.1-lineedit.patch]
 md5=9e5d99b89d79dd117310ee675322d9f2
 sha256=3fe138dc567d0fcda304f89523686aaec2f83c9193403cfc68d1ba32fa554511
 
-[http://www.busybox.net/downloads/busybox-1.9.1.tar.gz]
-md5=b9ae7be6e9a112ea5653855bbe70b501
-sha256=722071b14aba77ce6e2a83608b2ae4d4dab318d7f339d83e6c1719886b21aed9
-
-[http://www.busybox.net/downloads/busybox-1.9.2.tar.gz]
-md5=b31e4d1648df9259e2426839bc067038
-sha256=9bfc34aa8104caba9c0f089aab908700ff4ad76c2b7ca6d5f4c93d842041b1a7
-
 [http://downloads.sourceforge.net/bvi/bvi-1.3.1.src.tar.gz]
 md5=b9d77c57bda2e019207a1874d9bb4dea
 sha256=c94dbfa293cbc61b8571d025e90fd1f06a34f8d4e5b11a59856bfc1f13014de3
diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 7f67f47..5f52850 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -14,7 +14,6 @@ PRIORITY = "required"
 INC_PR = "r24"
 
 SRC_URI = "\
-  http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
   file://busybox-cron \
   file://busybox-httpd \
   file://busybox-udhcpd \
diff --git a/recipes/busybox/busybox_1.11.3.bb b/recipes/busybox/busybox_1.11.3.bb
index 0ec753f..838e1bd 100644
--- a/recipes/busybox/busybox_1.11.3.bb
+++ b/recipes/busybox/busybox_1.11.3.bb
@@ -2,7 +2,7 @@ require busybox.inc
 PR = "${INC_PR}.1"
 
 SRC_URI = "\
-  http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
+  http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
   \
   file://udhcpscript.patch;patch=1 \
   file://B921600.patch;patch=1 \
@@ -23,6 +23,8 @@ SRC_URI = "\
   file://mdev \
   file://mdev.conf \
 "
+SRC_URI[tarball.md5sum] = "4355ad8bb57ce3b39ad827566c1a6da3"
+SRC_URI[tarball.sha256sum] = "6d35fda668988c06f8c22e6e20fe6951ec83108169df6b8c0bad99872577c784"
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
 
diff --git a/recipes/busybox/busybox_1.13.2.bb b/recipes/busybox/busybox_1.13.2.bb
index 18d49ba..d22819e 100644
--- a/recipes/busybox/busybox_1.13.2.bb
+++ b/recipes/busybox/busybox_1.13.2.bb
@@ -2,7 +2,7 @@ require busybox.inc
 PR = "${INC_PR}.1"
 
 SRC_URI = "\
-  http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
+  http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
   file://busybox-1.13.2-awk.patch;patch=1 \
   file://busybox-1.13.2-depmod.patch;patch=1 \
   file://busybox-1.13.2-init.patch;patch=1 \
@@ -36,6 +36,8 @@ SRC_URI = "\
   file://mdev \
   file://mdev.conf \
 "
+SRC_URI[tarball.md5sum] = "9e2a604d18bef219a5a6bf3acf78b9e1"
+SRC_URI[tarball.sha256sum] = "927774408bd982dd246fb716bb2e646ab0708ce321b42c5e271dc98c1f5d1dc8"
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
 
diff --git a/recipes/busybox/busybox_1.14.3.bb b/recipes/busybox/busybox_1.14.3.bb
index 8d45e1e..d714310 100644
--- a/recipes/busybox/busybox_1.14.3.bb
+++ b/recipes/busybox/busybox_1.14.3.bb
@@ -4,7 +4,7 @@ PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
-  http://www.busybox.net/downloads/busybox-${PV}.tar.gz;name=tarball \
+  http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
 \
   file://udhcpscript.patch;patch=1 \
   file://udhcpc-fix-nfsroot.patch;patch=1 \
@@ -27,8 +27,8 @@ SRC_URI = "\
   file://mdev.conf \
 "
 
-SRC_URI[tarball.md5sum] = "dfb197b8de260ff284f7222ed23614fe"
-SRC_URI[tarball.sha256sum] = "b5a0c76d414cca97fb21622a5d09fa5a58f59890f5c9ce4f8b851c4e8b73a163"
+SRC_URI[tarball.md5sum] = "d170bf5f97a41aec3a505eab690d5699"
+SRC_URI[tarball.sha256sum] = "e94df4f9063a1951b4e94e76148ed80e921737a89d97bc2c310a2a8927982e90"
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
 
diff --git a/recipes/busybox/busybox_1.15.3.bb b/recipes/busybox/busybox_1.15.3.bb
index 3f8e40c..b638f9c 100644
--- a/recipes/busybox/busybox_1.15.3.bb
+++ b/recipes/busybox/busybox_1.15.3.bb
@@ -2,7 +2,7 @@ require busybox.inc
 PR = "${INC_PR}.0"
 
 SRC_URI = "\
-  http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
+  http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
   \
   file://udhcpscript.patch;patch=1 \
   file://udhcpc-fix-nfsroot.patch;patch=1 \
@@ -24,6 +24,8 @@ SRC_URI = "\
   file://mdev \
   file://mdev.conf \
 "
+SRC_URI[tarball.md5sum] = "6059ac9456de6fb18dc8ee4cd0ec9240"
+SRC_URI[tarball.sha256sum] = "d74020ad2cc5a4dcc5109c44dbd0e22582d6ce42954b0f1ff29763c8c0ff03cb"
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
 
diff --git a/recipes/busybox/busybox_1.2.1.bb b/recipes/busybox/busybox_1.2.1.bb
index 3630a46..037584a 100644
--- a/recipes/busybox/busybox_1.2.1.bb
+++ b/recipes/busybox/busybox_1.2.1.bb
@@ -2,9 +2,14 @@ require busybox.inc
 
 PR = "${INC_PR}.1"
 
-SRC_URI += "file://wget-long-options.patch;patch=1 \
+SRC_URI += "\
+	   http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
+	   \
+	   file://wget-long-options.patch;patch=1 \
 	   file://df_rootfs.patch;patch=1 \
            file://defconfig"
+SRC_URI[tarball.md5sum] = "362b3dc0f2023ddfda901dc1f1a74391"
+SRC_URI[tarball.sha256sum] = "c6f955c7feafdb7c40645b3dc4c4a3c945477a2429633eef7b2a34ef01827410"
 SRC_URI_append_avr32 = " file://install-should-unlink-dest-if-it-exists.patch;patch=1"
 
 do_configure () {
diff --git a/recipes/busybox/busybox_1.2.2.bb b/recipes/busybox/busybox_1.2.2.bb
index 43a15d0..c160635 100644
--- a/recipes/busybox/busybox_1.2.2.bb
+++ b/recipes/busybox/busybox_1.2.2.bb
@@ -4,8 +4,13 @@ PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE = "-1"
 
-SRC_URI = "file://wget-long-options.patch;patch=1 \
+SRC_URI = "\
+	   http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
+	   \
+	   file://wget-long-options.patch;patch=1 \
            file://defconfig"
+SRC_URI[tarball.md5sum] = "ae8a4c65b9464c8ece3483a3d3b9544c"
+SRC_URI[tarball.sha256sum] = "4de9fb2bb018e381e64199b38d90cb25e71366c37a8995e9ab5ed206ebcb972f"
 
 do_configure () {
 	install -m 0644 ${WORKDIR}/defconfig ${S}/.config.oe
diff --git a/recipes/busybox/busybox_1.3.1.bb b/recipes/busybox/busybox_1.3.1.bb
index e0fd63b..a6a79c9 100644
--- a/recipes/busybox/busybox_1.3.1.bb
+++ b/recipes/busybox/busybox_1.3.1.bb
@@ -4,7 +4,11 @@ PR = "${INC_PR}.1"
 
 DEFAULT_PREFERENCE = "-1"
 
-SRC_URI = "file://defconfig"
+SRC_URI = "\
+	http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
+	file://defconfig"
+SRC_URI[tarball.md5sum] = "571531cfa83726947ccb566de017ad4f"
+SRC_URI[tarball.sha256sum] = "5bf9ead9cca99620d2e56ddf79fdf5fb306fd7f30087b5556e0956e3b1948206"
 
 do_configure () {
 	install -m 0644 ${WORKDIR}/defconfig ${S}/.config.oe
diff --git a/recipes/busybox/busybox_1.7.2.bb b/recipes/busybox/busybox_1.7.2.bb
index 8ce081f..4bfd5e6 100644
--- a/recipes/busybox/busybox_1.7.2.bb
+++ b/recipes/busybox/busybox_1.7.2.bb
@@ -1,7 +1,7 @@
 require busybox.inc
 PR = "${INC_PR}.1"
 
-SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
+SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-cron \
            file://busybox-httpd \
            file://busybox-udhcpd \
@@ -15,6 +15,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
            file://busybox-appletlib-dependency.patch;patch=1 \
            file://umount.busybox \
            file://run_parts.c"
+SRC_URI[tarball.md5sum] = "c91ec9756e2000073a9dd8fa9fc3f89e"
+SRC_URI[tarball.sha256sum] = "83c4cc813124a43f13e2ebb83cea9da9909d63891b824bf4bc7006f0567db7cf"
 
 SRC_URI += "http://busybox.net/downloads/fixes-1.7.2/busybox-1.7.2-ash.patch;patch=1 \
             http://busybox.net/downloads/fixes-1.7.2/busybox-1.7.2-iptun.patch;patch=1 \
diff --git a/recipes/busybox/busybox_1.9.2.bb b/recipes/busybox/busybox_1.9.2.bb
index cd9b6ab..5e8e65a 100644
--- a/recipes/busybox/busybox_1.9.2.bb
+++ b/recipes/busybox/busybox_1.9.2.bb
@@ -1,7 +1,7 @@
 require busybox.inc
 PR = "${INC_PR}.1"
 
-SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
+SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch;patch=1 \
            file://adduser-longops.patch;patch=1 \
            file://sort-z-nul.patch;patch=1;status=upstream \
@@ -18,6 +18,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.gz \
            file://syslog.conf \
            file://umount.busybox \
            file://defconfig"
+SRC_URI[tarball.md5sum] = "7e26c56012dd5811251c2f87786b9a77"
+SRC_URI[tarball.sha256sum] = "a14ca1104242953672807f5b5223de5615c237a27140f36d625b3067daaf11dc"
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX}"
 
-- 
1.6.5



