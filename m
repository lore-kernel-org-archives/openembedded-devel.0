Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D60010ED650
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 09:59:28 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69351.1774605564688553298
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 02:59:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PhucjHkY;
 spf=pass (domain: mvista.com, ip: 209.85.210.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8296d553142so1038950b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 02:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774605564; x=1775210364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xLdNZ1MoT9CMdeIQHX66TDygD0KgZoe8UxEoVAPyNQM=;
        b=PhucjHkYMWZQpDqdgB2iUyTSlZEuRrrn6elJ8GGILaLP+M3iI1se5DJe3RMs2gmCHG
         tYOoOGn/m8KXsXfdAMNbQCHee8MC22y+BJpJXZpYKhnGG0rnWhdG1Si+G/vvfS4zKZzA
         +bQGr1F9W7exmo+065u40QsdlDWspwqP1cCrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774605564; x=1775210364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLdNZ1MoT9CMdeIQHX66TDygD0KgZoe8UxEoVAPyNQM=;
        b=GI0E97hYIjlHEgC4dYdBvpPOEZyNglfNcAxNSwm563ZZLbc2maONLqFDwVvBxQ4b22
         OMSqYvuUFTgzwnHe5LmGpruAgy4X2IY3gsMN7jjpym+l08jJvQmwWd+yx85l8TyvN9y9
         SfGphvwpA7rjjZTcTR5JI9vDpT1ZSuCDzqZsgEcfGJrf7x2HSJyELIOdTkcnfG6+Qcz2
         /xs11M2+qyXaVOqD4Tn6EFFYxRh4yav1Y5Hdzi0sW95tiSpPRkYI0ILQKxg4U8XS/C2M
         rWJ6ltZTOS6kay2NdhH1cBcfXpfR5DEaHBN+jrQXiFdd276oU9s8SC67D6XH2GRa/ly5
         kBWw==
X-Gm-Message-State: AOJu0YyT+ZsB2kKLPqZYC3ywNgYhLOnYQIfwDCFd05nXrH4ObijnnOcl
	UtsDyg1kr08Huk5+wtDr4lvvO3xvY29iF3xqpIPwQTIsYZWYcqz3NBRdKTFUolmBZ4G1aZULR1+
	rL50v+Po=
X-Gm-Gg: ATEYQzzzYx/YJl+cC2l5GcSre+rpnQEAXNyN5Pj3/OmVTLgH63KGRJI3mqAjomH5OoO
	dz5+t5hg7n6Teeq6bLKw2a8WifI/2G7pech2kggh4dbBSkyDwAVuUHNpOPYVA62xE7Jko/zsEWp
	56V9T7BTEjKvHiGI+66pgYSCDdbXOB96/HYyv+6lfISMkh7RhVjOegY0oyCcmBC3ON/CJKzEFjB
	rzVWoIiuaywEt1zxE2WzZ3iq3ZWkEjpSx2WMjbKIGcGs+xrAvVM9TGk361jxedop7IAwl0Is0km
	sHWMYhwj3XoYRAyMQw9yZBkRPVMhZWz+hyaDUqiteNfCrZSXjBdpw0riwqx3UKpOE4CQd9XOQSl
	/x8tQBaju7Eoh8aNbUtToQIDDY6Bk9ckw7qi48ePcHEZ6Y9SRyw6yIn/vkTfRZGJG69yLn9QWlW
	nR+4eqVBY7yeNDQFR1SqGKPAZBE7LcMQ5rGv99
X-Received: by 2002:a05:6a00:340b:b0:827:32d7:6690 with SMTP id d2e1a72fcca58-82c95c279ffmr2019628b3a.13.1774605563654;
        Fri, 27 Mar 2026 02:59:23 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:2bec:d28a:4e57:2e4f:db70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d400f62sm4695453b3a.55.2026.03.27.02.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:59:23 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/2] libssh: Update CVE-2026-0966-2.patch
Date: Fri, 27 Mar 2026 15:29:03 +0530
Message-Id: <20260327095904.54402-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 09:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125784

From: Vijay Anusuri <vanusuri@mvista.com>

Corrected the ssh_print_hexa to ssh_print_hash in the patch

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
index 9a035dbc1e..7162a47488 100644
--- a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
@@ -40,7 +40,7 @@ index 008ccb4e..bdd7489c 100644
          case SSH_KNOWN_HOSTS_CHANGED:
              fprintf(stderr, "Host key for server changed: it is now:\n");
 -            ssh_print_hexa("Public key hash", hash, hlen);
-+            ssh_print_hexa(SSH_PUBLICKEY_HASH_SHA256, hash, hlen);
++            ssh_print_hash(SSH_PUBLICKEY_HASH_SHA256, hash, hlen);
              fprintf(stderr, "For security reasons, connection will be stopped\n");
              ssh_clean_pubkey_hash(&hash);
  
-- 
2.25.1


