Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3149C04E69
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 19:09:55 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.28961.1690312190933356572
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jul 2023 12:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=Q68L7wYQ;
 spf=pass (domain: baylibre.com, ip: 209.85.167.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3a3e1152c23so4105250b6e.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 12:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690312190; x=1690916990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfBPUGIUuD3lhneoGevFLl41JD2pWEwpE+2o5OTTvJM=;
        b=Q68L7wYQ7xHi83/H9iarufu72pz0v7j5OGp1HjnznqADzbpdFZ1ky70nAZpPC+y52Q
         PnJhxEV8qS9eoz+VDREMO18KyFhs6XpGHxQVqKIrmQVXB4bvFORSaNmxtl/dYp38yE5j
         MgIF5Bojk1iYQrkQR5YjHMspPb+yUXjrskKskYHxS2jxp+k1bdgIMXUX8+fM9XEPIKzg
         UXkhAhDsNpHS62KpBL2gdcfUJtTUYnCadr5g4WaabCYRjVwjhE8Sk0IVXUMP3wxylZJW
         3+jenW1u85/JwgWQQqetAtwwuVRJnBhpE5mMFaM9T7qzvK7QvIDd3QwSdPX/5TfH/zOs
         +pTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690312190; x=1690916990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfBPUGIUuD3lhneoGevFLl41JD2pWEwpE+2o5OTTvJM=;
        b=Cgg/fm7I300HJT9QG+Fph3HcC/OugXm+t7T5hOG48FggTrdUNMCOKMSpCCFbojXQyN
         uDPlwTuhcT3eBmn+n/9Zr6iOcrRqJYowgyiziIJkuSShJEMptUFRuaJ0HgNU1nJya4v5
         p6pjBwEzGyfhLOKOE0eMzPSJhXKbbDLQa49v+EYIqtKxCXCnt/+P8uFi7Qiz4358Pp/F
         BwORSIvRldq064x760Rv6upQU3bkfYd5FRI7URgfVOZ7xY3/+dvkiHJ1eprjl1oNgC5T
         mXrnAAb9NQAPU2YziCuA8xviyGaetjS3Zp9PaHzF7LeALF2O5pdTt6uOjkaaJwHpSS5w
         f2fQ==
X-Gm-Message-State: ABy/qLbFtfeRj5hrsmV1BcM2UuEHcybqgqqqAVPmvcxdIquuJL139Tkk
	RVVmGbG4RasWIQeyE2K3fIgpJUhxzhPLfZwq/Ho=
X-Google-Smtp-Source: APBJJlFByFPnCXC5z5HUvwZMDxI1Fkg/E6oRN9MJ0rpaVNp77I0UFBVFTV0vzLw4KDk9JgVESuqx6w==
X-Received: by 2002:a05:6808:1598:b0:3a1:e3ee:742a with SMTP id t24-20020a056808159800b003a1e3ee742amr18631458oiw.8.1690312190069;
        Tue, 25 Jul 2023 12:09:50 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id z9-20020a0cf249000000b005ef81cc63ccsm4526109qvl.117.2023.07.25.12.09.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 12:09:49 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/7] python3-jsonpatch: upgrade 1.32 -> 1.33
Date: Tue, 25 Jul 2023 15:09:38 -0400
Message-ID: <20230725190947.660933-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725190947.660933-1-tgamblin@baylibre.com>
References: <20230725190947.660933-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 19:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104019

Update-License: Change name from COPYING to LICENSE

No changelog provided. Commit log:

0b05203 (tag: v1.33) bump version to 1.33
45cfe90 Switch to GitHub actions (#144)
33562b0 Update license text to match official 3-clause-BSD (#142)
a76f742 feat(jsondiff): Add support for preserving Unicode characters (#145)
714df3c docs: fix simple typo, raies -> raise (#135)
e0b3a9b Merge pull request #134 from Ventilateur/b/fix-invalid-remove-index
46eef55 remove unused import
db194f8 fix invalid remove index
a652648 Merge pull request #132 from JulienPalard/mdk/TypeError
c9bfb91 FIX: TypeError when one forgot to put its operation in a list.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-jsonpatch_1.32.bb => python3-jsonpatch_1.33.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.32.bb => python3-jsonpatch_1.33.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.32.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.32.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
index 2a653cce88..3d6deb2a61 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.32.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
@@ -1,11 +1,11 @@
 SUMMARY  = "Appling JSON patches in Python 2.6+ and 3.x"
 HOMEPAGE = "https://github.com/stefankoegl/python-json-patch"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4f81c84f9a053e31fe9402a2a4e78864"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b6ddfe6c3db30d81a96aaeceb6baf916094ffa23d7dd5fa2c13e13f8b6e600c2"
+SRC_URI[sha256sum] = "9fcd4009c41e6d12348b4a0ff2563ba56a2923a7dfee731d004e212e1ee5030c"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-json \
-- 
2.41.0


