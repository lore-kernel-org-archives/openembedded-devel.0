Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14712.1794911772454928622
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 02:36:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Yz4QmZed;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-497614c95f0so2205260f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 02:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911770; x=1795516570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=709VzTvslw81M9JPFIZRC9iRXRstYuzU6Uicl4C9c6Y=;
        b=Yz4QmZedDmSBaNdOIlCTs84cJ46UBGvL8Eq2CTOY0dewIpC1ULJ+LtEhwXef9YLE4e
         77KuqId2cJIvmuElEA25QGCqZ4Q2spW7FEPVpHkZPIDM2lmy8859gwVilhfR9719Q2kF
         anqrEy4LLq46EFJm2VqKls1d2pjqwNpSteOdAxokRZY+4x2SiY88zCBAyNOZhnMrTIqw
         tzMUxG61h3n8PR9UaC894IFUIBJCq7Y3MP0Rh4PON9hHbo9w4siBHyIqsRv/WT72AKL9
         kwuZ+fUXhf795YppBPNq9wDVbePI554UTC3sbf1gn8BQU61pszVCtJlz+knJZK9zby4g
         pCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911770; x=1795516570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=709VzTvslw81M9JPFIZRC9iRXRstYuzU6Uicl4C9c6Y=;
        b=Qv/coz96zU6qUI6a7gXEUhhYuL8Xk7Hfp4FKZTlYzGOqtn0+VlgdjirfUtJJVwRcS9
         Z/DZnq+tr+990s7FeH+e8t8PTVyA+FQ/FdU+w08hma5Lr/UBTsBfNTVCQSM7TnPUeux/
         F54kdBo4PaejhAjnKmkMq2gU4sMJZL3pA6hKgVTV8r0RMvonGTuksrTAhyMPNcDovJ/k
         3YJ8D+Z2YeSn8y8v34bmveH9yw0KcN5valm3oi9pG5xzgUijR4KF9nnJjlS5AJurAfok
         uwEHa+kxhyeQTcA48O1QOtbnZmQAf+0pyxPtPTbaxyz2JccnsNDMd6PIWLsfDQH6CQcg
         hfxQ==
X-Gm-Message-State: APuU4Z/qnTFjie73YICB6rXQI4Pw9VhgDtnApSj37scLeYHmO1sv5j3b
	Ogo/T4+gk5rgc/al/vxFxkaUuya/5WAQDb9ne6qLLfIc9qw8vUY9zIA0bP4ssw==
X-Gm-Gg: AZFdTZcCfSp6+uX1pHOINQRGqt8z/mMgSw2PaeiVHhf7J3NBYft3dEoduJ26xfdTeR7
	B/9FKteY0jkXy3/0HZWhpf+J63W/N5LuEpxQi7MtFkdsbQDOArDNERvKvj5bwnWgSGrpY20HooF
	CeX7IZ2WoRBbcvySWaFnvo+eLTxc8UhOqxxsSuCY25bl8A1Tbsh6zYT+rwGqkO/tGgEVJtaOHx3
	zxcX+LKQ5I8W9Tsdcywyx/w/jWe1Q9DXd7yuCeZt7N0Wu4lJci9I5wl1zPdOnDbPpjEY6/O9VFh
	e+4sb2UHiHyB/JjNq5yUyQ0hYZ8mkUlyiT9FKyQJHLJCcqdvJt1EDsjXZBbRcYOzb4y1SGpXOag
	6UTRlfiI3Qgk38IhvTo0p4LAZ9+hK4m7IHSbIRsL5hYU/daubrughyXJbmN9KCnhTvwcCx0f5qS
	J3iS2QWzpdimM3CrDUpmxQQkpCxEqNLc7MgnIjHBt8oFlo8UIq5PC3E6lGnpeX1EVU/VzD3duLa
	Nuk0Ql4OjFH5+9vnqBFMIt5jnsDZG1TzDHfxQ0Ncub2+anhlnTL1x5m0kVicA0o4uVwi6/yKpN/
	7d5GBMUWzJEOR5d2xyQSktczUAYGNnNmEqv3jaapKmIOLROo6bZr
X-Received: by 2002:a5d:5e01:0:b0:488:8ab9:f74c with SMTP id ffacd0b85a97d-49c6fc9dbd2mr29991608f8f.3.1794911770148;
        Tue, 17 Nov 2026 02:36:10 -0800 (PST)
Return-Path: <uvv.mail@gmail.com>
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4de4cb1c3sm1604674f8f.8.2026.11.17.02.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:36:09 -0800 (PST)
From: uvv.mail@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [meta-oe][PATCH 1/2] overlayfs-tools: upgrade 2026.10 -> 2026.11
Date: Tue, 17 Nov 2026 10:35:36 +0000
Message-ID: <20261117103537.814124-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 10:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132577
Content-Type: text/plain; charset="utf-8"

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

Changelog:
- Decople tests from the build system

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 .../{overlayfs-tools_2026.10.bb => overlayfs-tools_2026.11.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/overlayfs/{overlayfs-tools_2026.10.bb => overlayfs-tools_2026.11.bb} (88%)

diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2026.10.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2026.11.bb
similarity index 88%
rename from meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2026.10.bb
rename to meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2026.11.bb
index 6a3d609567..f0c378e043 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2026.10.bb
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2026.11.bb
@@ -7,7 +7,7 @@ SRC_URI = "\
     git://github.com/kmxz/overlayfs-tools.git;protocol=https;branch=master;tag=v${PV} \
 "
 
-SRCREV = "950d0cf35e4f917b6836565d76e38bcf7fcf2d5f"
+SRCREV = "42582352e11b162895c06826f18a2246d8005ca9"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
