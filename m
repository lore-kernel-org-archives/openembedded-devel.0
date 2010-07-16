Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OZoT3-0003VD-5u
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 19:13:01 +0200
Received: by ewy7 with SMTP id 7so839768ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 10:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=xvyuug/PgY/kvSz81ebiRk4t1Rdt7I/mXdr47pA9Q00=;
	b=tjc4apZH0aHTgDgWdcOULMm0/tn9albuT+dUytI6M6QTBg8fjOwvzevaUPQrGUHOv7
	jl/ORfNDdXvQmAn40bomAO5VmS0OTDb3iJ/wmBNy9w6RNePeCC0S7ilRgV0fKcth9DfX
	3DZzAqQKXVrQKBfrlRgPY4Y6pJG6ZxnsQKMok=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=GFqXDHbbUDTsGejQ8sAZJLNHpPRIgZdry7Jbq5uX6rcsc2CoclNgyQ2OHdpGxqxFuc
	6F+Gi0NtiKzDLE5Ddv5RbA+q+ysiGyK1MEpS6dAv2JOR2jWyG+j/wOPeFbJhsER4D2Vr
	rkb+FDsAI5F47AuR2U2OkqnvNGxwX6ckQoqTw=
Received: by 10.213.28.194 with SMTP id n2mr4565352ebc.10.1279300366990;
	Fri, 16 Jul 2010 10:12:46 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id z55sm19656640eeh.21.2010.07.16.10.12.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 16 Jul 2010 10:12:46 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jul 2010 19:12:40 +0200
Message-Id: <1279300361-3838-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] binutils: added COMPATIBLE_TARGET_SYS
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
X-List-Received-Date: Fri, 16 Jul 2010 17:13:02 -0000

added COMPATIBLE_TARGET_SYS = "(?!nios2)" to the inc file
and COMPATIBLE_TARGET_SYS = "" to the few recipes that do
support nios2

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

Modified as suggested by Marcin.

 recipes/binutils/binutils.inc             |    2 ++
 recipes/binutils/binutils_2.17.50.0.12.bb |    2 ++
 recipes/binutils/binutils_2.20.1.bb       |    2 ++
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/recipes/binutils/binutils.inc b/recipes/binutils/binutils.inc
index a1866f3..279d653 100644
--- a/recipes/binutils/binutils.inc
+++ b/recipes/binutils/binutils.inc
@@ -5,6 +5,8 @@ LICENSE = "GPL"
 
 INC_PR = "r10"
 
+COMPATIBLE_TARGET_SYS = "(?!nios2)"
+
 inherit autotools gettext
 
 PACKAGES += "${PN}-symlinks"
diff --git a/recipes/binutils/binutils_2.17.50.0.12.bb b/recipes/binutils/binutils_2.17.50.0.12.bb
index 70c0801..31ce22b 100644
--- a/recipes/binutils/binutils_2.17.50.0.12.bb
+++ b/recipes/binutils/binutils_2.17.50.0.12.bb
@@ -1,6 +1,8 @@
 require binutils.inc
 PR = "${INC_PR}.1"
 
+COMPATIBLE_TARGET_SYS = ""
+
 SRC_URI = \
     "${KERNELORG_MIRROR}/pub/linux/devel/binutils/binutils-${PV}.tar.bz2 \
      file://binutils-2.16.91.0.6-objcopy-rename-errorcode.patch \
diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/binutils_2.20.1.bb
index 624848c..b75de99 100644
--- a/recipes/binutils/binutils_2.20.1.bb
+++ b/recipes/binutils/binutils_2.20.1.bb
@@ -3,6 +3,8 @@ LICENSE = "GPLv3"
 
 PR = "${INC_PR}.1"
 
+COMPATIBLE_TARGET_SYS = ""
+
 SRC_URI = "\
      ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2;name=tarball \
      file://binutils-uclibc-100-uclibc-conf.patch \
-- 
1.6.4.2



