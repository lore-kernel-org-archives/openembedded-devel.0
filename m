Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64630D0EE19
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 19:12:12 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.20360.1728673929289967233
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 12:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CWIWXGwz;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-207115e3056so19811465ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 12:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728673928; x=1729278728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfQqb9ah1bS7Jh3BMzmt3RV3YHaOHEjErsrT3YBjYww=;
        b=CWIWXGwzbzxCrq6S3n6VCz9KPVucWfNhGExE8X5E6sbex4FgVzZ/xSnt84iwhqwtXT
         TPfVN3oSVy1n15H/74Ah54bw0PNzM/EcLzIZOz8YQR9zz2oOJxrF05vdo+PxB//qiON4
         gLlD2jwR6yTPqgB9aPNASOBcrmDEkwqHaX+Nuf2ozF7zFwnlQsUNKLz9+JNFaxwLvsoC
         +cQ13CDKnMtvQfIS+tTLZfM3n8eQnBwu8X0wgDUH6LgoQYHsqP9UMKjmXIEHVqDpX+WA
         1Et+EVjbmzxIOBO3mdIYeGVn8cbogSKZQG5e0IRHYrRXQM2sb3ZUeTFTQgpdo0wFRn9u
         ZgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728673928; x=1729278728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfQqb9ah1bS7Jh3BMzmt3RV3YHaOHEjErsrT3YBjYww=;
        b=Tm9mXlFhestwSQXsxjoFz9oAIlnFrU7ujSgmigmMKMfLIUKm1H1JQ1dI6xm2BXk5rL
         YID41QnHNEemKiPyGkNq7ZIzBYPrlTMgSj61WxiznBHr2ju6Rm3H6ozQ7QewUIeE6w0D
         p+3U6qQ9OuhnTQ+yvNvLcF8/yl/8UqanMz3aEUkYZ8eTwMzsmcgNeOWTttCMBuUTH4SJ
         rowlOyzow7Np+Zuc16e6PTvcSh0JEG380EEOowltqA307pBpsajF7h+82VaJQw3GPch4
         LRp7JRXHJRvDdLAmTC1wNVJYadoH8LTPNwGaAmkTsynW4rNwowDWaGdcvjrnFTHjKISU
         NMVA==
X-Gm-Message-State: AOJu0YxP1z4jmGRBlMOKkad1WpdpwnQ2REHM6yQVgx9dMuE0fpGX9gBv
	WwygXlRPsrTIq411RnCHem02eifyep+iKLl2tqN+17EEE9DulUEqDbGbE+xI
X-Google-Smtp-Source: AGHT+IEi15WN5p+SLLvq5kO7tqI4jyHmQdCiS9BO/2wJ6Hskw3TJRQoNEQYMkZOYbZbhKwW0n3XKuA==
X-Received: by 2002:a17:902:ccca:b0:20c:8f98:5dbe with SMTP id d9443c01a7336-20ca1677b77mr63063575ad.33.1728673928309;
        Fri, 11 Oct 2024 12:12:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f083])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bc0ca82sm26584075ad.68.2024.10.11.12.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 12:12:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-python-multipart: Fix ptest dependencie
Date: Fri, 11 Oct 2024 12:12:05 -0700
Message-ID: <20241011191205.808096-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241011191205.808096-1-raj.khem@gmail.com>
References: <20241011191205.808096-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 19:12:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112814

Do not overwerite implicit dependencies, otherwise
ptests stop depending upon the correcpoding python module
resulting in runtime failures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-python-multipart_0.0.12.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.12.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.12.bb
index 340e297b83..b3c018629c 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.12.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.12.bb
@@ -12,7 +12,7 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
-RDEPENDS:${PN}-ptest = " \
+RDEPENDS:${PN}-ptest += " \
 	python3-pytest \
 	python3-pyyaml \
 	python3-unittest-automake-output \

