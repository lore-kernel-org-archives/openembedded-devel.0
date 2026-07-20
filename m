Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3748C44524
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:42 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11424.1784590776344847863
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xsgnosng;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cea3004256so123212695ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590776; x=1785195576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKX5vHha/YN45+6Jo07GLYhnJ6IddIpMAmt+4BFLZ8Y=;
        b=XsgnosngZdeIuif/SSZa7pUgFcqg2RxjipshMb8zFnvOqOh+fjQieH9pS9ZsV4qlPN
         7xZiDRMpDP/oYppofN2ru87gMmOH6x8aPsZfMvI9lk2QF9h8FVbhRMD9Ds1UDqdPbPtM
         yjqccmgw9KoxKScuwN3ujSyNw9qUGjSWxolckJRCfMEZwgx625+GsPV/lVjoOpdPQDjj
         2W/mlAbEiOYKTkqWSWRDWe81JqYJyl71CJTVmhSBIZd2oaqaw1BnjCygp0b07BJOAQmo
         WtlE7RN49CZhLHZ4Hu8Hc5ytsyO2RTA4Hm0F+jZEZAlxzXZHdqCwuz4R+RHc3svLvet+
         r/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590776; x=1785195576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKX5vHha/YN45+6Jo07GLYhnJ6IddIpMAmt+4BFLZ8Y=;
        b=Vbsut1Hby9u5tMZQ0iSl0b6M2pftz7mO4v3A+bJqcBAx8UXIA2i/duk46ldWgT8qqg
         B77CUYgfyH146cEeavNjQCRqlo3sW0JIDIMpY8zy8MV9b2vVMSthmXkfZxQ2nR3qDpj5
         FRVq8JEMEUj2OkDpAcvprwnndIZ9KQ9SWcBD2fe2ithT/3m78ISf7yKpvCKC/cewjQu8
         JkAv+34p/GLWoDQh9x72TTCMkktX4yOgqaAzUyp6nA1f6F0Ohn4FQKi+QMWkhgM1J3s0
         wjeeUjVFpt8mSRYIe9oVH/xXJY99r7MP2IOiGIZ/0O8caUmXGVqv0LkmzDDaqWlcezyn
         TOlA==
X-Gm-Message-State: AOJu0YwmuzCU8McjiDKuRnVHGAX42gW4tvFPVIr7vG7Ng1A3EMTP3AW+
	po3dM04itKnTrIr5Fh8nzhFZlVAtqcvVfYiacWER+GxJY0ChdQRC3+ld9DPV0g==
X-Gm-Gg: AR+sD10AiSKDkAza5zrZCXFp3TDgjz9e/zbwVhRR/Rez75K8LUWAh+3CAhoS88IpjxD
	alv2na3epMs2MdGB0oDU95DwcwtnrIROW4ip7maNhj8p8wU9WEoBSZZxbbnzJkNGgLzU2CLh30F
	e6NhEJvJejgbv0b7a1X1Ab0Cl+pqW7XxKEWDzrWJoi2oc5MmBA4IoixqM4eUD6ygnCxwhG/dOHq
	BZlFxNikQE9LwyZai7OojH1Z/ttZB6bQxON63C+dvJT7T/6XnEZ5NgUy5GwUxYbkaWhh4Zk4Dho
	jxORYTH1VhSCpoAu/vIFyMBRHK/hOkGOWuKvNRdvZp3K264M4Qhz71thDKcnM/rQh6isxE/WU+B
	KuIMI00r5c2GLj3wfbP5pRRSfuu/OXxRlO4XMqP8Bd+t5x8bhhjezAF/9u0Zle+yiuhzWohtOqF
	2EC/5sLk6cc7Q4ibE=
X-Received: by 2002:a17:903:3805:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2cf813177admr8720385ad.13.1784590775682;
        Mon, 20 Jul 2026 16:39:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:39:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 28/30] postfix: upgrade 3.10.10 -> 3.10.12
Date: Tue, 21 Jul 2026 11:38:09 +1200
Message-ID: <20260720233811.2324493-28-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128329

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

http://www.postfix.org/announcements/postfix-3.11.4.html
http://www.postfix.org/announcements/postfix-3.11.5.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../postfix/{postfix_3.10.10.bb => postfix_3.10.12.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.10.bb => postfix_3.10.12.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.10.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.12.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.10.10.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.10.12.bb
index 5a9d77720e..3d78fa15cf 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.10.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.12.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-makedefs-Account-for-linux-7.x-version.patch \
            "
 
-SRC_URI[sha256sum] = "3b7197e00a98f7fe4624cf51a00ad805674256eff624e678529ccfbf2c7707a4"
+SRC_URI[sha256sum] = "f9ff299f92e4179706537bda288971f4b6eff7e70aa912d03da3cd1b6ffd842e"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"

