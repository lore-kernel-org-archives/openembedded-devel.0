Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411E4C47074
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:24:30 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.155960.1703877861348168878
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7bb0ab8e79fso127212939f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:24:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703877860; x=1704482660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXpD6xJQvR82WHA0DlD3qYttpBEHFmGYHPpr9dWBbos=;
        b=d/jcJytfteClLWXUJhSvn4oua//up8bSALFwyxCgt38d07PSB0zouwWOYij5wcQnap
         e5J/xU30rNNBl572VCAMJcNFVv7HpyoQsVNz98zaqe9N1sQAuSWOm52btTEDvJUj7Qt4
         VH9NNQo2bO67SrdBMts01h0/TAmvp77EWSnWAHp59vCQOcptw+7Sib5OBllEA1s8jqdv
         cWsR4rrbzgZGR+ip5L0FY3kmeow7CML1rEV0BbTxm0LbPc5fYWn4krw+rR7GIiXUVkXJ
         OkKZFMd+ZdRXPlumZuuUl8Hvv7AHrqVHuHSULTR5VCZt3T5nE4xb1DqtiXqbWP+LvqGB
         t+/w==
X-Gm-Message-State: AOJu0Yx+N3oDwPAKGX5GIYy3oHlswOK8Rw3yEVHgDlMAFXtp5rh0sGKy
	POuXIvOdDKVzYfDVNRl5WaIa8nnrX589jA==
X-Google-Smtp-Source: AGHT+IE4Egbb2aTcel58xXb4z7BwdiKqrYZ7YuDE7c4OVmnmg0mYDX6a9Hgj6uG4pK4n0eU+URNvyA==
X-Received: by 2002:a05:6602:4897:b0:7ba:db6f:6af with SMTP id ee23-20020a056602489700b007badb6f06afmr13121393iob.23.1703877859817;
        Fri, 29 Dec 2023 11:24:19 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id cd8-20020a0566381a0800b0046ce5f7e87fsm4884599jab.136.2023.12.29.11.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:24:18 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 3/5] python3-sqlalchemy: update to version 2.0.24
Date: Fri, 29 Dec 2023 19:24:05 +0000
Message-Id: <20231229192407.2736363-3-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229192407.2736363-1-derek@asterius.io>
References: <20231229192407.2736363-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107902

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ython3-sqlalchemy_2.0.23.bb => python3-sqlalchemy_2.0.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.23.bb => python3-sqlalchemy_2.0.24.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.23.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.24.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.23.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.24.bb
index ce216b016..91ab762eb 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.24.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b707d50badb798e1d897f2c8f649382d"
 
-SRC_URI[sha256sum] = "c1bda93cbbe4aa2aa0aa8655c5aeda505cd219ff3e8da91d1d329e143e4aff69"
+SRC_URI[sha256sum] = "6db97656fd3fe3f7e5b077f12fa6adb5feb6e0b567a3e99f47ecf5f7ea0a09e3"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.34.1


