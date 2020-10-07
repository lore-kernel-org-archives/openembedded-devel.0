Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.6514.1602048313251546963
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2020 22:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q0y9690P;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id a17so474609pju.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2020 22:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HPunfe3lw2HJBB2banLSJgV2Oyah/zC7K1PApSeviDQ=;
        b=q0y9690PaRo/CODAWIZ2BD5hmkzH1+MEvysHM6v13YeNyTyuEzX+fG1I7UCqFr0tmA
         ySFDsjca/RNvnjiFj9jUASdv5Dk3tEzz8zJWPd6FHol2BMthTcZ1BtN1arEcm0+xzThX
         mXCwMIGz9rhil/9Um6vo1Ezoqm7sdicoYoM7c97xqNLhUJgctNypz1J2bGI6J8Gx8wAh
         LYJxltYbc9b47bRuQwjZe0Ahu7LIsRezSCAhO7PMtaJMEdSJ9Nqo5zqPewKHz2+B67ha
         PTwN65X3o2F9vhTbFWSJsldJg80zehGLRgY/ZRzRnQe0CNpQTdWNaulft8e15D1nnaXg
         zipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HPunfe3lw2HJBB2banLSJgV2Oyah/zC7K1PApSeviDQ=;
        b=h7shg8Xd2apXC43jOoGHrnPNOPnb/CPl3n9EfnSV+NI+Kx8E97chfJ/9kp+TD9lJ4w
         IZeUhHd4gfKGEq5SM72veVvSJoEXJDpa4O1avJujXLHB9/1ZyxIIM7GtHJYrkWXq1isv
         HjUxP3YBoaC7z2ZQeGDo5QNll+5Kd/W+UnA7Zf+c07h7F66xNaywMOfTsWRgHAAZ0I1c
         MbteE48pAinKlW6yGCH0KuNTnvl3qygbmhxDlmSdLBXEJ+8IZ7qOhnfNXZFvq3T4MzNC
         lhPgCUnhydGxbBKxuyYU1DktrRCt+thmJRCoeyww9bSBJCUUshIF87f8JMw8q5P3AB6C
         9+jw==
X-Gm-Message-State: AOAM5324YaOBVKiD1g+ho4/k5dzZiC5cI/qKRj+Pl0qtwROBFzENzE/k
	TBevsgDFN0PIFSylqpPboo2Ct49tmIGfcQ==
X-Google-Smtp-Source: ABdhPJz0izTK8JYKDD0gClpCSDJcIz/+XiOXs4dtBmafCQnYloST3YhvcjEeH61eQTOhRDNK5mIUMQ==
X-Received: by 2002:a17:902:bccb:b029:d3:89e2:7a21 with SMTP id o11-20020a170902bccbb02900d389e27a21mr1366141pls.30.1602048312470;
        Tue, 06 Oct 2020 22:25:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0:923a:5c32:ada4:3e27])
        by smtp.gmail.com with ESMTPSA id k15sm1143212pfp.217.2020.10.06.22.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 22:25:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Siming Yuan <siyuan@cisco.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-paramiko: fixing runtime dependencies
Date: Tue,  6 Oct 2020 22:25:09 -0700
Message-Id: <20201007052509.3526946-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Siming Yuan <siyuan@cisco.com>

added rdepends to bcrypt, cryptography, pynacl as required by the
actual python package

Signed-off-by: Siming Yuan <siyuan@cisco.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-paramiko_2.7.2.bb        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
index 324847c31b..1b81171f68 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
@@ -12,3 +12,8 @@ inherit pypi setuptools3
 
 CLEANBROKEN = "1"
 
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-bcrypt \
+    ${PYTHON_PN}-cryptography \
+    ${PYTHON_PN}-pynacl \
+"
-- 
2.28.0

