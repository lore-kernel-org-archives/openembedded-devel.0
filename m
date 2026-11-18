Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10100.1794999723258084088
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JofRl5rG;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: awais.belal@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso5988175e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 03:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794999721; x=1795604521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgn5lCyNkS0m1v2hhIcAMLyKj2MzvSJJtn7aAcH5D2o=;
        b=JofRl5rG7mzuZsnr+kYRHOW9VyJ0Lfw0OkqJ68N6k13j26lKkUYv16DcqIPQBuwZ0n
         mb61Igcrhb/5kojFuKUeD/fWA+Xq/hA9CBR5ghcAr0ObWyIh8+GJrEGii7HehBlMrm75
         1wKzwQOrJyE9LHqX/EhUQ0PoytLj2I76c+Mh8BrVZtxZ9pmJ/f3xOlf+VYy8d8BSpI56
         G9X++8+4FI+JZn5bW45RIyNhQ6Uyv7SvU1qH2D1dMG+odqD2TQOEYiMLyA+7ZyUpOdD1
         0DC/1MCzfXFsbR5BWef6ut/37nIuHtDEKuISTSHkJyVURI81xv3rMFe4F5nzmZ3jdNnb
         VqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999721; x=1795604521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgn5lCyNkS0m1v2hhIcAMLyKj2MzvSJJtn7aAcH5D2o=;
        b=s7/xGrRFEScLCMuzWvCZqrE8yeajCVrK77HzIg9bDDOdIJVVeEsCWyO5a9o2iyQXsK
         Hy94KKcUVWHx0cWstQaFmlVCz7IeYHK2AoOnQAwhJKGAKVLqdXNHzTEB0jy+S1nusMcv
         fw0BP4B8mvXE54VEwxN/oglyD3EhGERFIg5eQCS/iXLsRBnyh48Uw1lGLb+Ke9Y7r83i
         iuP2Pzi0KdCFnHh/Pt2UJNZJe76wNZlJCRBYut473FDr5ID6VeZ3FQZWrNtgFupU/FRc
         UFbzW8pLKJ0TLc2/9b2r+A/soZcKixB0Q02RtFErle16maiXX23qRBivEeJiGsFpFtIi
         KzXw==
X-Gm-Message-State: APuU4Z+5HnCtL9sWMp+BURBnWqCdgjvj96gTVRGYzjCHHuuMYAJ0b46R
	f2SqO2ZT5ZB9Sb4JIIyhJsLWXFMdPZQ2P8Jv5PwzlGbsJgBD5Wzz1sTkHLXWpuR4
X-Gm-Gg: AYBFou1ZkDDWpSosZ9EPxqtaHIH2bsltfjNo6K4I4d60eHD7JixBOeaWENVBb0RU6do
	K6WeH09/VPIEn+33rn5FkI/uneo/aJnZEs8X7qvGjpQ63fFdRqlEy1Tl9wnrSbyUZkd+JaeHenx
	wveSGROuFmY4ytHu1TPE3Mk6fnbGDdSeprG6qAZKif5lriWlVTKyizHrKFRMpoQjJJS6alTgphD
	mjvjKCxAqfMaIJHUJUeol8JQIr35bl8Yu6STmTTTtgIlZpxLO69V6qGNGUr0MqFoMrmH1R+n6hi
	qz4ZYWFwhiA60ren8Q6kN8ETZOUV+nrJp5gxWWn0mu/ON/hwcHXmzzSj6kmZUOqK2XLkeWYXyrv
	s3yo1yN70fAEUJM6cYSzf2DDRFIvPghlVVVirxNMJFwcsTebzPQ4tGC4J4K8M+a+AU/Ctr5u/p6
	YqT+0zRridD17zvmUhK5d48Hu68B4v29QseEk+dkiAPI5rVS+uhnq99C6qoY4ET/C9BkxVEnliu
	Z9c0zff9tZ0L6PbWiVdoOKeuTjOJFHOLRkqb+XP8tD+eKACLXKzYe+JvsjsxjkerOkRuSdgSNQK
	3GIG9ZZRLQrGcoeBAPI17UyhDe3RhsnNDxrEFWL3EAU+6cFtQh0+gnTwWYVAcdNvvaZlMW8q+B9
	kAYUaxKfXWLaHmnWgvbKp
X-Received: by 2002:a05:600c:c167:b0:4a8:9a2f:d27 with SMTP id 5b1f17b1804b1-4bb7da390b9mr39617275e9.25.1794999721365;
        Wed, 18 Nov 2026 03:02:01 -0800 (PST)
Return-Path: <awais.belal@gmail.com>
Received: from elitebook.tailad32a6.ts.net ([101.53.238.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e57f6f9sm23139885e9.2.2026.11.18.03.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:02:00 -0800 (PST)
From: Awais Belal <awais.belal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Awais B <awais.b@rufilla.com>
Subject: [meta-oe][wrynose][PATCH 4/7] mongodb: ignore CVE-2025-14911
Date: Wed, 18 Nov 2026 16:01:17 +0500
Message-Id: <20261118110120.3913031-5-awais.belal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118110120.3913031-1-awais.belal@gmail.com>
References: <20261118110120.3913031-1-awais.belal@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 11:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132641
Content-Type: text/plain; charset="utf-8"

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14911

The CVE is currently tracked without valid CPE. The vulnerability
affects mongo-c-driver component, not mongodb. They are also stored
in different repositories.

Due to this, ignore this CVE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 272e975c34e5bd8863e72477c461755839932d88)
Signed-off-by: Awais B <awais.b@rufilla.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb               | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 720ddef416..b7f2c3aaac 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -51,6 +51,7 @@ SRC_URI:append:toolchain-clang = "\
 
 CVE_STATUS[CVE-2014-8180] = "not-applicable-config: Not affecting our configuration so it can be safely ignored."
 CVE_STATUS[CVE-2017-2665] = "not-applicable-config: Not affecting our configuration so it can be safely ignored."
+CVE_STATUS[CVE-2025-14911] = "cpe-incorrect: The vulnerability is about mongo-c-driver application, not mongodb"
 
 COMPATIBLE_HOST ?= '(x86_64|i.86|powerpc64|arm|aarch64).*-linux'
 
-- 
2.34.1

