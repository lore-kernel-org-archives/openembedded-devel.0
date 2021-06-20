Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.28165.1624148849537520790
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Jun 2021 17:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YR10sxmZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id x10so6586535plg.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Jun 2021 17:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8pHscMZ6gs7yy5tLqyQbEJSbPPxwE6wI78pey0MNhho=;
        b=YR10sxmZr5ox+n2CJC3ranxiaqmR2kUNYIkR+gXfj/S9NlEvzkZzYlZslWd4S1E9KM
         hAOEWe45Qh7UkHcW1G/vH4FqZ3wpOxJH6T69/1wWqBJVFpDGZ4aDCQw839qdw2hXSFM0
         01c5eqJ9Ee7UBTw13A4EAtyAbULITSWbVlKeMnfYYW9g5Jk0an1XAu0EFiCkXNLduQ7c
         5ZlHGkzwRZDys4JuMsLPn+6I1D1B7pGiD6xe+Ta2tgmkupRiFjUoCjYH85YlCRdomJ+p
         aQjM1NMVyB389lObhlJOkVejXvVYTkKeggwEEzVhNbvctcyKFZi6q7RL1ets2rgDE3KA
         HreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8pHscMZ6gs7yy5tLqyQbEJSbPPxwE6wI78pey0MNhho=;
        b=YYrMvqvVuV2sDNL2RVYioNM2MD7m9wg9cSauYlVa4oOaFoC+AM9kBqipKnCqqW73CW
         39/5STmUc4Wt4I+W/M3cRIaj258835KWyC9UYX0YBDeGlP/D5Qv2GHaN72UA/7CD0eCX
         ObDCk4QzOE5IkIpMRQ+i+7NSY6y7YLqm4z5lu6yZAntTq3R1vbBzUGJ2cjyZpG7P33JK
         Ea3l/VmooLtP5efFZVsstRQbazCLArklwPfoiEtaAHIi5yQNXRArfaNG4NBPVYGWs+RI
         T1OKvI85LY0g/tUYK8iZDlTwl0cpsLm3t+UxRXTLjSjl3WohrqdfPcxcawPqcvp8ZKoR
         odRg==
X-Gm-Message-State: AOAM533ROS1CMY3T5zseC0TKWG/frrMFf5Jdk2fqqDdzpWlFrrnkdJb2
	6jM8U/TKyDI79U8A/DYGuM2RRRDI7/v+Bg==
X-Google-Smtp-Source: ABdhPJzDM62U9o7tuE6EWrP/7MXX4aGSx/3k5wnZEdiumrWGy2aE5uHm2MMmSE1lxYxFabLWxoDp+w==
X-Received: by 2002:a17:902:74c6:b029:11f:1ae5:2099 with SMTP id f6-20020a17090274c6b029011f1ae52099mr11194702plt.49.1624148848849;
        Sat, 19 Jun 2021 17:27:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::5cd3])
        by smtp.gmail.com with ESMTPSA id b1sm2923628pjk.51.2021.06.19.17.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 17:27:28 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] czmq: Add libmicrohttpd feature via packageconfig
Date: Sat, 19 Jun 2021 17:27:22 -0700
Message-Id: <20210620002724.3894951-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210620002724.3894951-1-raj.khem@gmail.com>
References: <20210620002724.3894951-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keep it disabled by default

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
index 27d3b648f7..f97a160c35 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
@@ -27,6 +27,7 @@ PACKAGECONFIG[lz4] = ",-DCMAKE_DISABLE_FIND_PACKAGE_lz4=TRUE,lz4"
 PACKAGECONFIG[uuid] = ",-DCMAKE_DISABLE_FIND_PACKAGE_uuid=TRUE,util-linux"
 PACKAGECONFIG[curl] = ",-DCMAKE_DISABLE_FIND_PACKAGE_libcurl=TRUE,curl"
 PACKAGECONFIG[systemd] = ",-DCMAKE_DISABLE_FIND_PACKAGE_systemd=TRUE,systemd"
+PACKAGECONFIG[httpd] = "-DCZMQ_WITH_LIBMICROHTTPD=ON,-DCZMQ_WITH_LIBMICROHTTPD=OFF,libmicrohttpd"
 
 BBCLASSEXTEND = "nativesdk"
 
-- 
2.32.0

