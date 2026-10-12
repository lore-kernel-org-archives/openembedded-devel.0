Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A05CA9EBD
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:10:53 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3510.1791763844076174991
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f3pKIMPW;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd5e6f0a22bso227624a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763843; x=1792368643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjhCXHBxUjyK6lESQo2PAi2aWndh8PCz+Tl0U6po3z4=;
        b=f3pKIMPWV5Pj+0rTQ+YH0aWmTT20JIoVzE67apF0hMkRLrvcexOXqrZgCJ8C5NYnAI
         IwxN4d6u0iVzpoACIaieWLm00WMgHAYIgGbLnR67LeOnEzpirgOt1qtnl8aXMcpc3TW+
         o5Zvii0a1HgMZe7yLUhvBWnPuluWutH443a6VMo2/1f/3XpdgKFtD7VR3nMMYLtd60Kx
         HvPlV4DkOXcJ2d4uO3rmiYfzazrmnL7J5s8DGCVNajUCqD7v40nb0DXLJE3ML1ciq0Vi
         QS7kzm2CfQLwSMFC14+c83ZIly1TOF7OBDpqxcB20IjGRNoYCBB/l99XO3sV6Ca/sJDt
         twmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763843; x=1792368643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZjhCXHBxUjyK6lESQo2PAi2aWndh8PCz+Tl0U6po3z4=;
        b=1mRFKf2q0y7ZtgUN8Xb0GNRZUL7hZOeX8ZDp85/GJ6e4ruTQdj6mS7iyt8Qhl5U7/p
         sCIe+n2ixDCTKpoVCu1fYU4nALZcV/aClNMxtOLDY8RyYbHq1NLgCablWLD5mqCcApRB
         vAdfPdg/tYA0OMS93BTkwcGuYZxplBsS3qIVLsBk8WM0CDu88mWB2jXyQZN8DQmaiZ3k
         7eQiZp6IezV+MZtoHXlHZ4YdE/KHoe09ghzT0ab6WRyXFJMCsB0euc+clsd5q5pVH9Gq
         S65hhreY4t49OUOPlJ5PWEJT7yhk2LsWqDbv8RaAHjZsQRNfl2Co0Jgp5T9MYrF0y1Nt
         RAFA==
X-Gm-Message-State: AFq9FYIRnfTiaWxz3ga2C7TZ83re6hGSDuncTV2dIcnaa3SygAyxpROX
	kOqa2RxXmRp+YBSvgeVVBph2wMZ/oMI8fmN3jGRgwEyGw/rQAPlWJQi3U0Z6jg==
X-Gm-Gg: AYBFou3yqAHvu84OdPmgVzgjWX//RogErH63+gHJ0ZKqkSE9fIA4Te+ng/m70MDjWxl
	HnEhEoMEWG1NwG1G/aGzjIxSQaIwggxiAmRfU1lIo6KHZijFUQCClV+Xo61jRGkiNWIDC+G55D4
	/cnQy12Te4jmrCej/ItuwPvuGPVXN3ohfZFfwkKkPY4s6xLUbnlOs9k8ZE1c1dqSsuy6xYdOrTl
	lbfBALixGLHzi/4yYQP+n37+1wlv3AMjeu4KVx3TcD/O4Z0Iz56Wuz2DJ4w/eFfj/ph3UT/qr2M
	aKsKi2dSq3C6Ei3bS22lzwr195KQ+pp7fysTziSDmERsvBhI1D3tWmqnq98gMd1StF2HtvqX0RA
	lPZ5VsdaVaBoDHSjVpMeaUF+6QStsHaE19HOhN6lknZT/dLqcr744sHA23AsSpqEQhXft/d82+V
	+IcGh0AFSwpL6pk8vQFIO9MpC043mhZrxqwHt5p0UwwutExnyllYVuqVfR0sNKMuIAI95MCdPM3
	e9LX4jPpnIz2yr661M2Dx/AVm01yvippN4MqfM=
X-Received: by 2002:a17:90a:d006:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ab3a2901c2mr5330967a91.6.1791763843373;
        Sun, 11 Oct 2026 17:10:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:10:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-multimedia][PATCH 11/28] gerbera: ignore CVE-2025-23386
Date: Mon, 12 Oct 2026 13:09:49 +1300
Message-ID: <20261012001007.2541673-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:10:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130736

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-23386

This vulnerability is due to openSUSE specific packaging issue.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 369d9629673fd4282cc88fc9b7435de5d1a0ceeb)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb
index 3d28273f30a..ca54cf2315e 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_3.3.0.bb
@@ -29,3 +29,5 @@ PACKAGECONFIG[js] = "-DWITH_JS=TRUE,-DWITH_JS=FALSE,duktape"
 PACKAGECONFIG[zip] = "-DWITH_ZIP=TRUE,-DWITH_ZIP=FALSE,libzippp libzip"
 
 SECURITY_CFLAGS:riscv64 = "${SECURITY_NOPIE_CFLAGS}"
+
+CVE_STATUS[CVE-2025-23386] = "not-applicable-platform: The vulnerability is openSUSE specific"

