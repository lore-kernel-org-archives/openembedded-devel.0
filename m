Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAE6D0D786
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 12:38:20 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.10478.1728650293161541807
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 05:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=O56u0umG;
 spf=pass (domain: konsulko.com, ip: 209.85.218.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a99c0beaaa2so72428566b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 05:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1728650291; x=1729255091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=igsvxmuGsJm+FOxu65ASRUQepRU0tKh7RT9QQVmUy7Y=;
        b=O56u0umGsVKnNFuspyNfdf9DFTASzSULlKW7XHsUkRJXCVzV+JkccpJe6hIwWXicnD
         NMZBoRoOYbY+8Io/80KuTJfskIGXg+cQBjh8wBBD0NVjcs4Dxn9x8arMANmze60Rza0z
         qVKuhOrxY8lZvPKe5Xyh82oytfgBxSChHDlmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728650291; x=1729255091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igsvxmuGsJm+FOxu65ASRUQepRU0tKh7RT9QQVmUy7Y=;
        b=erEc3bRmKfJBSiuL1iUV6/7vneixPTFxiMxP5gei8AzGhNqDCcHeVzJeHGTHOz1wiP
         QSwOVzWMhll89zwV6dBgX/sC0wyA7b6GmRyKaRnrbikuiqgIKwQZppRxnuKMsKZUQh36
         fgXLlFjyFD111iRQdWe9ebj2NdDZHDwKHnJ80LdrwqOrJ/gnLWuV/NQZ01AOw39dxpt7
         1OL2rvfstTG3t4xXlxBQ4jAwWqqiPk9K5SrC1PeaWgEW4xVvRZiYyaTru9P/mw8eRSa4
         qZifIdCNoeOf4P397kr32Pg19+00cKZXz+lCxK0Ekl6MnZgeN4e3PPn0KJm5qblZoQm2
         NMLQ==
X-Gm-Message-State: AOJu0YxFUGSAPtX6CTLVyckD8t46eHyg+5p1/JjV+F1EmEFR29lN4CZ6
	Y9ZnRbD099NwhYlAZM13fGtVlTvpSUSgf3FzYmjn30tz3boxFAKgz56sFZmzD3/WRQ+MdJlxFv3
	Y
X-Google-Smtp-Source: AGHT+IGCBOrysG5uCZi7rx9Q3WIoLY+RJUcGvyBW49+1xa46ln9kiiVADM8mqj6W3W0TH7kk1gmpPg==
X-Received: by 2002:a17:907:86ab:b0:a86:b46b:860a with SMTP id a640c23a62f3a-a99b966b8camr241967266b.54.1728650291158;
        Fri, 11 Oct 2024 05:38:11 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80dcf0dsm211077466b.175.2024.10.11.05.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:38:10 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] valkey: Upgrade 8.0.0 -> 8.0.1
Date: Fri, 11 Oct 2024 15:38:08 +0300
Message-Id: <20241011123808.3892747-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 12:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112796

Upgrade valkey to version 8.0.1:

- Fix a build issue with RDMA when using additional make parameters
- Fix an issue where CLUSTER SLOTS might return the wrong tcp or
  tls port when called from inside a script or from a module
- Fix a crash when CLUSTER SLOTS or CLUSTER SHARDS is called from
  inside a script or from a module
- Fix a build issue on systems where <threads.h> is unavailable
- Fix an issue with the default sentinel.conf being invalid
- Build binary releases with systemd support
- Avoid .c, .d and .o files from being copied to the binary tar.gz
  releases
- (CVE-2024-31449) Lua library commands may lead to stack overflow
  and potential RCE
- (CVE-2024-31227) Potential Denial-of-service due to malformed ACL
  selectors
- (CVE-2024-31228) Potential Denial-of-service due to unbounded
  pattern matching

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../valkey/{valkey_8.0.0.bb => valkey_8.0.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/valkey/{valkey_8.0.0.bb => valkey_8.0.1.bb} (98%)

diff --git a/meta-oe/recipes-extended/valkey/valkey_8.0.0.bb b/meta-oe/recipes-extended/valkey/valkey_8.0.1.bb
similarity index 98%
rename from meta-oe/recipes-extended/valkey/valkey_8.0.0.bb
rename to meta-oe/recipes-extended/valkey/valkey_8.0.1.bb
index 373ebd469..a62abebfb 100644
--- a/meta-oe/recipes-extended/valkey/valkey_8.0.0.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_8.0.1.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
 	file://0001-src-Do-not-reset-FINAL_LIBS.patch \
 	file://GNU_SOURCE-7.patch \
 "
-SRCREV = "2b5c7a0dbd61fd4281ef6166b7d119ba7fe7368c"
+SRCREV = "4fbab5740bfef66918d6c2950dd2b3b4e07815a2"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.5


