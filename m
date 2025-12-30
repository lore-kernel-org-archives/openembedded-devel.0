Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51645E95A81
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 12:25:11 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63173.1767097502129724678
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 04:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ICo4MtDh;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so72301035e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 04:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767097500; x=1767702300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNxyiVRj1gZgzDnZqm0XmnzjHGniDUj0sCqz4ObYrvU=;
        b=ICo4MtDhpfYt4wEbq/PtPNGliqa/INcaP9IrHwiRx2LkJLyulEmr8FimAf15VKXWEd
         SI8E3ACWHovmLk3/D0pyNgi4dxGCE+2XF0EdillFyrue/747kohcekg6ypbQV9hDo1c7
         wQGS5yA4fBTjSiMd0oWBx4iywXIp1P14c+fmbQbddkg9SKW8pdGTh8nDkp/z8A4Rluac
         KpT9wLjE2DuKSKRzPyGTwiQqHWdcvc8zD0ags0mg7jacc7aOA6JZpSsjjQbs6zLy3lU1
         ychr7LUN6WRMjSUxO4zaOZkoIFxOTKfqzDrDRdEVyJ24gd30ZEvXRCHZwgsw35qnRUOb
         Nfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767097500; x=1767702300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PNxyiVRj1gZgzDnZqm0XmnzjHGniDUj0sCqz4ObYrvU=;
        b=S1ShAybOMBXSIG10yycN+J3e1iYtKFu3kAWDDr0XDEC3uLPXPU9+BFBUUIQPa9uilR
         ZweLWZ0PrVb8GaPKnLcEgOmfeC1i/eE0Vsl2wYDhI/jCAR8abiERoYzaWqTiVAZHQgIR
         re6p8Pk3CywOE5yXJD+YIkk03X4dDl6SvpplirPi8Lr14tFdBuIc9Au22MDafrYrISw0
         T/usVi1Bs6MAiVAd+Stqi6pJkI2fkNeVcDGE4e4uOWEK84kKQ6OIxtcbl6aJOLXZf8jr
         iWx4KeuIxI3C383QjnN1G3cnrlZWGYGxPwSaqzxKC5qMhYRQ8+wY8xXJnzjOQIMQnoF6
         IGmg==
X-Gm-Message-State: AOJu0Yw4Uvn1gL4ihqB/y/PlC47hsz0Jx0xmmCSmRoQaHHQjjDHGYT99
	4uOn8IS8sAUetC8RdlCeCkYtBtQpPmnmUhulTweduhG73XVQ7QMIc0tTPtSjmw==
X-Gm-Gg: AY/fxX6YV0ws1ABw7FensLvRfH0CM1KZeMgR7xTN9a7EgHBoaXYNW4HGG8O5vCBrOUd
	P+C34i+hb2n5x9P7if+XkwC/w0w+ytGM/y7ui3n6/tDIcjT0sMFLd0s4dPYJiI0sgwRfJ+HTPzM
	lHoMlhqCmHygnOam7C+bzc5Pv6sHrTS6jYC4LjvLJ1raI+WfhJcjRTpVhbsSwc4Db5NmYW0Y7nR
	+bXRXUGTO4JW7I6EjVqOZJFvNB9/NNihAxiueEPdel0eE/mKGliqgV8eBmBjFV5XwddJTnHjNz4
	fc7jS9RcZne0aEwCMLyVOGvmijTIoTJArqcZHR1MhjdJwDTHR3/XXXg7ARfXDGkc4Acl8MgHLOc
	R3vwTbipvRlldmw/4Y/UNOuyUT6Ryby38Euu1svGgzpv0U6O+skNXHI5itxvP7DSrGmDz5cjrvd
	sygvtjTbSh
X-Google-Smtp-Source: AGHT+IH102TK+23DPUTehxbIp66PxP0EWOih+/zYSYKxhwbM5gdkM8WZsn89BGYcAs3bvdV1XBy2EQ==
X-Received: by 2002:a05:600c:4ed2:b0:475:e067:f23d with SMTP id 5b1f17b1804b1-47d1959eaaemr410022145e9.25.1767097500325;
        Tue, 30 Dec 2025 04:25:00 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa477bsm68395060f8f.36.2025.12.30.04.24.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 04:24:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 08/10] python3-httplib2: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 13:24:52 +0100
Message-ID: <20251230122454.721515-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230122454.721515-1-skandigraun@gmail.com>
References: <20251230122454.721515-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 12:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123014

There are no CVEs tracked with python:httplib2 CPE, but there
are multiple ones tracked under httplib2_project:hgttplib2 CPE
(and they are related to this recipe).

See CVE db query:
sqlite> select * from products where PRODUCT = 'httplib2';
CVE-2013-2037|httplib2_project|httplib2|||0.7.2|<=
CVE-2013-2037|httplib2_project|httplib2|0.8|=||
CVE-2020-11078|httplib2_project|httplib2|||0.18.0|<
CVE-2021-21240|httplib2_project|httplib2|||0.19.0|<

Set the CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-httplib2_0.31.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.31.0.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.31.0.bb
index 9cde7acd3a..39f3459320 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.31.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.31.0.bb
@@ -13,3 +13,5 @@ RDEPENDS:${PN} += "\
     python3-netclient \
     python3-pyparsing \
 "
+
+CVE_PRODUCT = "httplib2"

