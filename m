Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C68DC433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 20:36:12 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.11112.1635021371029566397
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Oct 2021 13:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Fg3pOEqX;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.53, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f53.google.com with SMTP id l13so3480953lfg.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Oct 2021 13:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zev0+PQpgU2H9OhSQMdCe+AzHKqjrHbosC3ORm2GME0=;
        b=Fg3pOEqXmhT2XncGS9nXNAjzDmpLnrhsBgkLprR/wX/KHe+SshKi5DBNvbd/O2O2Tv
         oChSdeT6KKo6EVqQ8I8rrPww1R+SLY/8tSsRbePXKP+Y8XRDDAO1J6xqXvAxTRXOdEE3
         LD9xDZaKQ94NIetLWNkW+8/v4Q1kjMDjfAtqJwv6VC62ur9cz+qGNXpO5LQiczkhmoMp
         SFi4CsvCFR2C9nq7y4JB4K63VxZHfmlZ1Xc8+6PYAaXpL+k2233tRcD1iz7Kmh49HDKZ
         Kr6cBNEu2ngQIRr4yZ0ZmJMZ7oa1fEcjPC/HSyiK5wdNu3DvJaOC++4VIJj2HEfUku1v
         FM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zev0+PQpgU2H9OhSQMdCe+AzHKqjrHbosC3ORm2GME0=;
        b=lGxsf2hqaUn2jG4rRvBBiUqVqrPJBLFtPw4ZxhOz+WWLzYdwbImknlAJsdboV1wTgq
         a3qwRk0pjGx7lIcFTEvTUYg7bDwHld6Bc0sOrdgzFWbrRr6cslvbkDrbppg6K+ZsBWft
         w9EqXAlgx2ShuqFERLIQ98ITCiKKvPI7hiSJd81kqzER9H5Di3wPNYEFw32GjxSVV9L+
         JIqtQ6WeUNkCU0EPUNzrXi2e+eyRlXenZDO1ogctFPzY1Yqy2w6gcpPX9kypkYlJtZPc
         +zW5sVvkXyfJb4MUWNBnS+eFgwaW8Gl5yTX2B2Y23RI+Sm5ziIePWaCkMSeLdFmw8SfZ
         rIsA==
X-Gm-Message-State: AOAM530joB9HFJF8C4JrFk4oIDF9NsNsgBQ2tAiKI/uPLXN0n/7xpPYe
	L3iqhkVR8QJapF54NDsSIvFpIFw6EG7YDA==
X-Google-Smtp-Source: 
 ABdhPJyl8YsMgc8xd2BLWizkAEMrpVkT4xQvUghmRcZi1n5sBCkD6VUvEONHkgSqqgiK9ZxgruJslQ==
X-Received: by 2002:a05:6512:130c:: with SMTP id
 x12mr8042304lfu.101.1635021368471;
        Sat, 23 Oct 2021 13:36:08 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 l11sm1134823lfg.79.2021.10.23.13.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 13:36:07 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-python] python3-zeroconf: update to 0.36.9
Date: Sat, 23 Oct 2021 22:36:05 +0200
Message-Id: <20211023203605.1656492-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Oct 2021 20:36:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93546

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-zeroconf_0.36.0.bb => python3-zeroconf_0.36.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.36.0.bb => python3-zeroconf_0.36.9.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.36.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.36.9.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.36.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.36.9.bb
index 5f6f0a298..8258ddd51 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.36.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.36.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
 
-SRC_URI[sha256sum] = "549f685a318c06d5345ed6533f54f33b206816b564ed7f7876e7b9522e77bf29"
+SRC_URI[sha256sum] = "023ebc58b765537edcb0395367b732e5271e2659760b1d5c6119aaacaeb7b390"
 
 inherit pypi setuptools3
 
-- 
2.25.1


