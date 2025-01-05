Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D0CC02183
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:17 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.48490.1736119448954094400
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ebcyh9tj;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e53a5ff2233so17930631276.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119448; x=1736724248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxvt2I0oqBF8rlFLyBgVfsuh+4TZbhoDBNt4q0rtEEg=;
        b=Ebcyh9tj6w5f9HFYQt8jzqixYSbiBE7mxJ8tbjOnPrBmZGrMeHxyCA0fdrhrZbnNc7
         +VL57iDop5Nllira79/s8aCuYINIVuGPn53BYLvO1r/89Z2Xnc75vfM6MrsJG1M3Cw+n
         1Xzh0mCS6IzbT2clbJXXUFhVxlJx7mmhl1QsEajlclHF3uRljYnyGUGJxuZ485L0M/UE
         KT6sqSjc9LyQFIp9sE93vFDnxAlNo9EEIz9c0dBjQpBeQvG2GFYyJUC1ByvluupqKvV+
         dsvisALW93qXG14f95nKvXJY72N0w8ZOBLp0s14CK5CrE/P/WtOM4HE92KQhHfvMJJDK
         ikYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119448; x=1736724248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxvt2I0oqBF8rlFLyBgVfsuh+4TZbhoDBNt4q0rtEEg=;
        b=mQe/+wlasS54H0Nyfa+8PpRJ9gpjeGvyUCk77trRVbngARQZ+YbxVEVz4In60THtvw
         cIXGRFXFYTL77h3cTqbML3GuJgHZp3KQUDwpKnNC3sN5peIzRe7ocjLKWBpsy3HSJH5f
         hq2UzgvzxbVq1/ktRIsgnLOBDkLenH5jsw7zM111Ftulh0kpSYegttpG0GuzffeFAoNb
         AQ+5sop2Z5daKEsZQfT2mhf97JxOy2I+SFiUZMk79Elov/52eTD4xRz518dD2US3R8Ge
         8RK5tiVftWGmG9djx7j1fPOa1kEcu206nEQe6hpVaKidCyXkweICNWlJMzrjPHfHeE6g
         HYTQ==
X-Gm-Message-State: AOJu0Yz4YbUG9yM6UTh3PTPY8md2Ow7JQ7IZ3bxqpwRwL52oBnls+iU5
	NovphgZtmfN6kNwiRG+sOFmcxaURW3Bo2dSfx37qU+/EerNF4fpdJcJPzQl0
X-Gm-Gg: ASbGncv2mHGB9D1v6fwzaMwiwLqT43kD2AcUmpXo3WKryiPE4OBMNHk1dCD7Q/gh488
	cz0C5HHd7p/SyXWHPl7RuS4X/BO9/Wsry73eCRw4LHLCvi9/k44/kwQboEfTiZpEzw1wml08aJQ
	qHaiIH8oieSERZdhaYO46g4ng3cJ8CUgLWlGDuOL7y+EAFmEEhW0g83nsDc4oYO5Lr5LB6IXqNi
	nY+mT9BND327qyDymJOxpRsgauxqaJXLbqH+vcqz3UggO0N+FowDd4wJdQOOjHwSaGSmQ==
X-Google-Smtp-Source: AGHT+IHp6dEglxVFB4CgeX/0Pewm9oWWgEoasBwrGsJv+HTlf2QHbgrb70JQ9aFIS8axUXpWlCjKvQ==
X-Received: by 2002:a05:6902:2586:b0:e45:aab2:9633 with SMTP id 3f1490d57ef6-e538c261ce4mr37691729276.26.1736119448053;
        Sun, 05 Jan 2025 15:24:08 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 14/24] spice: ignore CVE-2016-0749
Date: Sun,  5 Jan 2025 18:23:47 -0500
Message-ID: <20250105232358.1502946-14-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114644

From: Peter Marko <peter.marko@siemens.com>

NVD tracks this as version-less CVE for spice.
It was fixed by [1] and [2] included in 0.13.2.

[1] https://gitlab.freedesktop.org/spice/spice/-/commit/6b32af3e1746988bb5a5123263bcf61b65e5be7e
[2] https://gitlab.freedesktop.org/spice/spice/-/commit/359ac42a7ac02dcd1013757559292006647cd5c4

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 073e8452748132a93103e5db32dc9980c84d201c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 419316a26e..5e6d8584e3 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -21,6 +21,7 @@ SRC_URI = "gitsm://gitlab.freedesktop.org/spice/spice;branch=master;protocol=htt
 
 S = "${WORKDIR}/git"
 
+CVE_STATUS[CVE-2016-0749] = "fixed-version: patched since 0.13.2"
 CVE_STATUS[CVE-2018-10893] = "fixed-version: patched already, caused by inaccurate CPE in the NVD database."
 
 inherit meson gettext python3native python3-dir pkgconfig
-- 
2.43.0


