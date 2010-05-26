Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OHEU2-0004Ct-FT
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 13:10:01 +0200
Received: by pvc30 with SMTP id 30so1000230pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 04:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=2Dpe5sifHIXf0+iotpfhHI9B+6WFq9LNgwxevktMC2c=;
	b=dYB7Ndf1mgU3hgb8O19Ua+zBVz+AQ4PGwgKtl6+PXmXqQ61FDN6vsSAzTQ8CubwsUR
	Xe+XNx8sQSjeARK3NEJX5NWR2JN5wxpFXCWRbXl6oiuhOZxje0usuZyZC71nMO5BvAIS
	RdZKqo0AHeKIFsqEwz+na0ML0ppmzOnZYXBoA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=n/5MsjQpdrnSvr7Jb1ArXocanu5VOdHTgZlWtSsqDfsIpesAQwMDfSfwu+qYv2wrlB
	wJDDt7KfkgTsDdj6bzgZKEerpFoVpvRkIlwa4sltBdFU3RX8blIB72ZBEMu2vySpBr1S
	kguXdhfPrMzDLjn8ePrUFWM6RU3wld5vFnhZA=
Received: by 10.115.116.5 with SMTP id t5mr7469055wam.77.1274871899265;
	Wed, 26 May 2010 04:04:59 -0700 (PDT)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id r20sm56259850wam.5.2010.05.26.04.04.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 May 2010 04:04:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 May 2010 04:04:53 -0700
Message-Id: <1274871893-30846-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] shadow.inc: Append serial devices mentioned in SERIAL_CONSOLE into /etc/securetty
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
X-List-Received-Date: Wed, 26 May 2010 11:12:49 -0000
X-List-Received-Date: Wed, 26 May 2010 11:12:49 -0000

* Some serial dev nodes are not part of /etc/securetty. So either
  we can add them manually or deduce from SERIAL_CONSOLE. this does
  the later. Tested on qemuarm which used ttyAMA0 for console and it
  not listed in the securetty list. This authorizes root login on
  the give named console.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/shadow/shadow.inc |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/recipes/shadow/shadow.inc b/recipes/shadow/shadow.inc
index 30bd92f..460930b 100644
--- a/recipes/shadow/shadow.inc
+++ b/recipes/shadow/shadow.inc
@@ -11,7 +11,9 @@ LICENSE = "BSD"
 SECTION = "base"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-INC_PR = "r13"
+PACKAGE_ARCH_${PN} = "${MACHINE_ARCH}"
+
+INC_PR = "r14"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = " \
@@ -90,8 +92,15 @@ do_install_append() {
   mv ${D}${bindir}/login ${D}${base_bindir}/login.${PN}
 
   # Ensure we add a suitable securetty file to the package that has most common embedded TTYs defined.
+  if [ ! -z "${SERIAL_CONSOLE}" ]; then
+  # our SERIAL_CONSOLE contains baud rate too and sometime -L option as well.
+  # the following pearl :) takes that and converts it into newline sepated tty's and appends
+  # them into securetty. So if a machine has a weird looking console device node (e.g. ttyAMA0) that securetty
+  # does not know then it will get appended to securetty and root login will be allowed on
+  # that console.
+    echo "${SERIAL_CONSOLE}" | sed -e 's/[0-9][0-9]\|\-L//g'|tr "[ ]" "[\n]"  >> ${WORKDIR}/securetty
+  fi
   install -m 0400 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty 
-
 }
 
 pkg_postinst_${PN} () {
-- 
1.7.0.4



