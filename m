Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.21235.1610905610339407482
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qxbEYddV;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id o20so412058pfu.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=3tLtyv3iCWeF2UWcCJfKHEc2oW/zQ71Tw4IZwHnENi8=;
        b=qxbEYddVX+x9MdnPApjnaDuT3BCN5kkHzLq5PBov5ppuYagjSDwjwTdqS14Lj3LINb
         N1h8xuW08NUAYFGcmI24AxfKl75XHbUhDJ/OY2vFCE3DcLkqwDhVZZkciTMLQNsOPEee
         V8jNQRw6/i+QZGFJ42SxO4Z6LyNR8dDRuKICyaHC+TNRqNhI8jMJ4gXOGInlzQFssaD5
         f+/Nbmo7vkR1RVfvZeycOmoCMs3QjrsJYuuGpcdiHkj1pZIoBrgCwhWyusW/vlg5tNnh
         iRmrNjIgLo7Xx8UBLxrmc6iliAN+TwXBo0YVp69M4aUkweIzLZkmHouk2hJA4SuFjD0J
         nG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=3tLtyv3iCWeF2UWcCJfKHEc2oW/zQ71Tw4IZwHnENi8=;
        b=iCqbstV0anxKRs417asuh2KR++Nlmz+rCx/ZWmXbnhAh9NPJU3scoIW8DyJpjBjQRa
         aWDR0kbYmM80IJMZfaHXKh/IGerbT+35L1GWSrkFOgY69Iq2bSkpz4Q2eVdqdWb5Zt3I
         1Zv/qasS6j57FYhuHYXd315K78EHfsag8hyqKD7zlhPjX6q9db/y1LixiNop27yVmvLg
         NrNm62esBTG258QyzPDUtUOkRr9NOiQaIV30aS9rBTcUzKOpMGeNHJd5bwzNsD7ZuhMJ
         EQxcXWfFcinWHZIFiYzr8FPHZhsnfv9OkPZmliTa+D3B+9j4IqWVOWOdYOtKy8nMlD4a
         kyRA==
X-Gm-Message-State: AOAM533qMXdjas4obwxbZrIjirgQKfxwJl2ji5hZ1/bekdkjX5AfVDH3
	4FIMPmUh9fJMvLU7b3m1PstN5d41qmz1vg==
X-Google-Smtp-Source: ABdhPJwn4sEFG6NqBrcXxaHwB+6i+gBj7SIf69QYPlJUtjXqEqauibyBVfnuhWpGdZCktVPP2Z0cpg==
X-Received: by 2002:a63:2fc5:: with SMTP id v188mr22186398pgv.243.1610905609748;
        Sun, 17 Jan 2021 09:46:49 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:49 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 18/28] nss: Security fix CVE-2020-12401
Date: Sun, 17 Jan 2021 09:46:16 -0800
Message-Id: <7b55e1ec32ae91faacfa855d10f871e2ccab187c.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

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

