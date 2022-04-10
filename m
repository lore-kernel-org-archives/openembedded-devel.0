Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46A3C47090
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web12.21880.1649623496998250245
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=siSMfftJ;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.53, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f53.google.com with SMTP id x17so14264570lfa.10
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xzQXhjlvgBSHexCtn98WvmRbfrvs8wVaeIxRNx3UszY=;
        b=siSMfftJ8vEuA63Ynelj/5xeY9NSpzRNbP59IiriKrcv1CZnIolGWriK7Uek6f2jRa
         opx3jxSZ2Ac1eZ+NtlkoaJSFGnlnxsL7e7DckOeOeSnxDrb91tgLpTL2KDKrWDRsbpfu
         ebr48nA2ofkgOuuV4K7Z4qyMt4Rnk/wc3+DiTYh3n/IlQFA8OxyJIFm5K5auPVUshu7C
         KOKveshaKuECGe8XsZf4PVwS3g63qhkvUUPdotNwZWnmm6ZpECvon2CXzpQmD6y1E+P5
         hbDn8sBdTzTuzw+XBCrqoGr9qw/r2boRBfu8Tad/ij5y5fgFgX1MPPMzvBxagnVlJyPk
         aqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xzQXhjlvgBSHexCtn98WvmRbfrvs8wVaeIxRNx3UszY=;
        b=RO0kvzNDezdT+1IZip4oPVwpjkLe/C2/eMLZ32MVg1yz99APvJH6m3m2TAx2VKM/fo
         Ky+G/FgA9DK/oNRmMGxZgdqgBsvhPFYuznB8zDas7bm84ca2DQJ8VkmT9pBtkVS86hfI
         RNmTXkGiST++OYTnqRrY3Sy7acooXLXktWK5uLRQjCP1+bGRhdOM6d3b/GYrcDF6Ccu+
         uPbDx1IPQUmQYqpKSRcb7GHujkAK0bKvuxLdoaFB6TuDnx8zfF5yaNKrBWNc77zPweAV
         0E10qI/RzAD2lRO5O3HFlISQ2euYEYnJlNpB9v/Q/6Qhk1ktpj3D2p3nrs1ODV1JC7UX
         ByGw==
X-Gm-Message-State: AOAM532Rd2abOVoe+rcInf3pTAUYNTV8V3k5VGdgmjFeZMUllHxt6kEM
	+J+VopmHEKp1HfGOEHyue/PEHAOaVDfUQvcR
X-Google-Smtp-Source: 
 ABdhPJzWfRWIDGU64oCfmqsDR18o3a9VW2MzY4F1WwH1idmEjXC4bxOVrW6JFw1u3MWfO/63BbIm0A==
X-Received: by 2002:a05:6512:39d2:b0:44b:230:1658 with SMTP id
 k18-20020a05651239d200b0044b02301658mr19496439lfu.555.1649623494929;
        Sun, 10 Apr 2022 13:44:54 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 l3-20020a194943000000b0046b928d2795sm545208lfj.67.2022.04.10.13.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:44:54 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-elementpath: update to 2.5.0
Date: Sun, 10 Apr 2022 22:44:53 +0200
Message-Id: <20220410204453.4047802-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96531

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ython3-elementpath_2.4.0.bb => python3-elementpath_2.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_2.4.0.bb => python3-elementpath_2.5.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.4.0.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.5.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-elementpath_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_2.5.0.bb
index ed55077e3..e882952ac 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_2.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "5b6801b3be94d48d213beb7b8ebad96addb35c95fc6a9c062c80e033b4a32fe8"
+SRC_URI[sha256sum] = "3a27aaf3399929fccda013899cb76d3ff111734abf4281e5f9d3721ba0b9ffa3"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.25.1


