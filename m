Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 61355788FF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 19:08:49 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u46so2432515wrc.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5Kft4pqIhVf1rw7Z98pUD1//kcNJoSMxiMhXtQJrbMs=;
	b=UDBYw/0X/0m9VQCQ8nA8jrUWAWvLoM+CHBDsOcC0Hx8f9hHK8oa/HFEgVi/7ZZFpHM
	MUFIa43OSGxxBx7cYz6yw6tX8vfnYEfePCZ+GNqJBO0ZqLmOJM8GZD1VHXWipI5XUg5f
	vCZU05jSgluJMs9EBaWBW2Hxv779p3kmJ+KIMUnxH7+KVnJ77BQZ3eRqB7AZVKSFlwfJ
	TjeCccU7bEDZmokJWIHvwGzbEwTkaZ64O0+nuEHyn3p7LwiUvQzjYBIS4Svc2nkYXdj4
	LmXYhRCcArgHKZNe07yk4mLCX0Sf1a0+VFmCJaVF2/NrQrFIV7BteBu8yvcibSEivEsh
	YDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5Kft4pqIhVf1rw7Z98pUD1//kcNJoSMxiMhXtQJrbMs=;
	b=hyEntMK9fObLVXZNQzBdRGRzTCMGPx1CkH7t/lwy5AkhGWlJaCszgFvs+WTjB4XTB8
	jU1Z15a3J3Fv/J1sTx+u9NWceonRS9CuNYY+cnLFdeoUEEomDU5nX59YoF+j6BH0QpEV
	SXyPW7tn0u820GpCNBfidv8fJclYVX/UmmfO37EuVE7xg5pj1UIRBwQL70h/NN0yvADR
	czTg6qNOzUyc+f7QLRpqVdVgU1byAhm/X+vGShvXe966rjhGs8i9aKWM6YKZlomU24DZ
	2Xqj19j/HgfcOiCpziqezKpTUTXVSV5+YUf/cK4uSgNox70J04Mf7xFMCLPMJa5YerXH
	xfIA==
X-Gm-Message-State: AElRT7FYCQRrxDv17CG8jV1AJCxIAXjlHQZwLVlWQGIp5WE3SVBxOdyA
	JfkSdGPER5yeTxMJA4W7jPJ4jw==
X-Google-Smtp-Source: AG47ELsYppcGdJYzo/EDQ0EhNYG+6+eQLPBvxBX05Za/YPY77hm/Oxd2flv3mStbtpuRIJ+Q8gguUg==
X-Received: by 10.223.156.10 with SMTP id f10mr7851214wrc.174.1521400129929;
	Sun, 18 Mar 2018 12:08:49 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b78:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	b8sm11614531wrf.29.2018.03.18.12.08.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 18 Mar 2018 12:08:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 20:08:30 +0100
Message-Id: <20180318190833.1393-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180318190833.1393-1-schnitzeltony@gmail.com>
References: <20180318190833.1393-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] xfce4-terminal: update 0.8.7.1 -> 0.8.7.2
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
X-List-Received-Date: Sun, 18 Mar 2018 19:08:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-terminal_0.8.7.1.bb => xfce4-terminal_0.8.7.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.7.1.bb => xfce4-terminal_0.8.7.2.bb} (68%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.1.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.2.bb
similarity index 68%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.1.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.2.bb
index 8d992f1cd..26bdf59aa 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.2.bb
@@ -8,5 +8,5 @@ inherit xfce-app
 FILES_${PN} += "${datadir}/xfce4 \
                 ${datadir}/gnome-control-center"
 
-SRC_URI[md5sum] = "cb34fdf6783d96bebd53e77fd83964ad"
-SRC_URI[sha256sum] = "9ff21627e8d2a105e7133efc3e8eeeda376a2071fac737e37cf47a539a7b4351"
+SRC_URI[md5sum] = "2a812438aeeb3d76e3d8d790817456bd"
+SRC_URI[sha256sum] = "a91fcbb89cab7987abc5d42e32d7ad62d2bf07656e30773eb274c7f087017bf3"
-- 
2.14.3


