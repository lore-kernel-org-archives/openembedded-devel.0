Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26690D3F295
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.30093.1729278823127518165
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kKocb41q;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e38fa1f82fso23651127b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278822; x=1729883622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjcMOTg8G8NoExDw3XFQwsAdZkIcs2hKA3u1r8de9PM=;
        b=kKocb41q/SzCTReGmbMo6ai3NXlLN5E86ujn+FnDiE45EJN3aYjhIfRgVo19KpTRua
         e5mPWIGT8AOF2SLNyyoIM4NtWdrQnnqEamLFF0hexeu5P4OPLQ4zJ9hGyjDhyzzh1f0Y
         XqQ5+oQAE6zdWPmztGNdpbm5sf3VZ0eWjmK5brFd6uZ3i7camTlU6Jt2MpB3n+jGLh0D
         S8qKwD3qk4WuhfhoLTypo9bMahilRsvM5fy7+G8g8bgSTh1pFdfP8iWEo3YvUr1PCBda
         VxnCzIua0QsBS+6rlQKZRb9bctmYSG7w6jY84sqN+I7wSjvBO1Jj4xBcM43YCN5sm53w
         mVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278822; x=1729883622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjcMOTg8G8NoExDw3XFQwsAdZkIcs2hKA3u1r8de9PM=;
        b=YGEydiVNf1Z9R/1cT8rQzLIOO7NKNHaPPBbfUHfrWLPSghSxR148sPSq93I1oUpZVG
         3ti7rLy8J3ayc5xcHmtSaqNexUyun9cMr0J6fMdJFnipDW31MuKd8cqBO1H3v8jeI8Kd
         KiJE4tMm8k7j+zG8G7bIQ/S3Ab9FtqTQnt+BoFfsoy35ZLYdTAQ2kf7g6jklyj3oRQCP
         DCD5YLXwQtLpf+slx8riYiAZ5OAy7QCno/2Kpqk5/BdPjW9Cp9Ph1QPtrijXxWZAPPiv
         YxNn5mwBQ3/AMYiPJmtuxMlKJjbVzedkMm7KGZyJmLulqFGZb5y14PgPTLRS0Z30Kucz
         E04w==
X-Gm-Message-State: AOJu0YyR3V4xMpot2mtySNn6u/tvHBH5PXJhEHVYwnVmigeZTVmNP4Bd
	9DzBFyZRGbdXHRFT38s7XhQHYkhGgSMLxJmF+3pkJMJyyQTA66sT8fOlow==
X-Google-Smtp-Source: AGHT+IHfRN0rksKruKOnaZ0+nSQBE+3c8rrcfLI6ci7SWNOkMewRE01gs7pp3g8+d+bUd2IL/XbGvQ==
X-Received: by 2002:a05:690c:87:b0:6e3:29ae:a3a5 with SMTP id 00721157ae682-6e5bfd4f8c6mr41503077b3.34.1729278821729;
        Fri, 18 Oct 2024 12:13:41 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:41 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 48/68] python3-pid: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:35 -0400
Message-ID: <20241018191101.25184-49-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113035

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pid_3.0.4.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pid_3.0.4.bb b/meta-python/recipes-devtools/python/python3-pid_3.0.4.bb
index c90f55105..55667ac81 100644
--- a/meta-python/recipes-devtools/python/python3-pid_3.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pid_3.0.4.bb
@@ -4,7 +4,6 @@ HOMEPAGE = "https://github.com/trbs/pid/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=83d53cbd3105063f20305bc313464e29"
 
-SRC_URI[md5sum] = "af607e6e2a51129e3fef516b7994c85b"
 SRC_URI[sha256sum] = "0e33670e83f6a33ebb0822e43a609c3247178d4a375ff50a4689e266d853eb66"
 
 inherit pypi setuptools3
-- 
2.43.0


