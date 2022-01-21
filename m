Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF70BC433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 04:16:50 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.7568.1642738607336804894
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jan 2022 20:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QPrdu2YA;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id f13so7334909plg.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jan 2022 20:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=90lVqaV+UmSqr43UQuAIPE9Gyj0iYhNLc7T5b4/KsBo=;
        b=QPrdu2YAJerKTr/L4RqU8Qse54bPACxNKnw0VeTfRfy959cVyC5epkcl1TdsGVbmqp
         jrzhTXyqnkprpXDnlWoy6TXdIcCjbUliWD3U9HGMyDuElApH3hZLcmuKKnOJQP8OM5TA
         bDmkQ6pkrtO9QL26iMSKXrpOQQKLi6c4Qw5gp5uAT+/4UIGsvr8Q5n+bFrTV2vt/I9/G
         6nCl55vg7tueTshc5qY3jqdlhpnHk771NnmhwlUQG/vFdbXksYzF5+QdomqmntdG+AAd
         tlqHxGFvuqVpeX01VH0u9UTqY48KUxmDOSOX/zpKfBbaDt9Xw7aBlcVoCuyWZGnMvT1D
         mX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=90lVqaV+UmSqr43UQuAIPE9Gyj0iYhNLc7T5b4/KsBo=;
        b=oOVF0ws5Dira6h5ihUR/9bkcv1xNT/pdC95o+PXrAySO9Oy5fdWSgGFsWyek52qQQb
         k3aOvIBD9CYaQHCQMrsSnXkA4BfklzASddxx7PlhjuzoUusfzIyVCYLZOIfVYAnGmpYH
         FNM1kvfsjVgRrQm1+kuyOWe0iYHWm9oiQ5l82uX/EEgKaIhocSiCl8fSrFsb08I9hMDY
         vimRP9FdXe5B08M/CXCYDeCyxzfsEb9S1iBrsF4R307QBgxgaTlzmI5a9CXweoazjQcR
         5gZma/Yrl0NB/mAVVUxqYuyMp4CCnhGZpEhZUMi0yJSu7goMHl8aHd5996T0GXA4n0us
         Nfxg==
X-Gm-Message-State: AOAM530bx8kEzlRmKKu4AUIDl7zFqhY31ScleiPltlnmIz253edFHwVv
	Cq8sKpCe3nJWQosgTnadup8yEv4duo+RHw==
X-Google-Smtp-Source: 
 ABdhPJwljsmJgH4pDk1cnEg12KjDKJo5av2rPAIjnE3NDzZnnJO+MOgUqAZ9EDY36mgIx2SzB6k20A==
X-Received: by 2002:a17:902:e80c:b0:14b:18a:acbe with SMTP id
 u12-20020a170902e80c00b0014b018aacbemr2126088plg.153.1642738606600;
        Thu, 20 Jan 2022 20:16:46 -0800 (PST)
Received: from localhost.localdomain ([122.170.243.42])
        by smtp.gmail.com with ESMTPSA id
 p4sm5166423pfo.100.2022.01.20.20.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 20:16:46 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: akuster808@gmail.com,
	Virendra Thakur <virendrak@kpit.com>
Subject: [oe][meta-networking][dunfell][PATCH v3] strongswan: Fix for
 CVE-2021-41990 and CVE-2021-41991
Date: Fri, 21 Jan 2022 09:46:24 +0530
Message-Id: <20220121041624.2217-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 04:16:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94964

From: Virendra Thakur <virendrak@kpit.com>

Add patch to fix CVE-2021-41990 and CVE-2021-41991

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


