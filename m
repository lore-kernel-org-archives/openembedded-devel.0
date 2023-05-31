Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46550C7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:33 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.11446.1685531607154727431
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AamsO7wp;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-565e8d575cbso32705867b3.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531606; x=1688123606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gH8zNUcP0uWKKrNgmWpDPPr1kh/LHsFuqp1MLJaKp0=;
        b=AamsO7wpK2fTMCJtC3grhHZhzWpGbdjqCNNieotGwnIN9zsSYIluus8qg/4ftl2s1b
         ACb8/E1vF+WqaQNnDRX7jQnLhGRv8xv9MBYctIIDBAoV8aYye5Obvw/ggcGywnX2GX20
         I4HpP/DSIoL8Rgh8ZAoKTNKtg9wqu+lu88dJ6CGVbS7RystZDeKJlawn1yvKecxVrrTM
         BNJZQpzk9t0tyLS6jupo7HtDtkeXesM38R0Sqn+2FkGMYlGU9rd7sE8dB+cxccq0Rabv
         TnaBnvTVegyTPe9r7T37AhhN8vY7LhtnUSOgrEf1F6+RFD79nqDxxLObxrirDq0355KQ
         HaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531606; x=1688123606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gH8zNUcP0uWKKrNgmWpDPPr1kh/LHsFuqp1MLJaKp0=;
        b=Z5xlr2srircIR3lcLcnF/iDBgwZyr/jhQuPPijVQftcMImVZtsgc4mFb0imIEPDEtu
         Ga8n+CadPvcvYpB9SrBYVn5/H3SkJZqJYUxGoRJ1EOSCPhfjcPF3HSd/eS22JLmPLjDj
         ICZxKEO+/98WdTKscTl8uanxz93hRDBdHmxRy9X4yCJH5v8ZLt8KmXbFjTWZT5RfZeXA
         7Ub3QTMKE95jEDDfHp+xLo05HzhEYCbA9j5aTss/4DvXzXMnssV7BTFOiNHQ0HU2d9eU
         MOYLdxOGT8RU38y+b+PzTQXhRm6GY8Bo0JlNUgRVwoledoUSOCEIHolg9OxJ1IzKSPUV
         w03A==
X-Gm-Message-State: AC+VfDxbF3f7foFxex86uMsM2K2FtnoWVXToYTQsLzW0SMvclmfR8w7R
	ZBcSK+zVBSDIleDDfEb2R39LQvTjHj0=
X-Google-Smtp-Source: ACHHUZ4XdS8faSVXICT5Mbneixtdtw6UGA5yJPIUewzivcQlLfcl3KFDpL+O4DeEWnOrF3sjegFGBA==
X-Received: by 2002:a81:7441:0:b0:55a:8e38:7d5f with SMTP id p62-20020a817441000000b0055a8e387d5fmr5078124ywc.39.1685531606111;
        Wed, 31 May 2023 04:13:26 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 18/36] mce-inject: Pass CFLAGS to make
Date: Wed, 31 May 2023 07:12:51 -0400
Message-Id: <20230531111309.2454603-18-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103047

From: Khem Raj <raj.khem@gmail.com>

This ensures right debug directory remapping options are passed to
compiler

Fixes
 WARNING: mce-inject-git-r0 do_package_qa: QA Issue: File /usr/sbin/.debug/mce-inject in package mce-inject-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9f1f22f95bc5e4e74cc8a4399b2d63ff15303896)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/mcelog/mce-inject_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mcelog/mce-inject_git.bb b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
index d440a53d87..a228c3cc06 100644
--- a/meta-oe/recipes-support/mcelog/mce-inject_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
@@ -21,4 +21,4 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
 
 inherit autotools-brokensep
 
-EXTRA_OEMAKE = "destdir=${D}"
+EXTRA_OEMAKE = "destdir=${D} CFLAGS='${CFLAGS}'"
-- 
2.25.1


