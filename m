Return-Path: <alexis.cellier@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9D9C19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 10:09:38 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.7596.1740650969221529791
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 02:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QiG/Or0X;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: alexis.cellier@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f2b7ce2f3so507649f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 02:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1740650967; x=1741255767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hf/0FPQGBgc5cEqQWMkJ0SDjHxYGD9+aAeyZqf5MmjY=;
        b=QiG/Or0XvVFCczv1V681o5nhCeI7v8eT9iLLnFN9xyq6eo4CT1ddf9YTRZFTfFc3nu
         UQSDqRqM4kDF7jJBJk4Ee6svHLlhVd9nF065txQYWATdPY+VMq9xTEqm4dDGzKy6xngc
         hJuyEGYEaLwhfbWHuQAKDizGf68arpk9Z2N/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740650967; x=1741255767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hf/0FPQGBgc5cEqQWMkJ0SDjHxYGD9+aAeyZqf5MmjY=;
        b=r0wRbd3BNmGngw/7/W6hG2tV6n8koyXFffPrmKyczgh44rhf6i0QZG2qr/naw+qOFW
         wxIIkqh/+2Nl6GjCKQCsxgKTZYYoDxblzrsKl8EYfvwoyft5mxVxh0OEY08refF166+j
         yjF0MNUgw5vPRQn8xjfXUQUvsujdlcCAxuMsOYXTK8KcSkXh7nAb+kjksSOY1DrGkeA7
         AaYqxp3pJU2wsUANv3u77wGFczsOsHw3QfSQy9mPqOrmh7x6zTanVTJh7/3t7Q6iBuzq
         s55Bzw/BbkfE6ws0mHdNFPCqDKs9Jg0QhlZIKC61gLPu4+TwhgeTxj4TdniMWrQ1i0sj
         IuQQ==
X-Gm-Message-State: AOJu0YygYFYa5S+FEGquK9SnFDkqEJR/pnnNeHJFFz1VT3+3WQANfsIS
	tZIPzdpnxks6uvUEYO54Xu18KSTqIcui983JG1yCqmyVW2UCsyLdptuUZrgHiaf8QDk0LKFsMxC
	s
X-Gm-Gg: ASbGncvM/ivicJD4MU0p4dC1ght/OzUv/uw4bq+WmiQmYlDP0Fs6Gvyl0A4TrYQFyUa
	5kPaA6YS3ISfvlOatUiRcq1jUC3wdfspYTznOTPf8WypbIODBT/TMSSJfBC17EzaLYZrNmcEbJP
	jCyaTooD82/9eWU1gV1orH+bAfzAwz1SixTfVOmeyRD7mu4yQyeO1/Asp6nC5edZxNyqsKKODR2
	W0ApALanaBNTpT8Y3hr7G8I5f7LoZjET7TslkNGQ8d6YdT+LTqOtCWbs9q3CrZPG3prWcZRfNnJ
	XxEeFALHqSPoWAao/i1w4W8fkSDszMAp3coyFZ7yh7Gxmy5zdddp
X-Google-Smtp-Source: AGHT+IGmW6ZCQ3Vxur3zTY9pUAxdF5SfZ6cSVkR3lUGJqGuwhMiMSrvqtf247tY0ZN0XkrwW07EY1g==
X-Received: by 2002:a5d:5f50:0:b0:38d:dfdc:52b6 with SMTP id ffacd0b85a97d-38f7082601cmr17843226f8f.37.1740650967551;
        Thu, 27 Feb 2025 02:09:27 -0800 (PST)
Received: from falke.. (176-147-181-65.abo.bbox.fr. [176.147.181.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e484486bsm1528723f8f.65.2025.02.27.02.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 02:09:27 -0800 (PST)
From: Alexis Cellier <alexis.cellier@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Alexis Cellier <alexis.cellier@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-webserver][PATCH] sthttpd: Fix service unit file
Date: Thu, 27 Feb 2025 11:09:09 +0100
Message-ID: <20250227100909.257307-1-alexis.cellier@smile.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 10:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115687

Update PID file path from /var/run to /run to avoid systemd warning:
    PIDFile= references a path below legacy directory /var/run/,
    updating /var/run/thttpd.pid → /run/thttpd.pid; please update
    the unit file accordingly.

Cc: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Alexis Cellier <alexis.cellier@smile.fr>
---
 meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service b/meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service
index f1095007c..f181f30ab 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd/thttpd.service
@@ -3,8 +3,8 @@ Description=Tiny/Turbo/Throttling Web Server
 
 [Service]
 Type=forking
-ExecStart=/usr/sbin/thttpd -C @@CONFFILE -c cgi-bin/* -i /var/run/thttpd.pid
-PIDFile=/var/run/thttpd.pid
+ExecStart=/usr/sbin/thttpd -C @@CONFFILE -c cgi-bin/* -i /run/thttpd.pid
+PIDFile=/run/thttpd.pid
 
 [Install]
 WantedBy=multi-user.target
-- 
2.48.1


