Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A6DC433EF
	for <webhook@archiver.kernel.org>; Sat, 16 Jul 2022 13:52:08 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.5566.1657979518910486861
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Jul 2022 06:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wa4MH7Z6;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id c3so5993185pfb.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Jul 2022 06:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LTdosOnggq48TBq6xM6hZNRu+V4EMNm0VHYU8fdFEM=;
        b=Wa4MH7Z6xckSJyyu7gUcd/LScowhnlVjE0EPEZVxOMGWOPPhQfetQ2NjSrlyBCInj+
         RTj9Ga5krtoTFM/eCTU6mucICoLZSueY/BRdBGFW4Tv18NxFusbXePV3BioMpsSDLhn7
         iKFkBqBHVxjStwhg2FwIcGxYx+iLYhqF1Bx1fUwnjjlV36b/jsQ3yw7/rcfsMlXXVlOm
         cYe8D1ik5Pqtkvh6uhDELN1EGbqcKZRs3zUHEaaBTdj9DQotrI5QuCiEHTn8wqLLEie6
         fTCcbub1CBpdP0F874zIm+acq2KQ8BwfDM+6jRiMkK5fBKOh3z0mZ502ur1awGs4NMY6
         lyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+LTdosOnggq48TBq6xM6hZNRu+V4EMNm0VHYU8fdFEM=;
        b=QGerJcVbChpsXA1MgD/Ivd/6yu32E6ZbsS4Oczbs9MVhrZQcry41qgvoOW+5Zm3M+b
         5uM/w8/wdQ3YlnbMsisRaxTGiOPaZSVIDRgp61PgJp3iyvXrRolNshR39IrvXH4C1kq0
         EFMo8ihDusIaOQRbgQGdEJfmQCApzU76AcOuKCfDTwekDi/Sc9Oy3YySHsPS5BU86qNE
         dgiV9AyS9CE+sxQjTHakp8ssXd7rK24tNpkDkIxKI2sgSO0gfkXIkhvgdaWmbjBfoWwH
         RbFzNASmEhR6QPzsl/eIf1WSRI7db/tv9o5gLAcCJR2DiwswH5DqtKOS002SO0zQ4qyO
         IL3w==
X-Gm-Message-State: AJIora9NgoPalWzxbddF50/yysnJl/8OOief7NJnmZc31p8UxJKmPTmU
	yOLypQQ6Od8eb01pvahHoxVx4m+F+ObeFQ==
X-Google-Smtp-Source: 
 AGRyM1s3bRADs2RATruENg9jr6PhZkFHahdDJSpDA4VJjYbMA83Y3mGxU0hBs6OZEMRYAlyTEXwA3g==
X-Received: by 2002:a63:8bc2:0:b0:41a:3c3:2ee1 with SMTP id
 j185-20020a638bc2000000b0041a03c32ee1mr990252pge.142.1657979517805;
        Sat, 16 Jul 2022 06:51:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 g1-20020a17090a708100b001ef3cec7f47sm5443558pjk.52.2022.07.16.06.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 06:51:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-qface: Inherit setuptools3 instead of
 python_setuptools_build_meta
Date: Sat, 16 Jul 2022 06:51:55 -0700
Message-Id: <20220716135155.3089558-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Jul 2022 13:52:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97854

This also adds missing dependency on python3-picobuild-native

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-qface_2.0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-qface_2.0.8.bb b/meta-python/recipes-devtools/python/python3-qface_2.0.8.bb
index 47a34d44b3..8ad61ab12b 100644
--- a/meta-python/recipes-devtools/python/python3-qface_2.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-qface_2.0.8.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eee61e10a40b0e3045ee5965bcd9a8b5"
 
 SRC_URI[sha256sum] = "eccee7dbc4290c5a4e394df8d527f39148e0de0ff22c6b260f48c48f12b3beb4"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi setuptools3
 
 DEPS = "\
     python3-jinja2 \
-- 
2.37.1


