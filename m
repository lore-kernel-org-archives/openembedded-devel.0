Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CB4C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 11:15:27 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.5695.1641899725862185726
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 03:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oOzGlGkH;
 spf=pass (domain: gmail.com, ip: 209.85.216.53,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 l16-20020a17090a409000b001b2e9628c9cso5202592pjg.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 03:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=9SvRROwo3+s3uEi99qgCeApmdzgNiMDsAj+qcleKNzo=;
        b=oOzGlGkHVCrecDaem4yMEMYCtObf4VisxGBKShUPahOqZscnjfXLMG+REYuZkACE/L
         se2GbozHPROmc6qguxVHwvHccICbGQLK5mMety/lhMdb2GS79RSdRlYwti4Hzc7vI2XU
         Zm87FSoMvVhplUmDUBFNtQ4a5/RDK+IqtPStCbnzlKweMZ65ha4rIqu+DocFn5vsL07v
         N24W/odRJ/8BkG/82N4jQbA78G1IHgnOSqNS4KWYcMzTXnGNv0FbNKeKooeS5Dyhz9UH
         id8wwcImZPrSTEmUenDxrc2P9GDjdgeLI++TiLpuXYGaHcCjJC8SCnnKSVhl5fXyE/mR
         Lyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9SvRROwo3+s3uEi99qgCeApmdzgNiMDsAj+qcleKNzo=;
        b=cxN57ANYN+xcisc64SPIuSMJgnwoRxOysSvazAu0KEDy2CWnCM6F5uIZfQtm/5vfPs
         QQz+4VOiyAvcAnwzXHHVaHotz4EFJRBs8aKWR8M1KzX3cUsCJTJz5t6saKnGpcYbBSpT
         QPHk7vHpqxBhRTOGwcBlLfTbNFgn6atbpWoQeqGo1R5hmVSfpv9ph31L1baYtQQabA1M
         aaw1+5YKtf23waMobo1bsY7DnWKeOpUi1nVSZP3n59Vfk0fOMRnmlGLod4JD+0NqkqvN
         ezsv1XHHeOMsQ1qYFxFMwIU8kvQxfBwC+0TbgB5fhOKSEPV6JwBngxIoQbkv1hBCSHbz
         HMfw==
X-Gm-Message-State: AOAM533CKfQ5P9qzLvey5DCLEZKxMOSo8KAdTwKPtfSL8fFxIVtPiyae
	lbM1i7G0KOtIJFPm7rGlOetq++rKZ9M=
X-Google-Smtp-Source: 
 ABdhPJxkNIi7kGUfe7fwlUU/gRUantbRlDvtfdShSvHknZU0bGOVIreEGaRrgLn3WfBaEpUGWPG4OA==
X-Received: by 2002:a17:90b:390b:: with SMTP id
 ob11mr2564779pjb.66.1641899724914;
        Tue, 11 Jan 2022 03:15:24 -0800 (PST)
Received: from localhost.localdomain
 ([2401:4900:1b36:63fa:598e:512d:693:66a0])
        by smtp.gmail.com with ESMTPSA id
 h2sm10565651pfh.55.2022.01.11.03.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 03:15:24 -0800 (PST)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sana Kazi <sanakazisk19@gmail.com>
Subject: [oe][meta-networking][dunfell][PATCH] netcat: Set CVE_PRODUCT
Date: Tue, 11 Jan 2022 16:44:44 +0530
Message-Id: <20220111111444.22321-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 11:15:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94729

From: Andre Carvalho <andrestc@fb.com>

This way yocto cve-check can find open CVE's. See also:

http://lists.openembedded.org/pipermail/openembedded-core/2017-July/139897.html

"Results from cve-check are not very good at the moment.
One of the reasons for this is that component names used in CVE
database differ from yocto recipe names. This series fixes several
of those name mapping problems by setting the CVE_PRODUCT correctly
in the recipes. To check this mapping with after a build, I'm exporting
LICENSE and CVE_PRODUCT variables to buildhistory for recipes and
packages."

Value added is based on:
https://nvd.nist.gov/products/cpe/search/results?keyword=netcat&status=FINAL&orderBy=CPEURI&namingFormat=2.3

Signed-off-by: Andre Carvalho <andrestc@fb.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 meta-networking/recipes-support/netcat/netcat_0.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
index 14d743f82..1e113de51 100644
--- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
+++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "b55af0bbdf5acc02d1eb6ab18da2acd77a400bafd074489003f3df0967
 
 inherit autotools
 
+CVE_PRODUCT = "netcat_project:netcat"
+
 do_install_append() {
     install -d ${D}${bindir}
     mv ${D}${bindir}/nc ${D}${bindir}/nc.${BPN}
-- 
2.17.1


