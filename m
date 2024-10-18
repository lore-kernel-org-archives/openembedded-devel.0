Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F51D3F2A6
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.29982.1729278827142883209
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I5tHtM5y;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e2e3e4f65dso28902847b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278826; x=1729883626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REXaEregDqZJWfyHSIjpexYpEAcUHKt2ObxxR/tkqfs=;
        b=I5tHtM5yiLDrVSfLnHiBoXargzuaaDlUrkHLlOy8loayzBZTQ8v7OTI+pHVYEdDWR4
         VU0C877d0PPz4+Gnd7qSoWpKHemKQ3N2svNBiuPWr0pS4hNLdqDY+EIJ8PE+jezTDzm4
         QJsS3Gl39NuY8IVUY9UaRdfWrfOd9UViiOoH+DBZZ68aioVwQe6Ka/auVflnd62/aJCn
         07MwnXzd6c+lhD71MjTfAXvwXyNVTsVj1GTX7UabrkyEjqIhKMovb+g9ZOsDG/xisKYs
         DUSqMPjb9S6TjdEGW3voOiVfeqRwrqX8M7GsUwHeWB0LXF5bRKqDu/1ehiRuCiekUSrZ
         RCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278826; x=1729883626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REXaEregDqZJWfyHSIjpexYpEAcUHKt2ObxxR/tkqfs=;
        b=wS4Ugkaf15+9wfG/SnZIfaPfv/uNv4k7rTDv91245u6e9zJNHTn82ij+wmFYCSX6B6
         lPvTR2/ygMsieGJPKGMhYVvQF4whqrxN2yE4ruA480F/vpb5kUyqlzUErxd/4UZo9y6Y
         RRk0OnFhT+ODLOo1hh37zvr51DyVt/imRL08EI1t2JFRdM1qvEuaMyrciKRIt3tvhBcu
         qR59y4Z3uZUCEz59inQFMLJHQYlXS67wc8hOSOMug1FXy27pjNDd0cbBWPsyxvVqFGyb
         B1e54t7AeJMJcm/+iEj5afyJxcW2rBCQuVD7mD4RukvPJZJbgSV+bfjTfm0P9Kc0pLiC
         ODDA==
X-Gm-Message-State: AOJu0YxR8zClH+i4trNM3yxwnDpSjpPrqjaTDlU268YtP9cMsbLPLJ8k
	GgloSUexNEYI7dfw4F2+g3QiwQpwSOiOSP48cDtFMtwVWe2fviq6+9ntmQ==
X-Google-Smtp-Source: AGHT+IEd6epTsAAMJL1YJ6MwaHuwQKL9rQOeO7irTF7f9S+67yMOVRO1uCbZxkMbVpJ7MaI9Ua9aeg==
X-Received: by 2002:a05:690c:10c:b0:6e3:21a9:d3c9 with SMTP id 00721157ae682-6e5bfbf1ec9mr32986067b3.9.1729278825536;
        Fri, 18 Oct 2024 12:13:45 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:45 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 54/68] python3-pytest-tempdir: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:41 -0400
Message-ID: <20241018191101.25184-55-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113041

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb b/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb
index dff6af4e0..b161b016b 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-tempdir_2019.10.12.bb
@@ -4,7 +4,6 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9872c3a37cc9baf79a464cd168282be5"
 
-SRC_URI[md5sum] = "79b997d418fb85c2529ab50cd4333689"
 SRC_URI[sha256sum] = "e7d91813a9aa991db87dacdef8cfd3f1657632d731d56d06238c5ffb63ab36d8"
 
 inherit pypi setuptools3
-- 
2.43.0


