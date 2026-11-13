Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2174.1794589407765266431
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 09:03:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=tYs9UqsX;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36e795af1d4so840844eec.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794589407; x=1795194207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTaRzm9yrs0z+IPlVqjUxo8dTg/bPGdYBbSIkTguUpo=;
        b=tYs9UqsXJ3y20CoR3L9FKVOioVEmTvUwihOVw1Qovtj2ZZvDlPPkypUPV9f0jRFS+O
         AqpUFGH3DxEIb5vAFdqBAD0CNCSUhKLCRNYUpPHUj7RBROrp/nyMFHktpQw2RA3x2uKi
         RR3uLgntdaClT1r3jm4Bdio8FF4/bCPDQlmsKSk0ujePEUfAQk99p8ZqQwsueNZ3ULt+
         fMPAxov8mBOGSJcdDkzuXG2qelPKlwzTHQ1A2GcnWyVZcn3MvQiKckjuoNhQcv6rg9Tf
         CWLvwnry+pBO2hpMvC/WiCHROJeSOm/0AJSr6wFEkTucd/Vtgm3OC6H/ECy4i7YVHPhc
         8Umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589407; x=1795194207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dTaRzm9yrs0z+IPlVqjUxo8dTg/bPGdYBbSIkTguUpo=;
        b=G3/F/VK9wKQ95TH5XS0pqH9jDlJCJAIHkUJGvE9MnROWyKU0fLu9BdNqRmkMdqrznX
         Z8emnogbqIBqtgQSpT1sIG6KPsvVIXUCgkAKG8/iUGqTAMUYaxmsu5bXboizGDvDk6TL
         C/vdQQgDZbAPPMvkeWx12Fsz0HEDOlIRCCXEA9wXKkjy9B4BG8q5bI5J38A+kwFlu3zi
         QxA6O1Y32N8+xNjtrF2IWJj2ODEsKvxFGThyoyfGiH20wN4GV9+oH2lMhRxpi+k/Z9E+
         2PE2h2pHZEqcTSPRrkjzPzg8e6KcmmlSBEo0+7YAGdju03bx++YEc1rxKVZ6V6yc0o+r
         5toQ==
X-Gm-Message-State: APuU4Z9NFdvSPeBpF0F5fSbEEXsrHTlBeGJn21RvnnwctRxld1QyJLiH
	EJHis+F0l8IM5B79VJ/lZtDNhSxP/OlKdZMbaMLwg97JZgwPbOqdm0IUuISd6xOm+fTQvojA
X-Gm-Gg: AYBFou3AlAiag7CA3dFSW7dBapUXiDjbzsAHR+MMDx2QSdn24kAEt43LlkgdOuOb+dN
	YO2aIBQbyaQ7dEJsd6YDNr7EE6u0+K2R33yl+paS/SikI1ZmMkNocZocTgTsQKD9ddHRmXgPsQx
	nqQkrjl7ECquzp8Ftcz6UT5yf5DYMZF1re0OmBngqGeUICKgxp8NPhwq0n3/hXQIHC1RX6kxYWL
	BjdorL9bwyrw5N7VPCZySB31aVROv9LMRWatZJCQInsn5/bmV6SbfyBrvR4REWNWOAFjZtPJ7h/
	mXfLaiJXQQuZCMJluS7/TxangdsNVjYskwRblDmhmtnVUIp1JOn1NbrfoE3A37rFNNYeBQyU1oZ
	m41EI5cjJJ6AIo8LbAdZ6PE5KWEH0wF+rEVDc1A7TQjR4hBKIivqBgPmS9lM0rEqjTkJHRM2CO1
	hTYhH+v5ggVZWMV6MRs8Q42oQPE5QSoewpmIpQkWzA9L5yXVEbwQ9pNw0U+cz9IOYDKsH2Lj/ec
	27xr2EhVaAruxGDfXLDpW+XtMnvuiwvEteV6/X6lxldUlpyMybcYpg5x9iEA6o+GAVBwkTGFo24
	ml8nBpv/8LHZzrqQWYngNIIRjraZ8bH/38PDnRIPCboTnQMype1wW6RW16QG07EdmS+ifXXjoq1
	LFq6O4o3bO7nKrmxzXXI7bbaZBB/3TtoFwBygxVr/kOvxZDwqhVhNWgEaNOD7uj/F3gmZUxSCE7
	i0I4dx8n9/T3UCtNTuTvbsYuiB6B+XROJOOXTftgL3Y12NlkmOu5oB5JE1QGZ0ygjc6MVJpV2h0
	1HtujA7k2M38tTVKzjXirtzD4Df8Difa5YTWXUu/RYb3jFw5eS2OIg/FPswJwK0sdIn4ca8Qcul
	CFDDp5Q4l5F2bwNQuFhjrjmkBQ==
X-Received: by 2002:a05:693c:8244:b0:375:11dc:7222 with SMTP id 5a478bee46e88-377e16e4fd6mr5997745eec.21.1794589406912;
        Fri, 13 Nov 2026 09:03:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm9068615eec.7.2026.11.13.09.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:03:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/2] cli11: Point SRCREV at the v2.7.2 commit
Date: Fri, 13 Nov 2026 09:03:22 -0800
Message-ID: <20261113170322.1425186-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113170322.1425186-1-khem.raj@oss.qualcomm.com>
References: <20261113170322.1425186-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 17:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132251
Content-Type: text/plain; charset="utf-8"

SRCREV was set to the v2.7.2 annotated tag object instead of the commit
it points to, so it did not match what tag=v${PV} resolves to.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/cli11/cli11_2.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/cli11/cli11_2.7.2.bb b/meta-oe/recipes-support/cli11/cli11_2.7.2.bb
index 9f06452301..615dbb8bd0 100644
--- a/meta-oe/recipes-support/cli11/cli11_2.7.2.bb
+++ b/meta-oe/recipes-support/cli11/cli11_2.7.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "catch2"
 SRC_URI = "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https;tag=v${PV} \
            file://remove_tmpdir_from_test_binary.patch \
            file://run-ptest"
-SRCREV = "919ce47dad39520a6e9a695d3e2d222c6920a445"
+SRCREV = "cbd58a3696887b34c70949aef21a71735a0c2ad5"

 inherit cmake ptest

