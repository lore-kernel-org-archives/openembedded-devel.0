Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8526CCA479
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 11:07:41 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.25803.1658142454928826667
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 04:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T9C2mJrw;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id j22so20547706ejs.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 04:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jqZE99AatGQ3M345SGQtPcV73cgtf7Tpgo4DK2ibuCk=;
        b=T9C2mJrwinpgsE4dIcS9ovVtOpmSS8NRvfuA4qUML6Y3NTGvszkeHnIiKoXxnFaI+2
         5s1amm7gGScBfUVWFssDnQ72pJyP1hlZyFQ/JcS0bNIoLq2ZVdBTWCgYBufLirONsl1X
         JLVed/f3Hyj5/BytRJOwHivBsWvRCjwWj+/DK9oJdKBwGOoJH76TZxU63La7QlXfOvFC
         mY52Fucbj8uhmMs3zmqeDlZq56s3XOeWKVgHWBm+eoy0zB3LgBgwjl4M4Hp5CwbOnMA5
         1NolbiIAc1n2A06Yn1TJEMOmrsJJNo7qygZhSR/eN9qJpaaJ3c8RhatmATDf1YawWZTX
         f+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jqZE99AatGQ3M345SGQtPcV73cgtf7Tpgo4DK2ibuCk=;
        b=mkG09L02dX7FhE8ilwax5DGVScSY3fp5wOSPuSFGzSC+Z61pvpFmLyoculYcdAaWAI
         bqL5iQrC6Cmzno8bPMXVfWYJ8JMwvZ9n631x1KTzXjiPQ2pdYzW09jQgoJitsg+i9ibi
         QrRGV6entT+smYTu0JQ56oEYtgUCjkzWzkGD1EisJR84R2k9kkLaGEespCIDi5emt/OS
         MXQCV1DXlp5xf7upMHZ8Wgsl6A7FrfVKk3HuCXUjnqOhUi4S/SiT5+HBRbQlqOP5gPH+
         oNvjYWk7T5XvpWDMAZkOlrliJjP7yRWzhMYlwKFKKVQjoV92BkGqRbCnYW7BBNkELtmJ
         BzSw==
X-Gm-Message-State: AJIora+7gAfBRuqL4q91q7s26E+X9n9jtzc/651KmbvZOZg2XWowU3qZ
	06qDTEgdgG1S90WztG4Bm7q4t2yw8ug=
X-Google-Smtp-Source: 
 AGRyM1uiazbB169N9x2o3k7fE79pISZNOLPFD2U6CTGtfamZGuTlh7XfvwLINLDXIQ13wmBekxAwYg==
X-Received: by 2002:a17:907:2c57:b0:72b:32a8:7afc with SMTP id
 hf23-20020a1709072c5700b0072b32a87afcmr24742670ejc.129.1658142453010;
        Mon, 18 Jul 2022 04:07:33 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-208.retail.telecomitalia.it. [87.5.19.208])
        by smtp.gmail.com with ESMTPSA id
 ne23-20020a1709077b9700b007263481a43fsm5284153ejc.81.2022.07.18.04.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 04:07:32 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-oe][master][PATCH] openjpeg: ignore CVE-2015-1239
Date: Mon, 18 Jul 2022 13:07:08 +0200
Message-Id: <20220718110710.303475-4-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220718110710.303475-1-davide.gardenal@huawei.com>
References: <20220718110710.303475-1-davide.gardenal@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Jul 2022 11:07:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97872

This CVE is patched in our version of openjpeg. The NVD database doesn't
include a version range this is why it's still reported.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
index c71e53564..379165718 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
@@ -11,6 +11,10 @@ SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https
 SRCREV = "a5891555eb49ed7cc26b2901ea680acda136d811"
 S = "${WORKDIR}/git"
 
+CVE_CHECK_IGNORE += "\
+    CVE-2015-1239 \
+"
+
 inherit cmake
 
 # for multilib
-- 
2.34.1


