Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52ACE77198
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:16 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.48488.1736119447315692995
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QkAA7QCM;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e46ebe19368so17226216276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119446; x=1736724246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUl1QAT36RKVp+yIqGRpgzmTN3+0nnu4kYc/1a2Y2vI=;
        b=QkAA7QCMGLJm5iftCz0o0U4/z5rq5YDIdAeDhtkwPR49asCxCzEv5IGN/nU09ZcC7J
         lOfp/1znmIdx9eVJayQYU2H6zDDgdSxTfAFWnC8CkDFwTF7D2scVi5IbGd8if9V6dnN2
         Qt5EEcS2fSqa8YyDnIR1Q1pmNlFoAIkP2sL6oRokr+xJXZOcswfBA14k2VomTaD0Jzag
         0OtO1UnmU+6bWhp17hgjVgIhXDxRbvBPCm7Z9txxmMKHSCkZ2+eQVxef6pdz+ilQNm9/
         rsHj3ABPxn3qpBKo8LkmJtTGE5SuRLW2ZaH3bWgjsMMMo6E7sx/Fmb1jyAl5wMfC1Tpw
         4yjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119446; x=1736724246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUl1QAT36RKVp+yIqGRpgzmTN3+0nnu4kYc/1a2Y2vI=;
        b=HyIDZPcbWes5cxodmKqOjEY+NgvmkEN9nlaW482s2JUbLprFJUTc3nSCBNy+7ICZzW
         dRLZTvBHQkc4XAZvtyoX7CMj8B/LZBnmMaenDwp8yb97JnTQcD+YjpKijGMx+sy/UKHW
         8O4SqWQp4gah+inRKc3iFnhhGB2Sb5RsRwvhQ3qsj0gQpQb/JDqpFElTA9z8UTALxymn
         JwBHofNFj0kGp/UpcLs7TNc/mEP8PayCUrSKRZhs3FBV1pW3cfBzq1m8ZplHRRQAQF3q
         +IZ4OV35XmLDONksaBDE5G0DvFwUX92env26fdXnOSN5XdUMu/4ZZiwOGU7zE0L0k9wK
         hP8g==
X-Gm-Message-State: AOJu0YzT44OHaSrapa0pOgv7skvCXYNjOU5MXTjtj68S16izuvUurHKz
	kMUNIXa+Qi+sNsu/0SRbm4U7WzW8xAcOlc0HcNcXr++2fClZewUILWe0lQYH
X-Gm-Gg: ASbGncuBlM8D+AZFOLQ2iYeRxfTdu8/bEX02RMfvo/EXNv0hgc4J92xTJRpv+u2Wk7K
	humj+CpWc+pTTaGTeDZscMF6l7u2rCw7Id9WydAgr4cNX3vz71dlLUIC91TJypO3UgiY0kyCYGO
	SftLtwHHNLhHZuvsfArW8yDOEt40qKHggFK5eAPVCqxcXVwetd3u5mtS5/fWJTn8s6d2e6ZWt6f
	viwIHQtCkdPrPtivkVGMovnnuzWt8U3dLaMPQO+lfYoURGS6tV4rXWpDZ+yHrjZUrAZvA==
X-Google-Smtp-Source: AGHT+IHRwZ1KI8QflrAIk6MVodifweZbYBHWkDNr3zzuGsN6f5g6mL9MYEi5G6FliY3Ay7Zao4plyA==
X-Received: by 2002:a25:5803:0:b0:e4e:891:c8cd with SMTP id 3f1490d57ef6-e538c22333emr28636225276.14.1736119446372;
        Sun, 05 Jan 2025 15:24:06 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:05 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 12/24] apache2: ignore CVE-1999-0678 and CVE-1999-1412
Date: Sun,  5 Jan 2025 18:23:45 -0500
Message-ID: <20250105232358.1502946-12-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114642

From: Peter Marko <peter.marko@siemens.com>

These CVEs are specific to Debian and MAC OS X respectively.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1b86a60f6283b08acadc50914075d93dd362700b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
index 7d6ea27e7e..475f77d41b 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
@@ -38,6 +38,8 @@ DEPENDS = "openssl expat pcre apr apr-util apache2-native "
 CVE_PRODUCT = "apache:http_server"
 
 CVE_STATUS[CVE-1999-0289] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows"
+CVE_STATUS[CVE-1999-0678] = "not-applicable-platform: this CVE is for Debian packaging configuration"
+CVE_STATUS[CVE-1999-1412] = "not-applicable-platform: this CVE is for MAC OS X specific problem"
 CVE_STATUS[CVE-2007-0450] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows."
 CVE_STATUS[CVE-2007-6421] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
 CVE_STATUS[CVE-2007-6422] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
-- 
2.43.0


