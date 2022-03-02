Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF167C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 18:57:51 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.1554.1646247471436903463
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 10:57:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d7dL+vAE;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 m13-20020a17090aab0d00b001bbe267d4d1so4557633pjq.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 10:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xrEioQaiNUZKzbAgnxw158XgKbV6sCVKlyODqXzkixk=;
        b=d7dL+vAE1zVfVNS08OFwmoxD9xXnM/DaRNyQvKCtJRU1+/Zmv6TqvfQTJ3SDkuGrWY
         V884DYiX8guPgSA+cgRb9W9fykOkpyO/vMzQkwiQadPP8utbXFBN1FFM98gYFHf/B8vX
         GZW5TBzbRk8vDzukYO++eHZ0Tq7jwktB8JoqqdnZt8ykM9GAFuIuLqT99f53jNzGTPXl
         orl8zvZrH7kjZSH3kwPRE659Y/DUpC8n55RsoIiCQeMGvytfxEG0weHtbzjO1NlA6OVu
         JnfBWOipHW0Co0QJAR6Ezza+t/KXn+OayUrVOpQJ2nSCGK6VIHIWRU7dpCjfOJHuLbLk
         A0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xrEioQaiNUZKzbAgnxw158XgKbV6sCVKlyODqXzkixk=;
        b=gAl+zktNDJ4ed4YZavUQ80xQ9AACa3E+4Kau/3D+R/Tu53xaD8q6sbRqlO3xSq3Ly0
         xB0up+6LwFhiyYjF67Uz1N+8y9NQG8j/9reu4J3ZNYCi8UAAJyj5K+Ia8O/2gYnhwEey
         LwvKg24rvWmCd79gF+VqxcNNQfNloVD3tLflJpRJeV0SIoSduSkIqezw+sb30pUP1nKU
         qBukIuk0IeH1ZJbHE9/UKeGHbY24g33pHZt5RfvpXT/5yYK07mcRkdGUDWX45AhmndDE
         AdGhL/7xY8xyQrKmcWcvLtADtXoCg5tyORzYxk1Ssl5scpD10IaTsucjbNpgsStPZ3Zn
         Z6hw==
X-Gm-Message-State: AOAM533WJyOy//MQBLMmF0QWWeamjpFTMkRmhGnmJrSxXSNRMaxd4CzC
	KE+dBnNdRheCD9UDeOuaPwT0tBTVm6eSUg==
X-Google-Smtp-Source: 
 ABdhPJyJJT7BvVj4fJu+02KDpXVm8WmpFy4DArospmOk01R47qEYfCsykfgHl+aCE7/bOAi+BzzQIA==
X-Received: by 2002:a17:90a:160f:b0:1b8:ab45:d287 with SMTP id
 n15-20020a17090a160f00b001b8ab45d287mr1209929pja.91.1646247470736;
        Wed, 02 Mar 2022 10:57:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1a20])
        by smtp.gmail.com with ESMTPSA id
 nn10-20020a17090b38ca00b001bc3a60b324sm5560011pjb.46.2022.03.02.10.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 10:57:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/5] python3-cson: Define PIP_INSTALL_PACKAGE
Date: Wed,  2 Mar 2022 10:57:44 -0800
Message-Id: <20220302185746.2402043-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220302185746.2402043-1-raj.khem@gmail.com>
References: <20220302185746.2402043-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 18:57:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95701

Fixes build with wheel packaging

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-extended/python-cson/python3-cson_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/python-cson/python3-cson_git.bb b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
index 5d696b30f7..c4fcc61ec0 100644
--- a/meta-python/recipes-extended/python-cson/python3-cson_git.bb
+++ b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
@@ -17,5 +17,7 @@ DEPENDS:append:class-native = " python-native "
 
 inherit setuptools3
 
+PIP_INSTALL_PACKAGE = "python_cson"
+
 BBCLASSEXTEND = "native"
 
-- 
2.35.1


