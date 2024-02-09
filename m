Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0A5C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 06:11:24 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.5915.1707459081587676393
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Feb 2024 22:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FY8KOlG5;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d70b0e521eso4554665ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 22:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707459080; x=1708063880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tSF5nXnFKErefgMFENNQnoR5CXIkJgGewSxJfvO6Vy8=;
        b=FY8KOlG5e8W+/uJ2n+tVz3EjoaUNaW66pFTKWN9ndQQddzMn6+ARvJ3tXlh9HAQFb/
         tfe+2/luX3fIYkrAh6uod36p8kcY7HsM69CKS8EavxQrqaVngsxeJM6/hfLjQDPuwJKC
         unAGaOqJrH6ptyvRRvALlVESsXfnooHj7fpXpeS2jl+VZzbPmv3XO2Rb6YecI1AEkjNK
         kolFjSYvFwA+6d9sjysDYezEZK1a1fRL5npkTVQ2CoJZmtT63s4mRIx6uxUeGBWkLeYG
         SIgPa9SR9X8aDj4YjsyZDYu6m+nFWeidO14UTW+E+ZKDN/Z2oO5MOjPhcWBjWKDwx9n4
         Zt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707459080; x=1708063880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tSF5nXnFKErefgMFENNQnoR5CXIkJgGewSxJfvO6Vy8=;
        b=XRWhaM8hY/+S+aOzUYbIG10+up8lXWsJKFmqVaFOXiyDt2Af7DG0o5YN/ZCKbKWOUk
         w/1dTzpjRe3LA7FkirO5jwgLUi6Ng7JEicJCuvEY94u8ucchbJklOPupDfVGHvhQhFNa
         G77VjMRBpnGJz5Wi+cmFlmkxdepF1ErahVdYKrSAaY48JqAE1dCJ6nBlgi6cedCj2E89
         y7XwFh2m2iQRGB5IfjwkNySrv3AhMdtSuGaYnUbNesgWnQ5zx1TPAXJB0Qmgq6PkG59P
         Nbcq0R7LcjrSOaGQ7wmEyAyS0jukQo9bhBM5Rpbc5TLBi7nAm27jwobP8Ti+D1Wt/n/p
         paYQ==
X-Gm-Message-State: AOJu0YyN7y8bDscqk/0tLN66DQRy7bZN1lAMfzX1OnjDSqwgbcKxYKeb
	nkux/OvLtqv6METVXQfoXMPyPWdBnOmvtMvp85BRFb3objtxgRAjZc7Wbc72
X-Google-Smtp-Source: AGHT+IGxR1wjm3FI4WkT2Mg3H1X6FprKLSqaq6RAgWfEcEv2jJIfcLyWFaWhtrHlyeUWMBqUUY3f8w==
X-Received: by 2002:a17:903:44c:b0:1d9:b749:d279 with SMTP id iw12-20020a170903044c00b001d9b749d279mr509566plb.50.1707459080237;
        Thu, 08 Feb 2024 22:11:20 -0800 (PST)
Received: from L-18076.kpit.com ([2401:4900:1c45:770c:9b88:c7f8:8927:6fa9])
        by smtp.gmail.com with ESMTPSA id e5-20020a17090301c500b001d7610fdb7csm730214plh.226.2024.02.08.22.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 22:11:19 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: virendra thakur <virendrak@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com
Subject: [meta-oe][kirkstone][PATCH] nodejs: Set CVE_PRODUCT to "node.js"
Date: Fri,  9 Feb 2024 11:41:05 +0530
Message-Id: <20240209061105.164184-1-virendrak@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 06:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108678

Set CVE_PRODUCT to 'node.js' for nodjs recipe

Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
index 16593a0fe..da1f621ee 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -41,6 +41,8 @@ SRC_URI[sha256sum] = "576f1a03c455e491a8d132b587eb6b3b84651fc8974bb3638433dd44d2
 
 S = "${WORKDIR}/node-v${PV}"
 
+CVE_PRODUCT += "node.js"
+
 # v8 errors out if you have set CCACHE
 CCACHE = ""
 
-- 
2.25.1


