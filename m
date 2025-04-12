Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496E1C369A2
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 01:03:24 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.1917.1744419795218044398
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Apr 2025 18:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SIWU7W16;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-306b602d2ffso2787273a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 18:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744419794; x=1745024594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hy3IPeb+Ph4Kihj2WKiVJ1q45pvlHiekfHwyXPDa41E=;
        b=SIWU7W16VXis+akFpi5EkXMCFgBKIfDHT5qBpWfmdf3cpSiwaJ/xx2cB3F/kPIpJqC
         ZY6pJV5VA7sy1nG65D0pvDzPp/L5jKIRdhZnig+7dovvYObvvZQlKqlWT03o9Q3YE5Oz
         3FvS3KPq9anHzQLUkz5plZK0l9g2epF+/cuTcGZVMmAy1yeD1yP1SfTxAZgbJ1lOif2o
         ZJ657XTTMmk/MPHATUIJedEo5u8aY2Yi/HjlWCkLe9RhN0uNT5H37f20ZMWe2MEdDRWJ
         cPOrSszSh4VdqDztBTw6fxNyJlRol9KSECiVVqaTyj8TQ368Ir/zWkp2niR18YpbZB7W
         Kn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744419794; x=1745024594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hy3IPeb+Ph4Kihj2WKiVJ1q45pvlHiekfHwyXPDa41E=;
        b=AVIKKDUQ0MzBOqUXWKNBp0to4qdoJrg8uwHl8Z68yIWgAISwTsZHtG4c8AR425ezln
         69fb0vHM2AtzgO3W5TMr6Stw2UFixBCMxklVNvjcuPp/8YNT7GQB6ybEBjLpfSDpZRdT
         UJj05z5g0YUk7w7aBWjl1vqx84Us1wHVDr49Sp1VId5hZP+JXp/defX3ekBqlaQlf00q
         5sdRiCSO3WKin1eRHhkBKB85sI3oIqMiZjUCWOcpq4AIxdTzmub7Uw8onH/I4b7ykj48
         ODbPe1cCnYFLlnt+iqdEuvKAiHn62L+a8eG08ygh0OV7EZlFsHZXU9wM4Q2H41i9L0eq
         3Sog==
X-Gm-Message-State: AOJu0YzdFGsU8xpqDrUMEUnwe+uN8nK79cJtBNFVMsQyjOXdWlYmYARf
	XucVIEaPMWft1zRgsI8mABAMtj4FzGMx7SpM/QoCoteRogXxxwpbUO7DeZ27
X-Gm-Gg: ASbGncv5S4myRKSbTTgH2Q5TVQ+pi9QRw2BXpvFwyTNJG4ngfG3CLO3dnvztgDuTW/o
	jemxe6uGskaP3pidTkogGyUpT9ItkjD7DRax1widXUmCUmPHFLDMn2qGMZXxyPl/IHx2yIG77st
	qvLF4A5oCT6Zq1Asool+7GN07TLm3J1WzKZw1hkoo3MAEHvFCZe0JDA4AONMPL5OUFL8qic9t/h
	rA8f1eHBvttn/iLjdAqdC/1IY5mg9QhRxY/IiyesVAKu6AvYfNbQXnaWR2n7Lle3bQ7z5ArmwV/
	fBLrItgp8Ob2/98vNhvJSQ8lYrDsGCwdhEJJLIxAo4I=
X-Google-Smtp-Source: AGHT+IEbpQjczmTjB2PUE1AIfQdyrDLOjMav63C5I8yPA+iuF2vNV0rit2KR+Fwy71NuWQmYynE0vg==
X-Received: by 2002:a17:90b:4a0a:b0:2ff:53ad:a0ec with SMTP id 98e67ed59e1d1-30823646a71mr6474245a91.21.1744419794032;
        Fri, 11 Apr 2025 18:03:14 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::7ceb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c9929csm57010645ad.112.2025.04.11.18.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 18:03:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] libspdm: Fix build with openssl 3.5
Date: Fri, 11 Apr 2025 18:03:10 -0700
Message-ID: <20250412010310.1167351-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250412010310.1167351-1-raj.khem@gmail.com>
References: <20250412010310.1167351-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 01:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116803

Backport new API signature, since the vendored version of openssl in
libspdm is 3.0.14, asn1.h has to sync for providing it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 ...port-API-introduced-in-openssl-3.5.0.patch | 33 +++++++++++++++++++
 .../recipes-support/libspdm/libspdm_3.7.0.bb  |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libspdm/libspdm/0001-Backport-A=
PI-introduced-in-openssl-3.5.0.patch

diff --git a/meta-oe/recipes-support/libspdm/libspdm/0001-Backport-API-intr=
oduced-in-openssl-3.5.0.patch b/meta-oe/recipes-support/libspdm/libspdm/000=
1-Backport-API-introduced-in-openssl-3.5.0.patch
new file mode 100644
index 0000000000..2df9a18c68
--- /dev/null
+++ b/meta-oe/recipes-support/libspdm/libspdm/0001-Backport-API-introduced-=
in-openssl-3.5.0.patch
@@ -0,0 +1,33 @@
+From 92f6c3d8fa26d9019ba27e0c1aa894517ada93b9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 11 Apr 2025 17:47:05 -0700
+Subject: [PATCH] Backport API introduced in openssl 3.5.0
+
+This commit [1] introduced this new API which is used by pem.h from
+openssl and it should be provided by asn1.h which is vendored here so
+it goes out of sync and causes build errors e.g
+
+In file included from ./os_stub/cryptlib_openssl/pk/x509.c:18:
+/usr/include/openssl/pem.h:399:28: error: unknown type name 'OSSL_i2d_of_v=
oid_ctx'
+  399 | int PEM_ASN1_write_bio_ctx(OSSL_i2d_of_void_ctx *i2d, void *vctx,
+
+[1] https://github.com/openssl/openssl/commit/35f6e7ea02b599d5aaf220b4720c=
badd946d8023
+
+Upstream-Status: Submitted [https://github.com/DMTF/libspdm/pull/3033]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ os_stub/openssllib/openssl_gen/openssl/asn1.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/os_stub/openssllib/openssl_gen/openssl/asn1.h b/os_stub/opens=
sllib/openssl_gen/openssl/asn1.h
+index a90152ee..fcfbe42e 100644
+--- a/os_stub/openssllib/openssl_gen/openssl/asn1.h
++++ b/os_stub/openssllib/openssl_gen/openssl/asn1.h
+@@ -368,6 +368,7 @@ typedef struct ASN1_VALUE_st ASN1_VALUE;
+ =0D
+ typedef void *d2i_of_void(void **, const unsigned char **, long);=0D
+ typedef int i2d_of_void(const void *, unsigned char **);=0D
++typedef int OSSL_i2d_of_void_ctx(const void *, unsigned char **, void *vc=
tx);=0D
+ =0D
+ /*-=0D
+  * The following macros and typedefs allow an ASN1_ITEM=0D
diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb b/meta-oe/rec=
ipes-support/libspdm/libspdm_3.7.0.bb
index a3012e10bd..e5915aa795 100644
--- a/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D8f9b59a81a88d=
a8e812af43728b72dd7"
=20
 DEPENDS =3D "openssl"
=20
-SRC_URI =3D "git://github.com/DMTF/libspdm.git;branch=3Dmain;protocol=3Dht=
tps"
+SRC_URI =3D "git://github.com/DMTF/libspdm.git;branch=3Dmain;protocol=3Dht=
tps \
+           file://0001-Backport-API-introduced-in-openssl-3.5.0.patch"
 SRCREV =3D "1be116c7b7713fa9003e1bd53b53a34758549eb9"
=20
 S =3D "${WORKDIR}/git"

