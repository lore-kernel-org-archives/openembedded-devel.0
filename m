Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TwHCF-0000lk-IW
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jan 2013 20:01:54 +0100
Received: by mail-pa0-f50.google.com with SMTP id hz10so2282687pad.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2013 10:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=p812f76+vdrnC2eVVyLnzXbt6S6kIjsZ9l0GYjADV34=;
	b=XQqryURdl2UHNuHq230iIRhK2HWceTli2Me5MIe94YrrsBx8heSJkmNra4zVUwhZoG
	pUQSlwCRaFj7LBDRSu9cN+jmA5iqvU+NYUCMOPCj3yhhiDURefzGy1gt1pCU4UdFcJMZ
	qGTbd1i7ODNwSk45w6Q+geR7zsBg+sHO/jVYo/9xwbr9dDAaCJrLG7DHPhBuCXE9BHyU
	BMv4mE1H5bgl8ec30CkezvMr9axsfPdlHy/PawOq/YfvyATvFdQBwuRBrmKDZgq4HK7R
	u/zDT9Hh/068gN7Ic1AVZIGuYOrhdIa8gfin1Sz0Omzi6Ie//Ql4srytRMp+g+QBlMOx
	42MA==
X-Received: by 10.68.241.232 with SMTP id wl8mr7843020pbc.144.1358534782158;
	Fri, 18 Jan 2013 10:46:22 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id x6sm3893922paw.0.2013.01.18.10.46.20
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 10:46:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jan 2013 10:45:54 -0800
Message-Id: <1358534754-5006-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] luajit_2.0.0.bb: Fix regexpt to change hardcodes path to fix rebuilds
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
X-List-Received-Date: Fri, 18 Jan 2013 19:01:54 -0000

when rebuilding we were running into issues where /usr/lib64 was
being made /usr/lib6464 and install was failing. Now we check if /lib
is at the end of line then only we replace it.

Fixes the reinstall issue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb
index ac769cf..70cefa8 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9511885992e4900014e3b13ca6372b7d"
 HOMEPAGE = "http://luajit.org"
 
 DEPENDS += "lua5.1"
-PR = "r0"
+PR = "r1"
 SRC_URI = "http://luajit.org/download/LuaJIT-${PV}.tar.gz \
            file://disable_lj_vm_foldarith_for_spe.patch \
           "
@@ -17,7 +17,7 @@ inherit pkgconfig binconfig
 
 do_configure_prepend() {
 	sed -i -e s:/usr/local:${prefix}:g ${S}/Makefile
-	sed -i -e s:/lib:${base_libdir}:g ${S}/Makefile
+	sed -i -e s:/lib$:${base_libdir}:g ${S}/Makefile
 }
 
 EXTRA_OEMAKE = 'CROSS=${HOST_PREFIX}'
-- 
1.7.9.5



