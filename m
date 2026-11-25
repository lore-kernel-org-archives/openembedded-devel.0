Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37939.1795594087556748081
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=r/P2J6va;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386b8f2f671so2583057eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594087; x=1796198887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nIRCAB2/9K5ggeYQHpdg9pV0zhikcmCifs0MvOazcN8=;
        b=r/P2J6vakJZVLjhO4SDukjgMih/q2cqtf3zqP/h/K4ECUNbH776QHKXC5wgl5to5fR
         fmCSvBwIZNECZ4s8lHjF2asjwYnWw5w5eYOeUzC6J4z4w1AV8G7WJCKjLzpGdcdu+MRH
         plgc888jcufax2+ZQarX3gmXRVbSl1PsqtQS0tD/cFw3iUay1Q1FsSD6750Ji+qHu7wi
         esy9Eb2kxsNOknqqQG3zhgcPhhxgIDj4nQfxaWIsdaleZFDYCg8AzjV+PG6VCLIYXl/2
         ZGidseycTUldsUGJEam3sXlOCrAY15sffJlAFxsnQDf+uNgFY4+SYbKip9R9kPYUoLkm
         pHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594087; x=1796198887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nIRCAB2/9K5ggeYQHpdg9pV0zhikcmCifs0MvOazcN8=;
        b=2UU+DcWsa4CM/+rbWWhQq2oi4NVDIzSHO1UXv5lXkHVYcn8QvUWziFPoI/3WKfjaCS
         ubFm+kyoLMHE8jNtJzALXX4pnGrutFYebhNAVCbU1bRrmwKIfUawsrNeI37sfvq+9fkb
         wLC1+MHsKVe5mMzBRq+m8QBQWllfbq3/A/EMNOR1EY+Nl8zzSQXSC20rg95pXxlzP4t6
         8TXGSpAk7iqTfAj5oBOdT0iWYT1VPIq0HiKOZs4lQkaT9aPw3QXymU1A2tWszKiD0djB
         q6rvSm/Gb+mYzreVnIRPZB2XLoMq4JFnSnBBXBFmXd1zrhRBritqcmIvm1PT1+CLNrtO
         7g1Q==
X-Gm-Message-State: APuU4Z8vH/LKTw9anY22WhvkBbeeN6MHgFLW2AwRdNhc6EHZytrO2A2Q
	m7/pmvpb9YQBhmq4okIXk+HEddRb4ZGAhGvYldzudLkQ+Erpa1eWWwY5XzSKeO1J
X-Gm-Gg: AZFdTZeXpPDaayW0eC2Ma9rYGWrvMbyD2X45aTp6z1ndAnqSudjcgyzDVkKtBYEAQDD
	WQlElA5kyzp6+UfZecm0Ko9o48wkok07aks2R3eigki0NCVs9dhoQPfzAu1T1uHZGNdQylAB/jo
	5s7cdz9mNcNsbgbYFtWN9NawwOnlWvt2ZXgA7e3z1L1tleH21hSfrwo5smwq61RoYkDjhuEnR/F
	zNpF94fJnEv75GgPFDuJWkv5oDhehmX6GNJC+/T+Y+xD8PZrXj/Corz/3hhCmIqMm0C9XlIfnkb
	+5zIIzDDNPyPOnOGiKT9cigKG3GGVqB6SiaMmYWJDp9WJKIPzxfKLMj/JdDL85MEA3OfgGJYkK0
	2LTqTeTIGfTOlj0hexPVWrtGY7Y1e1kvIjkPDx4pzaz6IIn5NWmmWjepZ3VyRlGpplpLsAnQ6vv
	idedLNm4B3dafMVKkgntbTJTts9E140xV59BYuWAXzZI6VztnC6LaeTsJp5yD5A43f2YghlYJGm
	ZPZlT11eIOblV2KANSsRddYJjF8l037caRyVYOW191SvYhOR77NrQQ9RJ75C0zkUzvAn2+fIwJY
	hsSXAKPDyJsSQRPG6e71sSkop38J7iS3082YKjGmVCnY0sRxj8aVTVZ5y3scPuBej5j8eT3tTQl
	NItCDPwfNXZU8BvEiGmUwP+ubgepbWnvrTxi1nL+r/8aQ/dbU9thBskzL3qs2Y0kHiSMBDpzgFZ
	ntjAqErvkgL1+4jo9+SSe73lDXdcrdz3D4bn/TmkNTO7zXnD4qpM3dgvH0NnvHhwqsnSVUXu6ZX
	HIX+g+F+L7b2PQNQ29X7s2/X77S5L6hn39Ktp+RdPdlX5vDX00kYdOkD/nP2lx8RSQLgU200Ji6
	6cMxsg==
X-Received: by 2002:a05:693c:69d4:b0:386:5adb:ac25 with SMTP id 5a478bee46e88-3865adbb1d2mr13572387eec.22.1795594086865;
        Wed, 25 Nov 2026 00:08:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 20/55] zbar: Restrict upstream check to release tags
Date: Wed, 25 Nov 2026 00:06:36 -0800
Message-ID: <20261125080732.2419614-26-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133023
Content-Type: text/plain; charset="utf-8"

The repository has an old iPhoneSDK-1.3.1 tag, which the version check
reported as a newer zbar release.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/zbar/zbar_0.23.95.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/zbar/zbar_0.23.95.bb b/meta-oe/recipes-support/zbar/zbar_0.23.95.bb
index e3e337d50e..ebe5c7a7aa 100644
--- a/meta-oe/recipes-support/zbar/zbar_0.23.95.bb
+++ b/meta-oe/recipes-support/zbar/zbar_0.23.95.bb
@@ -14,6 +14,8 @@ SRC_URI = "git://github.com/mchehab/zbar.git;branch=master;protocol=https;tag=${
            "
 SRCREV = "dc19fcc7da58e8cf84ba1ec417e24b04609feb23"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
+
 DEPENDS += "xmlto-native"
 
 PACKAGECONFIG ??= "\
