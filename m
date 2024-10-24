Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA328D10380
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:24 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.6086.1729801151694589822
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XCaIvWN9;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e38fa1f82fso12628687b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801151; x=1730405951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWNDKYLozzi5fWyelTYQhhHdbIf4xGHmYzEPY52t16c=;
        b=XCaIvWN9MFFawW/grLh9UfxrgbgFTTL9PxgmvPtH2ui5L2UX50j/RtJppi5RooJcWD
         zeGVPxp7pV87zXlPB5CnBUZX6sliMaqja3sJq9pGcKKxJ8+zTz9Tr4TBNPsrIJX0uJr5
         EXC8dOrSvMz3BrVC8RGozadmdPTAGrVrEfol+GkAxbyL+ZhB9gCsBm6fchG4XhFCdXUB
         mVPw3VyDO6ZJQPaLcLvVChDafkflIisHpXHEeGJ0W5949EFlHpi2kgOY8kpzmnVQ/tuF
         XB4RwqQsTYVfaiePGMlTKMjhWjEk42zFgHzJ6bVaOzS4tv7m3NmM4bzD+mIwuzs8fpdm
         JBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801151; x=1730405951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWNDKYLozzi5fWyelTYQhhHdbIf4xGHmYzEPY52t16c=;
        b=vXwvfHBzKUoNnWml8EIWE6U0+rcbq+fFAZO86VlF+4oGhwtQLKRZcO+8eYIWroWZVl
         bUjyHNiHegt0JjJALJibQxB5QD66ltakMds8x4cnp28olXgaJGsuJ5deP2hCJNG5fDZM
         YPIseIGC+zNjrRCs0BRcG7ryw8Bf2jnHpT8LkcVYRc+2c8b+MAtaGxxMu4rBTJSFsQOc
         quiUjgHCDJ+oul4koXdYFpRozkk1wkGzXnGmR3a09QfwMI09jeyuWxNleQaGQMFbIAaa
         w9wNp1k/YSCixD5WhBOL+f6Ra9jMktnbfiJ2M6NMQddtLLgO7sqtPiqPVyAz6ub8hRLo
         Euag==
X-Gm-Message-State: AOJu0YxFWwwIFbEeazzVqebQ2Ts2DmLYpo6+BMBZ/3qEPTsAwR2Pwyvw
	N7gaXvQaOE/kMehTtByH0Ng6xwD9wLirWTU+TnyIPSHp0h27XAd0yiRLvw==
X-Google-Smtp-Source: AGHT+IHGWqqbs6LFcbnm5GzNByqlbHmw+07mPLbc9qHQuktvRRCR8F+uc+c/Tm7sOehBteS73L6e8Q==
X-Received: by 2002:a05:690c:490b:b0:6e3:2b25:8972 with SMTP id 00721157ae682-6e858180faemr41181437b3.21.1729801150371;
        Thu, 24 Oct 2024 13:19:10 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:10 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 27/42] libmodule-runtime-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:46 -0400
Message-ID: <20241024201806.440273-28-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113205

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
index 9c4370e96..0ed61ac3a 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-runtime-perl_0.016.bb
@@ -14,7 +14,7 @@ are applied on any Perl version where the bugs exist, except for a case where \
 one of the bugs cannot be adequately worked around in pure Perl."
 SECTION = "libs"
 
-HOMEPAGE = "http://search.cpan.org/~zefram/Module-Runtime/"
+HOMEPAGE = "https://metacpan.org/dist/Module-Runtime"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=36;endline=44;md5=9416434672a57853d6181f3da9094963"
-- 
2.43.0


