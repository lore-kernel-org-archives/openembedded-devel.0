Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3DEE9E2F7
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:01:06 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17597.1770811261977534163
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 04:01:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gk964mzJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8249fc726e9so291347b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 04:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770811261; x=1771416061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJSZNDOx4Q9tXEImrn9xaKvki9n2UTfSh9OZJPSZiXc=;
        b=gk964mzJDcie9Dw0gy2E+LtueEV7PPePNEcJ/Km0llxbWFBuluFeyFGIEy+JMVyecJ
         +nIZLpqrXdY9BMcuDG0nflDkgGib1igZGTC5jXBgXeMnaiaOXXfRs1W8JU/VbUgAeHJH
         Z7uFM3nMMn9TB/HW7GauQ2LE1Ff8wF3S+yxtQp7idWq2bwURX+wD4h07AlcTpVUDo52n
         YxU+ZA9pkJA2Tjqj6PSfQlf4ASIpdG5wbIM3TYmMuDKvvcjSQkkh1KPg3u5kFzjoRn3R
         Tf/vbUnJO0zn+BAcRJHgbiy7yB6Cx1Q0oGYHNf/1YuX2SlYXPHSuo+QRd2RKla6AAGkn
         +UgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770811261; x=1771416061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FJSZNDOx4Q9tXEImrn9xaKvki9n2UTfSh9OZJPSZiXc=;
        b=h+4LVT1v9E57EYZyJXkJTwTLy7yNR1qsDBdlJvKW4j/mU4g5l9OSbYJQuIqbmveknk
         BO0hMzjN7wUsjHslZk1lMUsGsKNnugxPVbtNyIrsU8XK2Tu3yxFjnh2VWVBOpn07040G
         1Flpg285wq54IPiRFclbEZftXJl6bbzjBzS/mMLctNOlWN7i6brZUHYTYRwbP+cJeZfS
         Ap4xboacr5LRCE2i2q3MeKKPSwkQQRPDaw/ioBw3seW+qSc3wTKO/s38tI8Uq/sE9uiV
         un4+o2lUXUs5x2IshKZPXTOEry2RJwIrI8AZ45Pz/+7gm0ZA8tzG6sAGJcw3smibVLC/
         qJJg==
X-Gm-Message-State: AOJu0YzaMB5Xli/5oQk4kntPJ2BygL7dViz0+e9/Rv1thzy6w9UD/Hat
	eS4z6QCrn1E3DqFM/59T0auEErAsp1gSEFY8fyA5Z4o9zrRQFoB0yWnN+4LupA==
X-Gm-Gg: AZuq6aJf9aeBtwlYctjBkkUG45RyYQ3hKBYinmq1HmfaZGBSv+Z4CwaDitpXIfM0XGQ
	5wP68ahbGRZPhc24weerUI3FIrw7EvKg7uL/1F6mM2UP/TsWW3jqxzbALTdjDZ4AUfBOJI0HO6/
	DjzI+u5IwMRMH6LLhxphAZlGQKonqp6cM9GGsC3VF3bhDf5JwFEEgnOuFihtr4XWGH9r3SwQp9y
	eivbFtmf48rW35SeM+YQS/BYcrGLtwuCb/uWA7VJDDXGpsJKyMID3snOeK9ppbGte9jMkf2gq88
	DcIYm8O4y6g9naKb06PAQvKBUZkZCGCCv+OWW3kQ8pYUiHazZXQyZhRPMwN+T44Emg7RqAi/8vM
	4PEo0OzW+Y5HlbkQ1E55BWNECpvf2MNEvkn8XhQnyrA44DV8nRtDPIMRgOp2FaVeWsG56GThC5/
	RvxoATtPn9Yw5e3jKneVrkuzhr5lXw4hboJ0g=
X-Received: by 2002:a05:6a00:4c1a:b0:81f:be3c:37e4 with SMTP id d2e1a72fcca58-8249aecc919mr2049104b3a.27.1770811260681;
        Wed, 11 Feb 2026 04:01:00 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3669d8sm1805831b3a.2.2026.02.11.04.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 04:00:59 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 7/8] libtracefs: upgrade 1.8.2 -> 1.8.3
Date: Thu, 12 Feb 2026 01:00:24 +1300
Message-ID: <20260211120025.4190831-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
References: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 12:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124335

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0fbbddd53762d6cb273e898dbea6838a8af468d5)

Changes:
https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/tag/?h=libtracefs-1.8.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libtracefs/{libtracefs_1.8.2.bb => libtracefs_1.8.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/libtracefs/{libtracefs_1.8.2.bb => libtracefs_1.8.3.bb} (94%)

diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
similarity index 94%
rename from meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
rename to meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
index 35eabc7b11..8f27db9bf0 100644
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
 SECTION = "libs"
 DEPENDS = "libtraceevent bison-native flex-native"
 
-SRCREV = "03790961bf2e83b7b61fb6d326fb1076a4293adb"
+SRCREV = "6fad6a14ba0d4c4b437d9e4eed7098d4bb07b4fc"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BPN};protocol=https \
            file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch \
            "

