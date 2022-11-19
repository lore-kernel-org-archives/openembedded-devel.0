Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B27C43219
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:47 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.23277.1668873500241349036
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m/1Z4R61;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id c8so5325545qvn.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3/JFeZ/8DmQSYyEDWspjzla8iFz7vUSERBerygtNpU=;
        b=m/1Z4R61XrywH1BMGocV5Gu7ZZxrMIZ72eYup6nRFRFbM3UwdcZ0Tk3LqIbZofAy5k
         DZszAilkgXJGBpooNHLWp26FfTbfiqRyPzsH2oiZhA5MSc6CPKug4p82IOCoSVr0CmDr
         +psbKrJfnpyt3AXbDht82PeHmbqXTPeqXIdRNoeI0Qv0w4U+nWhgmkF28qJEucIpqWj8
         XPGhdSUhhlT2bUg0FY1Knz/Em8atfzpVRB2WHD3xeF3ldpOQPEkk0ampZq/rwJI+5uml
         CjGN6DWTMkt5CBJ/lt9YGqOMYlAUJl07eIMMPSGffJXK7Sv6+ALp7VI8OuTbKz+n5Yl5
         6x6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3/JFeZ/8DmQSYyEDWspjzla8iFz7vUSERBerygtNpU=;
        b=eRedgqIJjMkfzlxvXZXr3QixONG0/mlAkCWzEQciUgw92MiIcDBo7Fgji7O75FkSe7
         DysuiuvWViFkgG+8Dx+RyZNiA09ymMroxHYy7ScJXjDpqt/goKhasNimcYH+7G2gWLcF
         eeSXKQCrz3DyjsyiR3CwxowWoQ0M3xh2Wm+jBjCJV5AelMlJjRhnnZpc/TIA+I46B9hV
         Ue2btcSGqHn0SytTBI5W/htLLI7AVu/6eLdEb4LOs0nYDKPEaXpg3U1+l+02idAqN3Jw
         X/FpenG5sVUFuKR6xQmXlfmhbltkDX0NKcuknr4d+jh/HLwCn1N7xaAqXxqRJGF1nzPU
         4qeg==
X-Gm-Message-State: ANoB5plSppg6baiNVxmVBw4Ok3+h4vEEgFaX9UEMiv4gbc6A5psEJCDN
	pXb3shtnZPGWO9YpkVQa/RBSivzaCDnedQ==
X-Google-Smtp-Source: AA0mqf5tg2VtKIBqtdx+OFy2RuE3Q/lP1bz6diuZbYPvqkN4ToOWq40c0E3C+uk/Fu3d9QEzsQT4kA==
X-Received: by 2002:a0c:9068:0:b0:4bb:7f7d:2bb5 with SMTP id o95-20020a0c9068000000b004bb7f7d2bb5mr11189189qvo.80.1668873525723;
        Sat, 19 Nov 2022 07:58:45 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 29/35] function2: upgrade 4.2.1 -> 4.2.2
Date: Sat, 19 Nov 2022 10:57:53 -0500
Message-Id: <dba4edcef8ed7c18f4d341a9d28e3f99855f5f73.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99668

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 30444c8a59f6adb050349ae069d176db83c54d3a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../function2/{function2_4.2.1.bb => function2_4.2.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/function2/{function2_4.2.1.bb => function2_4.2.2.bb} (92%)

diff --git a/meta-oe/recipes-support/function2/function2_4.2.1.bb b/meta-oe/recipes-support/function2/function2_4.2.2.bb
similarity index 92%
rename from meta-oe/recipes-support/function2/function2_4.2.1.bb
rename to meta-oe/recipes-support/function2/function2_4.2.2.bb
index 8e3718102e..31cd077d91 100644
--- a/meta-oe/recipes-support/function2/function2_4.2.1.bb
+++ b/meta-oe/recipes-support/function2/function2_4.2.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Provides improved implementations of std::function."
 HOMEPAGE = "https://naios.github.io/function2"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
-SRCREV = "f569a63cfe369df867a1a4d17aaa12269156536c"
+SRCREV = "2d3a878ef19dd5d2fb188898513610fac0a48621"
 PV .= "+git${SRCPV}"
 
 SRC_URI += "gitsm://github.com/Naios/function2;branch=master;protocol=https"
-- 
2.25.1


