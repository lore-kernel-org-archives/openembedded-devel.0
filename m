Return-Path: <arthur.oliveira@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFA5C0018A
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 13:10:45 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.51459.1699017045187256895
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 06:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20230601.gappssmtp.com header.s=20230601 header.b=SqHL0riD;
 spf=pass (domain: ossystems.com.br, ip: 209.85.128.182, mailfrom: arthur.oliveira@ossystems.com.br)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5a7c08b7744so23989577b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 06:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20230601.gappssmtp.com; s=20230601; t=1699017044; x=1699621844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uiweSif1voSgbnlABYPVbzMk9k/bEjV2yYH85SjPYc=;
        b=SqHL0riDPERAsJXaPBKrqHU9HEQykZL6MXppOV4UiAl2xzurwcxDJ/yBzSvrN27zvi
         QRuJ2w+DqNz/4woSyhXiiwh3loRchr7531gy8MCHkcnJXcLzurUbfr2/Eu9kgy3rINrd
         I+Z42x/XzRqQbIIT8fUdsPHD2nfM/RS1RzfhB6hkjBpUxyi8H6d6QRW0O83OXQhj6yA6
         TJjN/mn2ImIa4c/YWjSC4CJwOocW3Om8A0EbAhlxtwPNQvsmzIzKdps2aW5gS3TbBGcT
         flyuzIcjjL94icKBu+0bBDMrciHfKCe1wC/F5yjPXIXRYUhtl5zqAYETcZdkYUf1SYv8
         ZkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699017044; x=1699621844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uiweSif1voSgbnlABYPVbzMk9k/bEjV2yYH85SjPYc=;
        b=RyNbkZdO58ZdD/FuRfdxC44aOAWPsAZzIKobhtvqnzaYnlvaZNJKYTjDbUAeG+N1NX
         9EUYKqb4e7M7SVBm9Ega3/yL8mhVOQD9378KUorzq+qP397eA7Z9MBu0bIW3EnWq4eyY
         Ao0iZbqyNSw3eHAMUVmoD60LIviuZVbdd/xmexdsx2+jgPMCF4GkEwoiufR7i28vsRGs
         UGGR1hvk2BI+Qyv6ng1mY2rwYsorGGNZIgdHcfewSt6lwctlKth1m/e7Q+qNoYsGRrR2
         EGuj1qXhb2Au+tQNFCLdCYXUnuBltAozDhF3BeQbJ4ZEa5e7Cv0To+2HdUK/4jyHV7cD
         xW2A==
X-Gm-Message-State: AOJu0Yyq5I0O0zH2D0lUceK1zbbWF1kV606VhH1KXYrpx1YdHMe35+Vy
	nxF0yVASb8d3SbcCDeamagsYi+jko5xOH/wxZrIBww==
X-Google-Smtp-Source: AGHT+IHieTUvd2pU6LYLMUc0R7sJwZoZ7DEfkjiTjYqLJqGBL6/oIF6aw+AIup6VMXZjfRdWn7YTIQ==
X-Received: by 2002:a81:7184:0:b0:59b:61c2:e8db with SMTP id m126-20020a817184000000b0059b61c2e8dbmr2858549ywc.49.1699017043916;
        Fri, 03 Nov 2023 06:10:43 -0700 (PDT)
Received: from hyper.lab.ossystems (189-11-177-132.user3p.brasiltelecom.net.br. [189.11.177.132])
        by smtp.gmail.com with ESMTPSA id z145-20020a0dd797000000b005a0f9718a5fsm894927ywd.78.2023.11.03.06.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 06:10:43 -0700 (PDT)
From: arthur.oliveira@ossystems.com.br
To: openembedded-devel@lists.openembedded.org
Cc: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
Subject: [meta-python][PATCH 2/3] python3-objectpath: Add ObjectPath Python Recipe
Date: Fri,  3 Nov 2023 10:10:36 -0300
Message-Id: <20231103131037.2997335-3-arthur.oliveira@ossystems.com.br>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103131037.2997335-1-arthur.oliveira@ossystems.com.br>
References: <20231103131037.2997335-1-arthur.oliveira@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 13:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105859

From: Arthur Oliveira <arthur.oliveira@ossystems.com.br>

This commit includes the python3-objectpath recipe, which introduces the agile
NoSQL query language for semi-structured data. It is licensed under MIT.

Signed-off-by: Arthur Oliveira <arthur.oliveira@ossystems.com.br>
---
 .../recipes-devtools/python/python3-objectpath_0.6.1.bb  | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-objectpath_0.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-objectpath_0.6.1.bb b/meta-python/recipes-devtools/python/python3-objectpath_0.6.1.bb
new file mode 100644
index 000000000..6e82dc13b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-objectpath_0.6.1.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "The agile NoSQL query language for semi-structured data"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
+
+DEPENDS += "dtc-native"
+
+SRC_URI[sha256sum] = "461263136c79292e42431fbb85cdcaac4c6a256f6b1aa5b3ae9316e4965ad819"
+
+inherit pypi setuptools3
-- 
2.39.2


