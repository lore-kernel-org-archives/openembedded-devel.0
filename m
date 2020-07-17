Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.13583.1594999264502553729
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jul 2020 08:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o0i309Pa;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id e90so7144390ote.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2020 08:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=sC4v/WGjx4MjayZoa0K4ZTVjvDKYAvsZbl0csfA0+ng=;
        b=o0i309Pa0P4ew5+8WDJbhh9JjehSHCScAJrtqGz3T1a1zwE+l+g+9o7wVHfkUz0k7l
         aVnYjvTtdZvngpAoDWhyo8vyMmoxLWaWKY/IIsqmtrvm1mmLFbpUiYAqKcIGkaIaThWG
         /naydrO4BUmJQ580QxhSBzDHWyEazwpTmQ3aO8OXmbO/KU0zjjGHjfbo2Wx+W3/60xTn
         tS1DiM/+cvaOFrJ073Qilb8LII+X+UdfmBhBQGaS2sqhhcU/0MOWsbGi/cMGIXqb6DiN
         7Ne1nbF/A4A48kmgwjk9EMuHylhxDaXRsgVckXTPlt4pTplAni2AyYEvjZbj3KeQD9gu
         wgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=sC4v/WGjx4MjayZoa0K4ZTVjvDKYAvsZbl0csfA0+ng=;
        b=Gh6Mh9wHHY5ae/DI0reM6IzfmTCvKYF/93phJc8j5vkOFZwE0fz6rRdtueWK6qVU7k
         yk1CS4ubhvKJEAFRVP999MIjQR0lzmBwyBJW+Tv6hPOPIMF5ns6quk/tqqNhFt+fXyIZ
         rTzqIi/q12i+TOkMd7oS5p1uqD8QY3YyOazQieeGm2jA4ky8gIGxLPIVvblAi1UVzt2t
         Gf1tUklWmms2UayvGvbVpDiIbwOBVBiT6ZW5Wvku4WY33W7YdiuT7jdNn1lv6KCoaN8O
         432RGUWakHLtCDmBVMeUKvHT1/XL7oEkmqHbLuUU0Awd5ZhrxAnT2EWkU8OQf7hl6xRE
         EFJQ==
X-Gm-Message-State: AOAM533Uz9b8aNsf2CayP07HXXBOBvILgdisX9O87rkZjeYmu7isGmMg
	vI8bw1D1IX+EOsP+Xosgh7c4/1eEMvQ=
X-Google-Smtp-Source: ABdhPJw/ti+ZWRGjKlh7lV8+8jg3SBoBtEhX6X5/nAp33jNkKXYlwHjBelr5yO0EgKMc+RsAutbv5A==
X-Received: by 2002:a05:6830:1f22:: with SMTP id e2mr8913676oth.62.1594999263523;
        Fri, 17 Jul 2020 08:21:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:b082:650f:a46e:c68d])
        by smtp.gmail.com with ESMTPSA id k126sm1868439oib.52.2020.07.17.08.21.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 08:21:03 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 2/2] nss: Fix CVE-2020-12399
Date: Fri, 17 Jul 2020 08:20:55 -0700
Message-Id: <5d4023848fabc2e0bf924b2f8def06f450d15ec0.1594999160.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594999160.git.akuster808@gmail.com>
References: <cover.1594999160.git.akuster808@gmail.com>

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Master (nss version 3.54) is not affected by this issue. This is a backport
from nss version 3.54.

NSS has shown timing differences when performing DSA signatures, which was
exploitable and could eventually leak private keys. This vulnerability affects
Thunderbird < 68.9.0, Firefox < 77, and Firefox ESR < 68.9.

Upstream patch:
https://hg.mozilla.org/projects/nss/rev/daa823a4a29bcef0fec33a379ec83857429aea2e

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...e-a-fixed-length-for-DSA-exponentiat.patch | 110 ++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb     |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch

diff --git a/meta-oe/recipes-support/nss/nss/0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch b/meta-oe/recipes-support/nss/nss/0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch
new file mode 100644
index 0000000000..517c277ae0
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch
@@ -0,0 +1,110 @@
+From 5942c26888ba12ad5e0d92fb62f23d7cde6dc159 Mon Sep 17 00:00:00 2001
+From: Ovidiu Panait <ovidiu.panait@windriver.com>
+Date: Mon, 13 Jul 2020 06:25:56 +0000
+Subject: [PATCH] Bug 1631576 - Force a fixed length for DSA exponentiation
+ r=pereida,bbrumley
+
+Differential Revision: https://phabricator.services.mozilla.com/D72011
+
+Upstream-Status: Backport [https://hg.mozilla.org/projects/nss/rev/daa823a4a29bcef0fec33a379ec83857429aea2e]
+
+Authored-by: Robert Relyea <rrelyea@redhat.com>
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ nss/lib/freebl/dsa.c | 45 ++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 35 insertions(+), 10 deletions(-)
+
+diff --git a/nss/lib/freebl/dsa.c b/nss/lib/freebl/dsa.c
+index aef3539..389c9de 100644
+--- a/nss/lib/freebl/dsa.c
++++ b/nss/lib/freebl/dsa.c
+@@ -313,13 +313,14 @@ DSA_NewKeyFromSeed(const PQGParams *params,
+ 
+ static SECStatus
+ dsa_SignDigest(DSAPrivateKey *key, SECItem *signature, const SECItem *digest,
+-               const unsigned char *kb)
++               const unsigned char *kbytes)
+ {
+     mp_int p, q, g; /* PQG parameters */
+     mp_int x, k;    /* private key & pseudo-random integer */
+     mp_int r, s;    /* tuple (r, s) is signature) */
+     mp_int t;       /* holding tmp values */
+     mp_int ar;      /* holding blinding values */
++    mp_digit fuzz;  /* blinding multiplier for q */
+     mp_err err = MP_OKAY;
+     SECStatus rv = SECSuccess;
+     unsigned int dsa_subprime_len, dsa_signature_len, offset;
+@@ -373,6 +374,7 @@ dsa_SignDigest(DSAPrivateKey *key, SECItem *signature, const SECItem *digest,
+     CHECK_MPI_OK(mp_init(&s));
+     CHECK_MPI_OK(mp_init(&t));
+     CHECK_MPI_OK(mp_init(&ar));
++
+     /*
+     ** Convert stored PQG and private key into MPI integers.
+     */
+@@ -380,14 +382,28 @@ dsa_SignDigest(DSAPrivateKey *key, SECItem *signature, const SECItem *digest,
+     SECITEM_TO_MPINT(key->params.subPrime, &q);
+     SECITEM_TO_MPINT(key->params.base, &g);
+     SECITEM_TO_MPINT(key->privateValue, &x);
+-    OCTETS_TO_MPINT(kb, &k, dsa_subprime_len);
++    OCTETS_TO_MPINT(kbytes, &k, dsa_subprime_len);
++
++    /* k blinding  create a single value that has the high bit set in
++     * the mp_digit*/
++    if (RNG_GenerateGlobalRandomBytes(&fuzz, sizeof(mp_digit)) != SECSuccess) {
++        PORT_SetError(SEC_ERROR_NEED_RANDOM);
++        rv = SECFailure;
++        goto cleanup;
++    }
++    fuzz |= 1ULL << ((sizeof(mp_digit) * PR_BITS_PER_BYTE - 1));
+     /*
+     ** FIPS 186-1, Section 5, Step 1
+     **
+     ** r = (g**k mod p) mod q
+     */
+-    CHECK_MPI_OK(mp_exptmod(&g, &k, &p, &r)); /* r = g**k mod p */
+-    CHECK_MPI_OK(mp_mod(&r, &q, &r));         /* r = r mod q    */
++    CHECK_MPI_OK(mp_mul_d(&q, fuzz, &t)); /* t = q*fuzz */
++    CHECK_MPI_OK(mp_add(&k, &t, &t));     /* t = k+q*fuzz */
++    /* length of t is now fixed, bits in k have been blinded */
++    CHECK_MPI_OK(mp_exptmod(&g, &t, &p, &r)); /* r = g**t mod p */
++    /* r is now g**(k+q*fuzz) == g**k mod p */
++    CHECK_MPI_OK(mp_mod(&r, &q, &r)); /* r = r mod q    */
++
+     /*
+     ** FIPS 186-1, Section 5, Step 2
+     **
+@@ -411,15 +427,24 @@ dsa_SignDigest(DSAPrivateKey *key, SECItem *signature, const SECItem *digest,
+     /* Using mp_invmod on k directly would leak bits from k. */
+     CHECK_MPI_OK(mp_mul(&k, &ar, &k));       /* k = k * ar */
+     CHECK_MPI_OK(mp_mulmod(&k, &t, &q, &k)); /* k = k * t mod q */
+-    CHECK_MPI_OK(mp_invmod(&k, &q, &k));     /* k = k**-1 mod q */
++    /* k is now k*t*ar */
++    CHECK_MPI_OK(mp_invmod(&k, &q, &k)); /* k = k**-1 mod q */
++    /* k is now (k*t*ar)**-1 */
+     CHECK_MPI_OK(mp_mulmod(&k, &t, &q, &k)); /* k = k * t mod q */
+-    SECITEM_TO_MPINT(localDigest, &s);       /* s = HASH(M)     */
++    /* k is now (k*ar)**-1 */
++    SECITEM_TO_MPINT(localDigest, &s); /* s = HASH(M)     */
+     /* To avoid leaking secret bits here the addition is blinded. */
+-    CHECK_MPI_OK(mp_mul(&x, &ar, &x));        /* x = x * ar */
+-    CHECK_MPI_OK(mp_mulmod(&x, &r, &q, &x));  /* x = x * r mod q */
++    CHECK_MPI_OK(mp_mul(&x, &ar, &x)); /* x = x * ar */
++    /* x is now x*ar */
++    CHECK_MPI_OK(mp_mulmod(&x, &r, &q, &x)); /* x = x * r mod q */
++    /* x is now x*r*ar */
+     CHECK_MPI_OK(mp_mulmod(&s, &ar, &q, &t)); /* t = s * ar mod q */
+-    CHECK_MPI_OK(mp_add(&t, &x, &s));         /* s = t + x */
+-    CHECK_MPI_OK(mp_mulmod(&s, &k, &q, &s));  /* s = s * k mod q */
++    /* t is now hash(M)*ar */
++    CHECK_MPI_OK(mp_add(&t, &x, &s)); /* s = t + x */
++    /* s is now (HASH(M)+x*r)*ar */
++    CHECK_MPI_OK(mp_mulmod(&s, &k, &q, &s)); /* s = s * k mod q */
++    /* s is now (HASH(M)+x*r)*ar*(k*ar)**-1 = (k**-1)*(HASH(M)+x*r) */
++
+     /*
+     ** verify r != 0 and s != 0
+     ** mentioned as optional in FIPS 186-1.
+-- 
+2.18.1
+
diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
index 36e6cd8fc5..c00bd34cb2 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            file://riscv.patch \
            file://0001-Enable-uint128-on-mips64.patch \
+           file://0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch \
            "
 
 SRC_URI[md5sum] = "6acaf1ddff69306ae30a908881c6f233"
-- 
2.17.1

