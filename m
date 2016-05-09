Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 199A8612E5
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 May 2016 14:36:36 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id zy2so18680794pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2016 07:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=Fd5KpDKgHcu4E8E6IhDpQTjyUQ0623Ay08+1Ry53JHE=;
	b=A6Bup3KHUi9eWpDh2FlqwjJPuDRps3u7gBYS8VoW614T2hkPuy/3KnsL9Ee/twDG5X
	9fayb6rWDACEYjuoMe/04AHBsd7iVQ0SjxIQ10ZVWihA3pP3nVOetpEej3xyOMh0mxiz
	2dQXbSPDq8MY9UlARhPDqDfkpn7Irmo60yD8mMpF+MAROQfg9gNahAq5d+xgRif62dBn
	TSYYJkdiA7uNeI/w3WIdseYRU6REzwfYmneRFmxSIolS4q+vZwL+sJaBC8ifmRjDxqIG
	Nisfw4flWh2gK0JjfY3Xk18veOHqV6Dw4vz6FFceEqZZ/kVaN9is5cdaKwnEERSwcipx
	oPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Fd5KpDKgHcu4E8E6IhDpQTjyUQ0623Ay08+1Ry53JHE=;
	b=BRmtxEoiy1kBimfm1PAupol43Q69T6g5fs0r3//2XlaqgvHydbsg1V9/mpdJaq996a
	ZO3FhvdcLC3bK+utO1OI4g3A2HlM/6pnqNUrcuCXfQP1AbINmM0YmZcQ/Bt0giwKPUcI
	3TmNqsK9VlakIXhG16TZaJE6FJ1pJOfWXVAsI5/bpNxMi5gVmhimmOcBcM7Ff9KvtgLU
	tStf12K5Pi7T8OaYqyUoPR6jDm08P0nK/H5RgQsUyQdRQL7DMKvXd3X8igaijWG8c+Lf
	OADU2BWmafufMUq/20/GCZKVxbaJ/1xfYkaN8JihFQPiVkRTIPH6L5mDZscYmzV5hFrE
	q/EQ==
X-Gm-Message-State: AOPr4FX9iaapmN3akahTU8KYmQA2zRXTny4ymu5I6Sttp0rXRz4sRrVJMxBMoecyEO3WZQ==
X-Received: by 10.66.65.235 with SMTP id a11mr50369114pat.155.1462804596938;
	Mon, 09 May 2016 07:36:36 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	h16sm39541280pfj.0.2016.05.09.07.36.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 May 2016 07:36:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon,  9 May 2016 07:36:34 -0700
Message-Id: <1462804594-18871-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][master][krogoth][PATCH] uim: Fix Warning
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
X-List-Received-Date: Mon, 09 May 2016 14:36:41 -0000

WARNING: uim-1.8.6-r0 do_configure: Missing DEPENDS on intltool-native

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/uim/uim_1.8.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
index 42788e4..8b07394 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32463fd29aa303fb2360faeeae17256b"
 SRC_URI[md5sum] = "ecea4c597bab1fd4ba98ea84edcece59"
 SRC_URI[sha256sum] = "7b1ea803c73f3478917166f04f67cce6e45ad7ea5ab6df99b948c17eb1cb235f"
 
-DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool"
+DEPENDS = "intltool-native anthy fontconfig libxft libxt glib-2.0 ncurses intltool"
 DEPENDS_class-target += "gtk+ gtk+3 uim-native takao-fonts"
 
 RDEPENDS_uim = "libuim0 libedit"
-- 
2.3.5


