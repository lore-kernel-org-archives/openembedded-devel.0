Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAD7C43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 14:59:29 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.85091.1657033166881821334
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jul 2022 07:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m8JvLPsN;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id y8so9889954eda.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jul 2022 07:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7KOUCNwHpIpjaXqGhXIN2QdTfwOk6LBChasB0w50kdM=;
        b=m8JvLPsNtJWaw7K3Jn18jL46LtgvOOS8AzkRFqKCPCCUSJlkpkEirxOmaGKrhvwYzk
         jEFaTZ7qR9KAjOWudg9ayHkOl2fO0k8P0snyFEUYnWNJWo9rdfa0gwqqhTcdl/YMnQIk
         zcCdtd3eHsdFog4OKHPLroBv/PhEnSzX4aWwGCI0WzHQFPlqSFfoFK+S84NLjKSPKtSj
         WB5GL32YSXvAdO2cOd5a4EfIw/c0jtSeYNCKMN8+iUY2qWO9C5DwaTYBQN/mmxcfd1fx
         G/gk2MSITjZwXdwcZDDXGdk/tkxCMqGKukizFHli5GwPvW1m81I+aXVGp20pE46BcLjw
         bDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7KOUCNwHpIpjaXqGhXIN2QdTfwOk6LBChasB0w50kdM=;
        b=UoQtbY7cDLhki+WSJtklvtMVs4cm8XMxh7JKRhJEB7CmhGxbDMiz2xhmPVBgOLPmRL
         r+hDwEkYt/I0tsfNomb9CzqmheDXu+DQ9mmZtTZIf1FptmlT3cfAHgfPZLcglvhXm7BO
         fsrEWzjqAfPh49tqpptNZ0cEFFPK30hv3dP5ju0wS4+4hQoeltOaI+Cdy9IeksUEkDbZ
         EfAbIr0A+1apszyjRyzf+C+4Av+HWPUa2wZ0ZAx29789vMtRqDjCVwHZUYTi63tAjoys
         uD8vQxfOuPjWSE5nqMzEuTC2fNnZOp2gvXlBQn+Sfcmfd87r3kOau/Rp7fKnaE8jGp2f
         zdXA==
X-Gm-Message-State: AJIora/IKH5L/cBsolGUDdGACyK7M30Ca7ebPCuofmae0nq/9ZujNIHU
	cUMdFAVkjoXis6HSx3WJf9GJu6+G0P4=
X-Google-Smtp-Source: 
 AGRyM1un2U1nXJ02TnXZoYm9eC6gIvdCny6pw4pemg2HUfUANtEL12nx1l38QuO06SAs4lGHdqvNow==
X-Received: by 2002:a05:6402:428a:b0:42e:8f7e:1638 with SMTP id
 g10-20020a056402428a00b0042e8f7e1638mr46976709edc.228.1657033164904;
        Tue, 05 Jul 2022 07:59:24 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-162.retail.telecomitalia.it. [82.60.178.162])
        by smtp.gmail.com with ESMTPSA id
 ej19-20020a056402369300b0043a7293a03dsm2821817edb.7.2022.07.05.07.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 07:59:24 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-devel@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [meta-networking][kirkstone][master][PATCH] wireshark: upgrade 3.4.11
 -> 3.4.12
Date: Tue,  5 Jul 2022 16:59:21 +0200
Message-Id: <20220705145921.321996-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Jul 2022 14:59:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97717

This upgrade includes the following CVE fixes:
- CVE-2021-4190
- CVE-2022-0581
- CVE-2022-0582
- CVE-2022-0583
- CVE-2022-0585
- CVE-2022-0586

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 .../wireshark/{wireshark_3.4.11.bb => wireshark_3.4.12.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.11.bb => wireshark_3.4.12.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.11.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_3.4.11.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index f1dba227a..38fdbce89 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.11.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -19,7 +19,7 @@ SRC_URI += " \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "a0e227bce2cc3a51ef3301891a0243231990b52a39b68a84a6e32f69c4e75279"
+SRC_URI[sha256sum] = "881a13303e263b7dc7fe337534c8a541d4914552287879bed30bbe76c5bf68ca"
 
 PE = "1"
 
-- 
2.34.1


