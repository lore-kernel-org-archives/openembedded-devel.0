Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8066.1795739693872290885
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bhxbBNZ1;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38190551625so14472180eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739693; x=1796344493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAaVFHYhnkH59A0smqakmmMTH+dsiC+7nK+Mv/MBn+M=;
        b=bhxbBNZ1Ex1EXHETuwCg385NPTzjp4VcvFl0WVL3EKg/eXqazEKuvJaPvqL+4Haf2y
         siiUMP3181YMnqZEbL9ElKD4+1IvTUskJ2YQmn52c9w8ZMSOr7Y3Cqim2e9xa2mW9rcm
         wZ3ejRtLNnlCsLrz0Rzbva+IHDBMgP6nXaeO2LRFCjFUQadcWwY4tyHitaFrVKsh3fjB
         /Q6mtRWY9bxSTiBIZnFOoVcC0KZNecVylsx1zRQ/tlq+NSOA0L1fDAHH8Pv9+lZHbKik
         6spxHENAtCVGxFimIDoy1d8Nluto4wV3ufctY+nzGkeG1enX3PzZikqFi+JF2LaLTxzx
         pzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739693; x=1796344493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HAaVFHYhnkH59A0smqakmmMTH+dsiC+7nK+Mv/MBn+M=;
        b=xwIeo1uICk9/advFHSVLMJBNeQO7VA4pv1KojDasX2Etfl3Hl6Nv+6RLGq/N3m6nCq
         JR44o5wVQI0Qd3FHmBxz0oTZCS7dg3DuZdNKqxwXulYmyUpEEX8Ti0ns/eF3TkZF1HMI
         jlXKViXHqeRB9YAEVggj/GaUVhaxUSXpDB3rbAY8CJKuM4ZGWgk6tMCTslR/sHRsdsql
         hcfmbIk71yq6RbtD0ISGA+3qgyLAw5HnLXzirpO/BL1afyy1Mrk0exESd7iAwxVgEpti
         r69B6WTJD9MH2yUZJphOxQAvqg8pFb6S3Q9tOwWujLTki1hoIcfIaR16L2OGnHHbtd30
         2Fow==
X-Gm-Message-State: APuU4Z9z9MeObSqxhJ6BmCBBK4npwa0QsCkvHByPutYqPdgQbVD0Jyla
	5RNWRa2Fy2Qft9pm3H7HKa749S3Xqre0HLm1rbN+Pd6GKnmo/SSsH9SK6Eegwkjf
X-Gm-Gg: AZFdTZd5MNxFxDkz07LyFRpArHdHNHB1SMKv7xH2OvQ/sl2VeeQYHjaRAy0zgEC7pe3
	aPxBYdAvIGnacxeArx33lAamJslIFVG7iTlS9Z9GteEUvY09lLzTXCkroDP56OZLf8MeudznT2Q
	ya0Vykb+NX1/UbvUeybU98/N4STTzIdTEpiGG3XLNy5Lbt1Bzu1/fQMJyV/30LQ9KxWNwUeRL7R
	BdSMdWZb+U90dZoPLgBGLV7QUVeRYkt4iZ8vWjt/Gzg/r8Noa65woqmi61v+MJ1OqDm3PZEJVrk
	K5hvDSOf/trO3AFe+c4RQ/dwr49GPPkyULMpYl9C0lWW863MykBnxzHhsYZ7yMvf/e/Kjk2hzC7
	M2J0lal1IiOkQBz/HoCUXAeM0+LEr5+e46rmO3eKRHKsZVxBNyeeKcQuzN73QX9HH7AdVEVPxBM
	CL6HKn+OdYdxem3Iim5/WVc4ZJ5TqDkCpITNU8pQ4K7kHkrUeurDtHandyeKOqFmb0+79V/IHLJ
	+437eUXhsVnsVDwuEloFz90L2bQd7lTpt4QDQlZYcG0s5WsQ1KTsJxmC/x7kkDggwUyzG3XJ1Bq
	4+jkJIQa8Bsev+aNUIR4lssGKATXkAU4+BcOGAVB6pglE5aYkl9Qm57D+AEUKBKYe03NlPndGNK
	urj0VUpg/umN3vwo+qoajoqAy3AF6CXwTFyYdd5oT6vdOvQtL+MKB4Ipe7eAOz6mI3bT2xXu7ks
	xKNjnDyHVuFVVM9dGTkJVE+FsELUNaaphMv/BkLwMHKjqY3qUvYdUcmiD/gmK4vPxt2nQAvoHQx
	ELbf4xlSu2HHwXSXer43Of/NkvhjPsjuIM+k+TNAFZDZCYADeo6x/AjsRjQmqCcAz3WDWHq93Jy
	dgIFl3mpOlIssq27/7PxBC275g==
X-Received: by 2002:a05:7300:c00e:20b0:386:c3ab:ab7d with SMTP id 5a478bee46e88-386c3abaf3bmr10275840eec.3.1795739693216;
        Thu, 26 Nov 2026 16:34:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 22/69] socketcand: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:38 -0800
Message-ID: <20261127003425.2166632-23-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133122
Content-Type: text/plain; charset="utf-8"

PV is "git" and SRCREV follows master, about 100 commits past the
0.6.1 tag, so a tag check has nothing to compare against and the
recipe was marked unknown. Check for new commits on master instead.

This replaces the upstream check settings from commit 787d1b73e2
("meta-oe: repair broken recipe upstream version-checks").

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/socketcan/socketcand_git.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/socketcan/socketcand_git.bb b/meta-oe/recipes-extended/socketcan/socketcand_git.bb
index 1244d175e3..892f460dc1 100644
--- a/meta-oe/recipes-extended/socketcan/socketcand_git.bb
+++ b/meta-oe/recipes-extended/socketcan/socketcand_git.bb
@@ -7,11 +7,7 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://github.com/linux-can/socketcand;branch=master;protocol=https"
 SRCREV = "998b0394d028e791aa97d549bfc686b4fbadf5ee"
-# Release tags are "0.6.1" (older ones "v0.6.0").
-UPSTREAM_CHECK_GITTAGREGEX = "v?(?P<pver>\d+(\.\d+)+)"
-# PV is "git" (AUTOINC recipe with no numeric PV), so the resolved tag (0.6.1)
-# has nothing to compare against; reported unknown rather than broken.
-UPSTREAM_VERSION_UNKNOWN = "1"
+UPSTREAM_CHECK_COMMITS = "1"
 
 inherit meson pkgconfig
 
