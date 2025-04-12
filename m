Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3E4C369A1
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 03:34:15 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.3975.1744428849301581785
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Apr 2025 20:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mIXrcKAu;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e53ef7462b6so2581355276.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 20:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744428848; x=1745033648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T4NC0b7Gr/LKakD3GPRkJdlN+9Xa9hvjnrr1OmsEQ0M=;
        b=mIXrcKAuvm7gLTPLtr4AfWKnqZuV4loquPfLjEwMakRmiaAy6j4EOXea0wCb1Rqjgx
         QsT8i06e1MgFd1vx9bJPEaZug6HC3TpqGWNMtObgI4e/y/7OtL1LfPSaxbKyFhbX4fqq
         24cz86xtZdaVVtLgrB4O6osk8fGdMDCxiPZLGnWAeO3lGBPuR2gMGX+/uWfHZJetCwTw
         IbilPX5RfFn5JUljG7Rp6/lzLW5YZrjgL8OndklvOciQeC11vVTDIuNlHAXG1DR1aqU7
         9Hp57xTMFSxbbWiJMZ9Yg8zg3d06gUms+tMv9zdZaujAFvMJCKaBlFiNTkKv7DcJ8kda
         UMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744428848; x=1745033648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4NC0b7Gr/LKakD3GPRkJdlN+9Xa9hvjnrr1OmsEQ0M=;
        b=uw9tUrRdTtS2JzbvCPJV49LA1+Tt0CVOpufhTKSBDJEAtcxNbdSHDWrqF9R0d/ZSzs
         A37bHWXA5XfBMlL9Er/BATZL1++iSNIGe4U9ke7ZM8ARInku8IF3NKWwuHJeop3ZC8yq
         W/CQv7iyVpSEa/md/upxtvpH7sawVdJJo2VLwGfi/FPyYIbfbGWXSzXntaXR91SF5hj2
         420KjkPnL4O/CmN//FKXjZoslmwfAhHAp8DFnqKA8qTwbPGqKrHloSVAX3ua8qL1WCmb
         fP+HEAEIBxdwBc6kB+MLj+BmAqwpYF/WWmM3Ve8LzE1NDf6Bfg52Sg9axoMO9kTGPAK9
         SoUA==
X-Gm-Message-State: AOJu0YwevppG3b8LQh3dv4oimeXuiFEY1KDgTK6Tm6yVAlQvyNRuCdYP
	XpQG0/zse70uKBeQHSULG9ceT5rSR9jKTTC4a6SVqsR/MLlSXJf4oM+evmxb
X-Gm-Gg: ASbGncvo5r5JkbDD1fUfV+NTeH/cOOtDrxceTCMyrO1/jHLCtkHbnIUmH3pD35qCZRw
	pgOw0nR9wfrKPJmxZv0cDC5oA8fgGrUwabAytrTz2ARqoBLUYcchEP6HnzzdGYrT3Vyl6jjPQCk
	9+jghVGUoZezt3koEIetJj2sNL4QE6OdfOZrxVrduVXgNSqReKP8d6GbE/Nmuo+cyZu57E8AKCV
	UzQpZ4AJ/u6XX9qKJrtEYHQMq9MEOKRbo6xeNqXyJVEnC9H9THmlICjGx4Qocq7BcNACs1C3x3b
	87wbACAfb82OK0rg7AdBImgeJ/VldX+T9MZA/W2ZiCKZiQ==
X-Google-Smtp-Source: AGHT+IG/Oan1xbVrYNeUxeEtflxmKVW2j+QjXaWvwVO6pN61xM9orpFFXlAJRO01WL6M2zKAwXeq8g==
X-Received: by 2002:a05:6902:2788:b0:e6d:ecfa:6ba9 with SMTP id 3f1490d57ef6-e704deee573mr8243680276.6.1744428847766;
        Fri, 11 Apr 2025 20:34:07 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7032743b5asm1549501276.42.2025.04.11.20.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 20:34:07 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] source-highlight: Fix warning : lack of whitespace around assignment
Date: Fri, 11 Apr 2025 23:33:58 -0400
Message-ID: <20250412033358.14882-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 03:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116805

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-support/source-highlight/source-highlight_git.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/source-highlight/source-highlight_git.bb b/meta-oe/recipes-support/source-highlight/source-highlight_git.bb
index ad5085250c..24e6c7ce9f 100644
--- a/meta-oe/recipes-support/source-highlight/source-highlight_git.bb
+++ b/meta-oe/recipes-support/source-highlight/source-highlight_git.bb
@@ -16,7 +16,7 @@ DEPENDS:append = " bison-native boost"
 
 DEPENDS:append:class-target = " ${PN}-native"
 
-EXTRA_OECONF="--with-boost-regex=boost_regex"
+EXTRA_OECONF = "--with-boost-regex=boost_regex"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


