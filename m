Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550A3C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 16:14:47 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.12434.1664468084762098240
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 09:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=UaTEn9Ld;
 spf=pass (domain: qtec.com, ip: 209.85.208.50, mailfrom: daniel@qtec.com)
Received: by mail-ed1-f50.google.com with SMTP id y100so2145741ede.6
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Sep 2022 09:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=9NTOc9oITWFJiH8mDNaKKBAfFAij2i1nQGGJC5cYGbk=;
        b=UaTEn9LdML5UYHqolGLtEG1/LhIUVAybCpUSDTdlLdDUXDBfoZ7eckPiD5Yx07uKrW
         VIWH1PCIJASpanwoAmCY2JEpSxjPcfIXUCcq8e1M3ZszSyBK6F3EobsZ4bqNOBRN7Aj0
         yVPkrAnpqPDCBdb/39ivv++BI4EpkuqGevx+v57QbaO5G+E33xVetKn7Ja0/PlfgROBc
         QDFgV1Yv0mUfosbtUEDuYAdomq/MjaKM4vgAVjFnV59TH+45Z06U7sgxUtI6tv0z5lkx
         mgQyCkMYSjiGax9O3s8mmsUNAgiXasltd//kg83r8z8jp/MEV0U3zqMedcLwRESMSRPU
         d/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=9NTOc9oITWFJiH8mDNaKKBAfFAij2i1nQGGJC5cYGbk=;
        b=TTxtGrqz8WV6Ab1/pquiJXmNePYZRyE2tZc6lqtbKMhI9KVaGJYFhixI7vR2uMSRpZ
         P4S+MNeUFTCG7t/svaWYs0AIQaC36yxj71nt68tXkTTva8OiLm7AhMp1RC1Kv7g8aiUU
         5cF7UA7ctzmGldCJbIhmrNc/07Ge/RhSZvKQHcq7wDyRChvLBlw0zaMBgqpnTdxtm0kq
         2vKD6V/0OFmAFtm1BhDmrNUstDt67ihb2I+scD12c0QiMw09VEGi3SSexCtCXBzJBNrw
         QZZQ3DxLc98sUjYU9fDKDKCtHlhgWo7AEj2PlQuAAF86LGtMZcAYYngri2vBp/Qr3ijh
         rljg==
X-Gm-Message-State: ACrzQf2NWHYem4nH/kaww4t0jJX/8TqLkqylA31XlJuWalWJX3FrG67+
	9Hkn4vAmZueEmlK/QRrRs3eKT4CsvqlIgrVUY4Baz2qnKe5XZSzmuhYUz5rdngZY+0GXYGEEf5J
	3Q84yn4anL5K9t9M7+95zoRI6x3eFOHEN0g3RiUo43oucxBD7DUlvhuehU2e26B3AdEBDqHQlq9
	hk1PkO29rfjVGzpiQF
X-Google-Smtp-Source: 
 AMsMyM7yMKmCNfrHpXvfifEKVdl7+klc1ns4tnEkPajnRAk7KR0vzr8BUqXXZrqL3VogdiTtLiKrGw==
X-Received: by 2002:a05:6402:2711:b0:451:327a:365f with SMTP id
 y17-20020a056402271100b00451327a365fmr3976415edd.315.1664468083077;
        Thu, 29 Sep 2022 09:14:43 -0700 (PDT)
Received: from datops.qtec.com (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net.
 [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id
 17-20020a170906311100b00780f6071b5dsm4158382ejx.188.2022.09.29.09.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 09:14:42 -0700 (PDT)
From: Daniel Gomez <daniel@qtec.com>
To: openembedded-devel@lists.openembedded.org
Cc: dagmcr@gmail.com,
	Daniel Gomez <daniel@qtec.com>
Subject: [meta-oe][PATCH 1/3] libftdi: Add ftdi-eeprom support
Date: Thu, 29 Sep 2022 18:14:34 +0200
Message-Id: <20220929161436.64661-1-daniel@qtec.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Sep 2022 16:14:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99009

Add ftdi-eeprom support. Note: Prepend ftdi-eeprom PACKAGE to avoid
ftdi_eeprom to be installed in the default PN package.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 meta-oe/recipes-support/libftdi/libftdi_1.5.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
index b03a0c7f4..bc5897413 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
@@ -20,14 +20,16 @@ inherit cmake binconfig pkgconfig python3native
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[cpp-wrapper] = "-DFTDI_BUILD_CPP=on -DFTDIPP=on,-DFTDI_BUILD_CPP=off -DFTDIPP=off,boost"
+PACKAGECONFIG[ftdi-eeprom] = "-DFTDI_EEPROM=on,-DFTDI_EEPROM=off,libconfuse"
 
-EXTRA_OECMAKE = "-DSTATICLIBS=off -DEXAMPLES=off -DFTDI_EEPROM=off \
+EXTRA_OECMAKE = "-DSTATICLIBS=off -DEXAMPLES=off \
                  -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
                  -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so \
                  -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-PACKAGES += "${PN}-python"
+PACKAGES =+ "${PN}-python ftdi-eeprom"
 
+FILES:ftdi-eeprom = "${bindir}/ftdi_eeprom"
 FILES:${PN}-python = "${libdir}/${PYTHON_DIR}/site-packages/"
-- 
2.35.1


