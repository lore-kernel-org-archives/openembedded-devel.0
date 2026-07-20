Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231F2C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:22 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11285.1784590760919546803
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gQTg8iSL;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso7446829a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590760; x=1785195560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXsZeHk1kbUwn7wo/WO75rp5MpxJP8WLtONuZBnNsn8=;
        b=gQTg8iSLDzr5dQhbj28zM8j/0MW+rLNhWM6T5rD69J9UGGdaf+S0dR1yLnn+yDq7Yc
         wecdr0AhiG4pWCZuMl9XPKsrhBTjRXmr0Jh41lbZtqGx2kekqceG6N27kQyJu0hkubbV
         GTxdce1gMn2kDsgM9TJwioiSarFx7QQXGnceYGOn8X5wQt6LZEck7plHoTi4nJCINwVy
         84rF58eyEk1KfM5eHnlFcyV9f88XHliTyc1JznhOC2R1JiRs4iIn22DjNvhEOLABLl0Q
         sfmVCSR0JWkwrLEUdaBsfv9EcF3nPK2QjX8U+r9nrxekZIa9KpRY56nnxndCMi6dEa9L
         yBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590760; x=1785195560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DXsZeHk1kbUwn7wo/WO75rp5MpxJP8WLtONuZBnNsn8=;
        b=JuDXzQ9It4ocLhGisNmKw39mm9YBps7vEH5WP03txQcn1lScQDzSGTfbHS70YFT6M3
         QGaCPthdhrHqJgLa8HOgFGT1jKmgx3ZVM2W+b4JC9Yw1RqrMt7K9CIkh6vp1HszynRyN
         eoGhToMCuYzpahIUqKfGwse5P9bS/KUlZj66Qe6Oc4W8ICwmgj4X8cZt+YYWExALmmIb
         SG9qCfXWPzBpzi/i2M26dWm16q5SkBpHjL3fxccpRhN1jmKXbZMnJlfE5HdNOTJAbn8r
         s0UbTBlCOEOjsHZixpxLjEzbluEkANgOvVl4mz9Xb2Eg8ep4d3vopjNZZBMl5p835MVS
         Mmvw==
X-Gm-Message-State: AOJu0YyenxAAVn4ONxmK8PUfQc4x7MoG1vT3x7ZHHNelpPDVs8GEwl4U
	UrD5fmZZHxu/1wuRM6mrCpSfELgmskox9gWxnXu0qZ+ZBM85m0UC4YdwiUOQ4w==
X-Gm-Gg: AfdE7cmnPZ6u6D9bHIDsvFBAvSsDLqjhcjtCgpvaHzQUPhlfz3TdNvkNiNV5YnNVUCb
	gvkbet7nt8JiOBGobS65GhN2d58q3wqAtmHS9YfA9I++rvvNE3slxbe0wyz+EFcDHfGr3G8HGzq
	NpG5S1DiyryKwAtIdq+Iyx/WkZBjONpsg2sQY4ZbstinHlZdbFzxxcp4oR3vDITFsdDFAeVZDe0
	9EdEbgl2RoBtiSd7kIsQ9EYb4OpxLg5poEQr65qo0poV+N/SE9gbNb+pDTzAh6JVzxlL1pdg2nx
	Zr4I63xqv0/AxwtEy0B88NcM1QnOQnncd0dCVZOHIemFNGwFbMnG8zCHdmdqxXGDrOLxgniOeDB
	FHsDXqjFuGto3cE5GPF3XqYwIi0BLcLc1skiNbtejHgxjFBhVgU/3HvwqIeoKxdcHoZAPo8WA6G
	3DJ5ye9ngRyasuy6U=
X-Received: by 2002:a05:6300:2289:b0:3c3:a546:12a2 with SMTP id adf61e73a8af0-3c3ad975d93mr17009311637.52.1784590760284;
        Mon, 20 Jul 2026 16:39:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:39:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 22/30] samba: upgrade 4.23.5 -> 4.23.8
Date: Tue, 21 Jul 2026 11:38:03 +1200
Message-ID: <20260720233811.2324493-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128323

From: Khem Raj <khem.raj@oss.qualcomm.com>

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 7840b777e1d81add8199fb520a4d0199309e52a9)

Security release https://gitlab.com/samba-team/samba/-/blob/samba-4.23.8/WHATSNEW.txt?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../samba/{samba_4.23.5.bb => samba_4.23.8.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.23.5.bb => samba_4.23.8.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.23.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.23.8.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.23.5.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.23.8.bb
index ec3149562a..fb00dd2ec1 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.23.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.23.8.bb
@@ -39,7 +39,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "593a43ddd0d57902237dfa76888f7b02cb7fc7747111369cb31e126db4836b9f"
+SRC_URI[sha256sum] = "976129847456dc5b78c00f8ffb79dc605c49d6aaca8b2aa772fd22dbb69fae01"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
 

