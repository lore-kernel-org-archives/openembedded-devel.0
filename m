Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D728C44503
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:49 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14757.1782634362146931928
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hetJHRWl;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30ec3dfbcd1so251110eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634361; x=1783239161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5fmOxfJOXTSFH2A3rQ4wqCkQlInV0caUv3bDiMcCDc=;
        b=hetJHRWlUOCYs9y5Cq6dk72iZyyIguRORKLjHoAklMxxMRPKEnGKg+2uuKtWoPtt6z
         pc3zJDQJY+rwpV6bKCeQs+VM3s95coFuRXEQkYkZ6sBoyhY+4uIXFQcNAYHaljhtuUhR
         dS7THNmGExknqDa8XFuSVnNel/hquzT8v4CiqLvwcMwF9SXrpWMJJsAg9Jjd89W6XJUa
         2JdBf+geNCIE9bZpneSogmorXSO7QeDMc24yzpt7U81go34pZ+ncF7sDu4ONJvkQTcYs
         HUKu1owuSwDicArSs9yhhX2Ipuu03Hef9fSHwFgNBdWmV9H2P0uIW/GMZBtE7SjtgXi1
         fkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634361; x=1783239161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w5fmOxfJOXTSFH2A3rQ4wqCkQlInV0caUv3bDiMcCDc=;
        b=GqBqIaX7L5sf/rmuGLsItmWUPe2TWzJgziU4YE2MTZlNcx6ZPoSEWJCMcDuI09x9cw
         +syHvzACu11JQtqHiOe3nKcDfw6bxkAuB2pwAkJUihgSqOd5P/DZ35980O2bRfIxCOh1
         wKXda0T/fzs/0hkB0LeLG6Vgyinpms+/R5k3WSlIB2svrpvn2VpOg/P78NBQqsGLKxTy
         apAhDpfL2E6aHk5c850bfboE7qT4Y8+oJ8us5BteWGAzh2I0XFNUb5Wcsi+M/a0fCUYe
         yHPfAd/JpDRGMRbl3Bkb7HpUe2MHHumvmKYAVG42h04G78aGiWpRw2zYpPo/ynfiKqrx
         9bGw==
X-Gm-Message-State: AOJu0YwSfoe5bZpS5xGJ2uI1qBsx1OojsiIjK89EJ8SF8UxLy7qbvyE9
	1GWPOwJXw8sv7nhqNz0ifAVcnYQYSefBr1NpDpD+LlHi9diXEbZ49DuNnL9gR8Hz8W36qg==
X-Gm-Gg: AfdE7ckemJdL7PO3WmQr4nchrCkextv+AoaShMm4SdkSAlHTAdhdYhDMjhCHqVp900r
	SfdYXDGygpKbnQxNH4fZuqW5eW+nU9ORcX04fotcS1SVC4gT3Pir5SnTT2RAtFuob7nRN239D2E
	r80on04LXzSjrYAj8keG6hM1msW3Fq2Bc3P4PQXx5C5gunC6pU6jve7V/Qcn0pLm9TZjZdG22qG
	Bh1/sqKuTky9wYN3Y5QatfIuD1ZPviYmAwryoS8Zt6KHOGQU97eIml8BECUq4SIPqJDxr5Gc7yX
	aRlSnnHlcEir/2pKMUTRFcohh77JmXe0J0bA9jVsuoZKMS8qbQC9OG6cpENEDextlKEaVHMZOkD
	x11QDNi9ZlA3crcCarrkHuR3yyoHDDPMqEFGtMj5rhcu4954S2ev8PcaKN+pJx8yPGD5yymtW78
	zEDNEJinlpiRkLyctKkfRiKxQllwL2TFom7s+41ZRzIXwfdJKphpoYuYi9kO+EClmgJuL418G37
	raoWP2LFH5xxXsWM+BezuU+Bfnu3HNAgvPFauAz909myYbsgQP4oOIwPR0sAKu1Lj+jHl/HmH5D
	gOw+E+KL/VeLYuD14OScQ5rUOAiUNA==
X-Received: by 2002:a05:7300:7246:b0:30c:5a5:df4f with SMTP id 5a478bee46e88-30c84eb9cf8mr13973097eec.16.1782634361391;
        Sun, 28 Jun 2026 01:12:41 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 083/128] ace: upgrade 8.0.5 -> 8.0.6
Date: Sun, 28 Jun 2026 01:10:34 -0700
Message-ID: <20260628081122.178348-83-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127893

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-connectivity/ace/{ace_8.0.5.bb => ace_8.0.6.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/ace/{ace_8.0.5.bb => ace_8.0.6.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.5.bb b/meta-oe/recipes-connectivity/ace/ace_8.0.6.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/ace/ace_8.0.5.bb
rename to meta-oe/recipes-connectivity/ace/ace_8.0.6.bb
index bd935999ca..4ca7f8b230 100644
--- a/meta-oe/recipes-connectivity/ace/ace_8.0.5.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_8.0.6.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d2c090e9c730fd91677782d8e2091d77"
 
 DEPENDS += "openssl gperf-native"
 
-SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-8_0_5/ACE-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/DOCGroup/ACE_TAO/releases/download/ACE%2BTAO-8_0_6/ACE-${PV}.tar.bz2 \
            file://ace_config.patch \
            file://no_sysctl.patch \
           "
-SRC_URI[sha256sum] = "2c40ecdbbd04c79fd5a815666e14654e71ab82d4335cdb3aa8669def250c3444"
+SRC_URI[sha256sum] = "4c5cb09ba91cf91ee86d1ed83cde9a1d3e4aca1da44dd372495137e2c955eff0"
 
 UPSTREAM_CHECK_URI = "https://github.com/DOCGroup/ACE_TAO/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"

