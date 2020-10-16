Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.17469.1602859066255096953
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 07:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=spivn5Th;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id o3so1555426pgr.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2020 07:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9e2el0TKshmYhjd6RK1UFhWfg7ZrvKaTa4flCfWOw0w=;
        b=spivn5ThKfCl05utfxouANJ78GCcdQ54jDV+4+pTtn6xs8cK1M5Mjl71X3Z0MYzfEv
         VTjSIJMQnLvlEfHfr75Q0m9XrE1vQ53Hj6qAX3x8sYd3cd+DGAro1xvK4UUOXuIQGLGO
         CnwmABIG1nGm3cdythzDYXbwSnxIxQEhwtrNGNKXhJqtSTZV3XL2Zal5h2rsu8hdWdvD
         TmCFOS5vJBTHCFO7BRM0AOLRg/gUdyqo7UwAIl4q5vhjZD+MkeaZfKYymirsQ/9krJrE
         sQlo8HTQWF8qZD1dQq3h8BnUlW3DizJ69De2Ox+jyYEHpE2Sht38qe2yY4f1qtvawrvy
         NhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9e2el0TKshmYhjd6RK1UFhWfg7ZrvKaTa4flCfWOw0w=;
        b=m2/2dEkJcORoXA+ULkQ9rjWENSfj8MhzujoYpJnXwpbMWImOCOftHvJmSFqOy4aW74
         6eSALgbj/4gEsU4MPx1HnN5s8z3OU2lKcjQG2DrTI0B5gDKhhp1f9julfMLEUDh6iKTu
         cHWkY+5JO4FZSJR1InvT+iqYN3abrAx9Qg+YtBScbSVo+0J6r0ghPhX6vf6BwnWKQNtt
         E9DH3pSFm+IeEJbr8o6lEHF4/eKDODG6+eOTqY6Ecu9xFkd11vIsjNiruXsMwn/q+LxF
         QBv3gQ3woSkBvIMMl48aGOlNuMvkUHv3EukkDExQWdY8ITlWgdf9CxU7GEdq80XKsPXN
         90Dg==
X-Gm-Message-State: AOAM533E5oTR9Ps66suumc79NvKfJfD4CQTLbZPSyyTWogDNAK5KRhwg
	55oC21L46XI0rOqZa1ivZn0UeyKnChidmA==
X-Google-Smtp-Source: ABdhPJyC+BRZmyDT1OEML3MErdPcOU9iFEFXX1R69oZ1+MJ6mw5S+e/yRlCgwFDAP7TTOhWyLcFjMQ==
X-Received: by 2002:a62:2985:0:b029:142:2501:3969 with SMTP id p127-20020a6229850000b029014225013969mr4118247pfp.46.1602859065612;
        Fri, 16 Oct 2020 07:37:45 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:4938:26a4:cb77:8681])
        by smtp.gmail.com with ESMTPSA id 128sm3087352pfd.110.2020.10.16.07.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 07:37:45 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python2][PATCH] conf/layer.conf: LAYERSERIES_COMPAT gatesgarth
Date: Fri, 16 Oct 2020 07:37:42 -0700
Message-Id: <20201016143742.23076-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for the release of Yocto Project 3.2,
"gatesgarth", change development branch to be only
compatible with the new release.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index b25c9ef9..a5738d96 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python2 = "1"
 
 LAYERDEPENDS_meta-python2 = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python2 = "dunfell"
+LAYERSERIES_COMPAT_meta-python2 = "gatesgarth"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.25.0

