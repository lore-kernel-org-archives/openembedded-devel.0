Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DC4C433FE
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 22:35:21 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.20051.1646606119630958464
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 14:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SQXf0u8J;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 195so12073080pgc.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 14:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7JevnLuCmBcYif09zhlsB/BWpXsxQ7tuETeFfcbjXHk=;
        b=SQXf0u8JTRbXq6CbledZoXE+sDJTMRbjos/4iBuwb+dTXdXrHGBBnj/lANp04BGr/4
         MAxGBYJzIQs7oNGQ2z4m1iT2zTzgfrF9tI/5ateOr95Mp9VOhzFgGJhXwRXlI2myzpye
         m3QT4pQ3glxdE8iqVcIIJcKCk/oA1P8G/zMtKIzh2OySMMA9vDG/upDzFA0vbhass6a1
         CynHPqkk11aG4yz0/fQWEc/MQpJAb9uHILwfFmBhQbV30Ug8Ua5r9uurknoIQ2L6spq3
         i/xh0ADNcHlUBb83Uq+0QANbIfa9Nwj4qklespCTvubhLHS05lz6YhmRXBoJlJwAJQ8e
         2Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7JevnLuCmBcYif09zhlsB/BWpXsxQ7tuETeFfcbjXHk=;
        b=DoCQI201StJyyxYZ3O5DfDjhQiW/p/Jco+DwQToADCOhRf1ljcslGJdZgrJ2l/Wjqn
         XRB61iQU+nI/x+UfrB69MJk7QFEQLDMdrZUvTKdjnKYwNeDfMAEWIu7IWIVnqF+c8Rbf
         UdkNBMt75hOj0njASkb6yBxeLLBDctTFt9K8laeg27ypwZl2qwHw8jA6iIJFTQiY61qd
         atDQohIpBWEwS5JJZVHZAQWLM+bcuTV2sBFPmiOze9ySgb9SEPx44FLkY/ZojYFUDXbI
         KUDx/6oHEghcRrN7fY/P1uzqt/1AzhclrIcfyoJ+0K/DMVRSDVnhnGWUZQ/IZwtKIVlI
         X/RA==
X-Gm-Message-State: AOAM533xnXUpR8yo6m8FqYbmQBBKGOprOgD4insPd0weLZnDJeQIkoFd
	vyZLCXE5VdWGkfFAMLxGncBQ18haBEqyJQ==
X-Google-Smtp-Source: 
 ABdhPJxByIu5eBmFAfWGpGDLsfwo/QKMG6Rf0CUitDp634B94iOpfLH3gZf9Ed6ZrJyI+KvUY7QH9w==
X-Received: by 2002:a05:6a00:10c9:b0:4ce:146e:6edf with SMTP id
 d9-20020a056a0010c900b004ce146e6edfmr9987897pfu.6.1646606118856;
        Sun, 06 Mar 2022 14:35:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 z5-20020a056a00240500b004e15d39f15fsm13502369pfh.83.2022.03.06.14.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 14:35:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/6] pcp: Enable check for x11 distro feature
Date: Sun,  6 Mar 2022 14:35:11 -0800
Message-Id: <20220306223516.504947-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Mar 2022 22:35:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95822

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/pcp/pcp_5.3.5.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pcp/pcp_5.3.5.bb b/meta-oe/recipes-support/pcp/pcp_5.3.5.bb
index bd09985af3..48d536e1d6 100644
--- a/meta-oe/recipes-support/pcp/pcp_5.3.5.bb
+++ b/meta-oe/recipes-support/pcp/pcp_5.3.5.bb
@@ -18,7 +18,10 @@ SRC_URI += "file://0001-Remove-unsuitble-part-for-cross-compile.patch \
 export PCP_DIR="${RECIPE_SYSROOT_NATIVE}"
 #export PCP_RUN_DIR="${RECIPE_SYSROOT_NATIVE}"
 EXTRA_OEMAKE = "CC="${CC}" LD="${LD}""
-inherit useradd systemd 
+inherit useradd systemd features_check
+
+# Needs libx11
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 SYSTEMD_SERVICE:${PN} = "pmcd.service pmcd.service pmie_check.service pmie_farm_check.service \
-- 
2.35.1


