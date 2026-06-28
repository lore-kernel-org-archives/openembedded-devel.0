Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 075E2C43327
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:38 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14751.1782634355350032366
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YrCiyqD/;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30df5854e1eso382644eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634355; x=1783239155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmtOaClHCSeCX5Viaym/Olu5mZyPUa5KCG/LTDmNw0g=;
        b=YrCiyqD/F/eEVO8oTEmvcgxVcyAH+Qn2H9S7zprAxaVBq/ZwV3LvdHbkaS76Q5czbZ
         5Kcq3W1aXTqK1Cp3pYVqwHMO9QwODzdJOTGK5a7LknuBFzxQ+zbWluz1O4p905GbPRjo
         Smgo1Va9/6M7lLim+2rDZUf/Ly0PqzbuVWAfNbx1goPhDTHZM2q5oiejSU6woxWOwmZZ
         +cmkfmvGcFji4f9y8cjP9j2UocjJq5TyT+wi1/FUH86ewZMq8HYoc/U9bGB1W9moMwxs
         Jw/d4YRjIBQJ8+QPfVOqibTLs5aZXnIreygLn6mWEZNOVclY+YfqCN/HpE5TBoMESfM1
         eWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634355; x=1783239155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wmtOaClHCSeCX5Viaym/Olu5mZyPUa5KCG/LTDmNw0g=;
        b=Sz1IKUCAxhBYA45M1Ky2fL0JTRu42hDMeyTg3anRLxV8mCqj+oOWb5cK9+aaooCtTN
         6l4oV3gWaMujpsiurLXiDBi8w/47orcB9FK4794i5cmsxy/Az8zr7nKPE3CZFvoaDGpL
         A8XLHdj3AmroZT6Mj/l7/VQ9ekXQDK6dJYuWXkqXjwIViToLnzkqfQw/pa4LcxN+Dvf1
         OqYj8/eyGPVSxH7tlW7SKPHyocCq5hDTAdaLs6R53PL5s9n5Mui/DkjuTSm4G2mC0Ax7
         VZb+Go3fgxn8pIdwTjO2t1VCUp0Wm0w05ItX09TiPdCJ5VhpnFkkV87SO58/6PUW7kov
         SO1A==
X-Gm-Message-State: AOJu0YxI6vTpxV1qZLRvyUfEJQbYitwthB12OfFO1MUJYajBbGt+qKMa
	nr8PlEFUJs+3oNBUKw+REDIqrH0EVM46bv+YHJF1KNCQ1zW9M39V/EyRerx7zjpMjpJrcA==
X-Gm-Gg: AfdE7ck6FxSH/n3jPQ4DYLk/O1j34OnuOUqyVDlA7LK011A/lmEr/YLfxc5BEZmv5mH
	ncCrBsth0WWSpaW5Rp1VKJD+jMXPtSAX6GdHAKkrOpnQmoPUygxhQxHuNcjhHx1ziIdJ9bvvDmi
	nZ6n52WOrpXSRY/JAmuWcuAXFrmsrH+sqTJjbPWPbEvglYDwvbmvwOlI4IYUMVEB6kOPG02zi5W
	KO6IaiQjC8kFDtAqtAJXyop5S+mFFdg4QdgLuWcPbzo5BHAcWsT5dchPzl3QaO0KRUJMLHdOYLu
	mFd5SynaEq+b6wkSe/cVyJP+z3pU+zGBp5wfgpJHsBXNghofbwFDhMILSDafTthF3OW6Jf3KfL+
	UFombMHT0HDf52JXS1gPdmD9uwGtA85xuusH36qj/ytnjCOVIJrJDtlGR2sd4wGKL44Y99zYkK0
	PRt/PW0SCQtmVwq8yahq3HE/rfZSDXgNHC0eBVrOe6pkQlvZ8ZqxfWlSS4bHTbIzBfXWdGf3bTG
	BdTK9PdTVe6c0xI328yEtGrMxqVoQex23hMFXFAVYZYcQDepgJIEyN9qnn8dkTkL7Kl678z0gyA
	MVhp47bxpPmmH9F24ffZq8zdwPGuHg==
X-Received: by 2002:a05:7300:3b28:b0:30c:ab96:7303 with SMTP id 5a478bee46e88-30cab967707mr6858534eec.19.1782634354696;
        Sun, 28 Jun 2026 01:12:34 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 076/128] pv: upgrade 1.10.1 -> 1.10.5
Date: Sun, 28 Jun 2026 01:10:27 -0700
Message-ID: <20260628081122.178348-76-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127886

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/pv/{pv_1.10.1.bb => pv_1.10.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pv/{pv_1.10.1.bb => pv_1.10.5.bb} (95%)

diff --git a/meta-oe/recipes-support/pv/pv_1.10.1.bb b/meta-oe/recipes-support/pv/pv_1.10.5.bb
similarity index 95%
rename from meta-oe/recipes-support/pv/pv_1.10.1.bb
rename to meta-oe/recipes-support/pv/pv_1.10.5.bb
index c3cf5e87e8..5ccb9f05af 100644
--- a/meta-oe/recipes-support/pv/pv_1.10.1.bb
+++ b/meta-oe/recipes-support/pv/pv_1.10.5.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.ivarch.com/programs/sources/${BP}.tar.gz \
            file://pv-test-system-version.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "20d38794b00fa9384a1ddf9e395a8357a0782cd95c8b74cf1df8df6388950eec"
+SRC_URI[sha256sum] = "ab21b4f8662280646b6a02e1b9f096790918f89c952bbe0d06fef75d3b52fb15"
 
 UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
 UPSTREAM_CHECK_REGEX = "pv-(?P<pver>\d+(\.\d+)+).tar"

