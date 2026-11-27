Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10352.1795753046389112886
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=EXjx9HaR;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8650095c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753046; x=1796357846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/Vqs6qwlXMCS5D2/ETD6yPKNbSgDxOB+CXdndlByzE=;
        b=EXjx9HaRw4qvAvvDgarQL83yH7I5BIY9w+4EU7cRjR/j/PJxWi5JK4VLKI/k53Ry+/
         j624UYMMlWXTm/TKV4OBYLvnNjwG+8aMY5w2xTG+3TEAfhBOEGO1Rer6hULQRC93hY3N
         gG5tGWb6dJjFkNesOyG+Li92shMVA9GSM0vnEwTAIbP4hfjdSMMzImcW40+fItmqxMRD
         wzu4sghEXtaWBOETCoIjVpkW5UYOPhKI9IxA0T6qysLWllgddeuvEdtmIzjEVFQFJF0s
         424ksJ72PsFJ6P6+F1Aj+4VJ6FAL10GBclgKvERcoxjipdDgtQCw2AtsMQGKKiajDT8o
         jbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753046; x=1796357846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o/Vqs6qwlXMCS5D2/ETD6yPKNbSgDxOB+CXdndlByzE=;
        b=wXfByACfe0Z0S+OLahn1FSFP59eC6j/zQUvbilM1hb55VXjT1X4jku/vcUdlahN7rV
         mdhECIA7+6bviHh/2IuwT+3XMBGxDKoX4sqU8ddNFjCSZtLRBwOvKJXjx6LxLBets4KA
         pOqRVI1Lbp2m8qVQA+dBbX5ecLij7cmil3IaoJopI2uCEP+qKq9FuqFcMs8CljBmtgt+
         weZw7xy1061vOwHDPfmFy8wan/lg6x4ele8TviHW5cQOqXEMGrk4VVl5YwCWA93s3Zxu
         1N9Cqyttd0q4c9Ud9ialm6rD7ZSRBjIO85e0iO0/TiQnilqs5DHj1k5qe/kaGuqDsf+3
         evIw==
X-Gm-Message-State: APuU4Z9WWWy2OcFMftHZmT5vfQCkGWt1Dq0I0ADiwFltZ/OOxw41Hy3Q
	OG1WkLgo92b2LWL9XU6wpesFbGp9m49n8BEdHzf8TpY8FXDH77SM0FZed0cf9C4p
X-Gm-Gg: AZFdTZcgXMgD+qpCRnk+dcJ3k26kjH/5gAOQrtSERU8Iq6NK+Od74i+RNCoqVyWlAIi
	krUqMwN/Y4rsNm+6IZzA6IHRlNmk9w/0orIgwWqmd0RKFFavHD+WDBSNsjm5DhbAIme230BvKsh
	anyUhWNVLZ+eGIJ+ZiTwx4nNXNhMQYprvv/jdNetf3BC/n/5G8cVCEX2Hh95M80qoI8gTbojzF7
	j0iNmxZDsgN9T7KgTfb070kPrcUEavQ61PO4Y6KSBskSd//TbbdC6M91o2nYxn5W43irVtfJy9c
	apUbG3hLse/PAJjB8v0xhqLOTjyPijn6X95lnXUsd+E/G1GeAkg1/sK90MzRghNjCWm4fFyCy0d
	TFt7iQyzVVox1jnu0NS9XvkxhQmkqpsgZlrlN5dgWlzr0G5bx4MvOhMRnr6gIOZzPY2wPZe8SSs
	wFp92CKrLgn2bKCRrEpfv3e9F1QscPHGrm0wZC0GVASa6dYxi1PBY7efChBamcAJ/w8AOOKXSQU
	Vj223dq6XqDhiVDfvXhC9UP55D2r5bDIiJhnn5OrlBy3eeIxNd+YomhtYF4HNHEfweL1AqkNwzQ
	wLa+9qsHwoFkvTjVf8uT70G7nZNVjTf6GaXEje+cuiyzvMwPjLbCLgUGPgWy2V+7ggoM7zOc5Ox
	TYh37qW6eqYMoqcbNr1D/lNhvMXqYUT0W6CkvuMZZzpaRjfSJdndjPRRgRn8HqbRve8a4WibsPe
	Wlyy5X75JZQ14ruhnHVCH85gZWinouUuYpfAET6HCwxt7EqcNeycTrBnM2Axpo4RPO3i7tWsvUL
	lLBWbzOXSvGMsGbUYSOaOYVzH5ZegvEKsis8X9fpzjJVkUe9muCByN2vHFp9ShrJA06F0kWlK66
	M+jDTAA2R13cE717Z3YHi+xw7A==
X-Received: by 2002:a05:701b:221b:b0:1a9:f3d2:6262 with SMTP id a92af1059eb24-1b5568de77fmr21247516c88.36.1795753045736;
        Thu, 26 Nov 2026 20:17:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 07/35] ot-br-posix: Fix upstream version check
Date: Thu, 26 Nov 2026 20:16:47 -0800
Message-ID: <20261127041715.1776485-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133259
Content-Type: text/plain; charset="utf-8"

The default tag regex picked the thread-reference-20250612 date tag.
Upstream now publishes monthly vYYYY.MM.N releases; match those tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-connectivity/openthread/ot-br-posix_git.bb          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index 5006b253fe..556dd4e4f4 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -20,6 +20,8 @@ SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=m
            file://0001-posix-backtrace-Reference-sCrashCallback-on-non-gli.patch;patchdir=third_party/openthread/repo \
            "
 
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
 SYSTEMD_SERVICE:${PN} = "otbr-agent.service"
 
 inherit pkgconfig cmake systemd
