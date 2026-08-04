Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68265C55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 07:00:57 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11227.1785826850369739888
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 00:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OTh4kmsa;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caed617615so57824695ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 00:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785826850; x=1786431650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zXh82G4o873jWLmUEJC0nx0a0/lPgFcmRFwdjiGuHkM=;
        b=OTh4kmsaSH5lqSRd0Xi7Ng+daMizunmAiHn4XLyCT2quYjDRy1M9nuuWtV3QlpsP/G
         LXtpVyUggkKYvyaHcidhEmLnqGY4+v+vSJhXhBLEUg0SibiGtjjfWegQypmKfwAtDAxj
         16Hdy4szkVlALNXeMqhQSnzVFzVCyhgOI02XK8qPOVWYhdBddhZX3nvW8JOXg399nFJ6
         QdUwJ3w/HR17VR19VD6oc6hLWRPJNui+/MGbrgUDa19izMSAZwKEZWbIvcrnBGSfr/14
         rXZJ8X/2Na9z8J6wb7rQK1SEDeE+bBN62hAX+Rv9mbvskQfoYLkqyRvRvpqW2/rGpolR
         wJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785826850; x=1786431650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zXh82G4o873jWLmUEJC0nx0a0/lPgFcmRFwdjiGuHkM=;
        b=Fdobql89sgiO2SiGK2tDpqO1XB0TVOfUgbHtvTbEUhbJnZVZcEMVZxpkdmAdEPm9rM
         DBGLZyagklGq8du+6Lyhes5OLw1efHXKhl0LvXHxjGp1k4Jy59E4RDCIfMHznBq2oXQx
         hqdjfGpX5DxmDlwtTxBj4yknIysVIn4hmAojpFXAi0msTs4aNdUkchAoz9l9cfqm1auE
         9F+Tdh0ZIBgzsAtH5RsQznZSzBSMVJNOyw5/LtKsTDvtRSe4G6XZVJxRhNAx+Svt/9h+
         VmHswSKKgfl8HvfPZxAADqdnK6o/Lat7mbcc8ryEwr9lWPv3mqYuYwrRYYo5XadN8o7a
         o31Q==
X-Gm-Message-State: AOJu0Yw2N/EkupkZ8056nxThp1J6st3NMwtASPrB9OAd5VOt6Ay9RVn7
	TcxOwdE7DwH10+K/u9/TQhcIL861Wgrn38bFgPhzH10DIFcZvF9X8aL0dt0nlA==
X-Gm-Gg: AR+sD12KCi4ZBKvk53py1EgDN3Js0oijBtjrdngfl4WTdHAEBhelmK0/snYcQQWONWe
	XtJCARwY4wH/Kg4EuJ3Y7Ri24C7ANsn/caeNH2R8porgZpLJUaJNedKOtQ8pJ7kf8wE8xrpejys
	/VULeEvBRehn1tQi0R0gvFUJy5BgfJxTdRVJOO2w89ZYIwrFOqbfKFVU+9xzgPP3Ij05Ry8nO9e
	eqXS3w1BB4FM5eT4gEZMr1gvYxRQb8wdoUFkcaRtvDCLCbcNQnn8hF8FWlCNFurhR6uuJhCd68p
	1LGCmEAfcUj9meiXXAmEAgVx/n+MGA9k0mjYFY2DoM5ZX+xbbRSzMybsABq9Qf4LR1CZiCAdbVi
	4O3GflGH6DUsC2b/7lZH2r5iVMZXktpDR3TEDyKbU/Cjt6yo+oLEbucgrFgJ134sx41Ao28EV6I
	H/X0Pw2nOfYz2xRSzPDGwHRspcUsBN2HLBEMWZOzJsOd8wfSBSo/FKFAtGBNbdKUT63+5rYMTyO
	w==
X-Received: by 2002:a05:6a21:e58d:b0:3c3:a804:8eed with SMTP id adf61e73a8af0-3c92a8b7943mr14317246637.56.1785826849256;
        Tue, 04 Aug 2026 00:00:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586447d52sm916034eec.12.2026.08.04.00.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:00:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 4/4] python3-linux-procfs: upgrade 0.7.3 -> 0.7.4
Date: Tue,  4 Aug 2026 19:00:12 +1200
Message-ID: <20260804070012.3171225-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804070012.3171225-1-ankur.tyagi85@gmail.com>
References: <20260804070012.3171225-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 07:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128738

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Upstream replaced setup.py with pyproject.toml[1]
Also included tag in the SRC_URI.

Changelog:
- Bump version to 0.7.4
- Fix spelling mistakes in comments
- Modernize packaging and update authorship
- Remove import of range from six.moves

[1] https://git.kernel.org/pub/scm/libs/python/python-linux-procfs/python-linux-procfs.git/commit/?id=ae7413ad5da8d923fe04e2c30879a4e8d3e98dd7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-linux-procfs_0.7.3.bb => python3-linux-procfs_0.7.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-linux-procfs_0.7.3.bb => python3-linux-procfs_0.7.4.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.4.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb
rename to meta-python/recipes-devtools/python/python3-linux-procfs_0.7.4.bb
index 26da91b16b..839ec94600 100644
--- a/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.4.bb
@@ -4,10 +4,10 @@ SECTION = "devel/python"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6855782848d572347212f667a2d637"
 
-SRC_URI = "git://git.kernel.org/pub/scm/libs/python/python-linux-procfs/python-linux-procfs.git;branch=main"
-SRCREV = "59ecd1ba018141a02ffe59c16a9346991dfd0d48"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/python/python-linux-procfs/python-linux-procfs.git;branch=main;tag=v${PV}"
+SRCREV = "702d6360ce082d8328e0cfd84f6415b0c94ca6dd"
 
 
-inherit setuptools3
+inherit python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-six"

