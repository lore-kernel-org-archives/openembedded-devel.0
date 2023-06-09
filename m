Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3C3C7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 14:47:59 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.15269.1686322073525398321
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jun 2023 07:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DEdFYANP;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-977d02931d1so280531066b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 07:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686322072; x=1688914072;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ABmFhsj6+tjkPl+7lHwZs0ZkT9ML92Z74e5OfjIyRE=;
        b=DEdFYANPXDGrFt2n1MuWMTaxQEq7mHeFFsV/leWRMYhqr5wUXx8kd55nxqI7UJ5Ebf
         0jB/R2+kvmU3qrUIvQih8FJ5eFd/9GPUZwOMGZoxP6hC1d+k/8vMxU27HcL5Mcmk67/A
         VO8VPzGvW/+nv8TY302/wm+mXrZs7ZUeixiuMYcgDPfe4D+9UGYXGWpbYz8pvomMOt2e
         aHJmgPDGZ23DR9TXVtQ/52Kr9rO4Y3AxjrT22LeEJZYMBOeBzTMnHmH0SO5SA5kxu+Du
         XNZkKogrWAm7DlH1fokgtUsy3Fbk8vusg9Kcm8qKqjyYWsm+SGVc+9+sGn7Dagn5UElB
         hWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686322072; x=1688914072;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ABmFhsj6+tjkPl+7lHwZs0ZkT9ML92Z74e5OfjIyRE=;
        b=gCXwW5nNCmMMTNO9P0hUMQJUzvWOfU5Qt/kalwc9oHrMH5IZDanoMDJQQvI8lI6cJe
         j11J5gTa1QtUivnqMLLJ0JFNoJpoeMsKLGhjr+cuoeDdOxilP1DpY9hyJk24D+nB0jOS
         IMWv4e5dRGUoPM09sawlkkXiZWqZ+/Cqdm6s2nA3F75t6V7RrljA0f/FkJ1u5aqjWBqZ
         fcalsJm2V6Fo7bkoOZ+C/em4RxmfwoPWc/4Ix2LY/EvZXzapCZHsTcAiNMMZlWj7SXXs
         wvPDghrDv+mrEM8IlKxvYqDNr/m92HOBNId0xhA3eWAI1BieB9LgIW9R/zRYXYEKhzNa
         Z5Wg==
X-Gm-Message-State: AC+VfDzYYe8bg3cyvDJt4V8zPOn8mrfBeWUdjVNKxugfvfCCJSttBuuZ
	+FE9/lLoDQoGVl6HE9S8nuGF9UiZSv8=
X-Google-Smtp-Source: ACHHUZ7pC5dhqZgSf8F7tIdaVkuP45IuHcVO+ME9sEwBrnPyaq84TkJkh08E3rPcReRzKcdxm4oq7w==
X-Received: by 2002:a17:906:58d2:b0:96f:f19b:887a with SMTP id e18-20020a17090658d200b0096ff19b887amr1842596ejs.56.1686322071857;
        Fri, 09 Jun 2023 07:47:51 -0700 (PDT)
Received: from NVC4181.nedap.local (159-210-178-143.ftth.glasoperator.nl. [143.178.210.159])
        by smtp.gmail.com with ESMTPSA id gv11-20020a170906f10b00b00947ed087a2csm1377097ejb.154.2023.06.09.07.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:47:51 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-devel@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	richard.leitner@skidata.com,
	Jermain Horsman <jermain.horsman@nedap.com>
Subject: [meta-java][PATCH 1/3] javasqlite: Revert changes to LIC_FILES_CHKSUM
Date: Fri,  9 Jun 2023 16:46:44 +0200
Message-Id: <20230609144646.1977-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.39.2.windows.1
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 14:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103201

From: Jermain Horsman <jermain.horsman@nedap.com>

Building javasqlite fails with a QA error due to LIC_FILES_CHKSUM
being incorrect.

This checksum was changed when the LICENSE value was updated.
However, neither the source, nor the license file has changed.
This commit restores the old value and reverts the changes made in
commit 6b2a48c3a7b1236a9d915135f685ef7eef5dcd02.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 recipes-core/javasqlite/javasqlite_20150419.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/javasqlite/javasqlite_20150419.bb b/recipes-core/javasqlite/javasqlite_20150419.bb
index 27dad88..71e9676 100644
--- a/recipes-core/javasqlite/javasqlite_20150419.bb
+++ b/recipes-core/javasqlite/javasqlite_20150419.bb
@@ -13,7 +13,7 @@ SRC_URI =  " \
     file://0001-fix-errors-during-cross-compile.patch \
     "
 
-LIC_FILES_CHKSUM = "file://license.terms;md5=788a765d15de8312110c282b2ef53c83"
+LIC_FILES_CHKSUM = "file://license.terms;md5=3da0e50feac5f64f08184584a8cad58a"
 
 inherit autotools-brokensep
 
-- 
2.39.2.windows.1


