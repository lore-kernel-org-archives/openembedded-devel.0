Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D232DC61DB3
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:32:06 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.44983.1674653519834523871
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AvpRzLxz;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-142b72a728fso21329885fac.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6D+uecJlv2w95gPcAkZGJIBQy/ByYG8l//+q9WNZ3tA=;
        b=AvpRzLxzi8ohrr5TfSl6X0qHeuGpCmwxT0fmzQY3/FMFZYbCs3sL5Bp+8moL9I915c
         lXQT+BAo9AlXyxY9jyut8NMVC6A/XLD4GPvkPmIcogE+c8JK4niNvTjMoVrS30F/uuCI
         m2OHjAedtkHrEIOgGrck4j67zbQhTvJP68m7swM4yzgHpJLx61sUoOXNz0wP/459adi1
         BJu9F9d+14HFq/InL7EvezcIWA/GH32480xHd+K1wKN/EtUVih0ups9+yxXIpsut5E1Y
         ojl/2TrlzyFAZu1F8nHlB6oyaELzcXV7I5VrHnUW7rzzgWrveCKWgmdrj2mf8C5z/ei2
         3KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6D+uecJlv2w95gPcAkZGJIBQy/ByYG8l//+q9WNZ3tA=;
        b=7NGP8rhE7HMkLsI6JZA5Xjvur1dxRJXAG6lZ3oJwxVBvUU9OSGSBk4sQg+OXUD4q0j
         Q5wYum/9bH1SeMJksdAouoPUFMSosL939mLp6aTqVSjxBUhyudq6Xpj/2SRA8v58xtch
         amemqVkVJPVq9YHjUgw7s3wKMgmbjS6aNBxsvV/YiJygag4Ppz6gvDw67oIgaD/FVxiQ
         I21i3Vb0/ZQ6MlGeTM952ntzxHlPlcXyMnrYc8NdmCZVCTIS+jZe5gzG1V+dOdc8Exs+
         JEBSVWT/FQ66Wyqbj+ALQhll0RqmUCdg78BHWrbxSWtgAEj5ZIHJg0PJewARIXmHb3mS
         Lpbg==
X-Gm-Message-State: AFqh2kr0Kf0ixZ/JZnoeuUeQEGqlRX/DtNY8+brrjQcopP1hNFYBkIez
	Cm9vRP1eNyulzbPC3EI9FrzCF8Tl6sA=
X-Google-Smtp-Source: AMrXdXt+CXRYgCO9JY7pTqjOThJT3u/lj8YFDa6YtybAQ9+rhDaVQhQWavbVF3cY7+RUFsuNW0G/ZA==
X-Received: by 2002:a05:6870:2103:b0:15f:2923:90fa with SMTP id f3-20020a056870210300b0015f292390famr15482795oae.10.1674653519037;
        Wed, 25 Jan 2023 05:31:59 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 33/41] kernel_add_regdb: Change the task order
Date: Wed, 25 Jan 2023 08:31:15 -0500
Message-Id: <4f16ee20764a1873d1b0e6c48504d026a0e7ccd6.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100768

From: Hermes Zhang <chenhuiz@axis.com>

The kernel_add_regdb should run before do_compile to make it take
effect.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/classes/kernel_wireless_regdb.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/classes/kernel_wireless_regdb.bbclass b/meta-networking/classes/kernel_wireless_regdb.bbclass
index 1238172bd4..9ad566c837 100644
--- a/meta-networking/classes/kernel_wireless_regdb.bbclass
+++ b/meta-networking/classes/kernel_wireless_regdb.bbclass
@@ -17,4 +17,4 @@ do_kernel_add_regdb() {
     cp ${STAGING_LIBDIR_NATIVE}/crda/db.txt ${S}/net/wireless/db.txt
 }
 do_kernel_add_regdb[dirs] = "${S}"
-addtask kernel_add_regdb before do_build after do_configure
+addtask kernel_add_regdb before do_compile after do_configure
-- 
2.25.1


