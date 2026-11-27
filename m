Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10355.1795753055401803755
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GDhvHCYC;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b563e32936so3515072c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753055; x=1796357855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvpE2HaCuAk+fQ+xKjs2yntvTMx6BGED46xqPc+Axcs=;
        b=GDhvHCYCxfJAW/bOnN/OJLQF7ZYTJ/s7jQsHYHO1BdngRvOjvoVFYEHFH8tPZbKHs9
         gYk/4xmWb4JOXvZlThr9wQlxumByeAnJH5OnKxSbnapNf6TC4oiae0wlT+d5jCem66uJ
         FUNrlq30tOHvT3o+Tk/bvtwDCWMLcOubjFKR2LMKe3OoFrK+mFLeZ+z7s6cTqs9vZMPd
         J9aI2tYTQ0z/+4XhsDGk5f+SO0DgA0wgMce4jp2VB3wKeGHn/hAR3AbQZOx1atSbmZDE
         x/Od1vOM/tWXQ3ZRibcJwe0ApVUX/Qi3IY/52VOofeLqXgLu+YjvmX0OQcMadnRwe5Bh
         oM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753055; x=1796357855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SvpE2HaCuAk+fQ+xKjs2yntvTMx6BGED46xqPc+Axcs=;
        b=llwjV/CYhwDNDlxRti6NrDpv+1B5y8W+skk+8KmOm5wkXSKhX0Qx/2mSdMotStNzpF
         tPDvpyaum4XW5ui2rvtmgTXQodepD4qG6vLd1o9Qd0Zp3/JS+7RCTLVRShHY1TX/r5wr
         9RLv3Z0j6A44LuvE7ueaz+3B0Zq/mC5PxfrPGcb5PgKvB2L6U72mLMEbl01DLK/eYV3U
         JBuF0E8WvoWRMtqpI+eckNXOUwQ8nlJDEWZ6+zICVE0OPo2WC3GTF5bZDpqu+nAp0EZV
         HCVOQfXJMm+1eecWxYa4qqn3MbUweiGYvmUfOQcJNqiCz0k2VKiB/JVuyk+56twj0Ncp
         ZrOQ==
X-Gm-Message-State: APuU4Z8pdLtT9eAr+ddIgGIU9mLHW13zBkCL1kKDprC+IvL/TlRDu3HW
	D5krb+N6y69tN6Hq/sVpQs2mJoQPtREVq5SUuUTaT+5i/0SetoOGTLAGboJG4y73
X-Gm-Gg: AZFdTZc5UaZJXVK0qcvUG+cQHF69IPPQSjuOIfTKJgCqcBvq1UF9qgPHP/c32FCDEj+
	zHxJ0h0BM2hgAPBBwG3UT6mGFg9MQbon3st1mmqWKRVILU9UjXc5wnuO/RuB61qDbU3eYEBq569
	OZUCIPJ4uwEOKgZ7MJDQ0IX88xyiLX4bgFjnvn4l1acx0SgBLM9+0tojHHelwckaHJVzhp9D00S
	TN81b8Bd0lQoMcycbnXeeywncvjYApNw7SViAdbUy+STk2aTkX1w70/dbJv4ZkJEkbNZXp42/2u
	/qlU2bN+/u653EL1utst8anlLCVxr6i65seKvuwGnjm6Zmwh2wMezWAa+oJ62JpsBwhgfGwju9i
	fSWbIsW1xLv47KmIMKyI5VxiCYXSPOZaDSCDjriPG4a3PygocJGepqpFRkC6leL4Xf4fDzY5l7E
	/3ny+8Nif+HXzU471NDNdaStpzcC+dOD4mCUxsj1CFzQOl435xV3tjTNv/8k0yIHEnrdTtHCSrB
	t/+pNFJeM0pBeu/RbdZnSx28k7QbyZxIvM7SrVbsJk/GcIZlSSYT6X2lbpTjq+XwKBSt39rwP+Q
	f5+3vZggnik5/FTqbXvx4tKV7Q5duVqWXESecIs23n0KONGURhTk1V/cyE2RfIRVNwX0oduLvrm
	qe2wElWrfFsT+Zb315YztFJSSTC3z+/KldFi+spskugqlKqg5dxAodsPuws8ayPgEDJYfR/RS91
	WDmiMvLS6Lbv/NkL7jd5hiIdcIf7ImYBkfYVMWSZLjDF9uY98DxHJ5cwWjcRHpclBPy2a8hHZd6
	rxPDq42OdmlqGJ4NL+ilN63NxmcHzhgVZrpCbJvtGFHkpWrzRjbhn6hu3dPJ0NNdzGSS3lGAj7G
	1VMH
X-Received: by 2002:a05:701b:4583:10b0:185:33ab:4d55 with SMTP id a92af1059eb24-1b5569101fdmr21780288c88.29.1795753054622;
        Thu, 26 Nov 2026 20:17:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 15/35] kronosnet: Restrict upstream check to the 1.x series
Date: Thu, 26 Nov 2026 20:16:55 -0800
Message-ID: <20261127041715.1776485-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133267
Content-Type: text/plain; charset="utf-8"

UPSTREAM_CHECK_URI is ignored for git recipes, and the default tag
regex picked the 2018 v1.90 tag, a 2.0 pre-release. Match v1.x tags
below 1.90.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-extended/kronosnet/kronosnet_1.36.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.36.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.36.bb
index 6b7be4b951..30d129d2e4 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.36.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.36.bb
@@ -16,7 +16,8 @@ SRC_URI = "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1;ta
 
 BB_GIT_SHALLOW_EXTRA_REFS = "refs/tags/v${PV}"
 
-UPSTREAM_CHECK_URI = "https://github.com/kronosnet/kronosnet/releases"
+# v1.9x tags are 2.0 pre-releases
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>1\.[0-8]?\d)$"
 
 inherit autotools pkgconfig
 
