Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF25C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 22:14:05 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.7534.1742508841492783975
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 15:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LeGqVuI6;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6fedefb1c9cso10202647b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 15:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742508840; x=1743113640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DBCG3agE7mYkC8HUe8hS2O+V8FN5VV4GcERN5PmLLPw=;
        b=LeGqVuI64HgwryfVjzC1Hun80DqdGF8jhZtqFrtVlfsHAo+/ZMsY1wac0SuwhAXb7m
         01URu53nYN4HtN2UO5Ug2F1lpB7RmS3xTLxEerjexOuxV9OR71lVa85YvQSn9m/gZyoY
         ZC7zGhxQx3LfzQON6YvxhQRF4ZmNdckgsbWWiZ+gMHr7hLK9ms1AvJICf56yZGL3wu6q
         dFMQNLCE44IT/jfSPDoLVoFR4Ru0Et8d9uzT6+Shvu+I3SQRwWgmaXr/WJaS2570QSnM
         Mu9ZuzwiPKnQPNjl+GvGTLS4dOR0kae6Q4FChI7Nu7qfnfJHYtVnxu6wvH6yVfQLTXWB
         nnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742508840; x=1743113640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DBCG3agE7mYkC8HUe8hS2O+V8FN5VV4GcERN5PmLLPw=;
        b=mdrcDItVqHfHf0xYtETrb3cF1r3VW9PkAIl+evuXAqu5NsekPpdO4IZm5HgFZAiqLa
         KXu9YQbz8xedYGMwVGnTbcr85IeZndygztmxJsblFVna8qNC0917R1D5H20vftHBjYRu
         GlC+hsPG3dpT8FHojwRWq23vq6FLp2AoYByoKcix1+Q+cddjeG4/mcIzDky0y79u3+Qe
         fiDoTjfS1RvzH+t3Qhijau0tcD6EuTLa+BeFwEVrBc8e2+PJmsRczNVoQ3Pxye5lWT74
         d9CJwDTfyeF0GJUAJP3kzqB8jJiVNzimqb32j3P5gxh2leOBTtUTjRg3gMhyDjnCJERl
         kzVg==
X-Gm-Message-State: AOJu0Yzz3TSFeMfV4r0mM+gK+/AvSo6lyz8bBFA8wuOoOzPYKAd9grSD
	vL+3qvXHxtv0hhM6f/OvDEDYywI9EBHSzVJjCN89+KFTvIVFuOBlyO76EMk1
X-Gm-Gg: ASbGncvqFF5MJv/lwKIeix/9S5lgM8vudVSVgE7+Np4e+dF4r12xFXGUHr+1pwEhcQ9
	nsZcLRlzJ8kzan64vtgDeR75g4RX6p4CLPTttmIwFVJ0T5rKOdMKXMO7dC0ll6KabFjG4KERj9w
	Ru8Gz8QgHUpaAdMK268yRKvGHJlGKJKRtQ3ko7D82PBA/tNjP2CrgBqcHuZl+55B7qkQgkE03cd
	RW1/HSuL9kT0MyWl8f5QKPXYNM2WX9T2y9Kl0SZFCL0nBzLRbU2QN+uuNRsNrKdSVtEi2o/9bZW
	MvFkn3+nsXrrEXgSBFf39ch/+m68Zfgxr+vAu160JlUBhvFWBA==
X-Google-Smtp-Source: AGHT+IEkPO6YnNZNC0We9Ns+RDkn+EDp/5+v7BF7briAXo4DlwPWl7Fk2W0E2+Ad+wHnmYPf9yNEwQ==
X-Received: by 2002:a05:690c:fca:b0:6ff:28b2:50e1 with SMTP id 00721157ae682-700babf3152mr13038427b3.2.1742508840028;
        Thu, 20 Mar 2025 15:14:00 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-700ba85bc6dsm1165137b3.91.2025.03.20.15.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:13:59 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] hiawatha: upgrade 11.1 -> 11.2
Date: Thu, 20 Mar 2025 18:13:20 -0400
Message-ID: <20250320221320.4561-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 22:14:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116149

  Changelog: https://hiawatha.leisink.net/changelog

    mbed TLS updated to 3.2.1.
    Small improvements.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../hiawatha/{hiawatha_11.1.bb => hiawatha_11.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_11.1.bb => hiawatha_11.2.bb} (97%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.1.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.2.bb
similarity index 97%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_11.1.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_11.2.bb
index b016d19ea6..243017d593 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.1.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://hiawatha.leisink.net/files/hiawatha-${PV}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 
-SRC_URI[sha256sum] = "802d1cedcb9612fa1abba650fac7224b33e7410a17e0045c66a75413c9195e64"
+SRC_URI[sha256sum] = "99c64f76927f93469f062ab76b74eb79a397ea4be12da86bf746b2bb57cf1bc5"
 
 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"
-- 
2.43.0


