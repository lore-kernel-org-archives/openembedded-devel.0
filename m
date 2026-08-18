Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E293FC5B572
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 00:14:21 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8759.1787012052220675098
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 17:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qlNJJdqI;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caf228a910so30433135ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 17:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787012051; x=1787616851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xz72B8j89sdFsEnHsS+vTCpQbi5SXyU6hTUkK4xd9j0=;
        b=qlNJJdqInWrXS2XMdrbYkuJLc4uUYdKasWNIx71RuIwwYw49jCvRRqdAEZB4GcF3kU
         2Xu7Pm5wzwZVzFyt1Y1SGir0miGFAp/x5zfORfgZS2biJB6DR0vMyZoY8LH1T1bNmoNq
         6Q3MBSINgjQOGeP1qE/OOiusLCKLq6V1Mypi5Q7ZAH7w4EJdD2KUcSbKzLbt+gD4aRq8
         4b2UXnE7HI3h4T9At7bkiS++amakFZnd0dX8aMxw8MUKmp6NS+kqu9lZkWYshIzi4OPE
         2AIjFZXsenh752Yp62hJ0Eu2ww5YqqmBdp3bCWvqRmLgYTveGIixEEVwxTPHAw9/2Tzo
         d6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787012051; x=1787616851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xz72B8j89sdFsEnHsS+vTCpQbi5SXyU6hTUkK4xd9j0=;
        b=rMNcaGnBIMVndc/jSbkLdETqdvbYRPZpcoSZtbX/Og9sIXPBv1SLFVCB68yivW4XHb
         iVooPBE5iaSmyhyQxu1HdSfcB0Ym9ueUJk8HKYnpp5Mo5cLA0OeF6qfJZ7AJ1nhBI6yA
         TC905O6VJjd85TwBcDN+CdYZdrwNJ4C1FiP2I+rqopmzA6rwY0VqCaxfYaz49FVRu6e2
         qoWhmG1o+km3MFn/Zd6gUZeH1NV0TDT219C00cDbfDp+o7UAHTjuLR5owGEbwdvF7N6X
         H1QFKdbUVEcmSJwcKyIXkCoMSsb9kpsExaMW0vbvTe9ETA8fHmIYFs5bH/h4KXGQ9yjq
         SXiA==
X-Gm-Message-State: AOJu0YxxAxYymQ0aP2Tei9RDqU04d5dPvVMiu2PAcW2hnhyp6hwPkMlN
	pVFIXF2F2OcytvKYQ8uTGwPGiGfY4echhZ7ZJNteKZ5CDHX1Ikc+IGF7+QxurAuu
X-Gm-Gg: AR+sD12WkGjU7qjmlabVC25UFP4K8P1qwd3K17whWjzYcOU15pOJi6adzXU4U/KmP4+
	nVQX4/fEE685r9HHmkKb6D+nU3F+v0FgrlbXEb+MfYeeclCutV744N77mrObMLNKYJXEqz/iCrP
	mDTIunlqwl/6o5wQL+mqKDj6qdKxkmDXx9e++hYx+E4n9bZXCYtOEf6orDogdTtYIGc3HycPm+F
	ubD/2xtvJ5xzFIqUX5WOvum7NLI5YgEMym8WNbbiTVzhXULPmMlrqfWl9lMpNgMGpsW/mNsObjj
	W4GyMh6DxGTuIhULdja2jUpzPjZ+qQ0bc/9Xv60K4zr7QPdyBwGsurz8CENoem8Cv+WurKppVXC
	5H4w9GW70nWrWFQMTY1ZekYcusB8FA0rJSNmzPT/w21ozuI6jBSAyzpgyQs6J5Uu5fmc5Fw+dBC
	OpvyzQmhYPwY5HrUeQ2nntpf0tfgj0LPvwWO2y6HmVJ7RsFVIoyxWGHoaULqD6UrZC3k7l2LQxV
	jGz/wHeqFx6TmAocX00wPlT2xlHkJq8TSfDGm7nzDcMpmxX66utnPdpRmmP9rekfDjamIqtR8NJ
	mqbFGnagPShNGwbIRGfol5K48EcjhiE44dg/DhKQk8Qezx+ub9hgaug+NnbwXkibXEz9/hG7JGm
	qWKUHG1oJotaZrZwOODIkQfbJKuB5tWewhKEAsvhnC74GTr0=
X-Received: by 2002:a17:90b:4a4b:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-3933b6ea12fmr27124899a91.1.1787012051250;
        Mon, 17 Aug 2026 17:14:11 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1415315900csm10350311c88.11.2026.08.17.17.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 17:14:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pychromecast: drop wheel upper cap in build requirements
Date: Mon, 17 Aug 2026 17:14:07 -0700
Message-ID: <20260818001407.1491175-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 00:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129197

From: Khem Raj <raj.khem@gmail.com>

The relax-build-requirements patch capped wheel at <0.48.0, which
excludes exactly the wheel 0.48.0 that oe-core now ships, so do_compile
fails its build-requirement check:

  ERROR Unmet dependencies ... wheel<0.48.0,>=0.37.1  found: 0.48.0

Drop the wheel upper cap entirely, mirroring the setuptools change
already in this patch: OE provides wheel via DEPENDS and builds with
--no-isolation, so the cap is spurious.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-pyproject.toml-relax-build-requirements.patch | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-pyproject.toml-relax-build-requirements.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-pyproject.toml-relax-build-requirements.patch
index 74e8f4d438..c793465005 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast/0001-pyproject.toml-relax-build-requirements.patch
+++ b/meta-python/recipes-devtools/python/python3-pychromecast/0001-pyproject.toml-relax-build-requirements.patch
@@ -3,10 +3,11 @@ From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Thu, 14 May 2026 11:49:05 -0700
 Subject: [PATCH] pyproject.toml: Relax build requirements

-Allow building with wheel 0.47+ and drop the upstream setuptools upper
-cap. OE provides setuptools via DEPENDS and builds with --no-isolation,
-so the cap is spurious and breaks the build whenever oe-core ships a
-newer setuptools (currently 83.0.0).
+Drop the upstream setuptools and wheel upper caps. OE provides both via
+DEPENDS and builds with --no-isolation, so the caps are spurious and
+break the build whenever oe-core ships a newer version (currently
+setuptools 83.0.0 and wheel 0.48.0, the latter excluded by the previous
+"wheel<0.48.0" bound).

 Upstream-Status: Inappropriate [oe-core specific dependency versions]

@@ -22,7 +23,7 @@ index 20524ca..fc62798 100644
 @@ -1,5 +1,5 @@
  [build-system]
 -requires = ["setuptools>=65.6,<83.0", "wheel>=0.37.1,<0.47.0"]
-+requires = ["setuptools>=65.6", "wheel>=0.37.1,<0.48.0"]
++requires = ["setuptools>=65.6", "wheel>=0.37.1"]
  build-backend = "setuptools.build_meta"

  [project]

