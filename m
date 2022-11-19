Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD80C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:27 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.23536.1668873486121725625
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qVEWsKw9;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id cg5so4931906qtb.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6l43Rf+RnQQP6HKQU8lwBU/pB8dqBjAZQpfAHWBlX7U=;
        b=qVEWsKw9Gd7n/JgkG5/7uts2EJ+tPyxx0Y2j4PTohDUxjhxEJ1Gv4Tp9cFqp70SDEv
         91rj3Dgz4EYPw8I51ND9JMyQVHkitb0NfZbdYB6Inp1Czd4KyUotoCZ93zR8trxuK1Xx
         AX1D2a5Si8OcPKSZyCoWoALurvsofMk1ZakmVzLRLLCn4VpSwfOC/2TPAycT68HRmp17
         2imBCJeZqqZMDUbDKQq81+Wb7x9jdMktl1KE2VxG06LgEB4EeP0VUp/r7eLYtZ6NVtEq
         2FMiv4UxQ/pNOg9IhpMiA6Vm+0DXXCx4zo1Vjvr9mNBgzGP5ybcwJ4BWvMxZCVFCM3AO
         Zm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6l43Rf+RnQQP6HKQU8lwBU/pB8dqBjAZQpfAHWBlX7U=;
        b=VRbXw1AdNpf9kP8nWR1+8XXaev3hJl/2O5XgJ3IvxHhJlBPa3Gu8QB5N6OeF6Axinh
         fOIDiH5MwCvL7HYAxbzFJrF9O9mevj48mm+3iFoH8JBXJhMN8CpVMU5AxCihxYUFz9gQ
         1l4ROmma2pDi2l+oEhgoTHFv5Hayi4HLYxAg8YuKWyErtr93oIsepjW3E3YpPZRRi/8e
         Dx/rjVIKnw3h71wyAFsa8eIMbgOtC6uQ2kbroqjZh0LAc+xehElhVPMWmpVobp1NYUPh
         90fph/ZtfWg0g60kQ08osEJ+RSSjDrfZVPqd394wZOBxsBH3nZUjlyRT25WQPf3G6taQ
         NO4Q==
X-Gm-Message-State: ANoB5pkkuDKFXs9gS82YVZVBfzdl2sovIKUSCD5r3ZD3VH1cItSgQUK+
	ARSKXMoWHTsupswN7Xv47+DGerduP/8zsw==
X-Google-Smtp-Source: AA0mqf7JIlyg8CYGTD4+4LCZSZdmE+HSUEKKVA+/5AFkfQHIjS+5b33xNmGedP1LRdELrDaxtM4ipA==
X-Received: by 2002:a05:622a:4d0f:b0:3a5:1cc2:f19e with SMTP id fd15-20020a05622a4d0f00b003a51cc2f19emr11063563qtb.577.1668873505895;
        Sat, 19 Nov 2022 07:58:25 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 16/35] python3-oauthlib: upgrade 3.2.1 -> 3.2.2
Date: Sat, 19 Nov 2022 10:57:40 -0500
Message-Id: <c77093ee639e4464384d70e67d2c5d0e73b434b1.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99655

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit eb6ccb958e485e6f82d77bfda39d49318f2ba77d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-oauthlib_3.2.1.bb => python3-oauthlib_3.2.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-oauthlib_3.2.1.bb => python3-oauthlib_3.2.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-oauthlib_3.2.1.bb b/meta-python/recipes-devtools/python/python3-oauthlib_3.2.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-oauthlib_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-oauthlib_3.2.2.bb
index 8cc30489bf..566279d71c 100644
--- a/meta-python/recipes-devtools/python/python3-oauthlib_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-oauthlib_3.2.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/idan/oauthlib"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=abd2675e944a2011aed7e505290ba482"
 
-SRC_URI[sha256sum] = "1565237372795bf6ee3e5aba5e2a85bd5a65d0e2aa5c628b9a97b7d7a0da3721"
+SRC_URI[sha256sum] = "9859c40929662bec5d64f34d01c99e093149682a3f38915dc0655d5a633dd918"
 
 inherit pypi setuptools3
 
-- 
2.25.1


