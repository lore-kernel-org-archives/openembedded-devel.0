Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1B1757A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jun 2015 01:44:05 +0000 (UTC)
Received: by iebgx4 with SMTP id gx4so48327785ieb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 18:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/3rcQCK7RVJ+8tF32lvwcaFfcuudGRrNqWXomevCEgM=;
	b=KP1Om7HV3LeykErUp2mz3S4U5kPXhzjQphmyjEno8asWHEho5ERZFDu9Zh2Oe8TGIc
	SJQxQ2mquz7tnASGxzq3E2s6VQpTfYuRPBodLmsedVj5PAg57xb178TX7oNFx678pYX/
	2wJK5z6CC2520nlOE/ibXhG3pmU3nAAEviGBm+vnU9NOstJ+1Xm6Toc+/JUb9oUdRyhF
	E0FYJFOCc4Ihv37xj6YaUKZfmx16lPXuPBYA0hYCWx/IeCF+Ja9FlOlcPidnR+16zb3J
	rj4yMegm4Wjl57SZAlUKbjJNU9XebmZVhRbDJI7tb/nQll1u2Ftphq0q+r2zIqSMXUhb
	CkOA==
X-Received: by 10.50.102.68 with SMTP id fm4mr9128164igb.25.1433468646648;
	Thu, 04 Jun 2015 18:44:06 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id n14sm2347521ion.5.2015.06.04.18.44.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jun 2015 18:44:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 18:44:01 -0700
Message-Id: <1433468641-18841-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] cpufrequtils: Create proper symlinks to versioned library
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jun 2015 01:44:10 -0000

Currently it produces duplicated .so files for .so.0 and .so.0.0.0
this is also noticed by opkg upgrade

Configuring libxcb-randr0.
/sbin/ldconfig: /usr/lib/libcpufreq.so.0 is not a symbolic link

Additionally helps in some code size savings

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
index e3b4de1..88fcc02 100644
--- a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
+++ b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/emagii/cpufrequtils.git \
            file://0001-dont-unset-cflags.patch \
 "
 
-CFLAGS_append_libc-uclibc = " ${@['-DNLS', '-UNLS']['${USE_NLS}' == 'no']} "
+EXTRA_OEMAKE_append = " ${@['', 'NLS=false']['${USE_NLS}' == 'no']} "
 
 PR = "r5"
 
@@ -30,5 +30,8 @@ do_compile() {
 
 do_install() {
     oe_runmake -e install DESTDIR=${D}
+    rm -f ${D}${libdir}/libcpufreq.so.0 ${D}${libdir}/libcpufreq.so
+    ln -s libcpufreq.so.0.0.0 ${D}${libdir}/libcpufreq.so.0
+    ln -s libcpufreq.so.0.0.0 ${D}${libdir}/libcpufreq.so
 }
 
-- 
2.1.4


