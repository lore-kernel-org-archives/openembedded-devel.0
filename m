Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MFPej-0006IK-RM
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Jun 2009 11:36:10 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MFPV3-0003Rk-VO
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Jun 2009 10:26:10 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Jun 2009 10:26:08 +0100
Message-Id: <1244885168.4151.149.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: [patch] util-linux-ng: repair do_install for prefix=/
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
X-List-Received-Date: Sat, 13 Jun 2009 09:36:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The current util-linux recipe loses quite badly if ${sbindir} and
${base_sbindir} are the same location.  I think this patch should
correct the behaviour, but there didn't seem to be any clear pattern to
which files should go where and hence I'm not quite sure that I've got
it right.

p.

--

diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index 7e949d1..ae2742c 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -83,39 +83,42 @@ do_install () {
 	oe_runmake ARCH=${TARGET_ARCH} CPU= CPUOPT= \
 		'OPT=${CFLAGS}' 'CC=${CC}' 'LD=${LD}' \
 		'LDFLAGS=${LDFLAGS}' 'DESTDIR=${D}' install
-	mkdir ${D}${base_bindir}
-	mkdir ${D}${base_sbindir}
-	test -f ${D}${sbindir}/pivot_root && \
-	mv ${D}${sbindir}/pivot_root ${D}${base_sbindir}/pivot_root.${PN}
-	mv ${D}${bindir}/dmesg ${D}${base_bindir}/dmesg.${PN}
-	mv ${D}${bindir}/kill ${D}${base_bindir}/kill.${PN}
-	mv ${D}${bindir}/more ${D}${base_bindir}/more.${PN}
-	mv ${D}${sbindir}/hwclock ${D}${base_sbindir}/hwclock.${PN}
-	mv ${D}${sbindir}/mkswap ${D}${base_sbindir}/mkswap.${PN}
-	mv ${D}${sbindir}/shutdown ${D}${base_sbindir}/shutdown.${PN}
-#	mv ${D}${sbindir}/sln ${D}${base_sbindir}/sln.${PN}
-	mv ${D}${sbindir}/mkfs.minix ${D}${base_sbindir}/mkfs.minix.${PN}
-	mv ${D}${sbindir}/fsck.minix ${D}${base_sbindir}/fsck.minix.${PN}
-	mv ${D}${bindir}/hexdump ${D}${bindir}/hexdump.${PN}
-	mv ${D}${bindir}/last ${D}${bindir}/last.${PN}
-	mv ${D}${bindir}/logger ${D}${bindir}/logger.${PN}
-	mv ${D}${bindir}/mesg ${D}${bindir}/mesg.${PN}
-	mv ${D}${bindir}/renice ${D}${bindir}/renice.${PN}
-	mv ${D}${bindir}/wall ${D}${bindir}/wall.${PN}
-
-	mv ${D}${sbindir}/losetup ${D}${base_sbindir}/losetup.${PN}
-	mv ${D}${sbindir}/swapon ${D}${base_sbindir}/swapon.${PN}
-	mv ${D}${bindir}/umount ${D}${base_bindir}/umount.${PN}
-	mv ${D}${bindir}/mount ${D}${base_bindir}/mount.${PN}
-	mv ${D}${sbindir}/fdisk ${D}${base_sbindir}/fdisk.${PN}
-
-	mv ${D}${sbindir}/agetty ${D}${base_sbindir}/ 
-	mv ${D}${sbindir}/blockdev ${D}${base_sbindir}/
-	mv ${D}${sbindir}/cfdisk ${D}${base_sbindir}/
-	mv ${D}${sbindir}/ctrlaltdel ${D}${base_sbindir}/
-
-	mv ${D}${sbindir}/readprofile ${D}${sbindir}/readprofile.${PN}
-	
+	mkdir -p ${D}${base_bindir}
+
+        sbinprogs="agetty blkdev ctrlaltdel cfdisk"
+        sbinprogs_a="pivot_root hwclock mkswap shutdown mkfs.minix fsck.minix losetup swapon fdisk readprofile"
+        binprogs_a="dmesg kill more hexdump last logger mesg renice wall umount mount"
+
+        if [ "${base_sbindir}" != "${sbindir}" ]; then
+        	mkdir -p ${D}${base_sbindir}
+                for p in $sbinprogs $sbinprogs_a; do
+                        if [ -f "${D}${sbindir}/$p" ]; then
+                                mv "${D}${sbindir}/$p" "${D}${base_sbindir}/$p"
+                        fi
+                done
+        fi
+
+        if [ "${base_bindir}" != "${bindir}" ]; then
+        	mkdir -p ${D}${base_bindir}
+                for p in $binprogs_a; do
+                        if [ -f "${D}${bindir}/$p" ]; then
+                                mv "${D}${bindir}/$p" "${D}${base_bindir}/$p"
+                        fi
+                done
+        fi
+
+        for p in $binprogs_a; do
+                if [ -f "${D}${base_bindir}/$p" ]; then
+                        mv "${D}${base_bindir}/$p" "${D}${base_bindir}/$p.${PN}"
+                fi
+        done
+
+        for p in $sbinprogs_a; do
+                if [ -f "${D}${base_sbindir}/$p" ]; then
+                        mv "${D}${base_sbindir}/$p" "${D}${base_sbindir}/$p.${PN}"
+                fi
+        done
+
 	install -d ${D}${sysconfdir}/default/
 	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"' > ${D}${sysconfdir}/default/mountall
 




