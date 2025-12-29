Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A834E92733
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 14:52:03 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44445.1767019918872524207
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 06:51:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l/GBoVXL;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so7144572f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 06:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767019917; x=1767624717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2UE9i93qYAuqbTHsMP0GrYBsEKYQ3wr3h11zfUrIDk=;
        b=l/GBoVXLNFKAJAFDikuu3Ci4W3UTEVsmB3W6VIn8deu/4HThHNDRZdik33iKR6HlLg
         ETGWqCIs5pyrIBqwY05mWrPSPXxVkpnPdbRy63KMlxQQC9MVa6Pq/IV2M+iqUQM6rbHz
         j6e9lc1DfaA2Ub54bycKuC+ZtOJxp6SqIgeoHaVJjalrJCeD6jMVk8RLTn+knkWncvt7
         JD0lfHGxwd1z7I8rTjHGt+U0fz2DD4BqzR+DBVSdmo/BqwaF/987pkVLHlGH/nSOTs/e
         hLaN3+mN2aFZDabR0XdJ0E9gOw5Xa9wMaJkKV2udvTyOaikvDItVJfT88wu+OqI7g0tk
         0ZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019917; x=1767624717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U2UE9i93qYAuqbTHsMP0GrYBsEKYQ3wr3h11zfUrIDk=;
        b=ohAozFRVMz/FPaEaM8JDhATUofczLCJ/6KwolsuOQA032LtVeiaTX6OogMdS5Yol8y
         ZLfSd+0hPcFXmxQN0P2V7y1VqnaB9x5q/IV+w2LWoz22reAtqch34qwaBlRlALn9sXvS
         C5qvXdTCYmbs5ChWtLg82iilmBgTPiYL2COGPVjHtzrvdyxfkFdwNbsFJlwx+HX1Gal/
         aZ4vI27kI9Jy7dS9Fwi+ozNAogYVeSYMGNDprniL3L8FSHVS7cZl4T0auzOLDHqgrFmk
         m9Ptlhf9PqPLFoCqfTEq8+Agi9C7pKt7O+HmFOZp/SYE8yonDA4FofZ5dAN35HDBsFFW
         bUmQ==
X-Gm-Message-State: AOJu0Yy4qHR3wriYi6yMfxbP6FNLWH22qO6jOnEcp5SeLGEKhXWikXMw
	wVrvpBzZWUI0m6iaNAL7xsBWpNAkCh8fkGLT0SEuJmMeWhq2W8xHtRxzEiDKtw==
X-Gm-Gg: AY/fxX7wiPmNIG/e8LsbL5bOU5XCQazsahuOamG4uWnbpO4hj3axsGmlNu0FW51oAut
	yG8SJc09dGFE7cdbIN08hDaFRkl6I7KOK6eWZ5iJY/hnQEN+ANXFrhePwCYKrn7MO6kG82hBemB
	/jYOZulq5BbDY1DqmtU3ZKPvxIazuPBXFBfsYbaSJ9AZV264KKPNwfJW7T5yGhnhq7dvhdWNN9S
	DvmyKyYR9mzbWlv7Auk3VOCf4nA4WTub6GdXKqNUZaGEQiybkqSw6e/h/TWYgodvmzXZrsN8rlV
	EY6iZeuicbROIxy2lnEaZlQPvSWvoFn1Ziulb2gxUKWKjx/TRLFK4gvdOEBhkoHpHtuXQFGFaug
	sc8+0Dnf1HHrlqwqGQmb/8IfLN1SH9OEyVZyuvzw/dmNIhl46Bqd+GkTIFmPNBa6XdeBJlLB9FA
	iUDpDFWw52
X-Google-Smtp-Source: AGHT+IHzZUZVm2DTKJp8VTawnmKNz7GV3oIGGgNg2uWVfByWmip9CwfbY/4x8AZ0FpEO4iSxFhySXQ==
X-Received: by 2002:a05:6000:604:b0:42b:55a1:214f with SMTP id ffacd0b85a97d-4324e4cd634mr34120116f8f.21.1767019917257;
        Mon, 29 Dec 2025 06:51:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm59449884f8f.2.2025.12.29.06.51.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:51:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 07/11] tigervnc: fix typo in CVE_STATUS
Date: Mon, 29 Dec 2025 15:51:48 +0100
Message-ID: <20251229145152.489068-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229145152.489068-1-skandigraun@gmail.com>
References: <20251229145152.489068-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122986

Forgot to add the CVE- prefix in previous patch.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2f913279d4926ab92b97ffbb7c53031835b393bd)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
index d3159f8a88..53832939e1 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.15.0.bb
@@ -86,4 +86,4 @@ FILES:${PN} += " \
 
 SYSTEMD_SERVICE:${PN} = "vncserver@.service"
 
-CVE_STATUS[2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.15.0)"
+CVE_STATUS[CVE-2014-8241] = "fixed-version: The vulnerable code is not present in the used version (1.15.0)"

