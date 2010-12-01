Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PNsBG-0000Wl-OK
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 20:17:32 +0100
Received: by fxm17 with SMTP id 17so4946507fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 11:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references:in-reply-to
	:references; bh=I8Gqucp+exX82yT6ch/eE+u5GA1k6kA8f6hjX/mpMhc=;
	b=OXYwJrxi+loOPOe728Zz5TTlq7gxNhU2cTqLoVZKq/esG18DjNTNdoLTJsgIo8r5q3
	75JNm39ZHG8/op/yQvW/M4VxX/eth52huzB9B5xA7RDguWO9/JSoeBDipfwA/sWiq6U6
	3m3i/3QD5u6bx4zXEghpZSZ4sRxaswKWM9siY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jg1BHk7k2SQuPRhDvIJlHzfvMuhiEeYRo8qO/s7vD89GYeD/LIBLzd2IPoR2/Qu2Oy
	KEO8V2OXPoY7Y/D79Bf/QffmvftK8QXqzhbUT/6OVPtNIYfhMV1cQYLijMplZDt9ibXs
	4p2YTa9y241/vo6wbwpxDduS/ZMj+y//Li9D8=
Received: by 10.223.104.198 with SMTP id q6mr8607370fao.13.1291230968765;
	Wed, 01 Dec 2010 11:16:08 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id 5sm153749fak.23.2010.12.01.11.16.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Dec 2010 11:16:07 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PNs9s-0008KW-RO; Wed, 01 Dec 2010 20:16:04 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Tom Rini <tom_rini@mentor.com>
Date: Wed,  1 Dec 2010 20:15:53 +0100
Message-Id: <1291230954-31990-3-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1291230954-31990-1-git-send-email-rep.dot.nop@gmail.com>
References: <1291230954-31990-1-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <4CE682D4.1040304@mentor.com>
References: <4CE682D4.1040304@mentor.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 2/3] e2fsprogs: fix alternatives of non-packaged native sysroot
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
X-List-Received-Date: Wed, 01 Dec 2010 19:17:32 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/e2fsprogs/e2fsprogs.inc |   42 ++++++++++++++++----------------------
 1 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/recipes/e2fsprogs/e2fsprogs.inc b/recipes/e2fsprogs/e2fsprogs.inc
index 7697440..ccf6163 100644
--- a/recipes/e2fsprogs/e2fsprogs.inc
+++ b/recipes/e2fsprogs/e2fsprogs.inc
@@ -9,7 +9,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-${PV}.tar.gz"
 
 S = "${WORKDIR}/e2fsprogs-${PV}"
 
-INC_PR = "r24"
+INC_PR = "r25"
 
 inherit autotools
 
@@ -31,29 +31,23 @@ do_install_append () {
 
     	oe_runmake install-libs DESTDIR=${D}
 
-	mv ${D}${base_sbindir}/e2fsck ${D}${base_sbindir}/e2fsck.${PN}
-	rm ${D}${base_sbindir}/fsck.ext2
-	rm ${D}${base_sbindir}/fsck.ext3
-	rm ${D}${base_sbindir}/fsck.ext4*
-	mv ${D}${base_sbindir}/mke2fs ${D}${base_sbindir}/mke2fs.${PN}
-	rm ${D}${base_sbindir}/mkfs.ext2
-	rm ${D}${base_sbindir}/mkfs.ext3
-	rm ${D}${base_sbindir}/mkfs.ext4*
-
-	cd ${D}/${base_sbindir}
-	ln -sf ./e2fsck.${PN} fsck.ext2.${PN}
-	ln -sf ./e2fsck.${PN} fsck.ext3.${PN}
-	ln -sf ./e2fsck.${PN} fsck.ext4.${PN}
-	ln -sf ./e2fsck.${PN} fsck.ext4dev.${PN}
-	ln -sf ./mke2fs.${PN} mkfs.ext2.${PN}
-	ln -sf ./mke2fs.${PN} mkfs.ext3.${PN}
-	ln -sf ./mke2fs.${PN} mkfs.ext4.${PN}
-	ln -sf ./mke2fs.${PN} mkfs.ext4dev.${PN}
-
-	ln -sf ./tune2fs findfs
-	ln -sf ./tune2fs e2label
-
-	mv ${D}${bindir}/chattr ${D}${bindir}/chattr.${PN}
+	ln -sf ${D}/${base_sbindir}/tune2fs findfs
+	ln -sf ${D}/${base_sbindir}/tune2fs e2label
+}
+
+do_install_append_pn-e2fsprogs () {
+	for f in e2fsck mke2fs; do
+		mv ${D}${base_sbindir}/$f ${D}${base_sbindir}/$f.${PN}
+	done
+	for f in chattr; do
+		mv ${D}${bindir}/$f ${D}${bindir}/$f.${PN}
+	done
+	fsck=$(cd ${D}${base_sbindir}/ && ls -1 fsck.ext* | sed s/[^\.]*//)
+	for e in $fsck;do
+		rm ${D}${base_sbindir}/{fsck,mkfs}$e;
+		ln -s ${D}${base_sbindir}/e2fsck$e.${PN}$e fsck$e.${PN}
+		ln -s ${D}${base_sbindir}/mke2fs$e.${PN}$e mkfs$e.${PN}
+	done
 }
 
 pkg_postinst_e2fsprogs () {
-- 
1.7.2.3



