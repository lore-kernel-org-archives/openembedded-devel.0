Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83877C53209
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 02:14:36 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11219.1784859273743713897
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 19:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TdKnbmBd;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1193827a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 19:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784859273; x=1785464073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVvvc++wD34NmHi+cCzkO+wYfJb3WbZAfcsODp98mJA=;
        b=TdKnbmBdaPYXTQueFaXNLVCIi1J6jL1TQ1NL5bYTmdt8m8wzgSD/hR/MxiM+PGQk2A
         muHTmejR+1iH5AxuX1gZJm3C8EW9MauOW22vbdgX5xMtPbXkXj5IChsgQlzP0j2ypaz6
         E4u4G/jJfA0MrMiXmmqsmbZ+7RIJ5P7d3s4JZoZfDs9eoyFWvX8S+58/62etLSSQ+fTp
         iwmSHeigKGmM/n8G53ud0INfcBoqJWUt+4pz4WRFiOXOihFkV2LflQ3So6n0jcIZf10T
         SSE9JzcA923xNntlubTf7LKHGjCJH/iQtPvyM2ENFTf+ZEP0Yz+ikbe76j/dlF8MbpY6
         yFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784859273; x=1785464073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVvvc++wD34NmHi+cCzkO+wYfJb3WbZAfcsODp98mJA=;
        b=GMckFJUJcNKdWPj1iI20eexb2eMZ8LAyjBez2Or+g2wpHainzlXkaA8yMneE0kH9Jn
         arst/6RdFpnJ26RrhncZcGd91Ltj+lFkCpTKAcXe9dLih8N2it7iUzTq91h9aCa98qqV
         YxJXj8vVcDFOu2gax+ML/FqGRTk+LfDlt2u74d8hHwyMRaypx69MXdr+Wh1lZGkVQJ7/
         kKpE8dLhYMqFwY0EChak09521JyJqbmwACsWmSVNJ/yLUlEJuMSUxtRIBhqyeoO0/g/3
         lDiJGFoh9xa2km4F+IngNlW7NOyivsbNhSjKp/0T/NWeLSF5XfsA5zp9tYJy7yDVXra1
         PeCA==
X-Gm-Message-State: AOJu0YwJLMKxd66voCsyTtfkvbADAwVy5PAS6OlTOL0eV50fbU5Up9CU
	/7Aig5lUop/VCbpkLCyGRJCB5igOoHA5RBseJr6jTMnBfvT+wNJiWMDqLxjBpauU
X-Gm-Gg: AR+sD12S8hZnFSvkxrpTkVQGk/caEW3ycWxEE1QfVvWB6Jgr8kFpIo0SncR7r5XLGWk
	AD3s/Tb2DYnF4fpOvfh2vFc3teRdtrik/T355c5uk7Rz6KX57G8Fdt52NJv7oN6X1XArwRwKz1Q
	GVQkZV0IFvIxcIe83WhPAeq5sxGLpaQMlbLbOgokspqUz2hYDFa4HxUucNZ7Iz1UidiAGGU9Ufo
	oVK7cAXUfNmcdZ5othV5y0AeBwTa+xYKHVuKOC6D9viPskZ3yIpDTHYUdoOktgz3NF3VCAkH1QT
	FCbh5iG/CO5xsE4qvWHAicXxQy34IoCeVmNXRsV01Ggp3cPRHkaCfZ+XDqj6+fZcty8X3mps8qd
	/IcYqmEeaXVmEbrEo65Olp+9q/+QtE7gliUhCvueKGgOMR+67PC16KNAUj75CtIDA2rp5BUSWka
	ectzj9L/SWY4KUhcM=
X-Received: by 2002:a17:90b:548c:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-38ec6989c87mr5678690a91.13.1784859273100;
        Thu, 23 Jul 2026 19:14:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1300401fsm26824794c88.3.2026.07.23.19.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:14:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 6/13] valkey: upgrade 9.1.0 -> 9.1.1
Date: Fri, 24 Jul 2026 14:14:00 +1200
Message-ID: <20260724021407.2840261-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
References: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 02:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128428

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Note:
https://github.com/valkey-io/valkey/releases/tag/9.1.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../valkey/{valkey_9.1.0.bb => valkey_9.1.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/valkey/{valkey_9.1.0.bb => valkey_9.1.1.bb} (98%)

diff --git a/meta-oe/recipes-extended/valkey/valkey_9.1.0.bb b/meta-oe/recipes-extended/valkey/valkey_9.1.1.bb
similarity index 98%
rename from meta-oe/recipes-extended/valkey/valkey_9.1.0.bb
rename to meta-oe/recipes-extended/valkey/valkey_9.1.1.bb
index de1f413d4f..92cb1cf2f2 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.1.0.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.1.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/valkey-io/valkey.git;branch=${@oe.utils.trim_version
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE-7.patch \
            "
-SRCREV = "c9e8005e9d0ec817e26c7db318861cb821409249"
+SRCREV = "d27f9ba65a04e80d9c417112a7621fc98a56f70d"
 
 RPROVIDES:${PN} = "virtual-redis"
 

