Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23D7C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 15:45:05 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.29841.1643298295337109220
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 07:44:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aGEG7FZ7;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id e9so2612261pgb.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 07:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2RFn+RTXpZGEgmziRDjkZwaklgDwFxzZ9EGB6mzkAEY=;
        b=aGEG7FZ7lAjXV+B1ApFsqrFmCgbHhi1yOLXugJ9I82bXQ4fPFMbwLw9w9af2PqEv2C
         jo2QU+6Dsz4U46lV7hv5sX6EsLUOj83a+Ae3m+tNDJeeifK6wL+Jd6dgRtwZzxFIszcq
         X7a426MnUuZeqTBbNBJpYJ+BvFosxknXcgL9+od0kLqKN4GQXInSaI2oQfoPjoRc61mx
         2TzliqYu5lVuRCRLM0Y2hyXvCJya8dGVYEgjG0kJ2OUeXfOBnceZfE627hZjLJhwLf0N
         mOPKixFHQRFDXkwm10RydaD2qrfYImhJsHxDxNTe2uSw8Y5lAQslAfMRRbonzwgyXWmD
         L+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2RFn+RTXpZGEgmziRDjkZwaklgDwFxzZ9EGB6mzkAEY=;
        b=JE+l3ER08otoletC6mQE5w8Sa4nXML29OaouEPV3oRKfl2q+r0ARyqoM5LVbX5MGkd
         GfMV/GoNWqy2Q/4xya3wztAYr0tidx0SnGqg0tiWCu9baAZs3BfHt+3EG5Z/ndy0B91i
         v/jv9QxnK8o89t3gY1A+abd9LIJRlErOJbI2YCwZ6/Ls0GPIczisrl1ct9YqD3B6SkOQ
         qS/ab52sEKF2RBMLhib+dZSh5hJm12rQJLIZDjYSYrISFik7F12BHtSUn6dIlU7yiMus
         dQgUB72df2FobrDzREtKmgO8ht93l7E4XiQpNkGe4JruPsqMu0m/aBfQrS9otNdOSm2x
         CRMg==
X-Gm-Message-State: AOAM531C2sWBn5a+LF5ydT9lXm6UnQFRrrKwnhYfGqfmnCXDE3Uceiwp
	72QffWQz/MoHvSRZ4QWBbpgyOzGjwAKIJw==
X-Google-Smtp-Source: 
 ABdhPJyheEpitr84+oi1efGTtuWtYaIGQI9Ixepc+ylNIh2rdty0KV87neElQ9S3XlSoJ+6dGfN5IQ==
X-Received: by 2002:a63:8bc8:: with SMTP id
 j191mr3169874pge.233.1643298294517;
        Thu, 27 Jan 2022 07:44:54 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:fdd2:3cac:1ddb:a448])
        by smtp.gmail.com with ESMTPSA id
 ns21sm6736465pjb.43.2022.01.27.07.44.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 07:44:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][dunfell][PATCH] c-ares: bump PV in recipe to 1.16.1
Date: Thu, 27 Jan 2022 07:44:52 -0800
Message-Id: <20220127154452.66380-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jan 2022 15:45:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95123

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
index b77604797d..692a5f0d6e 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
-PV = "1.16.0+gitr${SRCPV}"
+PV = "1.16.1+gitr${SRCPV}"
 
 SRC_URI = "\
     git://github.com/c-ares/c-ares.git;branch=main;protocol=https \
-- 
2.25.1


