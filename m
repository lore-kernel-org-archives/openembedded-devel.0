Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEA7C02182
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:17 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.48491.1736119449696696823
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YJJi2tD/;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e3a1cfeb711so15444902276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119449; x=1736724249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5GKHqUF0mGnJACJnkKjtls1iZl8FoknllA3mWy+A+M=;
        b=YJJi2tD/x2OUWVyNStEN9gDirRIxA6iC4oqLQ6fEtO1srkisbn1NOlAPRrRFsCKLVr
         W7ooCgoiaXFZYDGYBHrExdJ+rrMa6JLpQ6udSZGmE/5D6vC+0WHW3AN8SdewzH14LtS4
         nUKAOzhtmV9k46JMe62rDp6A+Iu6lpd+ihZJmIqyi4XwMWUP/fpyo6jgVG6I+1hNysP6
         icBp3P2FdKvlJbI+zi7qyEa7qud9vwpFSl41Top5fSlzxFNTSxX8QyFDhHe9bx2ciyqT
         urzWQxzHpRQHNwNc+EV9/QmXba7fguzW+OTPfS1cnjgDrrE8cdkC0AaR0g4OKl7VChkR
         ceZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119449; x=1736724249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5GKHqUF0mGnJACJnkKjtls1iZl8FoknllA3mWy+A+M=;
        b=OKZMLuwXDe36aWRPHQ8A9LYqWhYPtZYsEGs4xfdGNkpowCZyHx0lQ7Xn4LtzIdh1r0
         pl52/dS+iAX5jgKQAx6HJ+xje95g2WeqcbcFP/+pLYdEgPMx4ibrh39KWcGUzUwqc/mv
         Zw5/bHkvBLaBwhN2LfcHJXNM9tEXJJB1nJkPPgQie6SktvjyWBkZ46rejBCH6caElsll
         uJpVuhS4boQTB+U7kEDCHIcAHsC0fGPYpDaOInpIsUYqEb2RQLtLYBaNAhfwhuGJXIUh
         +vk0juPJpr6ZTWIb5UWmtZpqvx6p670OczdMy0gdlA4qm1mOxT5X1ffzQc/XRiBT6THd
         119g==
X-Gm-Message-State: AOJu0Yy6x7Su/JqxcqZ2GES9cNSQh56hpKDzHDzJ6aZKEHOzoZXCo7iN
	64wJ7EezckW6WrjmZFK3YvbktgvuM2h2Uyq7zJUpCNaOuLCaeKYr7ZLDU3s/
X-Gm-Gg: ASbGncvCmjLmc5eTOnsZ+KTGqyG+rmnciSNbd36rPqGiVYxGGwoRSRcRMynK0AsttwY
	kPMbWB1NfxLYnpqPOaM698wPudRWtw1CaeqpyZaLUkQpg6wAt4m7Atb/NkmBx3y8W5ukkePJQRy
	OffQSGTlgxKw/oi3td+4MSBd/CvPfzcN88wNveV+OamP8e8iL4c9xtMK6spClm7wjP4qLlKYGxh
	XrZynOknUcAMXLb9zXOja58aCGFw00kS2fApGXzuAFTF91CCXkgPHQyscnB/Em2nHxwTQ==
X-Google-Smtp-Source: AGHT+IH/Em+b896dvUW7zWOLjrROfX810b9xKHvdXZ8/dgFMPW0sjVeAL1FDfmnzkZQo4J9IYBNy3A==
X-Received: by 2002:a25:58c5:0:b0:e54:a0b3:fb40 with SMTP id 3f1490d57ef6-e54a0b3fca3mr3279247276.20.1736119448805;
        Sun, 05 Jan 2025 15:24:08 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 15/24] gattlib: mark CVE-2019-6498 as fixed
Date: Sun,  5 Jan 2025 18:23:48 -0500
Message-ID: <20250105232358.1502946-15-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114645

From: Peter Marko <peter.marko@siemens.com>

Our hash does not point to exact tag and CVE patch is already in.

We use: 33a8a275928b186381bb0aea0f9778e330e57ec3
Fix: https://github.com/labapart/gattlib/commit/60b813a770e42fdb0e85c1d2da7a55327784b8d6

git describe --tags --match=v0.2 33a8a275928b186381bb0aea0f9778e330e57ec3 60b813a770e42fdb0e85c1d2da7a55327784b8d6
v0.2-262-g33a8a27
v0.2-85-g60b813a

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e5a12d52522f10026570a5c48d6662a5359c4887)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index 7ad28d594d..0841dc2596 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -17,6 +17,8 @@ SRCREV = "33a8a275928b186381bb0aea0f9778e330e57ec3"
 
 S = "${WORKDIR}/git"
 
+CVE_STATUS[CVE-2019-6498] = "fixed-version: patch is already included in sources"
+
 PACKAGECONFIG[examples] = "-DGATTLIB_BUILD_EXAMPLES=ON,-DGATTLIB_BUILD_EXAMPLES=OFF"
 
 # Set this to force use of DBus API if Bluez version is older than 5.42
-- 
2.43.0


