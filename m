Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OnNTt-0004yb-CV
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 05:13:59 +0200
Received: by pxi11 with SMTP id 11so2159170pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 20:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=bvIuhmlXKlvo02xLD6tipG0PVFDm08PFzh/n4Ngux20=;
	b=WiJMr2ZBKXU5F8GNSVKJbx3fanNhB3vTeIYtOJ267rm3+EffxlC5B+J5HSeRDyjKPN
	uk8E/UYNkMtGEfKmTJ1miMFiTARgVGOqy2G8Zwf/jhiholwnISRKJtfrrGRtuF/e4539
	gW3104wNrLWkoFPZA1Xd37g27oZ2Taulkv3UM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=B+xQKm7dFAwYj3g1BRZLbtNjJl6ajL9uIYSWv0crdBCAFvYLbvQDf0FAE84COpexjv
	yJ56tmn/Dtyuz7ZIdCy79zDd9E83JTKzXXTCLL6x1EBhBVchzlm7jo3omwMC2wn2cGjD
	g18+V6WwFhxKFZN+/p1yE6woYBTh/ObBJn15o=
Received: by 10.114.15.16 with SMTP id 16mr5264068wao.118.1282533203777;
	Sun, 22 Aug 2010 20:13:23 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d38sm11586601wam.8.2010.08.22.20.13.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 22 Aug 2010 20:13:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Aug 2010 20:13:10 -0700
Message-Id: <1282533191-11579-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1282533191-11579-1-git-send-email-raj.khem@gmail.com>
References: <1282533191-11579-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3] linux-efikamx_2.6.31.bb: Add recipe for linux kernel used for Efika MX
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
X-List-Received-Date: Mon, 23 Aug 2010 03:13:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/linux/linux-efikamx_2.6.31.bb |   47 +++++++++++++++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-efikamx_2.6.31.bb

diff --git a/recipes/linux/linux-efikamx_2.6.31.bb b/recipes/linux/linux-efikamx_2.6.31.bb
new file mode 100644
index 0000000..96eb682
--- /dev/null
+++ b/recipes/linux/linux-efikamx_2.6.31.bb
@@ -0,0 +1,47 @@
+require linux.inc
+
+DESCRIPTION = "Linux kernel for EfikaMX platform"
+KERNEL_IMAGETYPE = "uImage"
+
+COMPATIBLE_MACHINE = "efikamx"
+
+python do_fetch () {
+        import os,shutil
+        bb.build.exec_func("base_do_fetch", d)
+        if os.access(bb.data.expand("${DL_DIR}/73", d), os.R_OK):
+                shutil.copy(bb.data.expand("${DL_DIR}/73", d), bb.data.expand("${DL_DIR}/${PN}-${PV}.tar.lzma", d))
+
+        if os.access(bb.data.expand("${DL_DIR}/83", d), os.R_OK):
+                shutil.copy(bb.data.expand("${DL_DIR}/83", d), bb.data.expand("${DL_DIR}/patch-${PV}.tar.lzma", d))
+}
+
+python do_unpack () {
+       bb.build.exec_func('efikamx_kernel_do_unpack', d)
+}
+
+efikamx_kernel_do_unpack () {
+       mkdir -p ${S}
+       tar xf ${DL_DIR}/${PN}-${PV}.tar.lzma --strip-components=1 -C ${S}
+       tar xf ${DL_DIR}/patch-${PV}.tar.lzma -C ${S}
+}
+
+python do_patch () {
+       bb.build.exec_func('efikamx_kernel_do_patch', d)
+}
+
+efikamx_kernel_do_patch (){
+       ( cd ${S}/patches; ls *.patch >series;cp *.config ${S}/../defconfig)
+       ( cd ${S}; quilt push -a)
+}
+
+SRC_URI += "http://www.powerdeveloper.org/asset/by-id/73;name=kernel \
+            http://www.powerdeveloper.org/asset/by-id/83;name=patch \
+           "
+
+SRC_URI[kernel.md5sum] = "c70ce0549cf85de79d5b28db7b552868"
+SRC_URI[kernel.sha256sum] = "658395072352cd38477d80c105f00d824c73bf437f0843579d1e0bf41066617f"
+
+SRC_URI[patch.md5sum] = "6c04416bce74dd413f3e82cd17378419"
+SRC_URI[patch.sha256sum] = "5c15cffa02089d286fc07ba734b1f33a81d1f7ceaf70e596bd8b82ddd5e73ec2"
+
+S = "${WORKDIR}/${PN}-${PV}"
-- 
1.7.1



