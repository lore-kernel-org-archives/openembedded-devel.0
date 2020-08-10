Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.39827.1597042006689640044
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2020 23:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EzGBZ0JO;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id f12so7041332wru.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2020 23:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dDY0X2BIBPPpamQDQ38CFF+NVFHiEJ/G6bw+/JhyXc4=;
        b=EzGBZ0JOZ0GyQDJMqG+ZGuD+krdpVk8+HrViYMW9Jx+1UeNM00EecIhsgxuCsOwciU
         vicXXfxBnJmxR1C+J2gIauFwgrpJlhcIP49MoLolYwQyWWa21opss194AP3nBSn8s+vB
         c+0EReHaxFR1Ou7ZfMD7DIAmcAiWVVCA6JLEr3x9lSIGMO3TxRAX82gaiu7XHnUVbH73
         ZUu0MsVHgkwmVeuDwD+Qj+SsaEHoiBZOhisvPlofZ73FuMZFqqadcdsLOPGAtvzPhBbS
         gAWn+BgEMWAyItfaGxix79OnUn8kBQCXKm+rddTnE0iHR1BG5tYQ5o6ygDBnHz/3HvS0
         k8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dDY0X2BIBPPpamQDQ38CFF+NVFHiEJ/G6bw+/JhyXc4=;
        b=WSnoOseWFx4vq9fTR5OV29eZYR4QhsshnWwgKxgp09HbskL635aAK/6nmOwxxrO73M
         S+WR/bsyL2/YjqUcs8+RK4CcXtxPKNx6xjqDdSeiOYrEpquwommLMiLhaFF14B8k5ARR
         qhW+Yue0KusloeFjeW6MJib6pyVgYWgj10PgVaqZe7ofwLloSb1kSiLm1lusVJMOTqHp
         4Ou6ziPtu3HkRKR1TLXAnRPmrM8hBPPZ546GHEoUrlKCVKYZV+gRLdWeG9F7ZtaIR5Z0
         UGoVXwiji1JVoJVpcoTV21bm6KmZfjcOhLyHb7TqgnWru+M9WJAnzYpvUveBovY2MHBC
         lUCw==
X-Gm-Message-State: AOAM532z/kfYEVsxYFZRfW5unXr2dsJMPLByJWXox8CajcymtkC0caIi
	Qz9ybwVmaCdFzh2MhDfwu4bRaRv2
X-Google-Smtp-Source: ABdhPJyEC2Ld4TxWbN23sFMjcWzWfq02iTkMeYHdqFUOedQos395VBrxqG/+QtwVGm9WFtLHWkdByQ==
X-Received: by 2002:adf:9e04:: with SMTP id u4mr24877967wre.302.1597042004987;
        Sun, 09 Aug 2020 23:46:44 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from localhost.localdomain ([5.170.82.145])
        by smtp.gmail.com with ESMTPSA id e16sm19410479wrx.30.2020.08.09.23.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 23:46:44 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco <costamagna.gianfranco@gmail.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 2/5] dlt-daemon: add new dlt-filetransfer PACKAGECONFIG option
Date: Mon, 10 Aug 2020 08:46:30 +0200
Message-Id: <20200810064633.20079-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810064633.20079-1-costamagnagianfranco@yahoo.it>
References: <20200810064633.20079-1-costamagnagianfranco@yahoo.it>

From: Gianfranco <costamagna.gianfranco@gmail.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
index 3f5089672..74270b579 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.5.bb
@@ -37,6 +37,7 @@ PACKAGECONFIG[udp-connection] = "-DWITH_UDP_CONNECTION=ON,-DWITH_UDP_CONNECTION=
 # Command line options
 PACKAGECONFIG[dlt-system] = "-DWITH_DLT_SYSTEM=ON,-DWITH_DLT_SYSTEM=OFF"
 PACKAGECONFIG[dlt-adaptor] = "-DWITH_DLT_ADAPTOR=ON,-DWITH_DLT_ADAPTOR=OFF,,dlt-daemon-systemd"
+PACKAGECONFIG[dlt-filetransfer] = "-DWITH_DLT_FILETRANSFER=ON,-DWITH_DLT_FILETRANSFER=OFF"
 PACKAGECONFIG[dlt-console] = "-DWITH_DLT_CONSOLE=ON,-DWITH_DLT_CONSOLE=OFF,,dlt-daemon-systemd"
 
 inherit autotools gettext cmake systemd
-- 
2.17.1

