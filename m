Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1TxKiV-0001JO-EA
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jan 2013 17:59:32 +0100
Received: by mail-wi0-f179.google.com with SMTP id o1so5111702wic.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2013 08:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=Hl1fiKEiKzqc75K1svFUhJ56b6n6sz9UpBjLZJv6s60=;
	b=nmT3S67MrECGK4Ni8NlDwGrus2izeM0vxruNOx7bt1S2zaiakebzhrrrU3/mJBbQqc
	36sU9lgcn5uLZb1XoglW/UbHZ9NXxjGc6S4r/yJUECrWQxYQ5F3+hwKq/ZcjMYRPvcqB
	tO7tsWi5uebXBIuJ6+V/FT+/Y7XG6el4ZP5ND6xBt9Arhyqmx2x5KjHFlMXMT8B2/8tm
	8rYiwk3cVvetjHza2+5U8p0qixv68XSqYugq3ym6ox9N7arKH3AertRHadRAlxKt/0EM
	j/EhM3SjgpeFB0D65XhRa6TeLhGZ5YIZdyqLM56qc9YyshZN4ojq4sR/VPf8em/JM9Yj
	/mzg==
X-Received: by 10.194.76.237 with SMTP id n13mr27552533wjw.57.1358786638648;
	Mon, 21 Jan 2013 08:43:58 -0800 (PST)
Received: from fahad-u1204.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPS id t17sm19454796wiv.6.2013.01.21.08.43.56
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 08:43:57 -0800 (PST)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jan 2013 21:43:47 +0500
Message-Id: <1358786627-20844-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Otavio Salvador <otavio@ossystems.com.br>, Eric Benard <eric@eukrea.com>
Subject: [meta-browser][PATCH] nss: fix access to https websites
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
X-List-Received-Date: Mon, 21 Jan 2013 16:59:33 -0000

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes-support/nss/nss_3.13.3.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-support/nss/nss_3.13.3.bb b/recipes-support/nss/nss_3.13.3.bb
index bb602b1..a841397 100644
--- a/recipes-support/nss/nss_3.13.3.bb
+++ b/recipes-support/nss/nss_3.13.3.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Mozilla's SSL and TLS implementation"
 HOMEPAGE = "http://www.mozilla.org/projects/security/pki/nss/"
 
-PR = "r1"
+PR = "r2"
 
 LICENSE = "MPL1.1 GPL LGPL"
 LIC_FILES_CHKSUM = "file://security/nss/manifest.mn;md5=d71978748f23eae3156c38ac2a691924"
@@ -66,6 +66,8 @@ do_install() {
 		NS_USE_GCC=1 \
 		NSS_USE_SYSTEM_SQLITE=1 \
 		NSS_ENABLE_ECC=1 \
+		FREEBL_CHILD_BUILD=1 \ 
+		CC="${CC}" \
 		SOURCE_LIB_DIR="${TD}/${libdir}" \
 		SOURCE_BIN_DIR="${TD}/${bindir}"
 
-- 
1.7.9.5



