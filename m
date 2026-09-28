Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB21DCA5FA3
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:57:07 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63903.1790618226876923527
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BWtFjw9f;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso1455305a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 10:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618226; x=1791223026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y42Sins3ZPk62dltV+tUVuU9RDBvbAFhUGatCFa/1gg=;
        b=BWtFjw9fbeBadnohQihDkn/zv392+hhRmsYgs9OPY1u0P9jwrjBzqUWgWDVvu1MEHB
         8uzsvlsv3M2SYnR15j68G4EK3t07GsE8xyv22LicEnWV2OVQVyzQVmVK6XUDzWnOmSzW
         JLFbbdLZsXkl/HRBeppDrWWn/jDyq9jkLYi7Aq752AFWJRWuJC8ShEFHTvKguKGzAYZN
         eNd+2c3UTnGkAy/Qt/zftfEep62APUjt4592SBDB6kuf+KcK76mNxemQJ7Hibvvq47RH
         UjPnCamwsZlDQWwKWc+qilV7mO1OF8zqWDkhhWIOkTxiO1d3vhsY5yRmwKUPBU/q0sj6
         H6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618226; x=1791223026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y42Sins3ZPk62dltV+tUVuU9RDBvbAFhUGatCFa/1gg=;
        b=2yYLaCmINU/WIJW8CY2tr4KDiGXLxfN7bXZTCuu1loj/J/kodQQ/eiNYf/32mYPyQ0
         dsmIkMXWpQGjasPIQNwfhbYBTrQiJxu1wYqVhNiuTpQetHWMczaeoUh2duda1DJhHQXO
         UoPqCHS+V/xU4boIEWpIyXjInAS4VPpsXWIw43A/t9E9WJ8ppUczYwotH+trrHTcGbPm
         v6ZhjUJR7Sw3kasGusX3HZNeVeGUqQojLsO/zg0SGlx7fu5YEmHpCStIaS08x+d2yfKn
         6bHSHFgEvJcEoNmbYl7ELj64dbh2fB4A5wkQXebrr9ndPB7+29uOTuoLxJS24I4jwuEc
         UwDw==
X-Gm-Message-State: AFq9FYLadYkVxKbIZnWWB9wClaBYF46Dt+aUt+kuM4cMAve7xOoXu6Se
	Yx8/HL5x9s39FUMNTeCYzJhNwrsWgZDpQbi7t4FXZ1nnXwQvCwJt2utqW34zkg==
X-Gm-Gg: AYBFou1rd0zmgPU/pK9O+lzoZ4KL8muKxVhFsX30Ph+snAMruelevn99tL+Vez9OwTW
	SuqD/PFeooD+RcSA2XUm8MSEVuYKkmmHkYjAVtr/n4mWZ09cGDoTyNeaGiXF9CsBN1zqxG0AGuN
	uaSCl/xEAQ2lgCN6Z/569DXxKgzlsexZSYMP00LicapBCgIOduEzCweJU4okzsOUdQS5KwUcOGu
	YdQVyvoq5mQnB0t4cPbRUstKgqi7hCJdQIS4WR0w1Yngjo4kmiOeu46aBBzXJHLDYpFV2UQuLkX
	fEwx4i2mcvzWGF1rHiCE3ZWObdTxo6kvutInrYaE7jeSX1xFCIxV9dP2BQj4q6v8qQn5o76YOX6
	ZpiODZL0IZAfyeSxNrPYfWJFaca/KjCWyTouZPu7GxQCeBILSluNrYr0RrzOHm+IXs4MebVt0nY
	ZEeKEdDqSienDtjxM+kR51SmCN5IOX7lg8QF8uOjzlv8o14NcVHQo0GogyM4+fzutAo5jni2vX8
	yHQkWXPCRirnF/LiJUjpKM=
X-Received: by 2002:a17:90a:da8b:b0:3a0:efa0:ff2a with SMTP id 98e67ed59e1d1-3a0efa10105mr4769447a91.45.1790618226178;
        Mon, 28 Sep 2026 10:57:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1905sm577182a91.13.2026.09.28.10.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:57:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/8] libmxml: upgrade 4.0.5 -> 4.0.6
Date: Tue, 29 Sep 2026 06:56:50 +1300
Message-ID: <20260928175656.3501512-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928175656.3501512-1-ankur.tyagi85@gmail.com>
References: <20260928175656.3501512-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130462

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/michaelrsweet/mxml/releases/tag/v4.0.6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libmxml/{libmxml_4.0.5.bb => libmxml_4.0.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libmxml/{libmxml_4.0.5.bb => libmxml_4.0.6.bb} (95%)

diff --git a/meta-oe/recipes-support/libmxml/libmxml_4.0.5.bb b/meta-oe/recipes-support/libmxml/libmxml_4.0.6.bb
similarity index 95%
rename from meta-oe/recipes-support/libmxml/libmxml_4.0.5.bb
rename to meta-oe/recipes-support/libmxml/libmxml_4.0.6.bb
index 01142f6f0d..11a16618d5 100644
--- a/meta-oe/recipes-support/libmxml/libmxml_4.0.5.bb
+++ b/meta-oe/recipes-support/libmxml/libmxml_4.0.6.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://www.msweet.org/mxml/"
 BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
 
 SRC_URI = "git://github.com/michaelrsweet/mxml.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "18d5c7dd9c71ebc1d3f21fe1e0614300babdda84"
+SRCREV = "874e249a0d3b506e883210b7ceece5316a8489d4"
 
 # Package does not support out of tree builds.
 inherit autotools-brokensep

