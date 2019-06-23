Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by mail.openembedded.org (Postfix) with ESMTP id 331996C106
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jun 2019 23:15:41 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id d11so8627540lfb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jun 2019 16:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=AWd2rsEqzfZGhwdCuPf9bGguAij789Zd0DvMKJKLqPg=;
	b=BTLx/zKvKgfshDBY36K9leazuB0uD6n2scpGGlVMKhXbO5/WsTz5Kw9EEjeoC7ROuH
	tzVLBB27RXPQApe+25RYJKvnzhwF6x4NQyGPAA5t+ipxhAoSZyrA5+rIVrm95yBB0hmv
	gBxmZ83itNPo6IHvF40U77wka9MVwy0xhZ4cZYqfOLGTUWYbJ1Rl4Hp2+xxzL3NEbiLk
	sjkOzOgldb7aE9SUuLk5hN9vGxyVYfzgrjpmYncClsnoNu3a9EZXTjhvaFMLnk+X2qr7
	8BckNL+2l7c2ehBzUFIf0L6j690AYvJosL9L6pmuKHqnZvjFO2et8R4yaBxcnV9cZVY5
	DsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AWd2rsEqzfZGhwdCuPf9bGguAij789Zd0DvMKJKLqPg=;
	b=GC68crccXjwyIxkV9Q0FutoPPeGYr3XkQDShkSS2TqJ+cU5WV5pyaPBhdiyGBPVAKa
	hmRI7dyrMlnrnxYMMDpQNemjtIqCHIuT9CWKbfazImlKhQkYLZ07V0JSIh1Z1aPCwzR0
	p7wSNsLsA0g6M++hTqvDImwSxrqRfR0Mx8BRIpQcRR8j13cdaR8D7/HmaBRFtuSPdv8z
	1ZKAyuDllBSJeiudfmzWbFWGoHC0LrDsqtdJ6xkxla3pokfeDnHARjDC0lOwh9pZmBqb
	eC1ACpQF5HbdgArAkWD8pbI9uokdOvYfqxoNLDWbqGI2dm4HWeBO6mh7Y3mj+1itcfV2
	KazQ==
X-Gm-Message-State: APjAAAXO/bCGsStpgTKFQWhbAOFrEb6qIR8QtjDF1KMsDosvLL2WJCml
	3wHjAZpZD6YqExf65tFvxhlUMbfuINk=
X-Google-Smtp-Source: APXvYqwXSyZI9BrfBN4UQUVcFyLcU/Xqa4UelJWrv2Ey82MVBipxOM6lq7Y4DeHEj2ne4FgWMfJQWQ==
X-Received: by 2002:a19:c301:: with SMTP id t1mr76388710lff.137.1561331742286; 
	Sun, 23 Jun 2019 16:15:42 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	y62sm1461942lje.100.2019.06.23.16.15.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 23 Jun 2019 16:15:41 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jun 2019 01:15:40 +0200
Message-Id: <20190623231540.25388-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] mbedtls: update to 2.16.2
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
X-List-Received-Date: Sun, 23 Jun 2019 23:15:42 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../mbedtls/{mbedtls_2.16.0.bb => mbedtls_2.16.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.16.0.bb => mbedtls_2.16.2.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.2.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.0.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.2.bb
index 2e9d01e14..b0bd942ee 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.2.bb
@@ -23,8 +23,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=302d50a6369f5f22efdb674db908167a"
 SECTION = "libs"
 
 SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-apache.tgz"
-SRC_URI[md5sum] = "eae9cf16114f4491dbbc0fe36bb7e6c3"
-SRC_URI[sha256sum] = "e3dab56e9093c790b7d5e0f7eb19451010fe680649d25cf1dcca9d5441669ae2"
+SRC_URI[md5sum] = "37cdec398ae9ebdd4640df74af893c95"
+SRC_URI[sha256sum] = "a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4"
 
 inherit cmake
 
-- 
2.17.1


