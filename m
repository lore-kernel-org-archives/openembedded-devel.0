Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1071CD5B164
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.1064.1730142302280668639
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iB87fNzX;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e59a9496f9so50945677b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142301; x=1730747101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTsfaFhRbrwU8RZE2NkOSXI8BtuY0w2NQ1TON8jSPEw=;
        b=iB87fNzXGzRyy3BQYjCmSehh00SZWxlLFwFe3rEDQov8axN35jvpmj2q2+MjuRiBbc
         tjlIpwsakpadXlF3rcqKNljwqZrs1Bno4ZmRZNw7Bllnc6QHOBXKCjrDRHwXgjU9j5cy
         LHf63vUGa0aVhqDLjWSc3/7d6rDgcZJ5XwXjgG+C0bTGBpOJXrOL/zkT3taNBKgUbzri
         6P5db6HA9xAIZlt2cgTDMX1RyWGGarEwakhkNAHpApGTeJLzVpy0UfDi1Mytf02J5EgZ
         6hrg3dSs2aXJLU2EOWb1CxrTZwlmNYIxmiLPAoag3YYjvDQZMmSll/aYa4D6N36JUvS+
         LKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142301; x=1730747101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTsfaFhRbrwU8RZE2NkOSXI8BtuY0w2NQ1TON8jSPEw=;
        b=JWRMixLQR9mNEMr3FTQBCwbfORsiTmlUcYl3Y+tihbGzXQgikyelR3dDkjDFw//J58
         RBGQJ0s++bfLWspH02zuOZWzDj8kNH+bYXGI4Dy25o9eAw3f7GphwzHBlwdYDWIkEi83
         6s4fi25H9A7Qu1Lsx9r5kn2Jiv5dVc5LbSBBA6KDvKkSe2ZbqMNARQ8kOpNcZxPIbA/k
         XTpCjU3XLMb4TwUMpTro1pQ2BFChIF0tty41cIGEv8iPzTlW4lWxxcMSF1R7ur3iDH31
         CZeuvKUnPp86ET3sSWlhSyYAF9GHim3Do6j4xC4GWL05pumVmdX6tBZgSyHssgRU27hK
         MtNQ==
X-Gm-Message-State: AOJu0YyTpCSJePThE+x9kJ6oMG9bcWOI3mileLEIy5Xp5GLVU+SXm361
	ZEabmnhwDWgFYpBGxM+D+pTheAtqtIv5ltmmMnilvFaeHQv2gjk3oHJvkA==
X-Google-Smtp-Source: AGHT+IHuOmYQF2DOE9qhbD6AowzcDc2+BcjFQGxGXgwPUn/uZKBrLWe40B7m9WcZUCidXadCqESZww==
X-Received: by 2002:a05:690c:968f:b0:6e3:21fa:e50f with SMTP id 00721157ae682-6e9d895d920mr91727827b3.13.1730142300937;
        Mon, 28 Oct 2024 12:05:00 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:05:00 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 12/22] libmime-types-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:48 -0400
Message-ID: <20241028190444.10522-13-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113302

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb
index 67b29019c..9b4dc1cab 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb
@@ -11,7 +11,7 @@ SECTION = "libraries"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875ace682de56eef8e8"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
            file://run-ptest \
           "
 SRC_URI[sha256sum] = "bc738483cb4cdb47d61e85fe9304fa929aa9ab927e3171ec2ba2ab1cd7cefdff"
-- 
2.43.0


