Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.1343.1610499711568449448
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Jan 2021 17:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=epB8U+Om;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id g15so364858pgu.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Jan 2021 17:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=3tLtyv3iCWeF2UWcCJfKHEc2oW/zQ71Tw4IZwHnENi8=;
        b=epB8U+OmZgX5CsKKfPTsHEPChCwtduTZE+uQtH6QghfQS2shfF7IwWvcKEVtFBtV20
         gwhyx+db5IkNWCRvvhRkofHPYJbdVq8UiQGSCfqMKbI8dtg3beQhWdBD3DuReTREJn9u
         RcNzTgRuML/RT7g4Kc9h0xg5xO1fRCtXmTEM3YmXJ1BXQpFREc/vBZcq5jEIIDU7uzn6
         L4nO79xwHIz2z6XthWL/DstNYCTXQKsRV1+T1AKlGKSVrMauaXWiaxkNBN2Az6Cd5RhT
         4U2stZSKLvKu1ZRI+OH63VyFtU3FpnAzFw3obAEY3BkLW+koLZyBTUnCB0gYIdEXXDgZ
         PtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3tLtyv3iCWeF2UWcCJfKHEc2oW/zQ71Tw4IZwHnENi8=;
        b=saTEiDz7k5iXQ9uu6dxlg9anwYrS4vKfMvMLXYrpgz7aWzVEGeN7SNz1zHwjsfoGoM
         0jxHrR0rEAEopQBK/Xo/T2iRfOVDfEzIR1SaDbLYTh5aw2Oh9klVztKg0FEKVD8tuFWB
         SH+zbw/sjFjPVBppX/D29LS7iFzKe95b27OXS8fxYLqCFxhV7oU6ObuaFiHaw3RMkUU0
         Hq+SfmFUMPWhSrrL4mJtDpeokdvaX+fSlVTiYiuXlqWNt6hPMXpV+FQI8MRq4jRclvd6
         fGH/DEqURC7VEqnU4GaXCTgK/cYYxWXMoPVWZaRhAFemqzZA0HOnEttz+HklEkt+i1uK
         HKgg==
X-Gm-Message-State: AOAM531qjLNjt3AJnZmDwNTwNu+QKforS/J9tuJ3CBe7eOTKSNMUQMJO
	aOk9k59WqNbcZt/zmTfsrU9dfCOWq7bsPg==
X-Google-Smtp-Source: ABdhPJyL/s29R1U7IrHXlnoZCEYPNfvS0/+vPl/BMZMsYxxkp/TjCfEmA0izGHf66z+XjAPOaMTOsg==
X-Received: by 2002:a65:5283:: with SMTP id y3mr1787671pgp.174.1610499710659;
        Tue, 12 Jan 2021 17:01:50 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:2960:99d5:cba5:7114])
        by smtp.gmail.com with ESMTPSA id b1sm247502pjh.54.2021.01.12.17.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 17:01:50 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][dunfell][PATCH] nss: Security fix CVE-2020-12401
Date: Tue, 12 Jan 2021 17:01:48 -0800
Message-Id: <20210113010148.29047-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Armin Kuster <akuster@mvista.com>

Source: Mozilla.org
MR: 106876
Type: Security Fix
Disposition: Backport from https://hg.mozilla.org/projects/nss/raw-rev/aeb2e583ee957a699d949009c7ba37af76515c20
ChangeID: a61d4926f8ab5afc54c23e58cd86b4a7609c9708
Description:

Fixes CVE-2020-12401

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nss/nss/CVE-2020-12401.patch              | 52 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb     |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2020-12401.patch

diff --git a/meta-oe/recipes-support/nss/nss/CVE-2020-12401.patch b/meta-oe/recipes-support/nss/nss/CVE-2020-12401.patch
new file mode 100644
index 0000000000..e67926fe50
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/CVE-2020-12401.patch
@@ -0,0 +1,52 @@
+# HG changeset patch
+# User Billy Brumley <bbrumley@gmail.com>
+# Date 1595283525 0
+# Node ID aeb2e583ee957a699d949009c7ba37af76515c20
+# Parent  ca207655b4b7cb1d3a5e438c1fb9b90d45596da6
+Bug 1631573: Remove unnecessary scalar padding in ec.c r=kjacobs,bbeurdouche
+
+Subsequent calls to ECPoints_mul and ECPoint_mul remove this padding.
+
+Timing attack countermeasures are now applied more generally deeper in
+the call stack.
+
+Differential Revision: https://phabricator.services.mozilla.com/D82011
+
+
+Upstream-Status: Backport
+
+CVE: CVE-2020-1240
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: nss-3.51.1/nss/lib/freebl/ec.c
+===================================================================
+--- nss-3.51.1.orig/nss/lib/freebl/ec.c
++++ nss-3.51.1/nss/lib/freebl/ec.c
+@@ -724,27 +724,6 @@ ECDSA_SignDigestWithSeed(ECPrivateKey *k
+     }
+ 
+     /*
+-    ** We do not want timing information to leak the length of k,
+-    ** so we compute k*G using an equivalent scalar of fixed
+-    ** bit-length.
+-    ** Fix based on patch for ECDSA timing attack in the paper
+-    ** by Billy Bob Brumley and Nicola Tuveri at
+-    **   http://eprint.iacr.org/2011/232
+-    **
+-    ** How do we convert k to a value of a fixed bit-length?
+-    ** k starts off as an integer satisfying 0 <= k < n.  Hence,
+-    ** n <= k+n < 2n, which means k+n has either the same number
+-    ** of bits as n or one more bit than n.  If k+n has the same
+-    ** number of bits as n, the second addition ensures that the
+-    ** final value has exactly one more bit than n.  Thus, we
+-    ** always end up with a value that exactly one more bit than n.
+-    */
+-    CHECK_MPI_OK(mp_add(&k, &n, &k));
+-    if (mpl_significant_bits(&k) <= mpl_significant_bits(&n)) {
+-        CHECK_MPI_OK(mp_add(&k, &n, &k));
+-    }
+-
+-    /*
+     ** ANSI X9.62, Section 5.3.2, Step 2
+     **
+     ** Compute kG
diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
index c00bd34cb2..3e3c3a3fdf 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://riscv.patch \
            file://0001-Enable-uint128-on-mips64.patch \
            file://0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch \
+           file://CVE-2020-12401.patch \
            "
 
 SRC_URI[md5sum] = "6acaf1ddff69306ae30a908881c6f233"
-- 
2.17.1

