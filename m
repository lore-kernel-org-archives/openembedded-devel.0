Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EDFC79FB7
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 20:25:53 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.548.1788985546793252250
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 13:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FDcloUot;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c86945164so65716031fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 13:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985545; x=1789590345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CAoPB6D5scMWdHsmd4uFdF6JVJqcaBqHH8gLaYa2i4s=;
        b=FDcloUotD1Sqvxuo0Px/CCoiOFlOo2m6gI/BQ9xBsvqwyMGsNu4X9/GEV8AkwfY8aj
         m6/PLFn7I+7REOqMj7IToaTZ8usWk+4KGu3pGSiKu4XiC7LjUi6tqaRUp1U6/ZFUx7Kp
         KK21VNuGPiZrRzbQVVj8uPkCDKYvFf+1us55RNJcs4Te03sVzz+KE29jXToGRR/pvHfJ
         CeKURc5zdGIIYJaj0PidaPMXmv3hxV92Be4pqb/384bsRltqT0ljgAqCMBFMuz706cBa
         lSmTAqty0gL12nJIbcNZ/UXp79Rz86NCNtW2NaD7L+0aZaGHkfldHiVKud1V38aiIARR
         mcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985545; x=1789590345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CAoPB6D5scMWdHsmd4uFdF6JVJqcaBqHH8gLaYa2i4s=;
        b=obKmwgA2BXdCGFuUj/9zFiSYliZzEaNYNis11OyhDKLbLoNUPWoDqTlfhdCe73/rS3
         MgMSUNkRcXI5bEHYwMNtIjJrf2JU3R7DBb4hQgwJ/YP1/xZQhP49A1itwAA4BJ5cUajS
         LnD0aBMEGB8VKzzxbfyuf2bfNyE0b3E2doSvF50pMV8LpUtvj0iKk74T2MvPip0FKMPu
         fc7VHX47LvopzpSo5qRr1wCFEDxCnA7mGZTTCLp2HN188n4ArB4H4rDjj6kVNYvSKhri
         VsjxSiiR199faGhH1ZDlXBQn4SzIygoZuc7gIQlWMJXXNH7ufv8HV+2xmmWo9wTY2Uw3
         I5bQ==
X-Gm-Message-State: AFuF++kns0mPO7xvm/qdZ4SGAPyzcRbLpOSwozlPqPUPMOy+isRh1hWo
	og8DxSnciSaaAPDeBf/cjcHmbdtLXLxg76cFadwEtu4S24SJswkXj9u/bQRGPw==
X-Gm-Gg: AYBFou1F6yC8jcIl+HzIrzPqmiSxwk9PGI9W3eQbfN5+Qd1JsKI4rr9XcSL/6GV50IJ
	IYDqEXNrI6I2UUHDwnBhusgEQ2J+ZI4LoEOCKfKs3J1qwoNRO37UU6PSon+WVnKn0Ujp3lMjKAX
	6VKrTwezUxg6OrCymIIT95q58kwDL1PNyODLJ4Sad5kLs4kEz9IQdyzrzuiO12UaPnDfc5MJvI1
	NBMWCgEXQ2nYbjzOZbqfZDeKbw0A7iX+Y/wOF+ebCeWdVOBOdlU/wgA6+x/RFfOpWV9QJ8jUPpI
	NrSZNAkYy788fL1RKbJjXQf1SvuVARQW02tj1uLSBJgPktYJPUJLfNVle/mf6Cn7DOvNCIxlPga
	qMpDRkwOZuI4TA1/eNJSncZ8fSeD3HGkT2vODhcuULusn3e+GjSQX4gonLmALYJYFsRSPgcqX4X
	2t2kWyk/MrIC2mscClom3OExUjDdU3Kuj/MmiMWEeT0KfEqyHzjR+dkbJA7mf+RK22iANOcZiWw
	lWVA3rDy2JqGFPGcEZIB8dpLdx2vGyvZDGa/hZoOVQPebF1smgeSEPyjzm9bPK5xlTexha6kVEb
	gA==
X-Received: by 2002:a05:651c:1510:b0:3a3:7681:6d68 with SMTP id 38308e7fff4ca-3a37681750emr41026791fa.17.1788985544347;
        Wed, 09 Sep 2026 13:25:44 -0700 (PDT)
Received: from localhost.localdomain ([176.88.90.107])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a372e9efadsm42348281fa.39.2026.09.09.13.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:25:44 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] softhsm: fix build with OpenSSL 4.0
Date: Wed,  9 Sep 2026 23:25:39 +0300
Message-ID: <20260909202539.260304-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 20:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129899

do_compile fails with:

  OSSLUtil.cpp:188:46: error: invalid use of incomplete type
  'ASN1_PRINTABLESTRING' {aka 'struct asn1_string_st'}

Backport the upstream fix. It was written for a memory leak, but it
moves to the ASN1_STRING accessors, which is also what OpenSSL 4 needs.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 ...n-EdDSA-PrintableString-handling-858.patch | 89 +++++++++++++++++++
 .../recipes-security/softhsm/softhsm_2.7.0.bb |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta-oe/recipes-security/softhsm/softhsm/0003-Fix-memory-leak-in-EdDSA-PrintableString-handling-858.patch

diff --git a/meta-oe/recipes-security/softhsm/softhsm/0003-Fix-memory-leak-in-EdDSA-PrintableString-handling-858.patch b/meta-oe/recipes-security/softhsm/softhsm/0003-Fix-memory-leak-in-EdDSA-PrintableString-handling-858.patch
new file mode 100644
index 0000000000..71319ea5e7
--- /dev/null
+++ b/meta-oe/recipes-security/softhsm/softhsm/0003-Fix-memory-leak-in-EdDSA-PrintableString-handling-858.patch
@@ -0,0 +1,89 @@
+From: =?UTF-8?q?Ma=C5=82gorzata=20Olsz=C3=B3wka?= <Malgorzata.Olszowka@stunnel.org>
+Date: Sun, 3 May 2026 13:00:07 +0200
+Subject: [PATCH] Fix memory leak in EdDSA PrintableString handling (#858)
+
+ASN1_STRING is opaque in OpenSSL 4, so curve_name->data no longer
+compiles. Use the accessors and free the string on every path.
+
+Upstream-Status: Backport [https://github.com/softhsm/SoftHSMv2/commit/d23ea09d318c03c033420d065f1c64b019cc94ed]
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ src/lib/crypto/OSSLUtil.cpp | 45 ++++++++++++++++++++++++++-----------
+ 1 file changed, 32 insertions(+), 13 deletions(-)
+
+--- a/src/lib/crypto/OSSLUtil.cpp
++++ b/src/lib/crypto/OSSLUtil.cpp
+@@ -160,12 +160,14 @@
+ // Convert a ByteString to an OpenSSL EVP_PKEY id
+ int OSSL::byteString2oid(const ByteString& byteString)
+ {
+-	ASN1_OBJECT *oid = NULL;
+-	ASN1_PRINTABLESTRING *curve_name = NULL;
++	ASN1_OBJECT *oid;
++	ASN1_PRINTABLESTRING *curve_name;
+ 	const unsigned char *p = byteString.const_byte_str();
+ 	const unsigned char *pp = p;
++	const unsigned char *data;
+ 	long length;
+-	int tag, pclass;
++	int tag, pclass, data_len;
++	int nid = NID_undef;
+ 
+ 	ASN1_get_object(&pp, &length, &tag, &pclass, byteString.size());
+ 	if (pclass == V_ASN1_UNIVERSAL && tag == V_ASN1_OBJECT)
+@@ -178,34 +180,49 @@
+ 			return NID_undef;
+ 		}
+ 
+-		return OBJ_obj2nid(oid);
++		nid = OBJ_obj2nid(oid);
++		ASN1_OBJECT_free(oid);
+ 	}
+ 	else if (pclass == V_ASN1_UNIVERSAL && tag == V_ASN1_PRINTABLESTRING)
+ 	{
+ 		/* The final PKCS#11 3.0 expects curve name encoded as PrintableString */
+ 		curve_name = d2i_ASN1_PRINTABLESTRING(NULL, &p, byteString.size());
+ 
+-		if (strcmp((char *)curve_name->data, "edwards25519") == 0)
++		if (curve_name == NULL)
+ 		{
++			return NID_undef;
++		}
++
++		data = ASN1_STRING_get0_data(curve_name);
++		data_len = ASN1_STRING_length(curve_name);
++
++		if (data_len == 12 && memcmp(data, "edwards25519", data_len) == 0)
++		{
++			ASN1_PRINTABLESTRING_free(curve_name);
+ 			return EVP_PKEY_ED25519;
+ 		}
+ 
+-		if (strcmp((char *)curve_name->data, "curve25519") == 0)
++		if (data_len == 10 && memcmp(data, "curve25519", 10) == 0)
+ 		{
++			ASN1_PRINTABLESTRING_free(curve_name);
+ 			return EVP_PKEY_X25519;
+ 		}
+ 
+-		if (strcmp((char *)curve_name->data, "edwards448") == 0)
++		if (data_len == 10 && memcmp(data, "edwards448", 10) == 0)
+ 		{
++			ASN1_PRINTABLESTRING_free(curve_name);
+ 			return EVP_PKEY_ED448;
+ 		}
+ 
+-		if (strcmp((char *)curve_name->data, "curve448") == 0)
++		if (data_len == 8 && memcmp(data, "curve448", 8) == 0)
+ 		{
++			ASN1_PRINTABLESTRING_free(curve_name);
+ 			return EVP_PKEY_X448;
+ 		}
++
++		ASN1_PRINTABLESTRING_free(curve_name);
+ 	}
+ 
+-	return NID_undef;
++	return nid;
+ }
+ #endif
diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.7.0.bb b/meta-oe/recipes-security/softhsm/softhsm_2.7.0.bb
index 9c4d1251fd..1b2660a2e3 100644
--- a/meta-oe/recipes-security/softhsm/softhsm_2.7.0.bb
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.7.0.bb
@@ -7,6 +7,7 @@ DEPENDS = "sqlite3"
 
 SRC_URI = "git://github.com/softhsm/SoftHSMv2.git;protocol=https;branch=main;tag=${PV} \
            file://0002-Prevent-accessing-of-global-c-objects-once-they-are-.patch \
+           file://0003-Fix-memory-leak-in-EdDSA-PrintableString-handling-858.patch \
 "
 SRCREV = "13e6e86b83748fef74046dbf0c91f664b7acc1c3"
 
-- 
2.43.0


