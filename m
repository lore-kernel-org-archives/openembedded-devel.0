Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AE9C4332F
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 16:26:59 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.161.1651422417616907578
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VuGkChAP;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d22so704305plr.9
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EfhvBwXiYL6uilmLfnkfoDMcB4Ngw875PINfUfUgPdc=;
        b=VuGkChAP+Y6bwKfUp7m2+7s9ILc3dpUm64gmCh5TJgrt5Zk34JhKJHia0ObgIm6val
         6Ev8FHF6OirnmAGfaOpPaC6xc8JaxRZtV7qhAhtU8ksqx/o1+fKk0ZKCruA0YUyIkHeb
         jNRZNSiA9Ev1Aev2GyuoF+k37UbygGQ1lv+p1xbwd7AJqDm+mM1iKpex0veYx5lmIKqd
         r3pIQiso4XH9/pOScBgNUWIYq2aH4Eg0r7LA6mIbXpFwNbnBmnJNjh9EU2Uu4yAneEeE
         g/zjKrYESUQteJ6YkN7tssZcexvuIfoOcVfWb/VC97g1zgxNS8weXJ5D5E7GzZgiRBnH
         NDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EfhvBwXiYL6uilmLfnkfoDMcB4Ngw875PINfUfUgPdc=;
        b=KrXblePaZm7+vRQu7TJdfQWQTlI6sfdpHa4UlxGyw4eHaRCE7/cR1l/83zjKxzxfxR
         F+V10epxzgjjgldjVLMhQaOHn5wvQ1iqK1hzhJyVo5zgeSba974GqrAR80u+rm8fqwKH
         9P7D+0aFStDqr0o1eGIgZwenMAVuG96fUzOHfFAvGTybZsGH8txjXhNYPjvPRqp9ksKq
         DL59CJ1prGYZAqkduJR0hAkXSGLb7eN4P2udEomuH6JJdxWXUFHRxevcHo8Y/L54ogeu
         4wRrOBoGfn85bp75r6QYjI92EqrIrfDj0pXncWos6dMVNBunaESNasMuKiV+GTGw4Q1k
         409g==
X-Gm-Message-State: AOAM531H9JCWG/AD0LYV6vPXOAVaFmAS734ksUcwcjf7OSLS16OfoK4N
	8Hvti0/y3ygj6F8rKig8HSxP1O0HeP2ahQ==
X-Google-Smtp-Source: 
 ABdhPJysuPX0fGqaLqqGSpSN5+MRdQ2UM3KymG3fMzcSDONMQ68vH5S/yqrqJ+PjscT0dWyUsgfCBQ==
X-Received: by 2002:a17:90a:bc8a:b0:1db:382d:6fb5 with SMTP id
 x10-20020a17090abc8a00b001db382d6fb5mr13949924pjr.100.1651422416884;
        Sun, 01 May 2022 09:26:56 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:9a0c:5968:29f0:efcf])
        by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f2d300b0015e8d4eb243sm3063569plc.141.2022.05.01.09.26.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 09:26:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 06/10] python3-ldap: move to meta-python
Date: Sun,  1 May 2022 09:26:39 -0700
Message-Id: <20220501162643.513646-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220501162643.513646-1-akuster808@gmail.com>
References: <20220501162643.513646-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 May 2022 16:26:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96918

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-networking}/python/python3-ldap_3.4.0.bb              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-networking/recipes-devtools => meta-python/recipes-networking}/python/python3-ldap_3.4.0.bb (100%)

diff --git a/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.0.bb
similarity index 100%
rename from meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb
rename to meta-python/recipes-networking/python/python3-ldap_3.4.0.bb
-- 
2.25.1


