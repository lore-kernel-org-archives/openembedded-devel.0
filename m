Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 83BF578862
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:46 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id t5so1464796pfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0KoBwpCF3JtCRPA1FeNVEwMUCnUrtI5naIrxFQZ/MLg=;
	b=qy1LUHWJ+dWef10L8v7WOJI113++adOvvUmGNsjNthUOyFhkpyvyJ3gSAJKf8Ot4mT
	/7df7xq1IJV6aF3kRQHDYZP3isSKH1eF4ux2HmyVOUl2bW+pd3FXUVmUxKwFFxHB01E/
	L/IgG8KcyYnGG7VEeO40Nqu7EcmHwyBxVk55ftUraeRQ5CLc/hCQtYorinh58Mk3g3qu
	7vGIcmQm7vr7xeVok+djiJgShVvGYnyvUY8sgMp4HOhJfbnvbr7IsCqNVpiIx/udTxNs
	O6OdzqhoflAZpRVsSg638STm4BClRz1+3f5/VAAtXYu2nmV3e3b/E2zMmNFPEToM9mCZ
	rOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0KoBwpCF3JtCRPA1FeNVEwMUCnUrtI5naIrxFQZ/MLg=;
	b=e7F4OHubgNf6LQYw6faCt1cldD7789t4hGYEhwHjks3LUfQNzpHQ6WfMEkDkZVBhR2
	mhB9uPzUhbWnUr3T2LwRiOpPpXBXSaJqm7CPqp6MwL24N/e8BNrZlhNta/67d6Cef5X+
	mLpe+yRxAD32VxcPXtVAhTgvNddiZ6AwNbJFlBABkfd9eyEKXX/DpdWfTcXo+WOv/lc4
	U9QfTX24JElYCBdfpYzgIvLKKoX0kEvVnmR/HU7glk2K2aI4R7yu/r5BNKlbtZViERSN
	1fv+slrgXOExGF/dg9ocYpPZBcRNZLiRFuhyh7nrTLaXb4NIiZHKq07VYcc3L0R+XVUd
	7edA==
X-Gm-Message-State: AKwxytfqsKbpxOg/eMIViKRNe05SZjzByivHJUZxLzczYESWxs9AUbpH
	bC2+VVk66XzTnH8Lp+yk6sc=
X-Google-Smtp-Source: AH8x227TZJ6FlokSkg5Z7mdHymvXRycOsjLm4cs6MuvmoKZFkRd1DGF79Gahf+s2ynanC8kObyPYJw==
X-Received: by 10.98.16.79 with SMTP id y76mr20896739pfi.111.1517023486915;
	Fri, 26 Jan 2018 19:24:46 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:06 -0800
Message-Id: <ddd93a943df979f3af6fbff6fdfc62ba713c552e.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 06/36] gpsd: add missing python-pygps RDEPENDS
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:46 -0000

From: Martin Kelly <mkelly@xevo.com>

Several runtime dependencies are missing from python-pygps. You can
verify this by adding gps-utils to an image and running gpsfake, which
will fail with python import errors. With this patch, gpsfake works
correctly.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit d6c40bcaef556e3c67c6214d8fb6933ac224e619)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
index 47fed2d..26d7486 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.16.bb
@@ -120,7 +120,14 @@ RDEPENDS_gps-utils = "python-pygps"
 
 SUMMARY_python-pygps = "Python bindings to gpsd"
 FILES_python-pygps = "${PYTHON_SITEPACKAGES_DIR}/*"
-RDEPENDS_python-pygps = "python-core python-curses gpsd python-json"
+RDEPENDS_python-pygps = " \
+    python-core \
+    python-io \
+    python-threading \
+    python-terminal \
+    python-curses \
+    gpsd \
+    python-json"
 
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
-- 
2.7.4


