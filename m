Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web12.76.1610139413656089773
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 12:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: aehs29@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id l200so12812385oig.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Jan 2021 12:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GZ/HYE86vVDcgBN6NCcyJ6ZWUIWuM6m6+3aMSKGeuBE=;
        b=Anc6Z7g82M3x9E1qsLeGGbpHXDjnHnXvOOAOHeoEN6/bpgdxcNmLGV67aStV60R/FS
         pujZ7NiaK11r5O9Le8zsfU/6kLiU5R1icUNYMQMdo43Q0KWvi/crocuHpRwunQhQqnX5
         mXcuMIbUPXljx6kYxqnmTE0S136fWxgL1dlpMn+Zt6AXxU6Yzcmr3KoFYsB64vsyn2sP
         FIsH1laTK+ESbCMtrDOv5QMzP0EVpRB7PcbpHyvRPZJIi+r/esqWZNrrdfsLY6EPloD8
         P0Pq/WXJGgSDETxmtDlBmtL8lbYhk8EnKBD4PTv2aN168IcPzKnS21viJewBIHBRofOz
         2dkw==
X-Gm-Message-State: AOAM533qG3jFe1mq7qer/4JtKsaP4Dl/PwI7jjIYzsccbuusyDDklxGF
	mrX7dcTBdbMAy1kHdBtlTvP9D2WtEr9R/A==
X-Google-Smtp-Source: ABdhPJyl7TQDk3Qan/7RTL/tLqdZuZDWe8Rx+ja7vJM1Sc9nwHWpBpMul+OHdeON2T2iz0AOv9JC/w==
X-Received: by 2002:aca:498e:: with SMTP id w136mr3518831oia.147.1610139412730;
        Fri, 08 Jan 2021 12:56:52 -0800 (PST)
Return-Path: <aehs29@gmail.com>
Received: from alsamon-xub.lan (2603-8080-9140-1427-791a-15bf-0351-bf68.res6.spectrum.com. [2603:8080:9140:1427:791a:15bf:351:bf68])
        by smtp.gmail.com with ESMTPSA id s26sm1979817otd.8.2021.01.08.12.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 12:56:51 -0800 (PST)
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH] imapfilter: Upgrade 2.6.16 -> 2.7.5
Date: Fri,  8 Jan 2021 13:56:48 -0700
Message-Id: <20210108205648.1130532-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- License dates were updated
- Source code was updated to use libpcre2

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
---
 .../{imapfilter_2.6.16.bb => imapfilter_2.7.5.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.6.16.bb => imapfilter_2.7.5.bb} (71%)

diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.6.16.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.7.5.bb
similarity index 71%
rename from meta-oe/recipes-support/imapfilter/imapfilter_2.6.16.bb
rename to meta-oe/recipes-support/imapfilter/imapfilter_2.7.5.bb
index 86553b5a8..0d21a6bfe 100644
--- a/meta-oe/recipes-support/imapfilter/imapfilter_2.6.16.bb
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.7.5.bb
@@ -1,13 +1,13 @@
 SUMMARY = "IMAPFilter is a mail filtering utility that processes mailboxes based on IMAP queries"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ccca8573ead8e965c130b6b2946a36ab"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=db3b99f230f9758fd77e4a0654e2266d"
 
 SRC_URI = "https://codeload.github.com/lefcha/${BPN}/tar.gz/v${PV};downloadfilename=${BP}.tar.gz \
            file://ldflags.patch \
 "
-SRC_URI[sha256sum] = "90af9bc9875e03fb5a09a3233287b74dd817867cb18ec9ff52fead615755563e"
+SRC_URI[sha256sum] = "ab19f840712e6951e51c29e44c43b3b2fa42e93693f98f8969cc763a4fad56bf"
 
-DEPENDS= "openssl lua libpcre"
+DEPENDS= "openssl lua libpcre2"
 
 EXTRA_OEMAKE_append = " PREFIX=${prefix}"
 
-- 
2.25.1

