Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B457CC6B08
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 09:18:25 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3084.1791883103427169712
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Jqig8TVw;
 spf=pass (domain: konsulko.com, ip: 209.85.221.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c45111bebso1539219f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 02:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1791883101; x=1792487901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uhTDJhAHsq1ytuJOH31q4sdg+ytX5Cpy7AtkM+Sb+1M=;
        b=Jqig8TVwBqV4OgUtKHGp8rPeuTnbKBy9n78wpYKV2h+1OklcQ4PvU/X6JmTQ2M0qIA
         o6BGhmZIddhz6oJMLI9avgLjt1PtBXddte7ChghtJhcXKi7wxHPbIV4lAKs0FmGeNbDI
         bxr4xDu57enolUI7NL6raxK93tjeTWR2ZZKno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883101; x=1792487901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhTDJhAHsq1ytuJOH31q4sdg+ytX5Cpy7AtkM+Sb+1M=;
        b=tu4emWzaUR5kYm955oYiyA0ue671wJ013SKeCTfjgLtnG8f/FhbBzwkNnKXpSfb2tX
         LgLhJLTp2nxkJ47suVkIPKzjnoHoTWCE/tKk7LaXHwj8TigEG4PSLdsnzsoos4R7mT5N
         +izDBa4Q+cmiQPQiGq4kn8QtH2Kw+kNEVdIzhn6uh4MAaK9Kv6OuTx39XLAXIedF+s+s
         BMXf39tXJ+bHu40Daw/587ISAHEsMKL8fvWgQ1z9DB+QA+BY9CqYeTSxPVYVx1WsTvHL
         mS/dLGu280ey3D8dqw0t+J56i+ISngZDVJs5NjCJtFWNzavWY9j2/pABLPN8yuuMZak8
         A/lg==
X-Gm-Message-State: AFq9FYKxkdLgA+1ocL+Vg6E7vSvOR9LXr0WyLgQ05GeI3y1izh4m15Ys
	ATtwgJyvKOR0IdXnE/5PPiPeoGc1uL0wFf3oXoeqyLlzmaKwUdag9S3F985dRCaIqIgvkdPzBFz
	pfUrM
X-Gm-Gg: AYBFou3IsPVsgxyXbxuu85R/IJPSP/8M4Y7G0rPbFIYQZX7sEBy0obLtMfANy9JNmKI
	3qHLtv5m09vAxtZr8SG+0C9ysTdptS9yWxUBHGkcFRMnsdZFPnuA39fnyikLtxkZYYwEWMF3aLz
	Fk4seOD8RG8GjiNc1sEULE3+gv3jO9uise7SavHvhJwpewtSc1CjHIfkwr0EH55DLvhbSa4IxHm
	isjVsemSgGcuDdZYzDPkn7Tag5iJD1HypJnc1JBLEH5k+uTu8to1ZODXHqp/UbHaIPIcjVjIIsQ
	F2Q9R1tKVuOsdcA2BNKiWBwF7LDqNScE2bS1P/ULsFDGC4h5+a3/JMjeDEHUyE5LkO85gCPzL6Q
	ztCXWQbESNDXvfnqJfDqS4toqD9maoy76RpPEqVNvjPVBdqoqzU5Ynf5dhcVBtUperVq89Ip7Ky
	X52Px49R5NPF7g/SJqOX/0CDWlfBcQW4mIMNJhW2a/xc9UloneqkS7eoC8SZtQDd2jOzyCM4cbv
	v/gEPA0//MYW85y6GuO3mgoxQ9Sdy4W2rWOeFiLedoZqOlpQlFxLGcgPHEzMCbslBwD8MvPkixF
	5nVMTKLUjL+N4p8xcG3wP/V93tzKrKMiMQ==
X-Received: by 2002:a5d:5e90:0:b0:48d:bc33:faa0 with SMTP id ffacd0b85a97d-48dbc33feb4mr20578558f8f.53.1791883101347;
        Tue, 13 Oct 2026 02:18:21 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa34sm4063113f8f.20.2026.10.13.02.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:18:20 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-texttable: Upgrade 1.7.0 -> 1.7.1
Date: Tue, 13 Oct 2026 12:18:17 +0300
Message-ID: <20261013091818.2843061-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 09:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130831

Upgrade to release 1.7.1:

- Consume Python 3 row iterators when reading table headers
- Invalidate horizontal lines when characters or widths change

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-texttable_1.7.0.bb => python3-texttable_1.7.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-texttable_1.7.0.bb => python3-texttable_1.7.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-texttable_1.7.0.bb b/meta-python/recipes-devtools/python/python3-texttable_1.7.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-texttable_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-texttable_1.7.1.bb
index 56448f738e..65472dfb9e 100644
--- a/meta-python/recipes-devtools/python/python3-texttable_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-texttable_1.7.1.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7a97cdac2d9679ffdcfef3dc036d24f6"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2d2068fb55115807d3ac77a4ca68fa48803e84ebb0ee2340f858107a36522638"
+SRC_URI[sha256sum] = "ce71fc5928ede6cd7a60dbe3cb2845e6df8f5598fe435252ea1b31722415fda7"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


