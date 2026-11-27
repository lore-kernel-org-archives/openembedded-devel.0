Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10360.1795753063984472267
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ChVJS0kn;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so6589158c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753063; x=1796357863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VG4m8tqGl/FBpxt0vn6h24VP7CBuSCJYr1cJKMZFp0E=;
        b=ChVJS0knllum+Ikt++oe6PCoBXqJrmZCYRWzk2FrkIhWrqCt34wwqnYYFtSwseUc1L
         0nxGUEqHGzcQQBgi0BWTsOzzBUu2QZQ9dVupIyvYHchcQcO5FoaFkef25kyg1Cg/UtVM
         Wb6h6XtX/6LGnu1C4gUL70o/KkcSP3WOHiHhKpKoYEFLHQmTT/1WYRBIvgWk8/aQLGff
         YUeK/1pEb++plF5KjF7ZXEvb7DhrgoQMVHBBwvqBzizjwX15Rp82L2u1sxzrLAGdHPEI
         cLJrAFEUSb38vuGYFw6F8TY8+FH5yJIT9kvwWwZfrjbyWabKCcOH0UizjHrh+1pdymEI
         m1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753063; x=1796357863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VG4m8tqGl/FBpxt0vn6h24VP7CBuSCJYr1cJKMZFp0E=;
        b=H9K/64JvvpfYRZJsUr/0ciY5tm4aJ0RzzXYOg0T7AufL8w71UJhctga86/3xnuxLpL
         wF9cSQuFDbNIc0XobX4guSXJq9kHAETtkmyTheqq8KL0GJtwpAnKtG0n5MQvmPGZT3aJ
         pS2b7lcC7rYABhP6399jY2Ein2oskA+d+dP0sfbckjPCUgg/ep/yDHsAoEeMeU7NNFa/
         E8CmUOZ2jOVznMJFLUwXsWotUDquyST66yORF/SKEZvK4v/WxvP8DzuSW/+gCHVDKCyi
         JnWPoUAYXohM/Nz86x5BA+e4ov4jyXCtuY7vs+wwYw/w36PPODOlbOg23jiRppPJITXv
         gosQ==
X-Gm-Message-State: APuU4Z8VSE60NFnE/gff9WwHDEarAj0ip8ha06XpR+AFPsnMwtYQ4soH
	qX/fQefxH3+dZvkNamwh7OV/VRVN2PqAXb/t7gJ01u1UI2zbZMqVmvxfpC1z+cUQ
X-Gm-Gg: AZFdTZfjeovQ4v8YhU2ki/AzR6H5ULC7/6s9ScrtFq5hbGzJ0qJMemGIHpGkBvd+0Ff
	Du1YMnQSaYgheKs4xE/Ew2/szxM/au6xKDBZA4Z7fd9fefm8+FSr12ZjiNtdlt2usYKkWkvchXF
	zKwoG+Dqd7b5qhSPl5LsCAiVUJ7Gg/kn2utNR6e1ycN+jEhpTitLnB+BRrcDHgvsKNk5//KIkyE
	HFt46kv8sNUn2yaVwHPDVAbPhTMsdI1LwWx/qvnb2cbd+oRP8Gq099Ad6SMJBNPC6S7m8CB9ebk
	exHcvGGDvZ5M/G04pPz2mb3reK4HNjgWn4hlSatXq6tP/fuv4pc6IownqiFMFw4ikJ//n39LKLU
	KGahBSBnlUK2at+qTXZu7282++4RU64zIKdyE/2us3XsBbcL28d8+7Wa8hQ42TqXbaSmmG6wFmS
	rT/rI3y8vP7En9sJ6gAosJUkWZ6GXMK2zpJEpNBbhdxgnljclItO3Ic4SG7NeMQc4FyR7snz0hl
	ah29H/+3Nz0TneRS5q6LGjC1eh40ARU1L24SIOGPAH33NNW9U+3GEqjYJoMKLUMKl62SvlIJyJN
	cwGjsfZ0uETGVYffd3sd1tM0QlDUUeFO4in6zTGJfJehUeHbls3BldsCmHFvhv/uYqRfqZm1bMF
	lMnTDAjjsck8dlrGnNTdgMKkLEYBxqwc5PnalJx5z++ldIjQJ1YC4miwvJr3mPMcOodIrXjeFdn
	2rXdLiO2h3WlkJHMW7kYoj4onlicIRtavsJlySzqSGx34tLB5YZwxDlhVJn6sM3z+Vb6QdKqfaR
	btULJFyiaPJKRcg1Sp74d6m81EmXXdbhyeJGtOIcgN3tZ5AvJ0X1A+1r45XpN/5g2BkrZ3f7M/Q
	7r4KTA==
X-Received: by 2002:a05:7022:f509:b0:1b3:ad88:b9c5 with SMTP id a92af1059eb24-1b5568b7e07mr23416743c88.24.1795753063277;
        Thu, 26 Nov 2026 20:17:43 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 23/35] bmon: Fix upstream version check
Date: Thu, 26 Nov 2026 20:17:03 -0800
Message-ID: <20261127041715.1776485-24-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133275
Content-Type: text/plain; charset="utf-8"

The GitHub release download directory is not a listing, so nothing was
found. Check the releases page for vX.Y tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-support/bmon/bmon_5.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/bmon/bmon_5.0.bb b/meta-networking/recipes-support/bmon/bmon_5.0.bb
index 360469be3b..8c659dfda1 100644
--- a/meta-networking/recipes-support/bmon/bmon_5.0.bb
+++ b/meta-networking/recipes-support/bmon/bmon_5.0.bb
@@ -11,5 +11,8 @@ DEPENDS = "libconfuse libnl ncurses"
 SRC_URI = "https://github.com/Jafaral/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
 SRC_URI[sha256sum] = "6016e41fdda9166b86b09a0ac601a0c453c3b35acdf904c97a8a555459ad73c0"
 
+UPSTREAM_CHECK_URI = "https://github.com/Jafaral/bmon/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
+
 inherit autotools pkgconfig
 
