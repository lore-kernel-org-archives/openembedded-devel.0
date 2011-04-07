Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q7kCC-0006qf-5t
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 10:04:04 +0200
Received: by mail-gx0-f175.google.com with SMTP id 3so363922gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 01:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=6+xT0iSFj5UD4QrKYFz/gOg+D4Za64NWiH10RT7E/os=;
	b=O2pz+Wz+ng0pUl9AHEoJzc5DSD1V8q7G4cQ3jy0eTaVyYbgsZpQTG9sl7SqtuHcuFz
	3eXY6kbTV1cPoN1MaA1HZ0utKEYSvN+ZIYQWSoyt/v6/BuCGco6UMVHrV0YiyeNue/KW
	/E0QwvWHMXrxCC64MjK0HU1ssMU7ZlyAh1EfA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Ksjb7FipI3wHVUEhkWg5MASRM+67aZKLiLYMdbbFoIs1LZ/svRczMmkjngFmv08dmx
	Qsn3Ah/Zo2xUyw9z5wsYsflU7u/IkWO9Zjw8ZL8nEw5rzRzOp2rk6pXfesyGqcDOGb3k
	IDpV7Tz3Lg4Tby6ldUJ03lfviltvd9M2x2zTE=
Received: by 10.147.124.16 with SMTP id b16mr479293yan.32.1302163318521;
	Thu, 07 Apr 2011 01:01:58 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id c4sm1593468ana.23.2011.04.07.01.01.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2011 01:01:58 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Apr 2011 13:31:36 +0530
Message-Id: <1302163296-16002-5-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302163296-16002-1-git-send-email-heroor@gmail.com>
References: <1302163296-16002-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCHv2 5/5] ti-syslink-libs: Add Syslink version 02.00.00.68 Beta2
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
X-List-Received-Date: Thu, 07 Apr 2011 08:04:04 -0000

From: Siddharth Heroor <heroor@ti.com>


Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-syslink-libs_02.00.00.68.bb |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-syslink-libs_02.00.00.68.bb

diff --git a/recipes/ti/ti-syslink-libs_02.00.00.68.bb b/recipes/ti/ti-syslink-libs_02.00.00.68.bb
new file mode 100644
index 0000000..4a88f28
--- /dev/null
+++ b/recipes/ti/ti-syslink-libs_02.00.00.68.bb
@@ -0,0 +1,24 @@
+require ti-syslink-libs.inc
+
+PV = "02_00_00_68"
+PVExtra = "_beta1"
+
+S = "${WORKDIR}/syslink_${PV}${PVExtra}"
+SYSLINK_ROOT = "${WORKDIR}/syslink_${PV}${PVExtra}"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/SysLink/${PV}${PVExtra}/exports/syslink_${PV}${PVExtra}.tar.gz;name=syslinktarball"
+SRC_URI[syslinktarball.md5sum] = "468034372124f70f82b60cfb5f11c8e8"
+SRC_URI[syslinktarball.sha256sum] = "ed574dcb3a5477cfbc69a1c9e768d5197291cb057d19fd791e16e1c89af3e8e1"
+
+do_configure() {
+    # Update config.bld
+    sed -i \
+        -e s:^C674_ELF.rootDir.*:C674_ELF.rootDir\ =\ \"${CODEGEN_INSTALL_DIR}\":g \
+        -e s:C64P_COFF,://C64P_COFF:g \
+        -e s:C64P_ELF,://C64P_ELF:g \
+        -e s:C674_COFF,://C674P_COFF:g \
+        -e s:M3_ELF,://M3_ELF:g \
+        -e s:A8_ELF$://A8_ELF:g \
+        ${S}/config.bld
+}
+
-- 
1.7.0.4



