Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.8654.1601544553083673102
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2020 02:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20150623.gappssmtp.com header.s=20150623 header.b=K4WS6bFO;
 spf=neutral (domain: kynetics.com, ip: 209.85.128.66, mailfrom: diego.rondini@kynetics.com)
Received: by mail-wm1-f66.google.com with SMTP id j136so962885wmj.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2020 02:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OYOzTElDD+eHe5YeZ2AV9RtEUzZjPHGxxsfCX9AZJn8=;
        b=K4WS6bFOCfuu5Gz/v+Q1sQD8yDMQFVvadRt1GykbGUvEpKUzMlJnUjCbMra26nggec
         75hZVjLpLf8E9OxcgCM1fqkPBATd6IoRcl9MxLm4G9orF2gi5P9qSpWeQ8Ir6WQtEJeL
         hzSbEoWxNvR6zL8sU94VKwitD1c+HZp/GHP/PWHqFI/uHqnQvxAmUiaXWrpvdSsAZUZ4
         xnXI4dTv8Vf1xWKtqreiDUX9IrVfvlHcin+0EPOm/TOolUnpBcc2DPnbejOWtrxsOKms
         CB/Si/x8g+c9STogfBfzJIo3rX2rfUAa4GOUQ5/2Ca7uT6p0igdOZJk2yuQ6duRR6JkS
         hLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OYOzTElDD+eHe5YeZ2AV9RtEUzZjPHGxxsfCX9AZJn8=;
        b=W9+HpjzpEF6Hsu8fQZL9sG+dAtJHfLs7slEZML6iM7cK4X7h5ASiP7jlAHRumlb1OX
         NxBHw5WAsq9ddHHPR1DaESvRwvw3ID7W5ud+KTBmV5IYOygjoGQdCMs9shOUXvUPPL8t
         uCLxkI9GnGBbZdxQKcLBJQWluxltwDsuQA2ElGb/YW+rDMJ1WEMIXDRwQfxn8MkIdnZ7
         M8IEXHk2J+onqEzbbMRmE/Ukhk8f3MDmQSAOatHEvV1tBI8LxyO74Hu5OXWQG5FHE55l
         Mr3mA/SqiHai72Qy/1xIO8BlIQABbrhYJvy5YzZcafqBDFCc4t3eV/OToYMBsLYt518o
         fYXQ==
X-Gm-Message-State: AOAM5329S5E0sB8x5FYKWhlQQSnT3Qjcjtd6/ZXMTpexj/hju7qzg4qQ
	XF5cHL7Bi03FqEAvBQz1Gjce+FO5OwxIpg==
X-Google-Smtp-Source: ABdhPJzNoJzXKxYPnn0uofCiMOWy2v7WHzudHX20jgrL6EByI81lEpYf6LDRiIdu4fvjH3QN1hKYMA==
X-Received: by 2002:a7b:cbd4:: with SMTP id n20mr7897725wmi.105.1601544551005;
        Thu, 01 Oct 2020 02:29:11 -0700 (PDT)
Return-Path: <diego.rondini@kynetics.com>
Received: from localhost.lan (217-133-17-98.static.clienti.tiscali.it. [217.133.17.98])
        by smtp.gmail.com with ESMTPSA id i6sm8451182wra.1.2020.10.01.02.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 02:29:10 -0700 (PDT)
From: "Diego" <diego.rondini@kynetics.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [meta-oe][PATCH] README: fix incorrect links
Date: Thu,  1 Oct 2020 11:28:57 +0200
Message-Id: <20201001092857.264894-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix incorrect links and replace the defunct "gitorious" with now popular
"GitLab".

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta-multimedia/README | 2 +-
 meta-oe/README         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/README b/meta-multimedia/README
index 3c4b1af7f..b4c2455a1 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -14,6 +14,6 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-mult
 When sending single patches, please use something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-multimedia][PATCH
 
-You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
+You are encouraged to fork the mirror on github https://github.com/openembedded/meta-openembedded to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like GitLab, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
 Layer maintainer: Andreas Müller <schnitzeltony@gmail.com>
diff --git a/meta-oe/README b/meta-oe/README
index 6a0d7c0a1..8d787df68 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -19,10 +19,10 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]'
 When sending single patches, please use something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-oe][PATCH"'
 
-You are encouraged to fork the mirror on GitHub https://github.com/openembedded/openembedded-core
+You are encouraged to fork the mirror on GitHub https://github.com/openembedded/meta-openembedded
 to share your patches, this is preferred for patch sets consisting of more than one patch.
 
-Other services like gitorious, repo.or.cz or self-hosted setups are of course accepted as well,
+Other services like GitLab, repo.or.cz or self-hosted setups are of course accepted as well,
 'git fetch <remote>' works the same on all of them. We recommend GitHub because it is free, easy
 to use, has been proven to be reliable and has a really good web GUI.
 
-- 
2.26.2

