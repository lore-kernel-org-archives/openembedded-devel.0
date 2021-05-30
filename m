Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.33874.1622393932528889381
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 09:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gdj+N3ms;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id q25so7230896pfn.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JC+c5a0Vt33k43Bs4b4RJBpHrkCqUk5KYOwUHZRzM9U=;
        b=Gdj+N3ms6DGmWD3KRtir/7hgDXZ/HOp67CBINJb8IIhI6FKXwGfN7uvMlRNptNbo/O
         fl7jVFFV/iszgU99xpb71WAqSygcdF6bUC5o2KFSxjHJ+9OaSyEp9NH2dIz2u3qXU1BR
         SHylNdJYfVN7x+TJh+Ek4lTREAH7VXiB9GU+AINdj9xGYhkRKWFrTFdNWMY0/37nujpp
         7Ju+vfCEN21lFfjsRcukkAiz/TI5aMF8Bw5P1gWMuSQ2ahdJwlaMxU3B9fbU+kTaiFSD
         XfvEBzi/tIJYNLL0LaJoVda8aAeRyJtGA5VoYg7mdUHvpFkZv9WVFOkLILz6BX74eG2t
         YrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JC+c5a0Vt33k43Bs4b4RJBpHrkCqUk5KYOwUHZRzM9U=;
        b=GDOcDkmr7S/ZA6qA2F9LN52FtkZe1q2laJBC29imGJgSrpJccqETpSLdE/+IXwi4Wp
         Kk0JAthc9QlOjBKOS90xI6luxzJSQxgHBlyLSSRWpqbUCVVDHOBiDd5yzroh1UxJHl+Y
         SuAAQPaH4OF+laTHC7Kfxqhoi4WmjPIOLr72U9tkH6FyNZigD+R7Qz48ujN9h6l2WHdX
         UFSfUbr9qLtEWVkEAVzcFiUqGsKg+HuOlLS84q9IFenOftlA4jGqBhBrLM1hCtkL7Zeh
         5wyUqiakln/Mbbe/E5atXsqzoU/ViqqhroL0py8CrydNsSmBLffs+yRcsGv/vzvaF9N0
         W5OQ==
X-Gm-Message-State: AOAM533Jfk90Jj+5LP66P8ny3hTcB31HKjg1gBg5dv6yWVbSXVTDRVDq
	CjxvrHh6cdZj0auptkRFuIbLJ4K1L5JXZg==
X-Google-Smtp-Source: ABdhPJwR/XStroUsQV/pZITHmjnVd1BOcUf7nYCGXWQVg3yEq45SssSQ34+7f/ZG/IWdI8DIe0Qycw==
X-Received: by 2002:a63:1443:: with SMTP id 3mr19020030pgu.69.1622393931993;
        Sun, 30 May 2021 09:58:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id m1sm9068641pfb.14.2021.05.30.09.58.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 09:58:51 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded[PATCH 1/2] python3-scapy: add pkg to pkg grp
Date: Sun, 30 May 2021 16:58:49 +0000
Message-Id: <20210530165850.554590-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.24.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-networking.bb   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 67a93e17b..24b9a1b49 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -100,6 +100,7 @@ RDEPENDS_packagegroup-meta-networking-daemons_remove_libc-musl = "opensaf"
 
 RDEPENDS_packagegroup-meta-networking-devtools = "\
     python3-ldap \
+    python3-scapy \
 "
 
 RDEPENDS_packagegroup-meta-networking-extended = "\
-- 
2.24.3

