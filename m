Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211D6C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 12:05:47 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.10298.1678968346554300687
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Mar 2023 05:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fwJA3XAh;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id c19so1323979qtn.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 05:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678968345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+tsopzg6qEMwkUtgoNlRRDYOJpgaJEI8O8T0S35mLGw=;
        b=fwJA3XAhM5Yzq71VdKA+HBFzfyq4/xDRz4zRLQY9NGu3ux4AUkUpUSL651+9cB8luV
         n2fFppiv7ypGtJFjd4tO8sE5UIzXQIhwAdU5XTICG9NqiBaS8YXV6KBy+BPOQFHX5A8u
         0i5TdY/E+AFmcfryDc3+tGNE95aRr0YJytyaRBJkDSIc+PSiSXugFt+GFD2HPef0p0J0
         Ruq9s+oOlHan28UM+swYgy6dC9Mc7siUupb9DcjyuqctuQLQkxURgcUSH9QIisUeMtef
         CbFiT9v3WGEmtAgUPnz6wk1t/gJDNtBSJnXWzvF31hqFJpbEwxYdKxjiPNJ0IInryF2/
         0ZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678968345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tsopzg6qEMwkUtgoNlRRDYOJpgaJEI8O8T0S35mLGw=;
        b=7pph8SUPQzvUgGTY68/0VKgjyOUnQI5J9V0XU1jiAQXYj/56an5S7+FI/lD0agzw2j
         ylM87EFDJ/1VT5NjkMgGmvyES6Jx24DmNaoye+bIbUel2Qr6dG151hqEeinB9BhIknou
         oGPMpOK9dzgfXnimd6Asd979zOR1t92GfotOtE0EFb/kFiARXNTYP3jNZNGmIqHxkimk
         E0s1r38B52Tt3Ocaab1pvg7Rsfvll94v+k4MuT4Jeap7s21KIpagWbnAG9z5iU6Clrw5
         mSyIZv+QtPovvyqGr0twkjXLP85TXqV2ZjCqYjCNxL13mKNrT8UoivaIpxymIBDdFhqQ
         0cOQ==
X-Gm-Message-State: AO0yUKW5FxntKvbIkNJCx7bAH7i7k97pHQfbDWJd+z3BaPNboSLPNxMN
	VlidlERaRiuSvVgEvkqW0cD9SqMGF7I=
X-Google-Smtp-Source: AK7set/vJLy6Xw8nSD4aJbCKSAJt/dYczIqJo/tc9OK0Kp+Sdju/xt5+sJ2nLHss44FzvPRhPncEwQ==
X-Received: by 2002:a05:622a:170c:b0:3a8:a84:7ffa with SMTP id h12-20020a05622a170c00b003a80a847ffamr5954722qtk.57.1678968345324;
        Thu, 16 Mar 2023 05:05:45 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6d77:5b42:4248:f526])
        by smtp.gmail.com with ESMTPSA id o6-20020a375a06000000b006fa16fe93bbsm5731677qkb.15.2023.03.16.05.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 05:05:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][langdale][kirkstone][PATCH 1/2] apache2: use /run instead of /var/run for systemd volatile config
Date: Thu, 16 Mar 2023 08:05:43 -0400
Message-Id: <20230316120544.271353-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 12:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101572

From: Yi Zhao <yi.zhao@windriver.com>

Fixes:
systemd-tmpfiles[181]: /etc/tmpfiles.d/apache2-volatile.conf:1:
Line references path below legacy directory /var/run/, updating /var/run/apache2 -> /run/apache2;
please update the tmpfiles.d/ drop-in file accordingly.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f018a6bb3b8400a19cd35b76809edcd545975465)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-httpd/apache2/files/apache2-volatile.conf           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf b/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
index ff2c587046..0852a8859a 100644
--- a/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
+++ b/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
@@ -1,2 +1,2 @@
-d  /var/run/apache2 0755 root root -
+d  /run/apache2 0755 root root -
 d  /var/log/apache2 0755 root root -
-- 
2.25.1


