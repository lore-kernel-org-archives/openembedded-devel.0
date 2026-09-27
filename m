Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E2BC98324
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:14 +0000 (UTC)
Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35354.1790506269180023578
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RQWScnpx;
 spf=pass (domain: gmail.com, ip: 74.125.228.40, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8804c1728f9so1564861b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506268; x=1791111068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eNc7Jg06U5BRKDDDkrjUfsX0TcbOw+toK20TGezihSI=;
        b=RQWScnpx1a6drQboF/6lJAmx9xVYscMEmbt0PvmMWTJ33055YeztKfA02SFTJFLxcw
         lCRwwSOTKyIY+QSJS/o+6RosilpLGe1egyp78yR0oa8kHUj+Xx2/YQET+B2/F4BOiT7N
         NPUBkp2iF5EwYFz890G/GeCQX8ZfEb/2r9EoFyHXfKhCPLRr31sIBOGV3kV+at56XKY5
         egRinLRM3fyf4kiHZuzyNcwYINoVWjHbCp3+kcH7nB/2UugSkrm0pae8uMGyWU37yM2l
         zIQaSL+sXZXtsGmsK3PIUkUCLnej7HRDxHO/Gl+Ki8KpqNby2S2no0ue9S+YkJBeKTpf
         7rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506268; x=1791111068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eNc7Jg06U5BRKDDDkrjUfsX0TcbOw+toK20TGezihSI=;
        b=2qTtpkQaOUFYpU4qcqPd2AVmO0xdKAIsuHvOab1IqpAIuCyOBkAZJ2cqoMVuT6MX6G
         VCjweJXrKuH0B87gvRSwaImzEC63U0R4S1+p7eBPvrp6eGmBFBNDYUp4Wwb3xYyGsPJ6
         1JTC+vgJgk6CMXW+x92DEW6NcdAm22BxMDGhrltmocQm3AuTyThYSiJ9j0T/QI7llUmw
         dwT20yPYPCW5j2mCxMSRctdHP7Hw5BxG8kFEuFNlTbMp78bjNE3Dipgda3pHYxgcf97P
         qGFbFIDUOrtEYN6XQ72ZoMYQlYTtD794yb/JQGC77EIbdogHBtbrNO1vqYSvxNX7CT/d
         m7sw==
X-Gm-Message-State: AFuF++k+6JqodpKTo2fkau6RvIilSO/qyNfmRMx4ciqRwK/7o3mHf6eB
	/9knhR3C+qoDgPQNs7zU76qsOSyaRmAAqFvHZFvBqIooL0aXbreNGRuaxioBDw==
X-Gm-Gg: AYBFou2sYgoqeSzItiWQ9ybHYND+3JVQRNAiQPovlF/4y8QdoP2OGM1fdR7db9UJMGt
	cI5ByAbsIjtcEbq/XZ8VQj4Z0G7GBYrBKqYWRCpN3GVd+3bDNTKUzQ280lRFuLFK5P9WbfaKOxX
	p4hF/EE2AUB30uiJ69qcX5APK0udxaXJ9urL616oosqXDcaItVtnFxXWUaicwE/YiAW1NxT2t39
	6WG72Pl9Oj1N5tS/Qc5WrTt8X+RtL4fMMocq3DGAbNiA0TBDoRzBquINqaTrs2juOCZMAKYpMWq
	LZX1vlEFWeVyXUz8i59a3dCc7UiBtoQhoVYlsNKiiQpXh6Z+8OzyKE1ZMfOoREKYQnNh07E0nOQ
	pYxEfKGDAIR9SKLLbNXKBKuXNFiIV61Lm95zBuqbe54Zlxjxho/PIDln/JuQ34TUU5evv3mQ6gr
	mxcsx/4bq7hm9aABoe+rkF7tblL7crGSCRCTXxAlZxN4xl9UvwlEhvQcUIwSQujdGy68gaqd5O1
	skTTOLpRdVI6JCS87+XDSd5fQ==
X-Received: by 2002:a05:6a20:d492:b0:3de:4976:a0fe with SMTP id adf61e73a8af0-3de4976baf2mr2590272637.64.1790506268547;
        Sun, 27 Sep 2026 03:51:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:51:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 22/35] rabbitmq-c: upgrade 0.17.0 -> 0.18.0
Date: Sun, 27 Sep 2026 23:49:49 +1300
Message-ID: <20260927105002.1832451-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130356

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/alanxz/rabbitmq-c/releases/tag/v0.18.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../rabbitmq-c/{rabbitmq-c_0.17.0.bb => rabbitmq-c_0.18.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.17.0.bb => rabbitmq-c_0.18.0.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.17.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.18.0.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.17.0.bb
rename to meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.18.0.bb
index 05179c0230..afeb5141f4 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.17.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.18.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 
 SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https;tag=v${PV} \
 "
-SRCREV = "59df173fff72857896a8257bbfb72d9d29175f1e"
+SRCREV = "b0b5f3774a216bcae9f31645c4ab581f718bd211"
 
 
 DEPENDS = "popt openssl"

