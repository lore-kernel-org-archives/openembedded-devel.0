Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F00CDB477
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 02:35:35 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9543.1763087734864038636
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 18:35:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GCw3dDxZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: alistair23@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b80fed1505so1284279b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 18:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763087734; x=1763692534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=49ww6sfTszlvbbbmN6epLLhH8Q5UctCzGzBzCWGpbno=;
        b=GCw3dDxZmd2TbrBtprfqEb1e8fvTimdqK53cGXfZ2B7JCJmMT+GoWj1wdaHqOqo2sj
         CGIZVFUFqLsc7CucvKaFxC5Owvgp2jUcMU2/p+EAFB77LkoyPO46X6C5KjFtkve3v3IA
         Esh66RtRFBBQfph8LgZNRQNBg+76xrlRVFy+JFJHlQLpsNQByiHs0M5n/WofVy2jYT+f
         GBLCDyAy53Dgi0T5ajdk/YBGQ5s07rR1LJ0LLYyeLzVsh0sT3lmfuG0gSfY4wkGLldZU
         XI7ZXl5ofwOUM/WGHQcm5Q+EJQpzbBMlopQ/1S9eKJlwTlXbs5H4v3OGS9RM43K8cJSu
         T3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763087734; x=1763692534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49ww6sfTszlvbbbmN6epLLhH8Q5UctCzGzBzCWGpbno=;
        b=c1nxD2OTc4EBXvRF38JTFs1BJcCPIhPUvLpeH/Z8p9CtsY5+WI9Xy+vg4PlriLNWiT
         2LTphotWvd9gHGm4uHB9k+rqxTvBdgYHhJOiiGXt9vj+QD4tsM6ZYCe3KxOJ7FEne6O6
         6Y5YS1nVfvBMmFS0mOmLkyfoJC9BW+9Hmo3SssZc38+nKaQKuCB0eH/4MK+nyZ9WcQfL
         bA+Yzi2LWoa/1PqtT6gyT6qxxUnQUdcu3EfwUtbgmd6jqcInr2Y1SCG+xztPzcynK/Dv
         unbOrIOM73JfAET0UoFvW/T9YJT3lNM9GF/YVaHryEXBQDxjo93K2QyeEVjZVmBUvvlh
         nlqQ==
X-Gm-Message-State: AOJu0Yxxv6j7nUUuj1UO8i2Q/1ZL5RlbLcetCxRIOmICoglbQ8F2alZG
	dWLeDE2yo2YDnTtpnCSp/ykswe+wnbOjXS1uKWRMZKx1Pf9YGSfD2BNXFdp+0A==
X-Gm-Gg: ASbGncvjZFhKxNa/tlgwfJshMQiXvqxBe/psO8Gyb9/EDu8KQNKpfq0bt+DNB6hZfCg
	ih/CKQxIU/3sEmYNR4L3/k2gtxH3sh99wJEaaf/9aQufDC3x+aS6aYw9W07H+xBK9ga0xEi/yG/
	X+i2fG5O/WmDK6EFbJgY9bgF6xgL0AWKdQvW2MNFzMiXuHx1pFOUmacRU+qnp095m0adeD80mgr
	uyBEYL6hJBsw7B+3g9l3mik/H3vqCyVNsMZq1/hw9BRmlAI+J5KdErUFWCxoGxDWD5iMCKap/Dx
	RFk4U4yLId3jMO3vv0EFcN+3UKSHG3nIrCN2swq9tMxPGKAxP7IB3ZRAxM4JLhLzeUHzvPHBm95
	Uma67tU6x5UoCnbCHSOuy6AT3uzTC3LOKpo0gI46wf9fK1zYQEMIfv//4zCdOcBIb2Gy5nQUIMt
	qNUJQsm3KGXuS474ZKyhWAQUO2XIzybpAfYqkUtcvbnSkn0/Cnd9FPifVzIUL28ZJdNjHT5F4kM
	+z41dnX
X-Google-Smtp-Source: AGHT+IEjQ2kFkbAEsS6NDUIUHFPMt0st7kqH+7EGR0gRKEtPmsgc/oIh5SzfvscI2XT6geB/3JOzbg==
X-Received: by 2002:a05:6a20:12d2:b0:348:9a99:6253 with SMTP id adf61e73a8af0-35ba2796ff5mr2112603637.57.1763087733771;
        Thu, 13 Nov 2025 18:35:33 -0800 (PST)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924be368bsm3619078b3a.9.2025.11.13.18.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 18:35:32 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: openembedded-devel@lists.openembedded.org
Cc: alistair23@gmail.com,
	Archana.Kakani@ibm.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-oe][PATCH] libspdm: upgrade 3.7.0 -> 3.8.1
Date: Fri, 14 Nov 2025 12:35:21 +1000
Message-ID: <20251114023522.1449515-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 02:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121669

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...port-API-introduced-in-openssl-3.5.0.patch | 33 -------------------
 .../{libspdm_3.7.0.bb =3D> libspdm_3.8.1.bb}    |  6 ++--
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libspdm/libspdm/0001-Backport-A=
PI-introduced-in-openssl-3.5.0.patch
 rename meta-oe/recipes-support/libspdm/{libspdm_3.7.0.bb =3D> libspdm_3.8.=
1.bb} (92%)

diff --git a/meta-oe/recipes-support/libspdm/libspdm/0001-Backport-API-intr=
oduced-in-openssl-3.5.0.patch b/meta-oe/recipes-support/libspdm/libspdm/000=
1-Backport-API-introduced-in-openssl-3.5.0.patch
deleted file mode 100644
index 2df9a18c68..0000000000
--- a/meta-oe/recipes-support/libspdm/libspdm/0001-Backport-API-introduced-=
in-openssl-3.5.0.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 92f6c3d8fa26d9019ba27e0c1aa894517ada93b9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 11 Apr 2025 17:47:05 -0700
-Subject: [PATCH] Backport API introduced in openssl 3.5.0
-
-This commit [1] introduced this new API which is used by pem.h from
-openssl and it should be provided by asn1.h which is vendored here so
-it goes out of sync and causes build errors e.g
-
-In file included from ./os_stub/cryptlib_openssl/pk/x509.c:18:
-/usr/include/openssl/pem.h:399:28: error: unknown type name 'OSSL_i2d_of_v=
oid_ctx'
-  399 | int PEM_ASN1_write_bio_ctx(OSSL_i2d_of_void_ctx *i2d, void *vctx,
-
-[1] https://github.com/openssl/openssl/commit/35f6e7ea02b599d5aaf220b4720c=
badd946d8023
-
-Upstream-Status: Submitted [https://github.com/DMTF/libspdm/pull/3033]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- os_stub/openssllib/openssl_gen/openssl/asn1.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/os_stub/openssllib/openssl_gen/openssl/asn1.h b/os_stub/opens=
sllib/openssl_gen/openssl/asn1.h
-index a90152ee..fcfbe42e 100644
---- a/os_stub/openssllib/openssl_gen/openssl/asn1.h
-+++ b/os_stub/openssllib/openssl_gen/openssl/asn1.h
-@@ -368,6 +368,7 @@ typedef struct ASN1_VALUE_st ASN1_VALUE;
- =0D
- typedef void *d2i_of_void(void **, const unsigned char **, long);=0D
- typedef int i2d_of_void(const void *, unsigned char **);=0D
-+typedef int OSSL_i2d_of_void_ctx(const void *, unsigned char **, void *vc=
tx);=0D
- =0D
- /*-=0D
-  * The following macros and typedefs allow an ASN1_ITEM=0D
diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb b/meta-oe/rec=
ipes-support/libspdm/libspdm_3.8.1.bb
similarity index 92%
rename from meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
rename to meta-oe/recipes-support/libspdm/libspdm_3.8.1.bb
index c6bbd1716b..431eb8fd40 100644
--- a/meta-oe/recipes-support/libspdm/libspdm_3.7.0.bb
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.8.1.bb
@@ -9,10 +9,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D8f9b59a81a88=
da8e812af43728b72dd7"
=20
 DEPENDS =3D "openssl"
=20
-SRC_URI =3D "git://github.com/DMTF/libspdm.git;branch=3Dmain;protocol=3Dht=
tps \
-           file://0001-Backport-API-introduced-in-openssl-3.5.0.patch"
-SRCREV =3D "1be116c7b7713fa9003e1bd53b53a34758549eb9"
-
+SRC_URI =3D "git://github.com/DMTF/libspdm.git;branch=3Drelease-3.8;protoc=
ol=3Dhttps"
+SRCREV =3D "d7c8c8247b4d0bd8ed75d9f35a558a4df173a4c7"
=20
 inherit cmake
=20
--=20
2.51.1


