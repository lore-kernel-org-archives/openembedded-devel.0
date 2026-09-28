Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0C2CA5FA3
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:04:17 +0000 (UTC)
Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46641.1790553852297342494
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AzsJwP8c;
 spf=pass (domain: gmail.com, ip: 74.125.227.142, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so10704555ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553852; x=1791158652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CnBFPiRhOiKXyAV0fWdEvxCU/31GpbqreJQKKmCM6Nw=;
        b=AzsJwP8cVdTq6FHHzjl9he9kNnmFcBLI4hcdehiOMKvRivJJdlqxGCTEL3Wyj5j2z/
         e8xAnyVDrHPzNwneAeq4XY0V6o7l/ozGo2kQKen8FKtlJNUJVPKG5wPedLg3s/7Zvi7E
         nF4xMIpTlh4GJ+YFSz7by1IsYqS5ECy+xrC6N4dcsPS14RX1Le/RuWqwGXojkkxz/oMB
         PUCm1qmPOIPOmlw1CDZ0SDWhJzbEWeKKGZ1Ja8g2Jwjo8enZtErVLhmNGODhN903U6EO
         PClwfMsN5GNOOEmG2DPxCCIl1cRd05VvB5pmnUngwkcIH2pRbTO3WHKn+H5iTI9pcNZX
         LSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553852; x=1791158652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CnBFPiRhOiKXyAV0fWdEvxCU/31GpbqreJQKKmCM6Nw=;
        b=n+SNkn1WSPgYB/HyfykgK2bQoRsIPTnm+uMY2K4C1bb1kMH5H9K83vRuCZJ+7XyMCO
         ncaTy0XMcPLeBk4SfRw2joZbUu15XGXaHWU7g3bTxNd8ngcHi9IEb8emoDSt7EXY9Th0
         tfgLiq9LWYkmPc9DKspYQZvgQIwdNJEFlgr+i70xCY8vJdECbs0qsNqLMt5pVDQN/AZX
         PNgBMGwxqSZoJA2PxhD49Jg5iHc81hGgVNjapBzXBu0YsW9VMntb7Wf+nP9sHNn6k1hr
         WZJcuqttclNmrKYHC1RmMiY8kmQsdHdsiK+er3J4qw8209/BDEeOV3gOsnuAuHsxoI9i
         sbJA==
X-Gm-Message-State: AFq9FYIbkxHEK/Y1Hwh4wvtCisWtJAT1ufPMognyWYmrZ3qn2NzEOwyn
	ypMi5exCjDnvnMTA1MMdXSxlSwo3gw4ZTiytyC4ALmIoro3wfi08MB+PRK+fuA==
X-Gm-Gg: AYBFou3qa+QkjxhChvm+9pSer7pNWTxw6Y5uzd37zy+8t3qBg3pOSTBZtU8MvjaKOAt
	n9lmuybDHP8FrrY/gLzhRekczuh3b3g+RT43WXpIZ8S5KbJRdSIjtoRuoSd/1CJk5U5pKGByWIk
	/m9p/CQUhxk4OoZuvtfbwuvN8bgqTKmzbPA5SkPgHRVMpJzHopGoXaYbzSVej/KKgy8ZFWFiJkw
	exuggzOcTHwubIno9SDxi6oWgI1JlpU7tPOdSO4jVhqLiN2PBhx47SFMS/UAt0KsuCaVrhzXuh+
	+26blW3IcZhw5ldbPvVu1Z6Is11ebdTLxcM1Ke5/ZycdwjO0hX5wwBzkLN8SumjqjErHtOSq6TI
	RXUIDIowAZU8vk+5q9IZXonPFrf3osJroibwlUn6LKqZh5EqAaSobAwED/k1pqopHAZnWlB2zCb
	bhYb91n3rB8YiHR25/pyHOGqDNqczpqDAbCBo6ncucRebQ7Vwcpe6wHfrbieqjsQpL5bDDuz+wg
	Vq+5JhRyFiaAeDomQwQA2U=
X-Received: by 2002:a17:903:2408:b0:2df:9556:684c with SMTP id d9443c01a7336-2df95566bb5mr60129855ad.44.1790553851524;
        Sun, 27 Sep 2026 17:04:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:04:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 29/30] python3-telnetlib3: upgrade 5.0.0 -> 5.0.1
Date: Mon, 28 Sep 2026 13:03:01 +1300
Message-ID: <20260928000302.2528437-29-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130416

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/jquast/telnetlib3/releases/tag/5.0.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...{python3-telnetlib3_5.0.0.bb => python3-telnetlib3_5.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-telnetlib3_5.0.0.bb => python3-telnetlib3_5.0.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.0.bb b/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-telnetlib3_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-telnetlib3_5.0.1.bb
index 45956d7154..2642f08c88 100644
--- a/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jquast/telnetlib3"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=15abe157ad6f0b483975cc34bcc1aa99"
 
-SRC_URI[sha256sum] = "b5387d811a270b98698081083a7843530c44765c0a023e3cab6fe8d81f8a2c73"
+SRC_URI[sha256sum] = "6fde197ffb71cf26ad27fe2c88694d8364f4b1cc962a37762e0cf7e79b9afaed"
 
 
 inherit pypi python_setuptools_build_meta python_hatchling

