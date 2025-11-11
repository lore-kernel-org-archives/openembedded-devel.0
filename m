Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48864CD13D2
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:38:07 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13808.1762853885044802657
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:38:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kdlnI0s/;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b9ab6cdf64bso326544a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853884; x=1763458684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ig6tDXDhzWD8YlUMBTh2Nm2UERsBNoR62oVB9KIvcxg=;
        b=kdlnI0s/l9ADd4HKeF/saGV7HDOHFF4YV+UiEuS93QeImdhe03KojRGUVnsiZBkb4x
         snIwFlCN6QVUkQr8W6W8qqogrHSH2u1qVosyxfmqiDYyPOP9ObUq3qDn7vnF77JN4BXp
         SQFnJ5wk0+ZF5h3oSvyREypEJ/66c+dxfbn41L0SVKPeqQjeGxVWGgWDK32IFBKEX8Ls
         sPn3MSUj/IQdl6vj7omNoXCzv99tA9Glryh1taa8lenDRbKggOYa0XLMtSQf2vt8ZfyL
         U+Ez1HHGJs4ATA0cBjg8B8idIz7Fy2/Q/PXB57JJL+k7YlU8GI22aN+tzO+2jnqduYRo
         n4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853884; x=1763458684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ig6tDXDhzWD8YlUMBTh2Nm2UERsBNoR62oVB9KIvcxg=;
        b=JB77ZEAvCSkKuPv+sK1/FTt+WjFatTkTeKC8ahG+rk99wisyIevMtpw0al/+U7wGnl
         Ruj6XeQP7JrElc43yGvN2duu5zkLpBDuk98iBePl0xh18Ay3zti9EJ9BJr63C6zdNkRR
         /PIUmSM2a2P36zpjFA8Z0XgUpFiwfWVOH6bFksbv21Bq5mgmBnnONgafN8a/yS8TkE7e
         GiZIlRbXTPjhChDpCVYLGChP4IW4B9K5Xav8OCbjDbqeF9uIaz1tDg8xlHNqaXWiAy5D
         dqfPNeR/FhKD1OU2pT/9G418T/U3ymJV1fMugrPGfUwXbjSRSRahgaqj3goASa/6wLHz
         wVUQ==
X-Gm-Message-State: AOJu0YzN56QBE4kECZI5Q0cLWbwlbt4tx2AthnO1X+6FEr323PQ6MsXV
	/LKGjAmw38hezeMaeHD9pIYq56f/ApRA1rlJJ9Lqe77XClAYvwyRWkakxAa1/ERPsXs=
X-Gm-Gg: ASbGncsUpYKVMMB7P2lLnFIuJpLUTwGvx37a47VvVmMdMXBAyJagk8jYc0dlMb6B9Q0
	0ZA6AMUZ3mSNPTesTEf7AWy7Whgxz+RLCUJQtrB1MkDdB82xcvJNN0Ez/ePDpz+HUvtqi2qD+37
	syvYtmgyf9fb++zN13NcgJrf+Nvv1jIvVNANFdsnjGkLRwhS6QA3YlTZn7e27En6CvRfg8lv2Ca
	4lZ6aY5a9W33qK2yCk4c1EkvvRlrdpRyAlAX7uJM7IngqIurEr54AnuMWEyzF/Jx2kR23IuXPW9
	MhPMwgNQhljScppsigfA8laIxgoUfRArYtJOr0Yt+xn9ewpiQ6vHMdo462p8XgkGpDbNlNTiNwM
	Jx3vhVdkO1OR4UvK3XVt1bPyL6/9A7698LCgjyD4NdxEX01I38uPv0MNM8ju2+CynKMaW/yV3AC
	B3p21ptS0gPszVLg==
X-Google-Smtp-Source: AGHT+IGdqV3PDL/1VT4mum3G6QasFE7ohI2wIZE2Zce+UMUng/J+J3AVK1wqkCnxznPb+TIPZA9WWw==
X-Received: by 2002:a17:902:fc4f:b0:297:f856:fbc1 with SMTP id d9443c01a7336-298408425a8mr34152565ad.15.1762853884240;
        Tue, 11 Nov 2025 01:38:04 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:38:03 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 09/18] postfix: upgrade 3.8.6 -> 3.8.9
Date: Tue, 11 Nov 2025 22:37:24 +1300
Message-ID: <20251111093733.1393568-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
References: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121512

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-3.8.9.HISTORY

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9e656e3ac21523260ea9a5b8a84c6853898a2b05)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../postfix/{postfix_3.8.6.bb => postfix_3.8.9.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.8.6.bb => postfix_3.8.9.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb b/meta-networking/recipes-daemons/postfix/postfix_3.8.9.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.8.9.bb
index b0ac51a9dd..1df5d1b415 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.8.9.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0006-postfix-add-preliminary-setting.patch \
            "
 
-SRC_URI[sha256sum] = "4b6e17c826cc438cc3016a9c0a55ea7e77c6cbafba7dd57241d81b690b0e9774"
+SRC_URI[sha256sum] = "d0205a11e36d57b640daaa17a7e7166b8abc730d93b1db7e92e32dfb24bbfde1"
 
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.8(\.\d+)+).tar.gz"
 

