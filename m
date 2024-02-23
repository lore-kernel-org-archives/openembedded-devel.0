Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B656C54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 17:47:07 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.1288.1708710422396488747
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 09:47:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3bbbc6bcc78so702239b6e.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 09:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710421; x=1709315221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ba2GmazMCLlzFzQN4hAWFLUeRuyS/ddPgvsnIv1C+SQ=;
        b=kHmYwKyWr/O6lYSDc+OvQ6aSbnIuS72t7nmOEhpB4mPXTq8mt2QxjIe70ajHre3MwN
         Osm8q5cwtNJ+11ArDba4qYwvqNQ93TnFNhlyQFxfJfHSbokytjowDVdwwLRg7j4PEj9J
         ArSoyr1HliNuH+CrI1gAJUTqXArkZ0SkCDxw8hE7ukIhSGR7L+GipbBamw/Yi+zmRhZj
         ARh74hy5RjtwVRz2yIVvwBC/+LBIS7+eBtoE3jn/Y7AS5cdBa63561amniFzf3df5XLZ
         RFT8+oCVXJ0hBR3nCDscwSOnibWDuXrg0PJC6Z5r4Wsp9lmOP6tp/DlP/FQs94f/EGTO
         g04A==
X-Gm-Message-State: AOJu0Yx+rwSyt6n4PxkZQUfueJlyhPxV9eFocEYDE78e+ag6hVMwHCqg
	oaBgRx066izLFB/DWQNz4WE9Dq5cqDI7kZARtFS8lgepu3UNzeUvM3fzfKgGpm4=
X-Google-Smtp-Source: AGHT+IHcBMp75jQkhOhJZ2tz3q45Nn0X4ZuuBHVsbJM6ovwYtc5Nsb+pCN6gQ2xXT/3q41ZSQfvaKA==
X-Received: by 2002:aca:1909:0:b0:3c1:5377:78 with SMTP id l9-20020aca1909000000b003c153770078mr483619oii.23.1708710421088;
        Fri, 23 Feb 2024 09:47:01 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id g39-20020a0568080de700b003c18aafffb7sm293342oic.42.2024.02.23.09.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:47:00 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-typeguard: update ptest dependencies and re-enable functional tests
Date: Fri, 23 Feb 2024 17:46:49 +0000
Message-Id: <20240223174649.2545134-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 17:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109014

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc    | 2 +-
 meta-python/recipes-devtools/python/python3-typeguard_4.1.5.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 6903157ce..b3ed60a26 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -58,6 +58,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-sqlparse \
     python3-tomlkit \
     python3-trustme \
+    python3-typeguard \
     python3-ujson \
     python3-u-msgpack-python \
     python3-unidiff \
@@ -82,7 +83,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-pyzmq \
     python3-scrypt \
     python3-service-identity \
-    python3-typeguard \
     python3-whoosh \
     python3-xlrd \
 "
diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.1.5.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.1.5.bb
index 000620ef7..1e9f6685d 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.1.5.bb
@@ -21,6 +21,7 @@ RDEPENDS:${PN}-ptest += " \
     python3-typing-extensions \
     python3-unittest-automake-output \
     python3-unixadmin \
+    python3-mypy \
 "
 
 do_install_ptest() {
-- 
2.34.1


