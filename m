Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5825DD2E03F
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.6062.1729801134269230875
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eEToFTZh;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e3881042dcso12947747b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801133; x=1730405933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yva+mr4yKdIpJ7h0MIP81M/xIygS0h1U9iOqJ20adK8=;
        b=eEToFTZh6I98ijh3U2TTIiNhbkxaQca4syD7IUP/QX9xjgp9t/gbAK5iP4ytab04Jb
         jbLO88OFNdqYW5/41Sr1Je9Tz+0Fy1AfgzLsN5pmxszxRCTEJBRPYkfOFrdYRhBajbg6
         RUX0qjMzQkdi6MPf0A6VM0QnzzU9gynZ5B7GAXSiJiTqMD5Ob6T77/0OsJKDTqwxPnuZ
         U6hQWRjBBolUnIrS44JybUrGjWlTk6xXU4XYBHYY5LxPl2wnKRXC5wXNQm457fuZri6w
         aYISsYf2klfGH1TPlfXZgrIFqpoiK7j7KR3KY2UTDqTkCKUHU97zQT42qWqCDDq5H8SA
         obpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801133; x=1730405933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yva+mr4yKdIpJ7h0MIP81M/xIygS0h1U9iOqJ20adK8=;
        b=WoMitO7RRh6rmHizQzgBPTMEOL93tsv6RlKWX+geKYlCmciKLZnQ/nuzMK6w7rSrHW
         58pMb4XOrXQH5s9OFlQfb0BOu6DskLsljPyPqqSmOY4OmiVv7JNdhY9bItIUEAc8kNoZ
         7KMvAoVrDTFqUSPyJ3w4ihvvgCLGyRAYkWRrDCUvCW2HWTt10I11lbjjgWv/XQrXvOHQ
         zVZ7A/QtPjrzmUerqxx9G7xLAjM5ouy4dNcvLz80s83oh4L35AB9rLBJi9//8uH4ywi8
         n2LnCqHe1CSMB7IxfISiBXvT/rljO7yBE349+zreaUFxXxjIGeZ63mMbk7grJiiliK30
         flcQ==
X-Gm-Message-State: AOJu0YwWAV5TVVNen53au8m8hmx/SQY13u6U/PbRJjeGf2subJYcKxh/
	epUG6ljZHhjTCMwqyMWBncjV183ulcW1dWvepQjzBkX99sxUqisss+/FIQ==
X-Google-Smtp-Source: AGHT+IEuNHaaCGJ7SFU4VdVQQg6Gnmn1vxnzLzYAVEY6CTG753UBydrP6vwERTl1tQoQOzFNUgpoKw==
X-Received: by 2002:a05:690c:89:b0:6d9:90f3:1a79 with SMTP id 00721157ae682-6e7f0fa6c18mr87080327b3.32.1729801132942;
        Thu, 24 Oct 2024 13:18:52 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:18:52 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 01/42] mime-construct: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:20 -0400
Message-ID: <20241024201806.440273-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113179

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-extended/mime-construct/mime-construct_1.11.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb b/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
index 9da2b1adf..28dbf1399 100644
--- a/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
+++ b/meta-perl/recipes-extended/mime-construct/mime-construct_1.11.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Constructs and (by default) mails MIME messages. \
                It is entirely driven from the command line, it is \
                designed to be used by other programs, or people who act \
                like programs."
-HOMEPAGE = "http://search.cpan.org/~rosch/mime-construct/mime-construct"
+HOMEPAGE = "https://metacpan.org/release/ROSCH/mime-construct-1.11/view/mime-construct"
 SECTION = "mail"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=5e2e5da619ac8ef8c84767ccc4656e96"
-- 
2.43.0


