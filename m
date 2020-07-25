Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.15474.1595703861343810651
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 12:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BTGZhPjU;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id l2so653477pff.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 12:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=z9a0r0TeOb9fdH1zxmY69FffC6exmnbX4RnXyJuxK1w=;
        b=BTGZhPjUmRs6QWLAoywZLzP7e0xgHVslrVufCYXvncTE2joikycJmEWT73gh2wYqM4
         zwchQ5yN3G+oz4xmbVUH2rEM8U/wAlOXvX5dDdkZxPnmsMpUuC4QLZJvg/Kkb1lEZ7S+
         O+58D06lWVK87u5PMWZG6CSJ7Asylh8LdbEhAD+JIPNnXsrARPb/uT7pRAJiApeT5fc0
         WpiUc8OQUNK7KFFYpUNsPNJgz7d+1hVJ43vT26zWmFkppevio7rpK061gKhJqufB+sh7
         On+30kLVS+wgHujqk3XN8rS2XY2jpifPbdR/gW17RuS0ogjOAJZcPsldazw0LblcN+Fm
         vIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=z9a0r0TeOb9fdH1zxmY69FffC6exmnbX4RnXyJuxK1w=;
        b=qfDLsyF/bYzW0ThkwWfMo1weNYhYYExSLLA+IOdk8BLWohZqzsPa48ogLo55eihbkE
         TtFippQslipcYZ3PDmb8m+GOwiJHU68lHmeZY76q6vx2xhNH82VbvqOp3BAnhni8pmjK
         kCgfyT/2jg2OKqyoRcHNe/5J1ThDzvAyratZk3FApB1ODMWq1HW9Qcg+9es0Kjxlelle
         Ta8SiSEvkTMOxoLIgQiE4zFJJfn3Cvhq9roK3iPjsSI6PEISERSn88WyU/zZmxyDx2OQ
         lF1gm5XY4a81rCWONQkYfMGATs4mCU3O66iwyI0Lyf3ZHa4sCarU/jPQlj9Cehvwsfz/
         UhIQ==
X-Gm-Message-State: AOAM532am4Ctv+qP+MxYWyCTXnJ8RpXtrCtgdY3iAFGryyLb9RG+61Vc
	2XFzRhTNH9zlD8R2AlKEJ/6BQjveuLU=
X-Google-Smtp-Source: ABdhPJyqUFie7hqtjOiaxQDOg2RULZtgpY6PxlKBL7oQ/af7IR9fG6iaIW0kD57kxTz21AkkW0wjoQ==
X-Received: by 2002:a65:6799:: with SMTP id e25mr14112522pgr.364.1595703860608;
        Sat, 25 Jul 2020 12:04:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:40e5:a0a0:80e8:2308])
        by smtp.gmail.com with ESMTPSA id m20sm9646955pgn.62.2020.07.25.12.04.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 12:04:20 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] jsoncpp: add PE do to dunfell reverts
Date: Sat, 25 Jul 2020 12:04:19 -0700
Message-Id: <20200725190419.21718-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
index 97c6361ad8..e41907de46 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
@@ -11,6 +11,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
 
+PE = "1"
+
 SRCREV = "6aba23f4a8628d599a9ef7fa4811c4ff6e4070e2"
 SRC_URI = "git://github.com/open-source-parsers/jsoncpp"
 
-- 
2.17.1

