Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1140.1792543045263461024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 17:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nnW+Yuvy;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15354aa70e8so527524c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 17:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792543045; x=1793147845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XFat1d3ZpFjE0MuujccegnQOtmbPkR8Yq23Q8mMmhJM=;
        b=nnW+Yuvyee9rw1q+YzBBHz7XVBFLv+s6QdpYAfEmyognY1TEldiwhov02tbJGMHqPf
         uYLJixmqtaGcWZ9Eh2Mjze9cs+xW7VKdFugJmEzLWnwbmnj2DV/ICZcMbVKMo3IVWvM0
         gdeltb8e83ENDvmbG35NPrC3rAVOw2nWRxqQNnx6nSgGSrkFjMcG96P8JlRRkyiu00aC
         LgxdF8GtUkk+uxz9ecT9T6koKEwlGP0HbyPlr4Pli0oAiOZ2wD0KNTJm5WZ7sTg5L0uO
         o29Qj4xA5353CYnjpvdpwIGjENIczRAqhRv0jXcMPYtwIB6ZGjlqxoakq7PZ3M1WSYd2
         Qw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792543045; x=1793147845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XFat1d3ZpFjE0MuujccegnQOtmbPkR8Yq23Q8mMmhJM=;
        b=s5ofxGJafGUgzEcbTP8Ne5RESvI3rjT1+lVHCJc3YP3CZZkRGziublmdfY/fiirtmT
         HsdxgEosc5X5uhso0HVaMeLpSSM0a1NUwpuztG732BK3Opb+/qOw5vC2DTwjQ9EnB/Rl
         7HHcdkoMkrU2p6svvxsXQ1e9JBPUU2lsRaJcb3b5rKmn4CEZDfuVBWmlUQBWImvDz3Lr
         Ech/XMPxoZi5AU8+0e09p6D86jY6i6khE9rJrrYdSfaWLsTvXxYHGZKB3LT04r8+s0bl
         KeVl16Rtktvy+jycRkPJ4gakpoMmJDJ4222dJlFfqGpQirjCxRUOv+FR3oUY/YaJZJmm
         Jvmg==
X-Gm-Message-State: AFq9FYLncAytKYvMrlXO6kuBA8nU+Y28MHjh9hH+F5iOBjirMkJVTowy
	ZIPTZ273GH3U3XOtCJL7rRm1zNp+ML8P/ndFg87NXEMkkV89bzoQ45ix0RztHw==
X-Gm-Gg: AYBFou3aJqx3e3Ie1nuewfRDqtY41br8iuVdiRjnvbxwT2bvPQjFgBq8RYOIDFT6Af5
	LzI4cPcbhtar69EXs4NJCTF6ZiSFhzNajZILwttu8YR3vAmF25V5q9YFjjdJ3h0WOAeKatpNZja
	RShTDTbvPKSk8A2I2AyJD8xwD/9/J6jJa1Vym9sVIvaBo3Bev6tGTW5FWIxuS6A5u7dWAezciNi
	HRuGxG1GFskYIdGpqeb3EQpC+a8OrDHvxWHTZNuEOXUhO0clYl0MaGMso4znKnXpl6qm+fotBrJ
	hNV3UE2lYt8M0156S+D3ZDAF6cXoU6OKIDxRl+9uzD2rM6qt6miVSkVOBu3f4BkhrYkJJTFcZe5
	poKnRWv+n+YWfVTcADxIw0AfinBJXzdT0iL571xuCNaqmN+CGCGTUO5Y9EOu7xc2rESd/CExnAw
	aU97uRxPR1Nt41dJQwCAWLyXMq2tlnoI3eir756F56NkzUr2Ft5/Gw4BnFgrHN3q0hEwOhnLX3h
	xXdV3uw83URYLoRzyJ4wPgfMN5Vc2vX+nZVRxF9wzE/XMpywflzVukkG3RfRit+s2BCNk4jQVeQ
	yCKzYb+eJJiGgqxeErdyaSFk0WTgwHLJgkfJZi8mPWOReoIqmEcF
X-Received: by 2002:a05:7022:1709:b0:13b:4ab5:41d7 with SMTP id a92af1059eb24-190a051ddf3mr514359c88.3.1792543044495;
        Tue, 20 Oct 2026 17:37:24 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035926fe9sm1648124c88.2.2026.10.20.17.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:37:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/5] fluentbit: upgrade 5.1.3 -> 5.1.4
Date: Wed, 21 Oct 2026 13:37:12 +1300
Message-ID: <20261021003715.2982979-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021003715.2982979-1-ankur.tyagi85@gmail.com>
References: <20261021003715.2982979-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 00:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131180
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/fluent/fluent-bit/releases/tag/v5.1.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../fluentbit/{fluentbit_5.1.3.bb => fluentbit_5.1.4.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_5.1.3.bb => fluentbit_5.1.4.bb} (98%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.3.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.4.bb
similarity index 98%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_5.1.3.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_5.1.4.bb
index 158378c8a2..5938656858 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.3.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_5.1.4.bb
@@ -17,9 +17,9 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "d1be1ba389a481ea727462e9a4afeb4538f0365a"
+SRCREV = "eef172226af2879b24ce61d8d73a874567e465c3"
 SRC_URI = "\
-    git://github.com/fluent/fluent-bit.git;nobranch=1;protocol=https;tag=v${PV} \
+    git://github.com/fluent/fluent-bit.git;branch=master;protocol=https;tag=v${PV} \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
     file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch \
     file://0003-CMakeLists.txt-Revise-init-manager-deduction.patch \
