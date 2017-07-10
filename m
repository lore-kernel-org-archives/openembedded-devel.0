Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 14F8E6FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 17:35:17 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k67so26344180wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 10:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LJ0W9mjkIr0HXtZi54TyOj2V9Uk4VB7wMaJlqNKK7ZE=;
	b=b2FxbfET1EK7fOj8kbOjlnUViKhIIUD7F4PQMznA/XOkgarYQCfWYuvaY/uvdfBtsA
	6GWIKZfBal/xZR4x36l5AWb8h8rbEVW0MAP1PNgQ/3ljXiemqdNmhLSdKz5WXy7Q95AQ
	sEnIqjl6HE82CuoisVrxRUEY2bzzw5u7zT/Zjzib9XKZMIpYepg2H5+X7IDDPDU9UJw0
	PyWdsF+HyIqN6ojpfZEXyCkzTn249Zy8RCgJ3pG1d8P+hblJEhVJoWsyJ2STkfopT8+Q
	2R0AA7ZiP9kh5OnC3IiJJABhbDZjjOnxk3HUZ5X8/fZhaOmM1MfCTUSpcK8ZXLo0ud11
	gujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LJ0W9mjkIr0HXtZi54TyOj2V9Uk4VB7wMaJlqNKK7ZE=;
	b=ByiQI4GQVBw2sjQHdgpspiEcEM+6Q1FguQHDtpjVyWJNXnjzDKT2YcyaK1muUaztCX
	8uhF6lAvN8QQHgdCZgHLJY4K5vjjiX+y0+as9l5vjnLCy4E8z5KgZQMDugCwmL2hDMuD
	4QCUOexp1T6OuhRrgyWNysXCgc59/bRVsrVx3mt6vvIhYdBdnQPTG5q/NDRK3ia1akxI
	esOocBQ+3KlD5zD0PKcXt6eRfjVuulQt1aaJYfArX/f3mUlL7xmwfsP89RcHRZWZb9FJ
	ajrr21/yqoI/2GjofDPG7SUutLqayk1DxBOtUv9jN9FcIHyFWLPgEjIdMA0racl4pklr
	MmMw==
X-Gm-Message-State: AIVw112PIG4Gp/10qsrRrQA95dSUK23FC6O2difbNOQTTQK1gV/BXxNG
	rxzUhRmNvf9GfSSw
X-Received: by 10.223.154.41 with SMTP id z38mr7422040wrb.76.1499708118421;
	Mon, 10 Jul 2017 10:35:18 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E9066A861E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e906:6a86:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	z195sm11980102wmz.28.2017.07.10.10.35.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 10:35:17 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jul 2017 19:35:02 +0200
Message-Id: <20170710173507.3843-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
MIME-Version: 1.0
Subject: [PATCH 1/6] udisks2: update 2.1.7 -> 2.1.8
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
X-List-Received-Date: Mon, 10 Jul 2017 17:35:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/udisks/{udisks2_2.1.7.bb => udisks2_2.1.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/udisks/{udisks2_2.1.7.bb => udisks2_2.1.8.bb} (89%)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb b/meta-oe/recipes-support/udisks/udisks2_2.1.8.bb
similarity index 89%
rename from meta-oe/recipes-support/udisks/udisks2_2.1.7.bb
rename to meta-oe/recipes-support/udisks/udisks2_2.1.8.bb
index d8f7eaa..6d90e49 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.1.8.bb
@@ -10,8 +10,8 @@ RDEPENDS_${PN} = "acl"
 SRC_URI = "http://udisks.freedesktop.org/releases/udisks-${PV}.tar.bz2 \
            file://non-gnu-libc.patch \
 "
-SRC_URI[md5sum] = "8bccd36573b75286538bd5bd2c424f45"
-SRC_URI[sha256sum] = "abae2bb3bdc691ca13c1e4c244630b8c881c4f3b35c207299f1b39b7bec83785"
+SRC_URI[md5sum] = "501d11c243bd8c6c00650474cd2afaab"
+SRC_URI[sha256sum] = "da416914812a77e5f4d82b81deb8c25799fd3228d27d52f7bf89a501b1857dda"
 
 inherit autotools systemd gtk-doc gobject-introspection
 
-- 
2.9.4


