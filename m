Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4033BC4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 22:11:17 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.5493.1706911875073599288
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 14:11:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: straka.derek@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-214c940145bso1444571fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 14:11:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706911874; x=1707516674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZJ1a+R9778nucQG1ztBHJJlyiFl7rufJ3vXwVvvzGE=;
        b=QSkDz4nSbHzuWoqv1vExHAXu9E5hHMotItC2Sdf8INt+hlzFPuUWXGYEgabzLIPPVX
         aCX8gmmRHbLzyEa4CaoJ//ETjoIGMFIILIWNDdJ2v+7tazilP9fIL4y2iLPAuDUOlGR3
         Iqk/+cWO0Cx/en825EX9W8HAJYRU9ZUl9hEnDym2CPkCATdA6waeUaAqmWiBuVBMaGb7
         Jku95+StyFDHMMBMnEnJVXKUAc0v0qJHpNN1W5aUeUy3buGUOGYFrBowzltXEUeOkQtr
         6qmeZEK+L45FG1EwKV2YpFYFyQpuSTTX0KaDDpohv1YesupUCz4+aPa08BveO2QeSp2S
         fNTQ==
X-Gm-Message-State: AOJu0YwVOZe6H/9ibowH5HpESjpaD3GM2h0/yNVhRqp/VYZMIuZG/Hg4
	t4sojuKPXwYSLDp5pPpKHmHiwkgmnEJ8G3DnGqlL0cjHxGyuSZoTM03SSmjkhO9ReFau
X-Google-Smtp-Source: AGHT+IH+x82DGL2qUa8RJk4CXPyD7DpSgEY4M7DT8bTZOTgJTLhJ6qbiX5RELMUkZEMpvWfi62LBWQ==
X-Received: by 2002:a05:6870:a44a:b0:218:7597:2018 with SMTP id n10-20020a056870a44a00b0021875972018mr1009202oal.16.1706911874009;
        Fri, 02 Feb 2024 14:11:14 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id pz8-20020a056871e48800b0021441afcc51sm668676oac.43.2024.02.02.14.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 14:11:13 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-binwalk: update the regex version for upstream checks
Date: Fri,  2 Feb 2024 22:10:58 +0000
Message-Id: <20240202221058.1620923-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 22:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108552

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb b/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
index 0b7d97fcc..45b1ff514 100644
--- a/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
@@ -12,6 +12,8 @@ SRCREV = "cddfede795971045d99422bd7a9676c8803ec5ee"
 
 S = "${WORKDIR}/git"
 
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
 inherit setuptools3
 
 RDEPENDS:${PN} += " \
-- 
2.34.1


