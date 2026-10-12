Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6022CA9EDC
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:12:04 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5125.1791839522285464295
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aTrFZWsu;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ab8309dcbaso1534857a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839522; x=1792444322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiPHs+ZgER4/6fC2+egNayEVI4YVUuf/Nr8sa3Fl1O4=;
        b=aTrFZWsuEK2qhiM1HBuIS3X/QbsIm1LuCkbB1GRN0UcDQI+UFOFyOZU36YY1fV7F06
         NzrsrptWkCFJ5Qn5ZAJNNOyLjTtaD3jg7+tHez8GxXBVMmK+iR4jleYgiJq1/EDp0Q1z
         2LHabfN4MDuF5rrFwv7VbYPuZaCzRsRmmIm+9Lkzs+c3QKH8ottn5ifS9WJNPCGWPZcw
         S3dyskQksfuNalcBIpBetzwUq0yYXZgXecQIIpdClJX4kxWT9Qm4T/eM0gGgTFylKTRJ
         O4dmOOuEYnit/KQ9pG/V9an5tQnF0RWziPWmLPiqcOinMDszF9hR0gfnENa0CBKGzCi6
         yYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839522; x=1792444322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FiPHs+ZgER4/6fC2+egNayEVI4YVUuf/Nr8sa3Fl1O4=;
        b=2JU/emnls9KwUEeOc4rkZItuGR1wImAHFb1ZhtGW9Bc//UAS9ULGo0/X88fVctpBW7
         Ccju3o9pxV4bl/TJFmIxrNX+GVTUFCxfiddx+P3/Rtl4XOjnUwzTHrmywQp3x+fgZ7iw
         4RQhltyA75NSa7pK+XUEUtLe5arAiGAfI4TbPKMmMjCJtH9/Gfx4FxcsUq32JQKElk2L
         7fxbpncgdbigdmvPIYeIPT2fFoo782GPdm41+njk+vg8bEjXWlcO3g1CMsF5M/H9SvTi
         +n2GcwCKtoHWsTp6AFmjaW5PcD1znGMFcc+iZQdwFU2dJR0nM76zMwrFQeXP/I5JVNSh
         Jc/A==
X-Gm-Message-State: AFq9FYI/cYjld3x/293kpc7s3IINpdMXPYMUb7dzmOyzIcbBaIV1uFtY
	hUcSDpGC4MKlHf7GLZxIyBAf1LQEv0TEeg4oruwpHnxdvTOw4TQlLjfhtOOeAA==
X-Gm-Gg: AYBFou2RMOIJH3j72AX012DPdJG2F8odmiOMTzoDl8m6I7fKF9SOndqcOVAyrE4SPyF
	Pfen3tZUkg9DMt1EilYI8njh4X2RjuNnLHWSfAvmRlxhY2eJc1cRUQq1XWJs5MMKntKa7ehpQTZ
	9pmymKFPif9V0CBp7zaKBIYRNIO0ymApNJo+XGwW6pEvdMX/Rk5w8lReKakYsPo2A0OvB1CstYV
	Hbv7aGB/OD68ziHMXiLhJbDxatYfdxNcZedfp6k5gopNXKz+dnB7utA1b2kzk+dcGuc7kc+IcIp
	8TwMSTIpynKmjF/c1dAyDg7M0TpZw8KiA07mnsSDxQ+456aF2fM/CmRX31VkpFUH8svA1OcjD9m
	oqMW2wIZD8HAzTL/YkkSdVzQBouoydG/kbe4k3ZelQzZ/RkHHbf78CFrFJd8dqVJ4XV30w+mO5J
	TJWR7/k4BGLc2WTBfPW02MvSIpMVFhAioSkcs/XaXMSNcy1abjNW7o82srLxiurK4BQRK+l7HOK
	lJ363p14yA3n5bvqmRPsRQey4KYVQBslWMbiW8RTbg/JJkqRQ==
X-Received: by 2002:a17:90b:1dd1:b0:3a0:c85a:ee12 with SMTP id 98e67ed59e1d1-3ab3aceba09mr6098775a91.41.1791839521640;
        Mon, 12 Oct 2026 14:12:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:12:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-python][blacksail][PATCH 41/43] python3-werkzeug: upgrade 3.1.8 -> 3.1.9
Date: Tue, 13 Oct 2026 10:10:05 +1300
Message-ID: <20261012211009.3352822-41-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130811

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pallets/werkzeug/releases/tag/3.1.9

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 0d101e1633262c35907fde6fd2708c0317eedbb5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-werkzeug_3.1.8.bb => python3-werkzeug_3.1.9.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.8.bb => python3-werkzeug_3.1.9.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.9.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.1.9.bb
index fae4de2a3f3..d3b1598f782 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.9.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "9bad61a4268dac112f1c5cd4630a56ede601b6ed420300677a869083d70a4c44"
+SRC_URI[sha256sum] = "55ca7c70a75689be937aa27f8ff4b018f06ff4838fc73045560bf0f5a1291060"
 
 CVE_PRODUCT = "pallets:werkzeug palletsprojects:werkzeug"
 

