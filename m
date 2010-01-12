Received: from mail-gx0-f217.google.com ([209.85.217.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1NUUL6-0007hw-VW
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 01:10:32 +0100
Received: by gxk9 with SMTP id 9so48448184gxk.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 16:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=xdioqUELbPOdLBklPYMl910QF55fH+Crcg4AgZ+YXZ0=;
	b=nJ36P2tuc6wG0VlMPrP6L+NVDkZnwJlwaDf4B64iQi3qdQR6vWnXJYAeU9RvCGZNOT
	/pm+yxNOaUHEb+P+hBd0bnOQtzviymYDLagiKXPqtzCPQKYk0/UATVN8TcJBnVNEjiaO
	YoJ/bqQ6xJ7F+WUBiFVOfixHb4j47LfEDVGMM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=kNXyefrDTBuHHznA4Sb7PyTPmzVkR3KjNe/8omLIrhNJEZx4UTGRFoxQmFuN3c3Npw
	hhXsxXxf5Xs1kvHwPxTYErO6VCeqlgXdBJOhh9PeaSQdobJqQSvY45mntmFt7WmFyMWc
	eQPgocn3WZ/KIyYHuti2H4E3kDVugOapAKqa4=
Received: by 10.150.251.4 with SMTP id y4mr1944215ybh.89.1263254899639;
	Mon, 11 Jan 2010 16:08:19 -0800 (PST)
Received: from ?10.0.0.21? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id 6sm10737741yxg.66.2010.01.11.16.08.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 11 Jan 2010 16:08:18 -0800 (PST)
Message-ID: <4B4BBD4C.2080107@gmail.com>
Date: Tue, 12 Jan 2010 10:37:40 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090820)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.1001110722550.22930@localhost>	<4B4B2B0E.8030501@balister.org>	<alpine.LFD.2.00.1001110856460.28813@localhost>	<4B4B3301.2090808@balister.org>	<6ec4247d1001111337x5a5572a2l74d23bf1bfa03a68@mail.gmail.com>	<alpine.LFD.2.00.1001111718250.2601@localhost>	<6ec4247d1001111439m43a8147bk8a614a253563999c@mail.gmail.com>
	<alpine.LFD.2.00.1001111813530.3541@localhost>
In-Reply-To: <alpine.LFD.2.00.1001111813530.3541@localhost>
X-SA-Exim-Connect-IP: 209.85.217.217
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Add e2fsprogs 1.41.9. [WAS Re: bitbake and e2fsprogs-1.41.9?]
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
X-List-Received-Date: Tue, 12 Jan 2010 00:10:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

FYI, here is the patch that was submitted upstream:
http://sourceforge.net/tracker/?func=detail&aid=2813809&group_id=2406&atid=302406

The issue with 1.41.5 went away for me when I installed 32bit compatibility
libs on my pure 64 bit system.

-Graham


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 conf/checksums.ini                           |    4 +
 recipes/e2fsprogs/e2fsprogs-native_1.41.9.bb |   20 ++++
 recipes/e2fsprogs/e2fsprogs_1.41.9.bb        |  125 ++++++++++++++++++++++++++
 3 files changed, 149 insertions(+), 0 deletions(-)
 create mode 100644 recipes/e2fsprogs/e2fsprogs-native_1.41.9.bb
 create mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.9.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 12c4cf2..ba6b7ba 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -5438,6 +5438,10 @@ sha256=2cc10fee2b29add737e454eb634513135b34a638f7ca2b18364864fe089020dc
 md5=e218df6c84fc17c1126d31de9472a76c
 sha256=b3d7d0e1058a3740ddae83d47285bd9dce161eec9e299dde7996ed721da32198
 
+[http://downloads.sourceforge.net/e2fsprogs/e2fsprogs-1.41.9.tar.gz]
+md5=52f60a9e19a02f142f5546f1b5681927
+sha256=cbf1e34261a16b3d7911b60b91290b19f2010036d6ba628d45b5f0b2af2b66e8
+
 [http://downloads.sourceforge.net/e2fsprogs/e2fsprogs-libs-1.33.tar.gz]
 md5=c7545bb05e0c2fc59174f0dc455c6519
 sha256=a65d064bee3e97c164d07a490692db0e73da8da10019ad9a89866706c93ae703
diff --git a/recipes/e2fsprogs/e2fsprogs-native_1.41.9.bb b/recipes/e2fsprogs/e2fsprogs-native_1.41.9.bb
new file mode 100644
index 0000000..c4a26e2
--- /dev/null
+++ b/recipes/e2fsprogs/e2fsprogs-native_1.41.9.bb
@@ -0,0 +1,20 @@
+SECTION = "base"
+require e2fsprogs.inc
+inherit native
+
+EXTRA_OECONF = ""
+
+PACKAGES = ""
+DEPENDS = ""
+
+do_configure() {
+        oe_runconf
+}
+
+do_stage () {
+	autotools_stage_all
+	install -d ${STAGING_BINDIR_NATIVE}/
+	for b in ${e2miscbins}; do
+		install -m 0755 misc/$b ${STAGING_BINDIR_NATIVE}/ || die "failed to install $b"
+	done
+}
diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.9.bb b/recipes/e2fsprogs/e2fsprogs_1.41.9.bb
new file mode 100644
index 0000000..ada93bd
--- /dev/null
+++ b/recipes/e2fsprogs/e2fsprogs_1.41.9.bb
@@ -0,0 +1,125 @@
+require e2fsprogs.inc
+
+DEPENDS += "gettext-native"
+
+do_configure() {
+        oe_runconf
+}
+
+do_compile_prepend () {
+	find ./ -print|xargs chmod u=rwX
+	( cd util; ${BUILD_CC} subst.c -o subst )
+}
+
+ext2fsheaders = "ext2_ext_attr.h bitops.h ext2_err.h \
+		 ext2_types.h ext2_fs.h ext2_io.h \
+		 ext2fs.h"
+e2pheaders = "e2p.h"
+
+do_stage () {
+	oe_libinstall -a -C lib libe2p ${STAGING_LIBDIR}/
+	oe_libinstall -a -C lib libext2fs ${STAGING_LIBDIR}/
+	install -d ${STAGING_INCDIR}/e2p
+	for h in ${e2pheaders}; do
+		install -m 0644 lib/e2p/$h ${STAGING_INCDIR}/e2p/ || die "failed to install $h"
+	done
+	install -d ${STAGING_INCDIR}/ext2fs
+	for h in ${ext2fsheaders}; do
+		install -m 0644 lib/ext2fs/$h ${STAGING_INCDIR}/ext2fs/ || die "failed to install $h"
+	done
+	autotools_stage_all
+}
+
+# blkid used to be part of e2fsprogs but is useful outside, add it
+# as an RDEPENDS so that anything relying on it being in e2fsprogs
+# still works
+RDEPENDS_e2fsprogs = "e2fsprogs-blkid e2fsprogs-uuidgen e2fsprogs-badblocks"
+
+FILES_${PN} += "${libdir}/e2initrd_helper"
+
+PACKAGES =+ "e2fsprogs-blkid e2fsprogs-uuidgen e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-fsck e2fsprogs-tune2fs e2fsprogs-badblocks"
+FILES_e2fsprogs-blkid = "${base_sbindir}/blkid.${PN}"
+FILES_e2fsprogs-uuidgen = "${bindir}/uuidgen"
+FILES_e2fsprogs-fsck = "${base_sbindir}/fsck.${PN}"
+FILES_e2fsprogs-e2fsck = "${base_sbindir}/e2fsck.${PN} ${base_sbindir}/fsck.ext*.${PN}"
+FILES_e2fsprogs-mke2fs = "${base_sbindir}/mke2fs.${PN} ${base_sbindir}/mkfs.ext*.${PN}"
+FILES_e2fsprogs-tune2fs = "${base_sbindir}/tune2fs ${base_sbindir}/e2label ${base_sbindir}/findfs"
+FILES_e2fsprogs-badblocks = "${base_sbindir}/badblocks"
+
+do_install_append () {
+	mv ${D}${base_sbindir}/fsck ${D}${base_sbindir}/fsck.${PN}
+	mv ${D}${base_sbindir}/blkid ${D}${base_sbindir}/blkid.${PN}
+	mv ${D}${base_sbindir}/e2fsck ${D}${base_sbindir}/e2fsck.${PN}
+	rm ${D}${base_sbindir}/fsck.ext2
+	rm ${D}${base_sbindir}/fsck.ext3
+	rm ${D}${base_sbindir}/fsck.ext4*
+	mv ${D}${base_sbindir}/mke2fs ${D}${base_sbindir}/mke2fs.${PN}
+	rm ${D}${base_sbindir}/mkfs.ext2
+	rm ${D}${base_sbindir}/mkfs.ext3
+	rm ${D}${base_sbindir}/mkfs.ext4*
+
+	cd ${D}/${base_sbindir}
+	ln -sf ./e2fsck.${PN} fsck.ext2.${PN}
+	ln -sf ./e2fsck.${PN} fsck.ext3.${PN}
+	ln -sf ./e2fsck.${PN} fsck.ext4.${PN}
+	ln -sf ./e2fsck.${PN} fsck.ext4dev.${PN}
+	ln -sf ./mke2fs.${PN} mkfs.ext2.${PN}
+	ln -sf ./mke2fs.${PN} mkfs.ext3.${PN}
+	ln -sf ./mke2fs.${PN} mkfs.ext4.${PN}
+	ln -sf ./mke2fs.${PN} mkfs.ext4dev.${PN}
+
+	ln -sf ./tune2fs findfs
+	ln -sf ./tune2fs e2label
+}
+
+pkg_postinst_e2fsprogs () {
+	update-alternatives --install ${base_bindir}/chattr chattr chattr.${PN} 100
+}
+
+pkg_postinst_e2fsprogs-fsck () {
+	update-alternatives --install ${base_sbindir}/fsck fsck fsck.${PN} 100
+}
+
+pkg_prerm_e2fsprogs-fsck () {
+	update-alternatives --remove fsck fsck.${PN}
+}
+
+pkg_postinst_e2fsprogs-blkid () {
+    update-alternatives --install ${base_sbindir}/blkid blkid blkid.${PN} 100
+}
+
+pkg_prerm_e2fsprogs-blkid () {
+    update-alternatives --remove blkid blkid.${PN}
+}
+
+pkg_postinst_e2fsprogs-e2fsck () {
+	update-alternatives --install ${base_sbindir}/e2fsck e2fsck e2fsck.${PN} 100
+	update-alternatives --install ${base_sbindir}/fsck.ext2 fsck.ext2 fsck.ext2.${PN} 100
+	update-alternatives --install ${base_sbindir}/fsck.ext3 fsck.ext3 fsck.ext3.${PN} 100
+	update-alternatives --install ${base_sbindir}/fsck.ext4 fsck.ext4 fsck.ext4.${PN} 100
+	update-alternatives --install ${base_sbindir}/fsck.ext4dev fsck.ext4dev fsck.ext4dev.${PN} 100
+}
+
+pkg_prerm_e2fsprogs-e2fsck () {
+	update-alternatives --remove e2fsck e2fsck.${PN}
+	update-alternatives --remove fsck.ext2 fsck.ext2.${PN}
+	update-alternatives --remove fsck.ext3 fsck.ext3.${PN}
+	update-alternatives --remove fsck.ext4 fsck.ext4.${PN}
+	update-alternatives --remove fsck.ext4dev fsck.ext4dev.${PN}
+}
+
+pkg_postinst_e2fsprogs-mke2fs () {
+	update-alternatives --install ${base_sbindir}/mke2fs mke2fs mke2fs.${PN} 100
+	update-alternatives --install ${base_sbindir}/mkfs.ext2 mkfs.ext2 mkfs.ext2.${PN} 100
+	update-alternatives --install ${base_sbindir}/mkfs.ext3 mkfs.ext3 mkfs.ext3.${PN} 100
+	update-alternatives --install ${base_sbindir}/mkfs.ext4 mkfs.ext4 mkfs.ext4.${PN} 100
+	update-alternatives --install ${base_sbindir}/mkfs.ext4dev mkfs.ext4dev mkfs.ext4dev.${PN} 100
+}
+
+pkg_prerm_e2fsprogs-mke2fs () {
+	update-alternatives --remove mke2fs mke2fs.${PN}
+	update-alternatives --remove mkfs.ext2 mkfs.ext2.${PN}
+	update-alternatives --remove mkfs.ext3 mkfs.ext3.${PN}
+	update-alternatives --remove mkfs.ext4 mkfs.ext4.${PN}
+	update-alternatives --remove mkfs.ext4dev mkfs.ext4dev.${PN}
+}
-- 
1.6.4



