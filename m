Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.6723.1611026698134802009
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jan 2021 19:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; 
   d="scan'208";a="103603831"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 19 Jan 2021 11:24:46 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 184444CE6018
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Jan 2021 11:24:46 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 19 Jan 2021 11:24:45 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-smbus: upgrade 4.1 -> 4.2
Date: Tue, 19 Jan 2021 23:24:44 +0800
Message-ID: <1611069884-4580-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 184444CE6018.A1359
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

4.2 (2020-09-22)
  manpages: Add BUGS section to let people know how to contact us
  Makefile: Allow to preset all CFLAGS and LDFLAGS variables
  tools: Consistently use snprintf instead of sprintf
         Restrict addresses 0x03-0x07, too (defined by I2C standard)
  decode-dimms: Print SPD revision for DDR3 too
                Print primary bus width for DDR3 and DDR4
                List ee1004 as a candidate driver
                Display MAC for DDR3
                Add MAC abbreviation for DDR4
                Round DDR4 speed properly
                Detect and report truncated input files
                Print kernel driver used
                Print DDR memory speed in MT/s
                Add DDR5 memory types
                Decode manufacturing data for LPDDR3
                Fix the version string
                Point the user to the right drivers
                Update the list of vendors to Jedec JEP106BB
  decode-vaio: Add support for the at24 driver
               Scan more i2c buses
  i2cset: Fix short writes with mask
  i2ctransfer: Mention '-a' everywhere in the manpage
               Support messages using I2C_M_RECV_LEN
               Add check for returned length from driver
  i2c-stub-from-dump: Read dumps from hexdump -C
  library: Add a manual page to document the API

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../python/{python3-smbus_4.1.bb => python3-smbus_4.2.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-smbus_4.1.bb => python3-smbus_4.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-smbus_4.1.bb b/meta-python/recipes-devtools/python/python3-smbus_4.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-smbus_4.1.bb
rename to meta-python/recipes-devtools/python/python3-smbus_4.2.bb
index 6b33649434..862a547c00 100644
--- a/meta-python/recipes-devtools/python/python3-smbus_4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus_4.2.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://smbusmodule.c;beginline=1;endline=18;md5=46e424fb0459
 PR = "r1"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV}.tar.gz "
-SRC_URI[md5sum] = "3536237a6b51fb10caacdc3b8a496237"
-SRC_URI[sha256sum] = "ef8f77afc70e7dbfd1171bfeae87a8a7f10074829370ce8d9ccd585a014e0073"
+SRC_URI[md5sum] = "d6861c89521f2a2773e19edadb2befee"
+SRC_URI[sha256sum] = "7de18ed890e111fa54ab7ea896804d5faa4d1f0462a258aad9fbb7a8cc6b60cc"
 
 DEPENDS += "i2c-tools"
 
-- 
2.25.1



