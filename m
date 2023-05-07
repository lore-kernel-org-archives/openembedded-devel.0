Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BCCC7EE2D
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:23 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.69129.1683477197108771009
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jsGNomp+;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-55a6efe95c9so53779637b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477198; x=1686069198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J76+vQgE6mChAtBHrj7jMC4QIVo3JUXLGGhQ222xrtQ=;
        b=jsGNomp+ZOW20NGg71EZWXqHHW6CM8pXybEIUr7OcqxVYrTUiKJTAp56hJvUH3ljlB
         wt3Cz/aySUv+U1H9F2qIuzIG+QD28hQN4b403eQdCF8p33EFbb3A1hhaDawoYmBVR8vo
         +MBj8zCQqI4TEyjcd5leDN7OQfBt2px3oItyqt5GaLO5lSyAit8X7eEfhiKYie5eeIEa
         pFFxMxSA4LfhkpvhpjzFhYeB4iEw4X6GoUtI5DdTW2wj/57Zrg0th8ZrLfJjaR6Ah5mQ
         LQMLxsZKA1+iXcq8ghJUia254FnX+M7YSXybExRSQ6L+OdKcK/qE41hyOUs8MHyceUje
         QHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477198; x=1686069198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J76+vQgE6mChAtBHrj7jMC4QIVo3JUXLGGhQ222xrtQ=;
        b=cT6Tmm8CY8kV2rkdMRUuxvi9jNa8V8LFKjUwBtXIddB3vpAXoe14G6Gnbv20qYdYYH
         lJq4sOG8IsF7/kre4mmy7NOfpoq82VRooyt5kItT4Wrj7zDLMfNVZSIDhv/QqHswIGr+
         pq7BzHH3uG3s28Z9B44SUnAlleZm0zxtLRY9zDlM0DH9x1aQQGwQIcuKytn/v1hTEyWu
         2SnAb1eB9jD/XVLLsiAm9twRNhvnqfpx1MF3QcJJR62EKFexj7uKujNOh93GuH/7YBkF
         oLgoD1Xsd0qJq1rabSkw9EluWrjJEU9swjrwQjGFfZ7UM0nS6C4gX0zpiobMsjrehlFz
         r8Qw==
X-Gm-Message-State: AC+VfDwtcYzHB5mCxZgfpIbrpGHSXp9sO3mkT+HPBcpp2G8doew+r69E
	xx2J3VNip8EXegnDEHv1lspgD3CQNgc=
X-Google-Smtp-Source: ACHHUZ6XiEsjhF0YdT4KztTlfHPl6nQrzD5QTauV9ReVAcCeaYGYCgmm5Eqj0fxCXj/YhzIFJLX+vA==
X-Received: by 2002:a81:75c6:0:b0:55a:7c68:c0f7 with SMTP id q189-20020a8175c6000000b0055a7c68c0f7mr8376945ywc.7.1683477198531;
        Sun, 07 May 2023 09:33:18 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 12/29] unicode-ucd: Update license URI to reflect renamed license
Date: Sun,  7 May 2023 12:32:48 -0400
Message-Id: <20230507163305.3261044-12-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102342

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e90757f7a71c04aa3f2cd2ab21084fed440d6820)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index f0f3a66e07..7970cd953f 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -1,14 +1,14 @@
 SUMMARY = "Unicode Character Database"
 HOMEPAGE = "https://unicode.org/ucd/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/license.html;beginline=43;endline=83;md5=cf6c4777b109bcee78b6083a21be6192"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/license.txt;md5=4b11b5cbb0a24df9f4e7db63db98f22f"
 
 SRC_URI = " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd;downloadfilename=unicode-ucd-${PV}.zip \
-    https://www.unicode.org/license.html;name=license \
+    https://www.unicode.org/license.txt;name=ucd-license \
 "
 SRC_URI[ucd.sha256sum] = "033a5276b5d7af8844589f8e3482f3977a8385e71d107d375055465178c23600"
-SRC_URI[license.sha256sum] = "e415e1f2188ef2b1a5f7e6ee8c60cefe8a49dacd8b96c9025cad5013985129e4"
+SRC_URI[ucd-license.sha256sum] = "f7830d126f59d83842565d3dddedc79db4ca978ed52aee0ebcc040ea76a85519"
 
 inherit allarch
 
-- 
2.25.1


