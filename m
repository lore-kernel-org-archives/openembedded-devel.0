Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02242C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 13:35:26 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.6490.1657892122254612359
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 06:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b4Bs8TpB;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id ez10so8971180ejc.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 06:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y5uej6KVrKrNsw6qkddyYvlVILM7Yoe3W78pw1oJ2g0=;
        b=b4Bs8TpBMSCEVhlUEOfPXcEjgJVvpr7+5MayLcDSpMT5V4DwfDQI3tcPg3a+tnAIXE
         L6slPuWN6a6tugDqdrnp9zgsAfWvHFCZ1Ta2pbg/bKI9X43H7p3QE2yubBeR+VbQsVGX
         Rwjgi0C72gRjhlpEAawP+Bhj+iGDBayFSzua7SNzaRuT4m3ZR0DP89+2+Vmhw0q4kwLL
         nPIhf+jq2VMH+st6Igc8Kg5lR9IA6I3tDNPJ6rNlLp89gPjobwslXeDRBhWnq2HmFrY5
         6Zj25UoGoouEkhHILghBzl0+y85/JwTSN41t1TUlZdiVk12vDy74xjbg0y4Vmb7oyu/T
         u1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y5uej6KVrKrNsw6qkddyYvlVILM7Yoe3W78pw1oJ2g0=;
        b=d2CIA0RSxRn0VgmyIidNpRnGZucHfxIrB1wvvdkUxxbAlMcwo1jtCibFPpA0ijnX5/
         85wdU6HvFhL0uRQA5SJmtMeR/NEwbewkLyNlMPmsw6ejP1DnA2M98rNhac5+s08hX7Yx
         QvwHlp1I3GdFDackJEfgSdpm19a6SYztQx2eyxDYLXHUbbDF15r74WsQtCG1xRDpUcFI
         N+Kl3gL7mqYTbs9qn3VuBDVomc1GOS75FAkB3oIojhKgniPhQrFXBzt7vjkEWvmRkwA2
         BTOqG79GiVGnzNooySTcWjhaL6jnecmKQ6xnpnmhtV01s7xBj4LettXJVoFSw6NJiadI
         ZX0Q==
X-Gm-Message-State: AJIora9VAdplUA/lv8XIzvctueaiJWuKL+Mrt2i7RAgUU9C376pVwMd+
	iV6rwknv5Nhs/5kCcmc36HidI6uhqHQ=
X-Google-Smtp-Source: 
 AGRyM1seGONQGDC4IApMCfdMdKUT744tAugb6DtFoPFhvE9Yu/yBj3tNXwnsjYARX5K0wxzsXYnaiA==
X-Received: by 2002:a17:907:a063:b0:72b:52f7:feea with SMTP id
 ia3-20020a170907a06300b0072b52f7feeamr13821884ejc.740.1657892120242;
        Fri, 15 Jul 2022 06:35:20 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-208.retail.telecomitalia.it. [87.5.19.208])
        by smtp.gmail.com with ESMTPSA id
 kv10-20020a17090778ca00b0072eddc468absm2043147ejc.134.2022.07.15.06.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 06:35:19 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][meta-networking][PATCH] freeradius: ignore
 patched CVEs
Date: Fri, 15 Jul 2022 15:35:15 +0200
Message-Id: <20220715133515.14298-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Jul 2022 13:35:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97843

CVE-2002-0318 and CVE-2011-4966 are both patched in our version of
freeradius. The CPE in the NVD database doesn't reflect correctly
the vulnerable versions that's why they are incorrectly picked up.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 .../recipes-connectivity/freeradius/freeradius_3.0.21.bb     | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
index da7e60419..0afcb2d70 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
@@ -36,6 +36,11 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0
 
 SRCREV = "af428abda249b2279ba0582180985a9f6f4a144a"
 
+CVE_CHECK_IGNORE = "\
+    CVE-2002-0318 \
+    CVE-2011-4966 \
+"
+
 PARALLEL_MAKE = ""
 
 S = "${WORKDIR}/git"
-- 
2.34.1


