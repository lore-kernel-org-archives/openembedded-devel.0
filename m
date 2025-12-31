Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA80EE57E5
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:55:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81815.1767167700189650400
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:55:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HJ4HICUT;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so81195385e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167698; x=1767772498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5aBjPru3/4HWD/aTs9jxEWEEfgRAX9OfEFDlbOcjVOk=;
        b=HJ4HICUTs6EkGvpWX+cUQpgqD3evlh+XgSDL608ffUPq5VME8+/RLQZ0h2JQa/zY8+
         ALmv3ea3Ha5kkuW/bzyfGQRfgCiW7osJSWVnx4kuZS85QWTobO/KPd8uNcRe2UXVriHA
         qyHDEM0G6JBa353KRCnFSC+yv0D4o+ur3zegl84CMBA7GuMdpinD00Eq5A97qKxsxrsl
         kr4hSb9DLzhtrwPyR4WbMK6QSJ6Zrel4Nh3kgz6W9B3T4YtyOCFx7grCWUN3GXY7XGns
         +4Lzq2lfK13bkcyyBT0TZLE6MlQCXUTbOqu7LG2+RC5RKHVKyZaIf4T8RARHEq3D4XlY
         UomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167698; x=1767772498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5aBjPru3/4HWD/aTs9jxEWEEfgRAX9OfEFDlbOcjVOk=;
        b=q42e53ZAIuHLiiNj5hH6VADmthVyEfXWrdLNc9dyH9jvuVI14JTVlNw4sBrpEu6uji
         mZ2i0rAVzzGBgDftgsYE4WeOR5y/7x5gx9X9wfWMwZsP7MjJ859m1K8rNNAyGEqd2c5k
         VOEmJz0nl7g+k9JrvydWo3y1eFXq/F2r0hFQwcYJ4nC0cXyiIHB6+G+wdodAQdwk+J2D
         PuR1V9zyMy9mk/gvkILxMkiUFCy4voWXZgfIx7GaU/lznqtT/HDI6fqGNNXmxRBpq4SO
         cb8BcwnnK50oHKS/lRz/PDynRcC0Uuc4MhYFFCabSO9lkZGR8VLnQXjLFiqf8onvJo3/
         lpng==
X-Gm-Message-State: AOJu0Yx4rbNu6tQLxgJaDxyeieYF9RHdlsOq+mrEs1oRb2VSZKDQLY/N
	V2fQLlKzZuONoBi+QApxZruX1UOVS2UWezLeTAdQgxzM6lIbwpaNpZaX7egNOw==
X-Gm-Gg: AY/fxX59Q/9w4z355s1KYppndy4GI8NEXmJ9LpVzXZl66rgc0Y8uPKA2caSYi0U0VeS
	oD9B9oRuAr8Fj/u6HOxITXv31HAP/F2Pe8dEYIJt5UaSrg3ulDa9BoFVVrEr12ZJvDv4JdeMClF
	hTg3EoC4k3c4ykx4xxDHzxI/UElILPqW/d+uM+a9AMVYCHNNOjrJJ21atzI8pU2kvjiZO6scvEo
	zg5K3BfehUGQvsCo5chW1vmfoj+mL2mDajO5ewznWR+FWqoqvwbP5eq5ZLSPxEKMRr0kkJAVpCX
	IFlU4LkQO2J1yMCnNMcfP0mYk6dxIHi8STh99zmfCrp0JLHNYgP9rt3T0gS/2jv/Ftfc5KpMESo
	B1/9pQ/CiAVIpBxO45KilvhOZytNgacOa7p0Gt6pTOEtBKneFoXWIqMhy38FIipCEV0OfmSGYrJ
	lE6lG1xXgr
X-Google-Smtp-Source: AGHT+IG6O6xGoHX8Bj4I/3wW0XmaSrTqHFUJoEf2eg+w4KxPjdlIQ2Byz7kyunCmyHBLLk+cV7nIpw==
X-Received: by 2002:a05:600c:3b05:b0:477:6e02:54a5 with SMTP id 5b1f17b1804b1-47d19594d77mr385291325e9.18.1767167698546;
        Tue, 30 Dec 2025 23:54:58 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:58 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 29/34] python3-gevent: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:31 +0100
Message-ID: <20251231075436.771395-29-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123069

Relevant CVEs are tracked with gevent:gevent CPE, and the default
python:gevent CPE doesn't match relevant entries. Set CVE_PRODUCT
accordingly.

See CVE db query:
sqlite> select * from products where product like '%gevent%';
CVE-2023-41419|gevent|gevent|||23.9.0|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-gevent_25.9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_25.9.1.bb b/meta-python/recipes-devtools/python/python3-gevent_25.9.1.bb
index ea445d8ceb..51861f24c7 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_25.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_25.9.1.bb
@@ -17,6 +17,8 @@ SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
 SRC_URI[sha256sum] = "adf9cd552de44a4e6754c51ff2e78d9193b7fa6eab123db9578a210e657235dd"
 
+CVE_PRODUCT = "gevent"
+
 inherit pypi python_setuptools_build_meta cython
 
 # Don't embed libraries, link to the system provided libs instead

