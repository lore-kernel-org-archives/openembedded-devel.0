Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5771EC433EF
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 14:28:01 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.7751.1642256880733518287
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:28:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LO0eQpiX;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id n11so13665352plf.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Nok5EUlmRVLJ1FDtEPmx/hCcKKpbqKjJR4Us1qsC/UE=;
        b=LO0eQpiXl+loLZUhHwXXKWupu5IasuXj9dEgFaIUJh+KQ9tU7fDPfRVIYcJQ4qGgFZ
         9m2YnChYf+NxXXMR+3qdPwiLo8zf9zINzFfJpDGcb/gL+neaiJrBCAUO3UNBVhNKMew3
         PiZn57tPSfB+5gtaW1TcgIwigDcAiWn46g6Ys5LBVgsa4+T/Ee3VR6v85gKz6N0A7GEM
         nfT5YmLM9+UEgxDLqfhYdMqT9zN0nrgsyXRy9ASO8lnd9yNhMUyZIGl7MhwbJWGPiAfW
         ctPQZ89sMDZ2fIpn2/l4DMhmbNHtbQPRoC+Rhy+NfVkfHUc7f+GPeDQiZMgnUr+UcgLl
         6SMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nok5EUlmRVLJ1FDtEPmx/hCcKKpbqKjJR4Us1qsC/UE=;
        b=ixeTTj+qakPIumEfpAcUTl/HI7vVKm201yp12qrvVxIQeNr+0e345ANrBU2va6S7k+
         Z8Y3BnztLiPlTU+AwLrmM60Ik+6g5oQReC4fvtHGt0apV1vPybVMPfnoTDv+v+CfhYu9
         wi7ugLf8ZgrO3eflOIZ01FuHJAsULqTzRYMnNIvF1xT7M36O/vvvkUKdxFwYPhZYxvXf
         IAoANuQKFf8eZaMwPBpcVgoDHg8AtTYahxKPqRfuhiqUS2QVTIRPyhhhj7JDofPL3jBl
         QP4PVziBios+g66kTzKJBTBPwf1bv0gIoiN0eppxA3fs2s4dkQBl9VJktB+/ZtbdfnaT
         hw0Q==
X-Gm-Message-State: AOAM533dJKXGNKXkPslwgykSnQ0IGfgHtzih+lNblBt2EbXW1Z2qgsWq
	mn/s9hzI+7bQBLvbKJ/7AAglJEE3cpPe3A==
X-Google-Smtp-Source: 
 ABdhPJyF5tsufMbuPmjqzQYjn7pgnSaHyJHy9EKNskounr4s1T+uCe6kk9QZR5AeGk0FKmd16CvbjA==
X-Received: by 2002:a17:902:d4c3:b0:14a:3575:2843 with SMTP id
 o3-20020a170902d4c300b0014a35752843mr13971426plg.40.1642256880169;
        Sat, 15 Jan 2022 06:28:00 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:7ab9:6507:6566:58c8])
        by smtp.gmail.com with ESMTPSA id
 k20sm8606779pfk.111.2022.01.15.06.27.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 06:27:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 03/11] redis: add back missing patch
Date: Sat, 15 Jan 2022 06:27:46 -0800
Message-Id: 
 <1cf3147f66746cd2573a88bfca93cc94ba1c0cbd.1642256649.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642256648.git.akuster808@gmail.com>
References: <cover.1642256648.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 14:28:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94862

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_6.2.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.6.bb b/meta-oe/recipes-extended/redis/redis_6.2.6.bb
index c129e61988..202fce16bb 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.6.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.6.bb
@@ -13,7 +13,11 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://hiredis-use-default-CC-if-it-is-set.patch \
            file://lua-update-Makefile-to-use-environment-build-setting.patch \
            file://oe-use-libc-malloc.patch \
+           file://0001-src-Do-not-reset-FINAL_LIBS.patch \
+           file://GNU_SOURCE.patch \
+           file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
+
 SRC_URI[sha256sum] = "5b2b8b7a50111ef395bf1c1d5be11e6e167ac018125055daa8b5c2317ae131ab"
 
 inherit autotools-brokensep update-rc.d systemd useradd
-- 
2.25.1


