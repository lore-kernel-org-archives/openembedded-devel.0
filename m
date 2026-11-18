Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10136.1794999720569015070
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Rx2jKHA0;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: awais.belal@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso6337605e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 03:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794999719; x=1795604519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHWJq4c2L8vwLNMipM3SvolqKdopXoWttmZJNYcOoCY=;
        b=Rx2jKHA0p/m2C+I2l0/SJEpUGkC9XYOJVLUQv9LxkoYar3zv617kq0hUrnV/LrSAU8
         zM2eBR2NcoYbrkT49Iv4bwNgg+1hK37ccufzIHSi2XRdl+rqAvGU+2Q/N6wdL/GIuBO/
         uStwevkeE/37kZslQKIl4MjdtbUUDkiOOHlJi2FSI3oE7oU1fTjeQc4wxIi/KCLfoUd6
         V+mRkj3XV2ox4L2H4HPs9awn+FbX38NGZ8+UjG+HWRaCfGOq5W1KdakR564HgrNBSXT2
         WxQbx80Ycfv4qREXkCR1hiz7lvTV0oW6G6rONsrDm7m8RDdvtQDvasd5Klo2QzqFuBQD
         a0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999719; x=1795604519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MHWJq4c2L8vwLNMipM3SvolqKdopXoWttmZJNYcOoCY=;
        b=KUfrKSS5PsoWg7X8R1Z/e9PdLvNo0+ImyIbeXI6icXMcRbFYi+jqOqoW8ghgRWpNkG
         EtRqplslGpTOx9uXDPgHEdmu6rmPqtVSV029o1nZnxR/muPSTa1pali4h1YDkPzS/lYC
         LnvkyKioIWgpN9hzWHDr7uYF9D/q1s67r37IJyH46WDnyhiwlef68qFC62hfRC4z43Pp
         RDTRyeqZKGkfFlSZgg32KhKyayK9N3+W2otm4lICo+VY/jsW2Ja715KscTEB9OL72WsG
         y+Ykz5cMlVDZxcXfaYlr4A2yPDJ6DorqFAj0BdnKVDmCcL4GQF2qFtU2R6TThIc9njEf
         eodg==
X-Gm-Message-State: APuU4Z+OBHv2Ipfg+qaxry2R6IEZmruSfswJn6/xKFNdGIcoNKArMIM2
	/g0vAH9ZzsGifDQivfGCEYhZByUGEIC9Ukf50rWQcsJbhOTfsJpB3j1FJDiVvO5M
X-Gm-Gg: AYBFou1XGL8lGJdhRY6nstwZOkfPygyPViAdXobnqhBjRFx5Fg68Q6+6ORobz4oewoG
	J1rGgALgMRh7Dw5V030UQysLZBuVApKc7odoOe4YmVFBbJS8N5empXFbd4m0rU8CXT8lWMOTEAm
	d3/ffiOWdTJm6s6nxqO6k9ka/WKkYjTcLMU/KJtfEnGGE5tGauII3594qwqxrLsL6Q0WRgVhopB
	rJA+2NX4Ln2oeq01fMdYRxkDp+wsXInR9s0nESpYRxg/iEOILs+y03IBP/LPQTLXJTI5PEl21oK
	Zgi4dX6nwncht6Muo17ftZM8DaYOWnsYu92JrVNidfuLVkCK2ReOoz7tqq1LMHL7BOvK/gdg4eK
	+AiI3HYD5kj/82azRmlhwVgYgtRf6Ypj22hYlsmuHsjtBmsPCu8aeNg3+PLqkSLTBMpIAwWeI3x
	eNBwh+GUdfX7Z0FlvJZft32/zJ2T0ChdotK4EvcJe7Pw/7sPkwLYiysHGJNW1TmaOCy8GoUEMFc
	kJkUcdfrh8Z+3yat5KcrTKuobJJlCv9BFTuoApP1iL2FBegDy9XxPs7YmdNMLOUK+0mrWZtMwYq
	kCKGU+lSUr0ga2UFRE84X5Mia4C2WCnMPmhB/AZJAAdcro/8iKHkkbdPzOB+9yTEU64Ss0/o+90
	=
X-Received: by 2002:a05:600c:83cf:b0:4a2:fe11:9a8a with SMTP id 5b1f17b1804b1-4bb7d57a4d0mr43714235e9.0.1794999718653;
        Wed, 18 Nov 2026 03:01:58 -0800 (PST)
Return-Path: <awais.belal@gmail.com>
Received: from elitebook.tailad32a6.ts.net ([101.53.238.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e57f6f9sm23139885e9.2.2026.11.18.03.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:01:58 -0800 (PST)
From: Awais Belal <awais.belal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Awais B <awais.b@rufilla.com>
Subject: [meta-oe][wrynose][PATCH 3/7] mongodb: upgrade 4.4.29 -> 4.4.30
Date: Wed, 18 Nov 2026 16:01:16 +0500
Message-Id: <20261118110120.3913031-4-awais.belal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118110120.3913031-1-awais.belal@gmail.com>
References: <20261118110120.3913031-1-awais.belal@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 11:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132640
Content-Type: text/plain; charset="utf-8"

From: Gyorgy Sarvari <skandigraun@gmail.com>

This is a security release to fix CVE-2025-14847:
https://nvd.nist.gov/vuln/detail/CVE-2025-14847

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 08c49b447b5a615aaaeb89802f503ec6d1722b74)
Signed-off-by: Awais B <awais.b@rufilla.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 339bb38a2b..720ddef416 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -11,9 +11,9 @@ DEPENDS = "openssl libpcap zlib boost curl python3 \
 
 inherit scons dos2unix siteinfo python3native systemd useradd
 
-PV = "4.4.29"
-#v4.4.29
-SRCREV = "89d6ffe6fc67b36fd47aff6425087003966588e3"
+PV = "4.4.30"
+#v4.4.30
+SRCREV = "1ae4c9990dbc5711f3500748f0c3f8b5d375d8c0"
 SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \
-- 
2.34.1

