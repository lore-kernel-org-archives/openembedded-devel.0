Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.8448.1586438148252987212
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2020 06:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B3ErRj6O;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id h9so11870751wrc.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2020 06:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IoEP2Y7ifblqRfb5xRYA+IHkecWGKRL591AHtdOnBLs=;
        b=B3ErRj6OaPUW6RtUHiP6etgM1j+VTgbbxoo5DAO802XDZLFVxu5QKkmxMeek7dUFz3
         RtNFa/udKDuiyRWfaLNf5CEbKKQ1nhh4jooUz6uH9kA3KFutPTfOshDcvMcbEZPsObnn
         8RdjNs28luDr9jgHnJbfyJdF+yyVOSkNZS7IAaa9g+vAECDOYu/4b9Gv3iZGWYOFVeZ1
         yQ3uINYWLcYhlJXgxjyfBI8Lepl2em9G9tSqWAys1rJ51ru186cWoaqgjcDR4cuRw6Mh
         QQNGVW2pDnhTwrmakxcD4Svwj/ydBuRvrCta0+QLPXzJDoT0Vx5x1BoTS1eTMjaD1Reh
         77rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IoEP2Y7ifblqRfb5xRYA+IHkecWGKRL591AHtdOnBLs=;
        b=iqtiWjRBcvpEbZtsWTVX5WIP7xt+vM97NmZMhOUdFuZNhwxfWlXBxFWp5uzAWozGUB
         pRqCfo3y8Si2sPXlxt63KbzB9mAzxXDaFGSQSE7jh9RdlNetMCSKcEFrnNikj/swrf1e
         vWPw/ucoJTRzs9ZK9zgV6zOulkX/W7fpV1hkp/PD0HQl2Oljo6xZJyH1SwFyLWCAikeN
         9Z7JFooLM10jYvDtH5xCyi65U4pp8Rqeb6L1v4Ekgvzxom8xG1J59XAI5ID/lOnk3v3Z
         5J9Bv8gvjRR8GFBJZZeVDBnKFuGjVbFKdV9UEQWdeW7qrpo//6IWaGi0cbO23MVaY14m
         WYCQ==
X-Gm-Message-State: AGi0PuZsXf9tzxHkq4AM/1lZ12VeLYcUujEKr7d+XV2XPXqYJj0Mjtqj
	1R4Qm0T9RdrqiiCFKTROE3S4tSlV
X-Google-Smtp-Source: APiQypKve1NHbRclz9joslcokoWI5QeuY1ofxnqQ/CuyBE9RC10f/c13owqZive/Q+YP3sSFKahKtw==
X-Received: by 2002:adf:e742:: with SMTP id c2mr14063386wrn.293.1586438146518;
        Thu, 09 Apr 2020 06:15:46 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from localhost.localdomain ([5.171.137.150])
        by smtp.gmail.com with ESMTPSA id a2sm39912617wrp.13.2020.04.09.06.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 06:15:45 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] fetchmail: upgrade 6.4.2 -> 6.4.3
Date: Thu,  9 Apr 2020 15:15:42 +0200
Message-Id: <20200409131543.21108-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../fetchmail/{fetchmail_6.4.2.bb => fetchmail_6.4.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.2.bb => fetchmail_6.4.3.bb} (86%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.2.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.3.bb
similarity index 86%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.4.2.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.4.3.bb
index 236c32bdd..5e2d1be1e 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.2.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.3.bb
@@ -9,8 +9,8 @@ DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "039b49a4f41f8544a51d82d2f4599dfc"
-SRC_URI[sha256sum] = "e21f6b3326f29fdb0c4786b5602aa4b9e668805424d0708eb42be6395c1ca630"
+SRC_URI[md5sum] = "614d5a05ac9a042bfc9317e5499bafd4"
+SRC_URI[sha256sum] = "b0360e14b9aa5d065eef8ff99ad0347ef6cbbfc934c8114908295a402a09d3e4"
 
 inherit autotools gettext python3-dir python3native
 
-- 
2.17.1

