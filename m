Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1C4C433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 10:54:11 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.11173.1642503249955603272
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 02:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pLAUkrnJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id u15so24034347ple.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 02:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=NRjj57V7GUnoMoLJLLr1zcYx9J6MRYq+AmCdXeoOqXs=;
        b=pLAUkrnJZiMKYkdgQnn69bbHS7bH6KOQszH3h1I882PsQ6k/Wth54qCKgEQ8JrhuWc
         uliIrGz6fFwzDfFOxq9DeVfDQLfQ6kjby3BbCj+5/JmnmLS9TkixSLES3MPG/IxsxC47
         kwnlLe8vuLsppUA3pLzaFt3PbtwuSwdMq2y3GyqSFCr9e8gEGoUJXEcTmek71HDcLLnK
         UwLJvZD1e9D1HhFWyNRfa8ELR06/5+TyA1Lq5bOuhC9NS32kdIPVdBah0a9Hcls6ZrHH
         vGtVJ54MESbWLhjQ5+zKP5WKkjBsftI7vC5NuSxt/LHSxqlDwXqI0pynNA/lndfgQCVh
         e4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NRjj57V7GUnoMoLJLLr1zcYx9J6MRYq+AmCdXeoOqXs=;
        b=6VZ4kK/DPgisublUI8jKQwE2a1L330JIThd01slpLpnEHKmvldM4GLG8tmP2xvweCE
         4v6KZg8p49mef0pWarDtYK5hd6Q1WFd99OC9ceAx5XEQw+Bku+M29LP+oOdPsJnM5e+J
         iAhgDwoB8Xv4u34Go5HEJqfbF7sRksmoNTsCe9YOfbYtzP+HyKq+r1w8fnNTtyZKl/OZ
         HVGZIuEr6flE2aGZzPtdFWgCP3TpMlbhKD3nGwY6IVLbjo/3wXqZvI6V3lRtHspd4NaM
         GV118B531Ors+G3PyKxkaJV9fYqixHYft9600tpEKku9mjKgrSeIXMJ/AReKM6yUCwHe
         pDOg==
X-Gm-Message-State: AOAM5306ENPe5gLD8jDunvewAg0UdWmeufmUzhjBpCoOYCn2/urI3Vxq
	lPZk9D1+/4Czkfglk9ENUjPs3ZxVFc2yYw==
X-Google-Smtp-Source: 
 ABdhPJw5XpBrpoMRN/7w+31rj4klt96dfq0gzhzB1Z+zRrXZbkGpnjY3Ce7hAq62U5q4K88iCUNS7w==
X-Received: by 2002:a17:902:8649:b0:149:f37a:9255 with SMTP id
 y9-20020a170902864900b00149f37a9255mr27459646plt.116.1642503249188;
        Tue, 18 Jan 2022 02:54:09 -0800 (PST)
Received: from localhost.localdomain ([122.170.250.50])
        by smtp.gmail.com with ESMTPSA id
 i63sm9956997pfg.20.2022.01.18.02.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 02:54:08 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: akuster808@gmail.com,
	Virendra Thakur <virendrak@kpit.com>,
	Virendra Thakur <virendra.thakur@kpit.com>
Subject: [meta-networking][dunfell][PATCH v3] strongswan: Fix for
 CVE-2021-41990 and CVE-2021-41991
Date: Tue, 18 Jan 2022 16:23:55 +0530
Message-Id: <20220118105355.8551-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jan 2022 10:54:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94914

From: Virendra Thakur <virendrak@kpit.com>

Add patch to fix CVE-2021-41990 and CVE-2021-41991

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
Signed-off-by: virendra thakur <thakur.virendra1810@gmail.com>
---
 .../strongswan/files/CVE-2021-41990.patch     | 62 +++++++++++++++++++
 .../strongswan/files/CVE-2021-41991.patch     | 41 ++++++++++++
 .../strongswan/strongswan_5.8.4.bb            |  2 +
 3 files changed, 105 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/files/CVE-2021-41990.patch
 create mode 100644 meta-networking/recipes-support/strongswan/files/CVE-2021-41991.patch

diff --git a/meta-networking/recipes-support/strongswan/files/CVE-2021-41990.patch b/meta-networking/recipes-support/strongswan/files/CVE-2021-41990.patch
new file mode 100644
index 000000000..b7118ba1f
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/CVE-2021-41990.patch
@@ -0,0 +1,62 @@
+From 423a5d56274a1d343e0d2107dfc4fbf0df2dcca5 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Tue, 28 Sep 2021 17:52:08 +0200
+Subject: [PATCH] Reject RSASSA-PSS params with negative salt length
+
+The `salt_len` member in the struct is of type `ssize_t` because we use
+negative values for special automatic salt lengths when generating
+signatures.
+
+Not checking this could lead to an integer overflow.  The value is assigned
+to the `len` field of a chunk (`size_t`), which is further used in
+calculations to check the padding structure and (if that is passed by a
+matching crafted signature value) eventually a memcpy() that will result
+in a segmentation fault.
+
+Fixes: a22316520b91 ("signature-params: Add functions to parse/build ASN.1 RSASSA-PSS params")
+Fixes: 7d6b81648b2d ("gmp: Add support for RSASSA-PSS signature verification")
+Fixes: CVE-2021-41990
+
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2021-41990]
+CVE: CVE-2021-41990
+
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+---
+ src/libstrongswan/credentials/keys/signature_params.c | 6 +++++-
+ src/libstrongswan/plugins/gmp/gmp_rsa_public_key.c    | 2 +-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/libstrongswan/credentials/keys/signature_params.c b/src/libstrongswan/credentials/keys/signature_params.c
+index d89bd2c96bb5..837de8443d43 100644
+--- a/src/libstrongswan/credentials/keys/signature_params.c
++++ b/src/libstrongswan/credentials/keys/signature_params.c
+@@ -322,7 +322,11 @@ bool rsa_pss_params_parse(chunk_t asn1, int level0, rsa_pss_params_t *params)
+ 			case RSASSA_PSS_PARAMS_SALT_LEN:
+ 				if (object.len)
+ 				{
+-					params->salt_len = (size_t)asn1_parse_integer_uint64(object);
++					params->salt_len = (ssize_t)asn1_parse_integer_uint64(object);
++					if (params->salt_len < 0)
++					{
++						goto end;
++					}
+ 				}
+ 				break;
+ 			case RSASSA_PSS_PARAMS_TRAILER:
+diff --git a/src/libstrongswan/plugins/gmp/gmp_rsa_public_key.c b/src/libstrongswan/plugins/gmp/gmp_rsa_public_key.c
+index f9bd1d314dec..3a775090883e 100644
+--- a/src/libstrongswan/plugins/gmp/gmp_rsa_public_key.c
++++ b/src/libstrongswan/plugins/gmp/gmp_rsa_public_key.c
+@@ -168,7 +168,7 @@ static bool verify_emsa_pss_signature(private_gmp_rsa_public_key_t *this,
+ 	int i;
+ 	bool success = FALSE;
+ 
+-	if (!params)
++	if (!params || params->salt_len < 0)
+ 	{
+ 		return FALSE;
+ 	}
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/strongswan/files/CVE-2021-41991.patch b/meta-networking/recipes-support/strongswan/files/CVE-2021-41991.patch
new file mode 100644
index 000000000..2d898fa5c
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/CVE-2021-41991.patch
@@ -0,0 +1,41 @@
+From b667237b3a84f601ef5a707ce8eb861c3a5002d3 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Tue, 28 Sep 2021 19:38:22 +0200
+Subject: [PATCH] cert-cache: Prevent crash due to integer overflow/sign change
+
+random() allocates values in the range [0, RAND_MAX], with RAND_MAX usually
+equaling INT_MAX = 2^31-1.  Previously, values between 0 and 31 were added
+directly to that offset before applying`% CACHE_SIZE` to get an index into
+the cache array.  If the random value was very high, this resulted in an
+integer overflow and a negative index value and, therefore, an out-of-bounds
+access of the array and in turn dereferencing invalid pointers when trying
+to acquire the read lock.  This most likely results in a segmentation fault.
+
+Fixes: 764e8b2211ce ("reimplemented certificate cache")
+Fixes: CVE-2021-41991
+
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2021-41991]
+CVE: CVE-2021-41991
+
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+---
+ src/libstrongswan/credentials/sets/cert_cache.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libstrongswan/credentials/sets/cert_cache.c b/src/libstrongswan/credentials/sets/cert_cache.c
+index f1579c60a9bc..ceebb3843725 100644
+--- a/src/libstrongswan/credentials/sets/cert_cache.c
++++ b/src/libstrongswan/credentials/sets/cert_cache.c
+@@ -151,7 +151,7 @@ static void cache(private_cert_cache_t *this,
+ 	for (try = 0; try < REPLACE_TRIES; try++)
+ 	{
+ 		/* replace a random relation */
+-		offset = random();
++		offset = random() % CACHE_SIZE;
+ 		for (i = 0; i < CACHE_SIZE; i++)
+ 		{
+ 			rel = &this->relations[(i + offset) % CACHE_SIZE];
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
index 8a8809243..b45b8074c 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
@@ -11,6 +11,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://fix-funtion-parameter.patch \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
            file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch \
+           file://CVE-2021-41990.patch \
+           file://CVE-2021-41991.patch \
            "
 
 SRC_URI[md5sum] = "0634e7f40591bd3f6770e583c3f27d29"
-- 
2.17.1


