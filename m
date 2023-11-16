Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B254C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 22:36:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.20041.1700174185809491323
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 14:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=XmAinTMz;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40842752c6eso11608735e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 14:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700174183; x=1700778983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f1f7Q2Lrmt7VQNZvKbuS1sDPBbavHoUsKxZ3HmlLM0w=;
        b=XmAinTMzlHGdK5DuaAZv1fCYD8ZpOLqD6gpMu+/wN/xbl8sfYzpQEnStvHPSkyhrXP
         cohXuG94Lb4h028n7ibU/yhm5Ljv8KL9M+hk/2tLHcaQyWgN8MNOZOFIkkPLgFq5oLim
         fd7q704e04VBfBa+H1uV5uu0C4yLw2Poh62wo6vaVCOjKJ33ialmjJKH/6p4aJkLq8c1
         XZGYdBbLy0EEgVXKlN5rqLeoPGpS93VxfVLSAkgw9kAWtnZ+eNf40pEI3EagiMqzdQlg
         vP2+T1H6AxQ/JJeIF9uJcWG3aR35m6kU72bEfS7TbBsSh4bsMQAK54e6mPAzhhiZED3N
         kL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700174183; x=1700778983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1f7Q2Lrmt7VQNZvKbuS1sDPBbavHoUsKxZ3HmlLM0w=;
        b=CBfd5IDGTDIAUCY5s9ktpJjS3ZcpUo6ndhboont3RJvI/tjcSqV2iHqHmyya6uf/BZ
         5nf6uHUtU7WZcY8ZW+Yztswn3PSi8I5mzw6bfw3VwYtxTLAS/xl7KV//dOR3Ul8WemUe
         MWccVBdtz8zZYb3RvWhOzEGxoht31ixUjXQz9gniYMdATtpDJLM5cPNzQdya4Io+vh7u
         U/sTweESjygnQ0wytTHWJkHnlA9OvhHJH3KLgHmUO7Ch7yCdKK822WSNfyCY4+mYEkXs
         y51qRDHsnOQ+Mg9HN3fghqRScSXuRobxVbk+XK/K3LpGujgXCHc4foj0Bjt9vdH80c4l
         krrg==
X-Gm-Message-State: AOJu0YwRE8rKdEf4dczv+w3R4lTxfoSrdScLwVzZOCDWtGQP/7xe6Px9
	BdSlmhF5aKY38fnoM8lGrcmqF3nZMLRqh28TDqs=
X-Google-Smtp-Source: AGHT+IHj9qH+Nm8QzR8v29j9P+WfyEI8UB2yjbPEvS+qclxtx9Wcowo8acgB3LUmxdvCmhhV8HgK3g==
X-Received: by 2002:a05:600c:4709:b0:409:637b:88e8 with SMTP id v9-20020a05600c470900b00409637b88e8mr15055350wmo.2.1700174183590;
        Thu, 16 Nov 2023 14:36:23 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id p11-20020adfcc8b000000b0032d9337e7d1sm525500wrj.11.2023.11.16.14.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:36:23 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][kirkstone][PATCH] python3-soupsieve: Break circular dependency with beautifulsoup4
Date: Thu, 16 Nov 2023 23:36:12 +0100
Message-Id: <20231116223612.426824-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 22:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106843

python3-beautifulsoup4 does depend on python3-soupsieve but
python3-soupsieve does not depend on python3-beautifulsoup4.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-devtools/python/python3-soupsieve_2.3.1.bb        | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb
index 7cb76b426..631a45c99 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.3.1.bb
@@ -12,10 +12,6 @@ SRC_URI += " \
         file://run-ptest \
 "
 
-RDEPENDS:${PN} += "\
-        ${PYTHON_PN}-beautifulsoup4 \
-"
-
 RDEPENDS:${PN}-ptest += " \
         ${PYTHON_PN}-pytest \
         ${PYTHON_PN}-beautifulsoup4 \
-- 
2.30.2


