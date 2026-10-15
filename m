Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B942CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:39 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33260.1792043076509745443
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X2Nnsu92;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2dd76b1361dso12002325ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043076; x=1792647876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zf2z5lSjXeVTjCY+5tAe6ThiIjq+B00NWRY557XdNMk=;
        b=X2Nnsu92R81iSs4L3GuI6+e7BECLe7p0qCRVr7GuxivUKIWXw3n44opbUg0sKu7XPu
         tS/t9zY9aVRhnKGznC7DZcvcewnRbeuWLnegxI6Udze5fH9rfUueCm//cs34rvjzHZKr
         RsvAccUVkeXYLTU+h7g9H6S4FzEd1IqhpHvj83iurDvi0re1v58SHRERzx8D5vXSBOE3
         12pAwEwc1V4wMFfoZKYMbU/ttWNHM306YdtpOhUNXU0jZKeY5mDCnMH+CiB4oSFqpdUy
         A5w2pYaRCO1YZadxL/SMKzKTFVIGNRKHnHKFnhQgKX60eh0f4jFrTIs1Q8ruGWfJ5NVG
         3zVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043076; x=1792647876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zf2z5lSjXeVTjCY+5tAe6ThiIjq+B00NWRY557XdNMk=;
        b=Oyc5BGC1Y7mj72H89f5ohXS3vEqSQWrgAXTTTv67S/htPMZwnomh7kqKcbbSv3/46z
         7NeuTBY7jWQw9bTJlhkSNY+dtc0KN6/nqXBYCVl/c085fvFpsbfziWTQEaWODpAUUCt/
         Mrpe4SZHHkXiMam8AdHyjxuxz+MF/PSzeEfb4ZdSaQaMZvV7NV3fqySrwsoEDzsaH3B8
         IGy86NyNZ9fXIluLSQfPCSwoaEKOCHsyOj/SIHE8nLSLoXVbesHa7+WvLNby9md0gy1Q
         VV0JY5AF9anRqgjdikalMQgtzicd4GeKFf3MFKLSOnMfN9id37cwovUeKGcs+Z2gH2BZ
         nkNQ==
X-Gm-Message-State: AFq9FYIw9Q5Y6e8vK3GY9io7/v/rFNjccoEesA2ldLxLZ004upDl7NdZ
	LhsFep8bt3wIR69/eRRR9sM05G4hljZXEbxKNvOxiel8kFEloOI2yjDhcZG2+Q==
X-Gm-Gg: AYBFou3PkYlNx4Th73OLI2gkw7fj1/75KiM7jEpC703YW0LUKrjzt5nCJpCOv9Fp4nq
	phiS94K/ZRWNJirifS+skfVs3ACJGlV1l/zHyGq4wvbuiRNTU+xmEgyK0uPV4OiYkyOYq3/KdXR
	KH22ZWGLO5dLsBTgN9FOitp2FnyfaLT3PP+vPsYRQFTwG9ixjGQ3iFjNrTG/PmH4/+zyR9Yvy/l
	fBH2DOzICtAqTuQCEcJdX5acsIEvA9pkiXULmHAeAJAs0O5jWF9fR++npSLKHgQ5Y50JMl2ta+K
	AVEFbL+yyp89bB7Fny7peIzyFa6wpsr4k4vp5kBOS52VKo+hjb89tV8e9k/MRlf0KSC7c2H6zqr
	ihnaElWY3ZK1w0i8dbm6q7Pz6+ziHWNzy5SxvKJeNJhGGiatb/y2yuPlvegsKh4NM/OrSrpUjhq
	5KuYpAcnYzkevTivRoYXxchhwjO5/FKp3HiNA9XVUgPHdre76pnsR1BBt8IIoti6xIulB655ytc
	ZWyyd+hCJTMOHVUXO85/VAPXg==
X-Received: by 2002:a17:903:1a0e:b0:2e5:54b9:6b5c with SMTP id d9443c01a7336-2e842ab9b86mr137745845ad.20.1792043075825;
        Wed, 14 Oct 2026 22:44:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 49/82] python3-tzdata: upgrade 2026.4 -> 2026.5
Date: Thu, 15 Oct 2026 18:41:37 +1300
Message-ID: <e56c9807f264dc77a75c0179147622aaffb3778e.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130969

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/python/tzdata/releases/tag/2026.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 01bd918ea8c7a391e977b9ab409605fa7fc5d953)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-tzdata_2026.4.bb => python3-tzdata_2026.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.4.bb => python3-tzdata_2026.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb b/meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb
index 9bd29afa61..4590cec28d 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=804220b73c90950be376e7ff7b2066bb \
                     file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     "
 
-SRC_URI[sha256sum] = "f1b8bd365d8d210c55353f4d7f8d6d8561c0ba50d704b700d195a9424bba0d79"
+SRC_URI[sha256sum] = "8cc73c0a0bfca7dbfa59235d60b2eff82231dee33f53d206db1acd9173cfc0a7"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

