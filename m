Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44119D5B174
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.1053.1730142295224094651
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fPOlFqW4;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e3b7b3e9acso42967797b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142294; x=1730747094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6awifHAYwppAJwMSmwvSUXIobTj4/2Az3aZX349jj0k=;
        b=fPOlFqW4f0kAA0vrXgtWIcscVcUvEQU3m27g67mzVitQY7rPr5cfs8CwidcmUx9a9Q
         V6LKWvg1e4sa1pxNXW6uVIZxjqiLoP7mmf3k2TGIb4NUzt0aAk4MXIJMsqa9R3TniiQz
         +S3kHIxJ13BjfLRNfAlk/R6BPXBwYzCcfT/uxajULM17KK+QrjQJ8ebONMtXZtn0xkrm
         0hdivwqkqbM8FVTnjxNoWUa0Sz3bvMJ/WsWcgdgAo9x4ud8oWrr2l0VXe5HQlXxJDG2m
         jzeh1dusjVQu1JbO9CgyhihYYQFfh3GETMwIhccKMN3yyECn0exkVI45Ewe7dmcsjL8e
         gTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142294; x=1730747094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6awifHAYwppAJwMSmwvSUXIobTj4/2Az3aZX349jj0k=;
        b=QkSf7wEUp2eZ+xHG+SUUGTMuBChVxa4y7xJeHorSXqIZ8VTvKw+BUEcQz9O2JfL/q1
         pIM+6kV54xPm0x6J/P6oP/j2j+PufxKpWLSvpajYlxdyVVz5tOxSZ6eikf6DI4+/j6zn
         nC0766I3ZtAu3IJg+MvdJ3RyvThMUu/mvVRqvyeNNvYmp/DgljRsndgO2gdsNjF4x/0k
         O6MqjkJ9M9JmoB/4u4yozSFyJIRo6crqnxsY2zIEJin4lo41x7GCu8C9tUw93/rpVDaZ
         11XCb5zxdLdqdnoM549F5G+nQu8FnvBEsP47zhBzE2drrEP0HKywrcFAeLu4qbLurstv
         ec/w==
X-Gm-Message-State: AOJu0YzgODCZ5GGL4soY9+FbILP0z4cHCYULGazSfyfcrTixt2o29wPU
	+XakxVjkDkEl6vjak4GyIbyea7rKVOnw9WcJZgs4d7ERRPTS0IFe8hmfCg==
X-Google-Smtp-Source: AGHT+IGuqf4M2LbsBQNwLy7SB7Jqh5Fr7k6F9Aep9N16Wza6oy9oh0hBmQZfyxU3fQqeZcyAg+n7sQ==
X-Received: by 2002:a05:690c:2883:b0:6e3:3508:e32e with SMTP id 00721157ae682-6e9d8aff362mr66776207b3.41.1730142293874;
        Mon, 28 Oct 2024 12:04:53 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:04:53 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 01/22] libauthen-radius-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:37 -0400
Message-ID: <20241028190444.10522-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113292

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
index 79a371d2c..835fd2f6c 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78ab6ea0cba1f1ec1680ebb149e3bc11"
 
 DEPENDS = "perl"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/M/MA/MANOWAR/RadiusPerl-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MANOWAR/RadiusPerl-${PV}.tar.gz \
            file://test.pl-adjust-for-ptest.patch \
            file://run-ptest \
 "
-- 
2.43.0


