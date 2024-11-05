Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B72D40D10
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.30872.1730840242760692842
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:57:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IGel8pu3;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ea85f7f445so32399127b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840242; x=1731445042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHBCuXG37qm6u8MBf512tJX9iF1Z6OlDoer3ENuOMiU=;
        b=IGel8pu3LlTYxr9p+zqIkXOXkuo2s54+BMSNixnzzlMdaLLbWIA1/kroVBmXlcRXdX
         L6bO+aAJnCdUg/a0kaOS9j+DI2XcDUV8oYiVcyviAxbeW9f+CbJ/ppd5krMb/uwYc1gp
         CZK27X0pTqFjY6hyQYQntvpzEi3ytOA9PjlR0oCLXeXZEbZpDIWPh0zq3KGCNxaSQyBI
         fjcC/s40Q00IDSEQblF8SBv+NDkn+8kgfcHWWqQhTj1v72skPFA8S5iYcAWZmW/63gti
         V8ac/SnoQ0wyTRjZ4uV5HOVcVibF2Lk64E2u6sh2fCWdJ2zNzDGiffAB850GdZuimNh/
         1L0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840242; x=1731445042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHBCuXG37qm6u8MBf512tJX9iF1Z6OlDoer3ENuOMiU=;
        b=FWys8RwYI5uAN1Mr1ElPho8ZgEagJGdLx0pXrbqJkqdCnqQewMbVg1vULKfQbaaeQs
         3rfuHRCAsHsKlThnRua15LeYDDJFtwdqskBOzfvFMhsitPfbhDkDzTdCaet9v1UMDo5y
         LV+U0a6zXKLGMndwQlscOkLtpG8T5I24GoeCosYdMn5m2KDr5HGAGgadap9jAVvn2c+n
         7ieGw9OVWq+BkxVTYGXkVeUYufGCyGla16AeW2C7zGXbpVtStmVV4Qz5uFM1tsPVFmVV
         NYrMGyPLv34IiZwfzDVTozYL5j8MLMif9aFKz3DkAXVMdazDDHBJmCZI2+DunHhkYxEu
         dclQ==
X-Gm-Message-State: AOJu0YzkIzpna2eIJ9d++FJub6exZFc7KuuSuV01SJDJL3s8TAqRMFcu
	3cdfDSkN5CRM2fdyFlYlBQMq3epHH7BA0snVQDN7uM1e4Qj82lgw0nc2z9ng
X-Google-Smtp-Source: AGHT+IEaS+B1r8birZQ+shsaNRSwla18pDLzaHR2Qd6iLdFPwrcuCBCsgR+O0cvSc/1MdmBjACFwPw==
X-Received: by 2002:a05:690c:c94:b0:6ea:9d16:929a with SMTP id 00721157ae682-6ea9d172301mr92812007b3.4.1730840241328;
        Tue, 05 Nov 2024 12:57:21 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.12.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:57:21 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 148/161] procmail: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:46:54 -0500
Message-ID: <20241105204707.4155-148-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113664

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/procmail/procmail_3.22.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index abb87f993..3623bd777 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -13,7 +13,6 @@ SRC_URI = "http://www.ring.gr.jp/archives/net/mail/${BPN}/${BP}.tar.gz \
     file://from-debian-to-modify-parameters.patch \
     file://from-debian-to-fix-man-file.patch \
     file://man-file-mailstat.1-from-debian.patch"
-SRC_URI[md5sum] = "1678ea99b973eb77eda4ecf6acae53f1"
 SRC_URI[sha256sum] = "087c75b34dd33d8b9df5afe9e42801c9395f4bf373a784d9bc97153b0062e117"
 
 LICENSE = "GPL-2.0-only & Artistic-1.0"
-- 
2.43.0


