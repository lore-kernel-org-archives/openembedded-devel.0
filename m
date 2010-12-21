Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1PV8qh-0002bE-Bl
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 21:30:19 +0100
Received: by ywi6 with SMTP id 6so2012811ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 12:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=cIIJQA3NQOXhhbDnCFUClQuXmXQDPlMc9tzWUv1izZg=;
	b=cR1T2LLd9Ebd6uN4YywO9PU8v5vPVVD+eaviap2wMmAQ7WZqS3JoY+GHlQjox4VTHx
	vjZ5mrhG+TYlsql6nZLkW8GXp3tgSvZ8CRYqwU4fKP9BrbKsJVSDlGvCR3ZklFSAMC3Z
	yyYmxy9VnKg74coSzVFE+ceOVmxdS8c884JhM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=N90SvL/wiUFZprAFF5DmTQT/shoTOpKfV97ykFBn7Sxfy6cHuPL87FHhqIROkZYOIn
	PGniTLTneD1Z/dBKzYIdbrOUW8mVj2C+C+shsHEnv8g9l1xaG6cizqDpNuZnazeq0ZF6
	dW0a6Zq0jdLlfBTEwIXH05QeIDI8V66aJJCV8=
Received: by 10.236.109.146 with SMTP id s18mr8670056yhg.28.1292963409506;
	Tue, 21 Dec 2010 12:30:09 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id t38sm3049015yhg.9.2010.12.21.12.30.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 12:30:08 -0800 (PST)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Dec 2010 14:30:05 -0600
Message-Id: <1292963406-19767-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 1/2] ti-pru-sw-edma-library: stage needed header
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
X-List-Received-Date: Tue, 21 Dec 2010 20:30:19 -0000

* Stage the edma.h header which is needed by other example
  applications that link with this library.
* Bump the PR

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/ti-pru-sw-edma-library_1.00.00.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb b/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
index 128d79d..7571421 100644
--- a/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
+++ b/recipes/ti/ti-pru-sw-edma-library_1.00.00.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "eDMA library for use by PRU sw example applications"
 HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
 LICENSE = "BSD"
-PR = "r1+svnr${SRCPV}"
+PR = "r2+svnr${SRCPV}"
 
 DEPENDS += "virtual/kernel ti-pru-sw-edma-driver"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -18,7 +18,9 @@ do_compile () {
 }
 
 do_install () {
-	install -d ${D}/${libdir}
-	install -m 0755 ${S}/../lib/libedmautils.a ${D}/${libdir}/
+	install -d ${D}${libdir}
+    install -d ${D}${includedir}
+	install -m 0755 ${S}/../lib/libedmautils.a ${D}${libdir}/
+    install -m 0644 ${S}/../include/edma.h ${D}${includedir}/
 }
 
-- 
1.7.0.4



