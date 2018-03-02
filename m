Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1BA6E60125
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 12:39:40 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id r16so11653650qtm.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 04:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4CmTh712HIak9t0496E5Yt7Rbpq01YYD/63KqlH1mC0=;
	b=CYwdYYnQl1x1uk+Uy6x3Gpj4fQtecx4ETbG8n2tjZZ0wfxmfZaQAw0MtUE+wVb0BRO
	LqhuXv4+QttGhBonggRnmi0hYSjvcrbliAhAm4sij9MTd4YNxHWWnAY5bcd9tFDu9SRM
	xVHZaxLU8XdunMYiVkzVVlZBVeGHIxSQ2+CqX98/Oq9iYmGGAXTjxTrHI7ciYYDD/3B6
	YUYBmhh6CsdrwaFYEaV+5Cp3afKabknOXMVGp71UFtX9SUnXoJfHmy9f9x0JkVCtfDqC
	0jSjGkk8BoD87RhE8GWf4bj3eMjw6RzzWnwHiKWKgEr7ZQhQTaz5gzFfqnTQuZTowxiD
	FPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4CmTh712HIak9t0496E5Yt7Rbpq01YYD/63KqlH1mC0=;
	b=NFGa5aYbzG69/+GUwPerAzbZuBzjwa6DF7X/YI20etAbhhtZAp/lAXzG5kOnAggaF7
	RYKqx0CigPduYC/goKhRonLsu3Ht0DvjH8l69Sv+i4ytAFeO5ceoGG2Uxh5/W1yok45c
	8h+vUwz646IifGWl1eDRRuLQibW2TWXbJA0iQPM8ibs7RJd+G90jIiYKFm2Ij8bpd/n+
	vkgzss/7BJTCKksCkUwX5X0oeSlNkVDYfeC5Y6Px6iKcAmWn8cNe2/QRy7v9BFpcXa6l
	vXm6lKQJJXhiB7ipLzR/adu9nJRXbbOMqXLuVJSQAdjXPDxlQKS6JFksIdD8KUju/a+D
	nTsA==
X-Gm-Message-State: AElRT7FiyvnEvJj0YRPQ5M1Qy0eVXz6/29is4SezWvBp6xzJ0bSS5Nmx
	TTiBEMw5mejkz2AUYlw5qgx09RZq
X-Google-Smtp-Source: AG47ELs8th7ieS/ZRwqJmMZqDj3LwKXPsFjKCwbdJB85vH8GQSWXhJNqUiOmkxhpYAm95JmbjtD/BQ==
X-Received: by 10.237.53.98 with SMTP id b31mr8602214qte.230.1519994381672;
	Fri, 02 Mar 2018 04:39:41 -0800 (PST)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	k131sm4346874qke.5.2018.03.02.04.39.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 04:39:41 -0800 (PST)
From: "=?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?="
	<maxime.roussinbelanger@gmail.com>
X-Google-Original-From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<roussinm@sonatest.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 07:38:14 -0500
Message-Id: <20180302123814.14043-1-roussinm@sonatest.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Subject: [meta-python][PATCH] python-matplotlib: Change download name
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
X-List-Received-Date: Fri, 02 Mar 2018 12:39:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>

Just having "v2.0.2.tar.gz" was causing problems with other
similarly misconfigured packages.

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb b/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
index 5b1c3f05b..b7a3fcfc1 100644
--- a/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74"
 DEPENDS += "python-numpy freetype libpng python-dateutil python-pytz"
 RDEPENDS_${PN} = "python-core python-distutils python-numpy freetype libpng python-dateutil python-pytz"
 
-SRC_URI = "https://github.com/matplotlib/matplotlib/archive/v${PV}.tar.gz \
+SRC_URI = "https://github.com/matplotlib/matplotlib/archive/v${PV}.tar.gz;downloadfilename=${BP}-${PN}.tar.gz \
            file://fix_setupext.patch \
 "
 SRC_URI[md5sum] = "89717c1ef3c6fdcd6fb1f3b597a4858c"
-- 
2.11.0


