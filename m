Return-Path: <liu.ming50@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 601487F961
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 10:05:36 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id g3so14966025ljl.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Nov 2019 02:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kwacxk2RbZlVX9vwRH/wIbJcvHF5u0y6TnuokMK3zB4=;
	b=UkSf5JHybDq5Vt0O81+o17FsZ4XufvkiqeGhXp0BqUEx/Ia1P+zby/vs+UWiymP3G9
	yUkyLc5deH4ZQqEFXXUg9NTBekOrJtls9G8cMGbWzcPDhduWKc3PY1MpNmiGHdJR9gNf
	MZ6++xgGCA635scYR6oz9UFjwzwODD4jslRgSvciQIit8PPOoS5MXI1VYllhLn53rnyS
	uPXI1g8Pe1HsZ5rk2FWIih9dHQ+46wpJKuqwAbXy4UnlL1uSmJB9WbhVbBK/L/FMN9oy
	LIMhCLHqhIcvHZE4nskvNz+/oKiDXT8HIuLH02NLDaUFErBdHkLYuT87gNh5/pxEi67V
	wwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kwacxk2RbZlVX9vwRH/wIbJcvHF5u0y6TnuokMK3zB4=;
	b=SyuIopM4oYJWq36bXZy7SbyvdTs1BU9iGm6vWUn0sNSUCJoVxe5ktu7C6J3dg0MSDQ
	ahkyunNnHJAY61GfrDS3QcCSqjmCyz2amz/NXBa3vQJMYrticj2YxEp8YkVu8mobFYfW
	oDFsoEt2/qb37kTfTtH9FjmrQ20NCWTfmo3fcafbhCkcdpNRa4oRuSS8FW/1TJPJSFv/
	Vn60yxlHJ20r7lydusmhHGNI0i5QuOSy1aD/MyZYDf/A0bYSq+pe6DxVH9z/8UgyO0Zx
	V7xfzSR4RykjM1GRNArYilcqepDKMcmk0DAXh99ZTmYIPa/qwacTCek4+0btu88ZAStr
	DgYQ==
X-Gm-Message-State: APjAAAX98mndshRQ83ucQYuoyKJkidE1TDJH8pTDvJ5izF6po7GWCD+U
	9bn/jCvrNrbHc2bMrwfyttlvC931A+4=
X-Google-Smtp-Source: APXvYqyNs/7HY4RbFZ7G7sdX75PfOnqFRn9o97Po6L9HKhXKE7e4/5c233+cjOe3a35GdYOCtonuIg==
X-Received: by 2002:a2e:6e15:: with SMTP id j21mr1675351ljc.17.1572948336780; 
	Tue, 05 Nov 2019 02:05:36 -0800 (PST)
Received: from localhost.localdomain (m77-218-240-151.cust.tele2.se.
	[77.218.240.151])
	by smtp.gmail.com with ESMTPSA id e2sm8421250lfc.2.2019.11.05.02.05.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Nov 2019 02:05:36 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Nov 2019 11:05:31 +0100
Message-Id: <1572948331-9704-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH] python-jsonschema: RDEPENDS on python-importlib-metadata
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Nov 2019 10:05:37 -0000

From: Ming Liu <liu.ming50@gmail.com>

This fixes a following runtime issue:
|      raise DistributionNotFound(req, requirers)
| pkg_resources.DistributionNotFound: The 'importlib_metadata'
| distribution was not found and is required by jsonschema

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta-python/recipes-devtools/python/python-jsonschema.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index 6fdc024..95c40aa 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -9,6 +9,7 @@ DEPENDS += "${PYTHON_PN}-vcversioner-native"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-core \
+    ${PYTHON_PN}-importlib-metadata \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-netclient \
-- 
2.7.4


