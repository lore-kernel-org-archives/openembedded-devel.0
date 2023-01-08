Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EA4C678D6
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:32 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.46771.1673191281451234591
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SN3QLDRi;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id y18-20020a0568301d9200b0067082cd4679so3852277oti.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJbrKF+NAOyPWXcIhohzVQg3D4n1LmQ8pHj4o890gMs=;
        b=SN3QLDRitR+0o3T23e14wHXGsh+fGHawlC+rhS/Y4yo84pyKOcf3/hWXihJJxb2dVF
         m5NgdYAjOmwpSuRrjeXpxf5cLR3JpwDOyxB3Zzf/ll0Ut8UejLYjDcXrN9lkcTAd7W02
         U5eHYUgntu+NFvOc9SmsTW2rJWyrzPGEyT2MMRhLtYAEiw0iIWbT4cQV8m1c0rufFp1V
         Djyr8ij3vvFf6KwERhjkqN/SRDp/QY206Vt0SOCORSgHcvYeob3575RM5u88qVPn1QHF
         IOIUuYehsT4bkOtlHZmkYfJyhegS7yHMMnofJfEv6CXhyGk78AXlIMBcC0hJsTlxK5cR
         /n7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJbrKF+NAOyPWXcIhohzVQg3D4n1LmQ8pHj4o890gMs=;
        b=QmZZqkc9spLEfeoy+e19PeRoxdX/aZYhSAyJCGkgiOMN5bRkBHdGsiFNisB8aXD3v8
         dkwzy2t0QapAlZNOUCm+YqKoVpQiqWTeC/IcHF8BvYWNBCw/nUE1sMwNt7FpTD6nxpoz
         joMHSsBZRSXmD4y93GxUxn4FBoqELBFsWzox0fM384JIQ8PUhhy0zEjEv31S1BFpUuPC
         DQ8aBPOi2OjmGtf6hKf7R45MxEiEDNesp38qrQVYjIvfpiTUQK+IVHgZ2n60IX9lviy2
         0B9A1eNLJa2yRP1twa8eogA6HLqUPjjYX+ymbvTyuN/Cx21/nVdoTCK3Tq/zwPPzxmIN
         L7KQ==
X-Gm-Message-State: AFqh2kpCH3D2w87t6OUB1NnC8JDJ8Z5uJDNw1+7QLLDHX//hf0BOIN2F
	LQHs8YLuTVdEoCOXzsouSthQ492vCIg=
X-Google-Smtp-Source: AMrXdXuzNgLzRZWWJxBF3pFZwhMCIRWF3VxQYn5if0ovh5YR+ByWcRvdsloH6TUMz68G/7gGL86MSg==
X-Received: by 2002:a05:6830:1145:b0:670:6688:b97b with SMTP id x5-20020a056830114500b006706688b97bmr28365928otq.36.1673191282314;
        Sun, 08 Jan 2023 07:21:22 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 10/26] imapfilter: Upgrade to 2.7.6
Date: Sun,  8 Jan 2023 10:20:45 -0500
Message-Id: <112f75b77f6698395da8dc3d80f4536317144a65.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100455

From: Khem Raj <raj.khem@gmail.com>

Use git fetcher to avoid src-uri-bad build QA error

Changes in this release [1]

License-Update: Update copyright years [2]

[1] https://github.com/lefcha/imapfilter/compare/v2.7.5...v2.7.6
[2] https://github.com/lefcha/imapfilter/commit/ce6b9050b284b9944ac52371a4a2254fc73bc219

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8299706b637b76d95716079455c276a825d6f0c9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{imapfilter_2.7.5.bb => imapfilter_2.7.6.bb}          | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.7.5.bb => imapfilter_2.7.6.bb} (60%)

diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.7.5.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
similarity index 60%
rename from meta-oe/recipes-support/imapfilter/imapfilter_2.7.5.bb
rename to meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
index 111a8208a9..eb23816e8a 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.7.5.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.7.6.bb
@@ -1,11 +1,13 @@
 SUMMARY = "IMAPFilter is a mail filtering utility that processes mailboxes based on IMAP queries"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=db3b99f230f9758fd77e4a0654e2266d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c11d4fd926d3ce7aac13b0ed1e9b3a63"
 
-SRC_URI = "https://codeload.github.com/lefcha/${BPN}/tar.gz/v${PV};downloadfilename=${BP}.tar.gz \
+# v2.7.6
+SRCREV = "b39d0430f29d7c953581186955c11b461e6c824f"
+SRC_URI = "git://github.com/lefcha/imapfilter;protocol=https;branch=master \
            file://ldflags.patch \
 "
-SRC_URI[sha256sum] = "ab19f840712e6951e51c29e44c43b3b2fa42e93693f98f8969cc763a4fad56bf"
+S = "${WORKDIR}/git"
 
 DEPENDS= "openssl lua libpcre2"
 
-- 
2.25.1


