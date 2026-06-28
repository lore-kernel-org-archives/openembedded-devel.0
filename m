Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85316C44507
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:51 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20732.1782663761384844137
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KYnTYbO4;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30ec3dfbcd1so538205eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663761; x=1783268561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKtyD2Qg9zrukkFIX51a4URILCjZdnPyau8rFbpxuNc=;
        b=KYnTYbO4KjZAm76tf5EjxBkdbRjBqkS8CMdSn9ma/lYHkBWuEuUseG220/bQjllSfF
         f8SodTJ06/YFl4mp9uA1gFTzhHh0fnj1szdZcWFg1vr07ES3rMGgBBHurxi8W0aRXVAm
         ReltlHcN8NKOEUE9ALjQBnNqD54M+Xh9wjC8CSqNB0hB+U7UYbpDgRqGkzGf5MEl3JzW
         yWaqXcRk0rhotMlW221XzdD67CBSUvsOHD1Ki9If6wVvKISwX60bdY1JF9FRYNlF249+
         2vSGAi300DQ2L47ur+nnQNrI/ipF/H6juNLTagkQIlyz5g+YvThcjg9y7lznLISHw05r
         HmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663761; x=1783268561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FKtyD2Qg9zrukkFIX51a4URILCjZdnPyau8rFbpxuNc=;
        b=bbZv3pCLJHxGuzHKrzNbv8vwT7mOL5UqMMt0pxE5+L8qJAdiez1zvL/KW4R8+73ic3
         XA1xYhiHUis3qPY4ZonmT21bfZwJUA2g099TLPqqJpDk3ZWqB2CjvEk41wBNNvRlLsiq
         EO2Rl+zubAk56524LVoT7kzf4FP1JaTxPm7S3cRhBlIGuuq+gFM5zDnuygmhpi+YwQx0
         qatuvFU3cmiwaNBAX79h2GBTohThYpA4XXwqxG3lPJsr87cSuzintIKpqTxd8XegZPJm
         7wGWd1LWxEOM2lYSqojF95bHHrtpIslVE1iMwh87i+zpzhfdd+ndrRnqXjH+LBuaDK5f
         eY1A==
X-Gm-Message-State: AOJu0YxXEqkBI2/KnnBNdSx6PwLnM5sjWkHqb5cPofiyKL0raWTDL1SA
	j4qBttYPLyrYQ1siCUiF8FCSl3lvYwUR/l40+cE2yb7v25DIaM+H+C9CGnBf9RdA4BIU8A==
X-Gm-Gg: AfdE7cm4Rw9e/K+lR6ckpv1wxx82iERhXoesDstEFiGVMHmg9XzAEmIUFHxqkT6lQfx
	43QvhR2hnsaboME9TF4Uq3L/9CxQhg50nc4CGTj1zvXA9w+PMEqLSwW1v7SZz7UrRO+6BFBZzn+
	X6D5UfZLXFDU7c0Fe+da8epypdwOgiPWBULyR8OFFdmpsX3ZWQ4c9jiRiybJMWxzUHSc8xsl7SL
	ypuacWYA8N4DUb9lniavYvYt/WS3BxpOvIpHt5v6KghlVuRQT/tJwrQYwePUobK2bENoR+9ByVa
	L58Vrz0/ct7IMyH/SzPP5/lckNcN7ag3eH2BYRKZIBgcjuMUmnz0OVjJdTyJfJ27tcEdfd+Q+Cm
	cc4rwSgWvXp7IMds1y2yJGEOury/r65Ih2bNcaTaio2M8vltkyG1zOCFsd1RObb/i3iZnEd7B16
	gzXMoHST1tL0AWFubijLkSC9NCKalBNP+UPissjtPboGpXEWeLabzain+A7W5jryjQNqqaUGmCR
	mia3uv9OpsItCTcvmJGblkMEPMKbFKqKjw3qZMvmjF7ksXX9ukcBN+FDFfr2XrTe6jdB4sFQZOW
	SOo2eF+GZH8jZUQIGYA8DLazA9q/NA==
X-Received: by 2002:a05:7301:6194:10b0:30c:99c8:2b1b with SMTP id 5a478bee46e88-30c99c82df7mr6051491eec.10.1782663760710;
        Sun, 28 Jun 2026 09:22:40 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 115/128] pam-radius: skip pre-configure make clean via CLEANBROKEN
Date: Sun, 28 Jun 2026 09:22:09 -0700
Message-ID: <20260628162222.4081517-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127925

The shipped Makefile errors out

'You must run ./configure before make'

when Make.inc/src/config.h are missing, so the 'make clean' run by
autotools_preconfigure fails before configure has run.

Set CLEANBROKEN to skip that clean.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb b/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
index 0e2199b066..32373129be 100644
--- a/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
+++ b/meta-oe/recipes-extended/pam/pam-radius_3.0.0.bb
@@ -16,6 +16,11 @@ DEPENDS = "libpam"
 inherit autotools-brokensep features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
+# The shipped Makefile errors out ("You must run './configure' before 'make'")
+# when Make.inc/src/config.h are missing, so the "make clean" run by
+# autotools_preconfigure fails before configure has run. Skip that clean.
+CLEANBROKEN = "1"
+
 EXTRA_OECONF = "--disable-developer"
 
 do_install() {

