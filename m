Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DD2CD98F2
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 15:38:36 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45403.1781883505925629862
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2026 08:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ul8eZnLn;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490c1915793so18137155e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2026 08:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781883504; x=1782488304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=64OIngaz54FD6ZIF5Juegxp2YlPw7wlZcWajFnRsRuk=;
        b=Ul8eZnLnjvQuj64uUZskjDESx1MoCtflzblQaAisnZaRDwVmGl/rNacxVwK5lsyodc
         fXYaWb+YbB5Ry1oiAtpvRxO3i9r2aNzHvXcdAKHXU/wAi1Q7xMrWtMNvbl6r5QMXZ9J8
         HhcwkRaB4NYS45mrIXJC1cBMPxi+cvAxyIgYl88qC611khUBwdh+tw1PRSxb3ndTh8Dd
         t0n5hqdQkT2RT/ZNwJVFd+/cO0ix9ynweMS6PSJV/Mx8oVLhNtncXf4T6/UuJbV7ag5E
         1UNYp5ETyfSXevsuYHLwfqa5n5nnrK8CLO4tUR9xdgxtiKEg2Z/kJzuDXMhZiaRH5GEC
         akLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781883504; x=1782488304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64OIngaz54FD6ZIF5Juegxp2YlPw7wlZcWajFnRsRuk=;
        b=IqP6Z+p2fkF9FTC32OnhRZZIMpMXrQ1F6JNVOAqyKa/pJ+MXg23xTtUrJd2sK85YES
         k/Kp05PnpKgzhF6WrxxnCgifmU+pMFWD08h90GtufTgZDad7Be6kwAhQRGw6FZwHVNHV
         1a41oENpRI3+04vVBHyCz99ErJq93rz2chy+rHRwetF5ecHezZ93qzSKClRwaesb+F6i
         BDbrOr5yg/I5mXfnIE+2TxXnQPX2CFUb4U5rL4hSPi1BobVoeZ4vkLl/b3RtIJqME6PI
         CcP8cPnfFlYy2cpIZ8z0jYp9LSGY/CL87bChrLAYN9VErNxGwAe7su7a6VXpBE3qH9C5
         7jPA==
X-Gm-Message-State: AOJu0YyVpEyxHq9szzFV1l8vdAUDLX6rRJV1mpHLrw1SCnYw38NuYNWs
	YbzDLzqZJKuHiu82+slzrdXFViTA0QDF9W+gjPmHX0B8EZmXEfnvydEt1GB3wA==
X-Gm-Gg: AfdE7cmEPrl5nWu42buGBYboDmHajiyzytoYlbNHs4G/uiJEcyTvEu0GoV7Ci4vNLMU
	h0tkTW0JweRHmoey1/ElRTIJ/d1oY0bbOcvWWmmoT8HxiMfHmDa0jx6sRcfDbViI4gVh5BnYPW2
	FyWjNS+E1FVRF7mVZ0FC+Z9LJK/woXnA7pcLuStrTz/6K9hNurVLPl28np7+vom7Wn14+JYPJI/
	2t4gyiylh+xSRIoRxk+J/BEthNqSaoCSf4E+LyR+MxbwRP57dszrGiFxnkB7k+gPzn5Vj+zXS+L
	AREq3o8hKHfds1Wfe0wi6etgM7wpjHDGCUADE0cTt7sMAy5DyVCY54B09JIMm9i/R0veYekVwF1
	NKEg2OKP6LHS2fvwa7mZN9JDO1FltLVk8BoCi/5ZADajP7a1xu9NAG+5agJqiKIX0A8uNVg50w1
	Sr9cydnXPVAvqgzXm1GuAavCwIYdv9KGyXkEoKHcek29TIKsi6qAkW9loCrYzriLg9pX17
X-Received: by 2002:a05:600c:628f:b0:490:601f:d776 with SMTP id 5b1f17b1804b1-49242313c00mr42210685e9.3.1781883503936;
        Fri, 19 Jun 2026 08:38:23 -0700 (PDT)
Received: from Unimatrix13-WMWARE-Resolute.localdomain ([78.212.182.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc426e1sm9045566f8f.29.2026.06.19.08.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 08:38:23 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <locutusofborg@debian.org>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagna.gianfranco@gmail.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] ettercap: move from old libpcre to new libpcre2
Date: Fri, 19 Jun 2026 17:38:16 +0200
Message-ID: <20260619153816.254921-1-locutusofborg@debian.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2026 15:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127682

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 meta-networking/recipes-support/ettercap/ettercap_0.8.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.4.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.4.1.bb
index a28de7b2bd..e8679bf463 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.4.1.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.4.1.bb
@@ -11,7 +11,7 @@ DEPENDS += "ethtool \
             librepo \
             libnet \
             libpcap \
-            libpcre \
+            libpcre2 \
             ncurses \
             openssl \
             zlib \
-- 
2.53.0


