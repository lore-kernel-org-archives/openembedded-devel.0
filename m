Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.323.1586714913156798482
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2020 11:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=olL6A7YJ;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id B1FE3600BB;
	Sun, 12 Apr 2020 20:08:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586714909;
	bh=jNP1OAguXIWM+BpTiZBNKq3+eV/JHpauC9Apa8WpzrQ=;
	h=From:To:Cc:Subject:Date:From;
	b=olL6A7YJP9gAZMKDJq51DIaE/SyQpOPOwZwHIxW4jCBBoz+U1aLuEDU9VtX6OcFUu
	 eaxPlN0G5yImGh9eLzd+Xm9bt5b4B20UI7L+VVuXcDnYj8pxELgwttuZMOqCV+XGco
	 brgRKlbSCeUAKM9kfF5UFnBMe8rlBsRhsChhHDCrTJMXUMQCFgtENoyqavQ5K/E5vX
	 +PKoJ5x6isBW1w4qNFidtvIWkhS1mjKFSEtZlMU2CqQCFIUjK3rZGfK6mxjvuMW2oA
	 bt4xHZF2sBH7fmGarlulZRn3uHNfCC7JTDRWByhuFMPUPBJs3zIX2dndu5lCPLE1Tv
	 GEiw+vxGcLoAg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-networking][PATCH] uftp: upgrade 4.10.1 -> 4.10.2
Date: Sun, 12 Apr 2020 20:08:25 +0200
Message-Id: <1586714905-21555-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This includes:

Version 4.10.2
  Fixed security issue where using sha384 or sha512 would set encryption keys
    to all bytes 0
  When using ECDH key exchange with closed group membership, an incorrect
    signature would be applied to the ANNOUCE message, causing the session
    to fail.  Bug fixes.
  Relaxed server side checks on the type of key supplied by a client when not
    using public key signatures on all messages.  This will assist in the
    upgrade process to the upcoming version 5.0.
  Fixed various small memory leaks

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../recipes-support/uftp/{uftp_4.10.1.bb => uftp_4.10.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/uftp/{uftp_4.10.1.bb => uftp_4.10.2.bb} (77%)

diff --git a/meta-networking/recipes-support/uftp/uftp_4.10.1.bb b/meta-networking/recipes-support/uftp/uftp_4.10.2.bb
similarity index 77%
rename from meta-networking/recipes-support/uftp/uftp_4.10.1.bb
rename to meta-networking/recipes-support/uftp/uftp_4.10.2.bb
index a70fd4d..8e35ee1 100644
--- a/meta-networking/recipes-support/uftp/uftp_4.10.1.bb
+++ b/meta-networking/recipes-support/uftp/uftp_4.10.2.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
-SRC_URI[md5sum] = "a5c79c8e5a20d0646c9579fe1f339493"
-SRC_URI[sha256sum] = "903353febf1b88f701198d956a60cec3d2be3cc251561a678061761aec6622f6"
+SRC_URI[md5sum] = "db0519bf7b1e0329449e81c1e68262f8"
+SRC_URI[sha256sum] = "ecab6ab07fe0ebaf7bfe35d99fe2da28ede3ddc6f21f825d3b259cf171258505"
 
 DEPENDS = "openssl"
 
-- 
2.7.4

