Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8739.1792580509756708724
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZEMgBxOh;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso393262f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580508; x=1793185308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZKzcrv8wjMFH5nRhrcGIDjwQ58lcKxKeOyDmcaYmQFk=;
        b=ZEMgBxOheUGsV9bbPfKnUYOuyv073StRwLoGqZgkLB+5dl5aZog/AmjjWje/TWGBFH
         /Pr1QoKRkCVPCceS34zA7C0eZJcKAdqDBEeNBZChsxCkgxcp1syA+DHC+Bti1yCg1bcU
         +l6OxRokvxNI7WKkrO0/oxq7Wno4m+JqePZFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580508; x=1793185308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZKzcrv8wjMFH5nRhrcGIDjwQ58lcKxKeOyDmcaYmQFk=;
        b=N6Hgy3Ht8CFB/N6Ayx30K9DGO/GZv5tESbzvMhAQ6yZ5HYIK3MyhM9jSekyROevvNa
         bYj8oJXU+f25hwav3rB+OrZXwDTal85rhDFXV8vc0ZjWsvUoPRWZCV3lzIUsEZ5e08iB
         XV53MKg4xY5XBCXR+DX875MR3qqxLtaLm52K8zhEn0ulmYoE80uDI6WzDRQZZgBEWNCR
         zWC3frWZhlOL7fGksJ81dD8hLyHm/b7mA95ULMxOnWR0Lx7e3dhWbcvKEEcVtPbjoD8f
         2ssgq2j0/8ozPn/ifJPCrnkrCtuL5n2Y5qqi8YPAy+EtPlH1ExesTu70avsliL6ndfKl
         TV0g==
X-Gm-Message-State: AFq9FYIKLMsxQPR7ug6Uori8vQpFN6az7RQDLvOt9Svs7GLbvoB+rBPM
	oZa6dDR4CDeiELyMdueLbYLKsCus6meY3XYsyN4V7nvtx/6wNJL4L1zwK8xsEPTMBsbUx7oxqZR
	7U2LO
X-Gm-Gg: AYBFou3oluJXiLBwxMNAnNNQU/QXkuA30OCrJgbCzL126vEXyswq+SqKEvZwV5pAMp9
	BGVeJvtEaI2g0c8JKsJqSKpNRCYHeDym7ivbpI6rfDgPOu4hf+WPUt+VS/H6jDTvkOC+rZHNv5z
	9uFK02ErzeYlsxYiAkXpXmyalh6daAVzjO7vWSqdhQu/dktZB2qlpf7JLREJpXkvjUj+qXQqbVU
	YsWPnfTaNkjP92Pe0GQHB1gz4Fb+dex2BfO9pyRPBC4JHR83xNYrGOnNsbmic0CwF+XAx1lYoQw
	1NBn/kR6X++hagy/aMLWRucrawtVVxL0QTkEy3lu5TY7SdEfKy9WaJ5M7wvpn4MIdLmdV6MQE9/
	D+Mw/U24DxL6/nMSSFsI012FMCVayfTD5SZR62p+IfeYusSG+MK2djn9mBaYckHOPcHC9VICH6U
	CUN/bjmn72AwRlzFWz2LU2RS9HAmPNXp+MyauwJ7dO5H6d5QswFHsyCR6CiXsysuAJh3fbkeHIZ
	GKwjKztJZqEPmka9B5PTCTtpsZNsbt4zFLMazLFri4vYV33uNGn062rrVVbIBNISV7NL9VGn2Z/
	CFE5x2D0Vx49xywJ36RjB4GTy9+HboELAO8WlsH2nlyCkjjNTuvPUd8vqieGvzF/fsEF91DM6Ev
	qj6EQ3chfQKUkIPZZjnODbykH3g==
X-Received: by 2002:a5d:5f09:0:b0:48c:6f3a:fe30 with SMTP id ffacd0b85a97d-48e264aaf75mr3239457f8f.15.1792580506465;
        Wed, 21 Oct 2026 04:01:46 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:45 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 21/36] python3-ipython: Upgrade 9.17.0 -> 9.17.1
Date: Wed, 21 Oct 2026 14:00:45 +0300
Message-ID: <20261021110103.1943456-21-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131281
Content-Type: text/plain; charset="utf-8"

Upgrade to release 9.17.1:

- Have builin-lazy magics have a lower priority than registered on

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-ipython_9.17.0.bb => python3-ipython_9.17.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.17.0.bb => python3-ipython_9.17.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.17.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.17.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.17.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.17.1.bb
index 8e4b26cf23..37dbc1a33a 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.17.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=954609b5a3603364bc25989a92e38d67"
 
-SRC_URI[sha256sum] = "1dc69e6966b270fb259f676c71a21450e63607729b14a672b942914a54e8b730"
+SRC_URI[sha256sum] = "8919be8c27f20a6f4423145028063f6637b42a03ce57665bb12015ee1f073529"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.47.3

