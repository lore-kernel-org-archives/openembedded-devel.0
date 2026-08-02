Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DA6C55177
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 12:05:19 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22146.1785672309955857936
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 05:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MlcXaVA2;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c998fd549a8so1963694a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 05:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785672309; x=1786277109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dn+7q7b4l7I1IObNhTyzVZCLf0VyXn4F9pRzwcOF/oU=;
        b=MlcXaVA2m6TsjaBV9j/gJThnRQQZUWDQDYaLNMwi4fUZBg3tS4k0R5PsJ9hWQvuM83
         puc+bgwydMu2mBp86IHuTbxhPfe1CiPhAbe1uaXbbZtBV6N4K5fWU8GLCCWteQVL1TMC
         6nKMJCVBcwyJNvZakkJLMbS4rvZxXylkXO0Lu4UO+MksU0N4ntqQQapc9DRbidy9xZcv
         V5LahDu1VB1rZ5xdBeQB/v7f8NeS9GTSedTJpvgeuw7Zt1XUiM/xWz4yT9Gxy9Fukix1
         X6LktYwgUSo17pvN7BTQl6psewRiU2pqGj9NGNrDPRznxxnt7mRxcW1695g8PnyBN2ae
         VZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785672309; x=1786277109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dn+7q7b4l7I1IObNhTyzVZCLf0VyXn4F9pRzwcOF/oU=;
        b=SSxrnaJzsyKEvYQBnjgLnDOEzs5EjnqHbWmTn3LHa/FtIOndmozWqvjspecI+2Wlra
         HK6TmsUQ+MqzzuUtDxQ/4JFiXjGSjePmUSDCLdn2LQ69omZlLptmfvKUW+3qNh2lBO63
         iG3n/3PH75p/EOWk8t6gm7W9OPWrsyLMXxtc4KV0U/bRcaJTNMCSNY7UrT5FnN4+89iL
         qS+myo4xe3Fmzz2fvNjTUpjzqdkvdVqe+ZJJLoK10uuuf0Kwfi+XwlBK1oSnPCVJ78vc
         QKHafZgVcGqYsMELWNeGSs4CoM065/lc86WCFv1RFNn705FCefRBBYDr9w3oj3/PLI/s
         S2kA==
X-Gm-Message-State: AOJu0YyNJumMe6TT8BanP+z6Lx40EOIcS/ZWjWKjKxOUICKT/P5jv5A6
	9vqQkApVj2RTUX9fFZ/xAlpnSamlloqKfNY0fwEFIV1wDjdqG+wyjl9YeLOr2g==
X-Gm-Gg: AR+sD12Lc9lsCVUYOBPGviVsMVzgzRHH/eMpsTpqYzvFnjJhrTlga0ZGriMO1vSpxni
	HQdn5fFkngOUAjVf/IsJGRFCQQGE4GiapafcvHgGagTSpGUpSTrNMtKasElO624I5/9G2kfldgP
	qZtDe//ZDjWSbFJPO0m/M/ra4eig+r8jEaGqz78ppHSk/3SRlGVk5lK1kddY5ZYfuWgpbIKgT98
	vChBTI2PgMMgNtC+Im5+cGC5qut4kErchIpRIh1WuI7GngeiRxrSqzfOHUHKAwjyL1/jpSl0k9/
	fIBsUd/ruU87sVD22ZDjHOQsFtkaddLuaJ/cyRfRsfMOcefoYQ1h0p5dNfioL0z0VsXkwhSkOmF
	GHGT6OM69L2rRq8qWysvqWt2RVdUWm6IxfUynWKxwCfCCZCOOBFfQmEoMHzfj1B1f8dJjcFfKoA
	OFz5i2FGs1lC3x/naHe+CUDLMkqoP1hIW/lVn3JcwckJxEj8b/lT/U5UoLJmWz8JOinxGHmtL8E
	A==
X-Received: by 2002:a05:6a20:1582:b0:3c3:bfd3:4715 with SMTP id adf61e73a8af0-3c92a90eaaemr6084140637.74.1785672309309;
        Sun, 02 Aug 2026 05:05:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39eb13dbsm2556152a12.29.2026.08.02.05.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:05:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][master-next][PATCH 6/11] tcpreplay: upgrade 4.5.2 -> 4.5.5
Date: Mon,  3 Aug 2026 00:04:37 +1200
Message-ID: <20260802120444.2973561-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
References: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 12:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128661

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/appneta/tcpreplay/releases/tag/v4.5.3
https://github.com/appneta/tcpreplay/releases/tag/v4.5.4
https://github.com/appneta/tcpreplay/releases/tag/v4.5.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tcpreplay/{tcpreplay_4.5.2.bb => tcpreplay_4.5.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.5.2.bb => tcpreplay_4.5.5.bb} (89%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.5.bb
similarity index 89%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.5.bb
index efcbb13439..55bc8e198f 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.2.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.
     file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
 "
 
-SRC_URI[sha256sum] = "ccff3bb29469a04ccc20ed0b518e3e43c4a7b5a876339d9435bfd9db7fe5d0f1"
+SRC_URI[sha256sum] = "ba37b6c9270fcebe86b83f68c4ec3d5ac8981f8c6087b582af0205a35ec4b11d"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"

