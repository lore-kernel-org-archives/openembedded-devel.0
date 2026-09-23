Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F249EC98309
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:42:27 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4304.1790160138904140024
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=izXJ2FHe;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e25400so405221b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160138; x=1790764938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S65oGOjDejyz7Z+oaYfkCqfFs8TakFqwN0brlJaPnf8=;
        b=izXJ2FHeHJ6mivJtjZtZGx8I3TnzxRpeJ2fQ/N4iJbD9QAuYkdR9HROtk3H87eK/w8
         imbIkQ/GZE8z2+91neK4tMNE33kcvub5zdvJKH1Wan8oJJwRyAkFflOcTOZVyJgacToQ
         HBXxYp6gteA4/oK6k6FR9XjtnqlyrDtUpU5mJawXvYBVxgzgPZrM2wMFmC/7WV2qD61A
         /5OZq/GVxZ1py0bzJ3QxgB37MdqicUu9pexR61wWNEqLd7QomC2PGu762tKPqKQVAnmZ
         XAa3xBKEnQKShIseWldhqft+zYAK2clduNdyNYS7O4W4r8iaPSR6j9MFCSauYsX9h5vv
         bTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160138; x=1790764938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S65oGOjDejyz7Z+oaYfkCqfFs8TakFqwN0brlJaPnf8=;
        b=DWyIs1ARuwXbDkT1/QhQqY3Zc/djNTilf8KQ/W7A6+XNjMHVelHTz7e+vJWwGaetDW
         h8zmYHzs5b8S9U8HoP7oWMzrVqf7qTA3tjz5GpZSb9A0sCChZ8FrGUJFRAyH44Lq5Q7S
         rm0jXg/HNJQvLGww7WNDn+hUt+/j3EE0knmQsHe4v1vagA1/xiRZsG9CNMwUaF5T3Ok0
         h6ZkaCdR5is/KGTAKbz9uOoXhX+3kX2ALgdaqLNFg6B27virgDYXH2VOUD8AzyeJGBk0
         L1aSX+FB/Gw3+oohOLbfyWewPMLLF3NO8O+s+95r4nWyDbQiqUlQ+9LrssJ5lOWo5TFb
         IpQQ==
X-Gm-Message-State: AFuF++mb+48WFSJy/Qfg/W2vjZlYhXEujxHwa3y2/rY4+5bguYob/xM4
	s9H+mVP63q9AZ6OddEPXQt7p2b8UwDaOvlfVEPl56sgCmP1SYSZfFyVZY8pZLw==
X-Gm-Gg: AYBFou1DgTL7ZsUdWbu5uh8H2/4urbKD/0rV4v6To1JM11hmb/p7Fqxj+K11q8OvpU6
	xy8ACGL9SQK4Y0Maq2Gl9mTJJbE7hwo8t4tzn+AIOVpLYD+sPHebj7f83NA6TFPXY0wTCvyMpN7
	sw8ja89UuA2SZwmF25Td4iPOOyj1zI6wVLPtXhzRygI8u7pZqLrwJwQSn2XzygmWYuosgc6BUQP
	MqpCa810YG+VVksEJHh3heV02Wj2eDkGGWG14FfvN65QdWrU6obt6c04BdKhyIxa/+trm54aGTK
	+BfgZXB7gDRDNThxgBsiVHZQx0y0CJg9WpLJFMRZJaQLhE/2A9RhQ/OgDmlRvgNUVDdhiX0CWOe
	K+0jzYXo0TsVaZDOh+b7KZEYpDHKSn7fpebBF4wcbwm7hjXYhBqaqUz8VxMAfmPWOXDjfvKfIk0
	HK3n+LqfoyOrXaR1kB4yRF6t0sQGSiqe5hCYHRJiR9st+61o9CrLZjV4f2LoBf2qOIENetQOac3
	3/z6AWEvzC69bKp43nA8cmRU+a+LpSrjtg3
X-Received: by 2002:a05:6a00:1f14:b0:878:34d7:69aa with SMTP id d2e1a72fcca58-87d1ccc6e73mr1730943b3a.49.1790160138253;
        Wed, 23 Sep 2026 03:42:18 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:42:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 36/42] python3-flask-user: correct CVE_PRODUCT mapping
Date: Wed, 23 Sep 2026 22:40:50 +1200
Message-ID: <20260923104056.457360-36-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130223

From: Devansh Patel <devanshp@cisco.com>

The current "flask-user" mapping emits the wildcard-vendor
*:flask-user CPE instead of the exact NVD identity for the packaged
lingthio/Flask-User source.

Use "flask-user_project:flask-user", which is both an NVD dictionary
CPE and an NVD configuration identity. CNA affected data uses
"n/a:Flask-User" and remains covered by scanner aliases. With
sbom-cve-check 1.3.3 and the pinned 2026-08-12 data, the generated
identity changes but CVE-2021-23401 remains reported as affected.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 3874342e002c8693e6c53eee5f775bec9bb3a7d6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-devtools/python/python3-flask-user_0.6.19.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
index 68d7361519..c05c74b5c4 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c
 PYPI_PACKAGE = "Flask-User"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-CVE_PRODUCT = "flask-user"
+CVE_PRODUCT = "flask-user_project:flask-user"
 
 inherit pypi setuptools3
 

