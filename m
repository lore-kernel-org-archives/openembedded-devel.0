Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46852C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:42:07 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4176.1790160118979077571
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UBHsfJXc;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f20513so446251b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160118; x=1790764918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSMeNgG9DxaVhfWLsx1U9cv/Qx1zpuE5IVasfU0Nn6g=;
        b=UBHsfJXcavCl5w7h8olPPOexyNrAFL0SFyEJxZDkgAR5hwzA+8h2JscOaipfLCpF38
         +bXAv/LYb8E88yI26iOvP9LFmZybQcbVA4KldsfLNfU8pw5kR0aTqBp1uw5KKUtzC8h9
         2Hpx4w+Y7fNyd/0sPHgyN69fhI5IB4WSOT13BncL7k6V8OJa94LTKsxY6537mDEKSqCW
         PaxRbtAhFO98SOKA2YsCuK1lhFnFyfZlvZNrhslV5Zzf881WDlY+jqWVVJiWQdoD4iAQ
         42Uvc6bnfjbGQ6fxeLwyVPGTZOjiMh3CGRNRrd4iYo6oBTX2w9zgpyOP1qMZurDCLf5Z
         fbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160118; x=1790764918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TSMeNgG9DxaVhfWLsx1U9cv/Qx1zpuE5IVasfU0Nn6g=;
        b=yw712Hnyxwg1l8venclmiNjGiAqRq/Xg060lF+ZWDQB3q3AbTbZn7p9+lzbaTlymPa
         uwsL4sL73KQzU2Nk7W5fk/T/2n7/RlnBYGvgC2wdADUaf2Bu+Jod8swPkMax6XJeOBxO
         SwDlun+kgziGpBNxAD9WznacH4IziavVJ6AcHsVIEh3i7EXh+Vh91MzF/6o+KqCqIbSR
         c/bzYD6a6mJ4H9ZJaGNYIsI1vNzV/jn8O+QtwIpLF7vk9OGKM9NNfUNo/TOTutDD47J8
         6dEmE7WaC7AmTbaRPqUQZ3bAMBGaZUdHxrbkJroc0Zg73sebzYbX1lYevw6udIz+HbQ1
         X0Ng==
X-Gm-Message-State: AFuF++lvxpgbiIYZFUnmPzw6CDpTeIvX7+FQ0t/wHQgR0ohnVBgxVmri
	AIrzI/FAwQJLm5XmsvD+Znx0UF9AA0BuPzMsUM4IEXAo3PhJ56PKKJqDMZsnmg==
X-Gm-Gg: AYBFou0n7/+UuEDDWYcMCkHC5md5Z/dvZbK9PS6bt3g1Xq1drR0kzZjjDe8ecyG6xUb
	02uBRFOWJ23ed/d16FfEXJ/TkBnBfX3QuvUqYjeg4QYZANl17VHqSJ725ei1hGBWoedXolIVsp7
	ImmO1q6ORFh2DRrYp0L8VuN2hHAiY5xyKXCg2pRfmyCYWQHauFHBda+CVGQE2tgHg9v/mEirb0b
	zPw9qbr8BvP1iZnNpwhGlU9aVVfqRhKWJKeZc/w9M5P7prCaJdSwY1lgOYFd0nTfLCpYlEtMok2
	+hHdQh/YDQs+pb3rX8QDlEfkud9+Tl0up+pVC5vg3+91vGPFWf8CgR+73vJHTo+mbThHydPF8mA
	gql1P9G4AMgiPhKbGzsqoPXLr3Qn253eyMwAIJpk3pCaCP7dvlNF2D9yrN63gZjmI1h/vLOqtnL
	ig0TuLSp59jpXCt0gR0BwbCcPCKKPaNyGY8YNTR/YlNzwVIrtc3dnQTy0O2gl3QktSfae/+oFPP
	CEm/Ozlj0loKMwvIAZM/zo=
X-Received: by 2002:a05:6a00:2e25:b0:87d:fa7:87c7 with SMTP id d2e1a72fcca58-87d1b6a9ebamr1916817b3a.25.1790160118368;
        Wed, 23 Sep 2026 03:41:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:58 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 28/42] ldns: correct CVE_PRODUCT mapping
Date: Wed, 23 Sep 2026 22:40:42 +1200
Message-ID: <20260923104056.457360-28-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130215

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping generates a vendor-wildcard CPE.
nlnetlabs:ldns is the active NVD dictionary CPE and configuration
identity for the packaged NLnet Labs source.

This changes the generated product identity to an exact CPE, but the
frozen sbom-cve-check database leaves the eight-entry CVE report
unchanged, with no current CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit fe530d55ef61d61e8620c45c96c0abe009d595b2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb b/meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb
index 8b3b9bd9de..6e50cc2b1e 100644
--- a/meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb
+++ b/meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34330f15b2b4abbbaaa7623f79a6a019"
 SRC_URI = "https://www.nlnetlabs.nl/downloads/ldns/ldns-${PV}.tar.gz"
 SRC_URI[sha256sum] = "b524fa21994b6e834200ceb8c27f1b84bda5982fe35706f058196c079db94d5d"
 
+CVE_PRODUCT = "nlnetlabs:ldns"
+
 DEPENDS = "openssl"
 
 inherit autotools-brokensep

