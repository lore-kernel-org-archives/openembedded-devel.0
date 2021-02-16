Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.2318.1613440705230224485
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Feb 2021 17:58:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fllk4Qtl;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id c11so5211520pfp.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Feb 2021 17:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QZJ4cNZy3uvyIxPvo1iyJF7iDZCNcOFzquAMiikxU3s=;
        b=Fllk4Qtl3vkC2UW6NB+6KWgMsciYEWg3UmpHTkUdecaovdb8DixiRwT7c9LCTXNyFg
         HD1zbuk0RXPWy+sG0u4NXKCugxGBuZsR/Ll1phgTK3f0TNDYt/HiDqAyaKvMtHpq4rpj
         sw2uPAqaU2IjGVtcJEvEmEopBRys0hiApRm/0Ke/IosKovY2ZkiGkuii3ucTPc0ujOHB
         J7r1/QTIdtJMtYIauVIcMYM0LVrvCjmpkuWawCNjmAS+PgEjqtIGz6DfIWbP6qVWy+Oq
         83Di/QWsNTVYmPq6YRHEw+YmelEJYwS42CHK27gpjNhRAbeh5/N1yxsTCce7RR4sOqLX
         mInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QZJ4cNZy3uvyIxPvo1iyJF7iDZCNcOFzquAMiikxU3s=;
        b=FzXc51aGkRHtNKXvcCkm3OsLnXKjv1p0HSOzaC3THXgsttKKkrBwEcV3SdZY8EjJnN
         i7Ut+CAA2tTUmKdOaBsfJMZtSjQfE/xR2x8fzGEL3OtCVZ0abADgh59DUEdA8FxXPbQJ
         IpFvJfB0e6CQmr724bEA601eyjmSURjVolj+UsHXF/narihZnbpWiRR+f88rvfy2wWPr
         zSK4s8upgZ1znAueOF1sM/gLnZ3/iIAjBWVadmY70+iP74xGCTvS3HrdULGmYpHJUgju
         9t5HE1S5KMmxjSunRAVLMZjLisYLZhjiMWa3Iy0gZDid1UKuEpMiBEaO7PHHfUBm8uQC
         1eFA==
X-Gm-Message-State: AOAM533ija3T1X+ohrz9RZXtklmtwMEO+lpyO4lec89B8yaz2xV82lC+
	uzrBKqtdeLtIDC1UY/yYIz81ayRlHZ6izA==
X-Google-Smtp-Source: ABdhPJzDl+Q5D1UF4c9tyE54pcCTWIj/XVwdKojkcluPgZfrnyTqrOtmwaQziTQGfNvw5ue3DNNwsA==
X-Received: by 2002:a63:170e:: with SMTP id x14mr1776898pgl.245.1613440704429;
        Mon, 15 Feb 2021 17:58:24 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3567:4d62:c82e:b7f7])
        by smtp.gmail.com with ESMTPSA id c24sm19756159pfo.209.2021.02.15.17.58.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 17:58:23 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 01/11] openldap: upgrade 2.4.50 -> 2.4.51
Date: Mon, 15 Feb 2021 17:58:09 -0800
Message-Id: <c4ef31f210fe1350cb9125dee19ca0fe25a1ae65.1613440394.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613440394.git.akuster808@gmail.com>
References: <cover.1613440394.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 70860d99bf4e8036af1adccced8f9066f6dd50a6)
[Bug fix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openldap/{openldap_2.4.50.bb => openldap_2.4.51.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.4.50.bb => openldap_2.4.51.bb} (98%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.50.bb b/meta-oe/recipes-support/openldap/openldap_2.4.51.bb
similarity index 98%
rename from meta-oe/recipes-support/openldap/openldap_2.4.50.bb
rename to meta-oe/recipes-support/openldap/openldap_2.4.51.bb
index 3a130f970c..d2c5746080 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.50.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.51.bb
@@ -25,8 +25,8 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://remove-user-host-pwd-from-version.patch \
 "
 
-SRC_URI[md5sum] = "f9ed44ef373abed04c9e4c8586260f9e"
-SRC_URI[sha256sum] = "5cb57d958bf5c55a678c6a0f06821e0e5504d5a92e6a33240841fbca1db586b8"
+SRC_URI[md5sum] = "0d2025896cf1c17af7304ecc57ec9531"
+SRC_URI[sha256sum] = "f490775ea4c6506b7210ee55a102c8f4aacfe9d1c8eaa633c7316d33a714be62"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.17.1

