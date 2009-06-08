Received: from [209.85.200.174] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ramaxlo@gmail.com>) id 1MDX9j-0003iJ-PU
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2009 07:12:23 +0200
Received: by wf-out-1314.google.com with SMTP id 25so1250129wfa.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jun 2009 22:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=NXnr8H3KjJSxb+8JJCkRezMQ0yI7SZz1qwMO7Z9IO/c=;
	b=rpC4WcSmWSTIE7GRsLb17uDgT0gpC5EdzovX32/OtwGfoBkaJo67l5rZsOWEf24z8N
	yqkOAsDU8OeXpruAUqwPdSLTEPPWsbN9bWJMXpIeHHwBpoK1DUoQaGWsQRfwxC/8nO7S
	DsIgDNupH67UR0h4N8CTAQfq1+DuocWjy+CAY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=mG5mCs8Q7tJ+tu0MKDzaoUZVNz7EFn6yiIQZgHb3b8ujixw9Z1gwp1OLtwRRZofVFb
	DCq4IntsFtgbhI/qnXOEQtuxNTn4add5ZY8r6p4b36rBnjwIn3w6uGG4xWKCSdojbm1n
	Q8dilw+FhHs+ieqTB8MzpnZomAJWsbM6/JULQ=
Received: by 10.142.14.18 with SMTP id 18mr2113901wfn.35.1244437376880;
	Sun, 07 Jun 2009 22:02:56 -0700 (PDT)
Received: from renaisance1 (220-128-119-163.HINET-IP.hinet.net
	[220.128.119.163])
	by mx.google.com with ESMTPS id 22sm8119854wfi.32.2009.06.07.22.02.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 07 Jun 2009 22:02:55 -0700 (PDT)
From: Ramax Lo <ramaxlo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jun 2009 13:03:17 +0800
Message-Id: <1244437397-7409-1-git-send-email-ramaxlo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
Subject: [PATCH] u-boot-mkimage-openmoko: Fix SRC_URI
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
X-List-Received-Date: Mon, 08 Jun 2009 05:12:24 -0000

---
 .../u-boot/u-boot-mkimage-openmoko-native_oe.bb    |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/u-boot/u-boot-mkimage-openmoko-native_oe.bb b/recipes/u-boot/u-boot-mkimage-openmoko-native_oe.bb
index 8b5564c..4005c37 100644
--- a/recipes/u-boot/u-boot-mkimage-openmoko-native_oe.bb
+++ b/recipes/u-boot/u-boot-mkimage-openmoko-native_oe.bb
@@ -5,7 +5,7 @@ inherit native
 PV = "1.2.0+git9912121f7ed804ea58fd62f3f230b5dcfc357d88svn2238"
 PR = "r1"
 
-SRC_URI = "git://www.denx.de/git/u-boot.git/;protocol=git;tag=9912121f7ed804ea58fd62f3f230b5dcfc357d88 \
+SRC_URI = "git://git.denx.de/u-boot.git;protocol=git;tag=9912121f7ed804ea58fd62f3f230b5dcfc357d88 \
 file://uboot-machtypes.patch;patch=1 \
 file://ext2load_hex.patch;patch=1 \
 file://uboot-s3c2410-warnings-fix.patch;patch=1 \
-- 
1.5.4.3



