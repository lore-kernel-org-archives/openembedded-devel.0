Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20D7C48BF3
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 13:26:19 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.12780.1700054774956162793
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 05:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lcP1G/U3;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a82c2eb50cso70551737b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 05:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700054774; x=1700659574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEhzZ+7WX0zSE4zE8mznQDVmr1mDf9rqPnnKZ9jcdR8=;
        b=lcP1G/U3sCmIcfyDU3bSsrPPYuC+B5ZPkH7ixaiA7+AfIzMIoJDmMFbOvIVuJiS8m5
         bpX5y+2oNXKJh5fX+PAIgyncS4p5n8sCWVwdmnKekrzKtcG2rzsRo4Nzr3Q+qRvuWKy/
         XoLhT9xQaWtgKZmZehdTtaTOWLcqn2J0rYN4C3C7N+5iDGINl9P5EuS0CCoh/fHmmzRC
         PhxnFsZCsABJ6JnEQDNezL+vs1KC9WLaS9DwlZWm9TXvtIkpC8W9agAF665qZ/6jQWKu
         Io/+j/Zo+niQbcMpY6zOJmwWLhuUp7K/nHRKmXeeYWhycSXulT9leq28d2vqezSpyO/K
         MTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700054774; x=1700659574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEhzZ+7WX0zSE4zE8mznQDVmr1mDf9rqPnnKZ9jcdR8=;
        b=akwJ9udisszb99OA9TePoXRifcoTtOJvS1CAtPV5OlLQXTEVd30z90nJ4tf+Jdudgl
         ES7p7e2IRBXesPMGicLBfOidrJNXSFvkJ+ic8+y8b4mSfq0dqpII/nsy8oTb3NsUsdMX
         zyaNpDTUHygUzj5WPqLGwE7pTi1Eq301K2gzG1MIyXpZRAhGjDTCBPLzxMa9HR3uAz6t
         2DBapVvdCN+EffHeb72EF8DFL3Al8QVPOeKEhJmzHGUycduxBSmAYbp751ST8FI5Tc+h
         Q9YIVXTXGnjt+cwv0NEg7xQGqjBNxUFON3rQwFsZ/4zvvdC4bmpmUkjJy2n8lFMppvnS
         ulwQ==
X-Gm-Message-State: AOJu0YzrIt9OaW/6vqdccJoW6r36g/yUgBeUBNkEta7GluIymGu+Yqa+
	J34cRqEiCEYL4IrgyVqkDhxeFuoMml4=
X-Google-Smtp-Source: AGHT+IHoDabX467m/jNGyBbfIhnyeCBsfQsBEUcX3DizqdLeXqTChcWqUgVC4bKDdVvKKgxqhUkuow==
X-Received: by 2002:a0d:df4e:0:b0:5af:7330:9f1e with SMTP id i75-20020a0ddf4e000000b005af73309f1emr11289420ywe.28.1700054773717;
        Wed, 15 Nov 2023 05:26:13 -0800 (PST)
Received: from keaua.. ([12.110.163.194])
        by smtp.gmail.com with ESMTPSA id r68-20020a818147000000b0059a34cfa2a5sm365846ywf.67.2023.11.15.05.26.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 05:26:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/3] MAINTANERS: drop netkit
Date: Wed, 15 Nov 2023 08:26:10 -0500
Message-Id: <20231115132611.16589-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115132611.16589-1-akuster808@gmail.com>
References: <20231115132611.16589-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 13:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106757

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/MAINTAINERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index ce53ec471b..dc549d7582 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -34,10 +34,6 @@ S:      Maintained
 F:      conf
 F:      recipes-*
 
-NETKIT
-M:      Armin Kuster <akuster808@gmail.com>
-F:      recipes-netkit
-
 OPENTHREAD
 M:      Stefan Schmidt <stefan@datenfreihafen.org>
 F:      recipes-connectivity/openthread/
-- 
2.34.1


