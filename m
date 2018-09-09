Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id F341379550
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Sep 2018 23:01:16 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id l5so15138242edw.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 16:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=J1+6oYwZSU7ZtkwhkdaJBd7Hw6l/TMT5ZIlWrSS7b4k=;
	b=ZA9+ZIZ0w7drlZKRrUl0Rl2Zdwk9nldNOlWvmtyxbCLx5Fcgw1CNUf1O2heVUiKnMt
	SPGCB+TUMbdp5ILEvlg1eAix77TB8f2dmYbJvAWAqm9l6YrePlJVtWHSFYsah7pp3kv/
	J6noa19SCPEyJRgTbsQOHSd0CQikcYF9YDsWdb7L+wBCvygZIAq0dwm46Xtl3uE1UZmI
	SdiiLG44eAzKJw9byeDRGHR2R3ypEtrjYUwQmyoXA06ns7NxhHxAcNICZXsDBCeLGoR5
	aT6uzU/x+evSlQJpUjTMH0lXC7SA1dESeiCmcDf9FJmR+bmWSTC9yEdWFrchc4y/66FQ
	Dpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=J1+6oYwZSU7ZtkwhkdaJBd7Hw6l/TMT5ZIlWrSS7b4k=;
	b=Q3PihR8MXIvZFcylmLg68AO5pCz98htRUFh/TYJ/fZdH5Tf3nO1birKAwdpfxO8lYq
	ttd7U3BKfJrhxJYmNoLJjyIsMwjIT2vkE4BqQbzZ6XHzkr+006VVflttZil3+xCk1ixN
	ACQ5iO7zmrft0XanURMmYfDArSxVaWmyiCe6PgZNSMgcayDgbwqgjE6flHRHWRDqHf4r
	lHIbZiWFlcnfEfllghWuMuGKw8/w0Pcm0OcHLDs7KfWPzczMwcpz2MDnJ3GMtwXLiqDI
	uViK9XVrHc8Gt1IjYpUSjIEc2MUv9SlBtdtunj1u3Lj+wGTMRe3Y3Yt8ihGz+0H0pgeD
	4kqA==
X-Gm-Message-State: APzg51CZDfgUvpiht7qUkoPbaPsv2wTAn+y+OJeBJkQ26mDn5H1qD/dY
	Xd3o7m8XzD6Oxoh3NBs5pKAUcV/1dYQ=
X-Google-Smtp-Source: ANB0Vdb+2vJaLs6b/0tR7rrx/FyYnh5uku3B+jls2xglV/3uFGwsRjVMk1r98Bh1aZMPhCt4Bd3OYQ==
X-Received: by 2002:a50:b5a5:: with SMTP id
	a34-v6mr16010951ede.88.1536534077261; 
	Sun, 09 Sep 2018 16:01:17 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ae08:1403:ff00:b821:e49c:2197:f50])
	by smtp.gmail.com with ESMTPSA id
	j10-v6sm8252229ede.5.2018.09.09.16.01.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Sep 2018 16:01:16 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
X-Google-Original-From: Oleksandr Kravchuk <dev@sashko.rv.ua>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Sep 2018 01:00:43 +0200
Message-Id: <20180909230043.25831-1-dev@sashko.rv.ua>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <dev@sashko.rv.ua>
Subject: [meta-oe][PATCH] nano: upgrade to 3.0
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
X-List-Received-Date: Sun, 09 Sep 2018 23:01:17 -0000

Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
---
 meta-oe/recipes-support/nano/nano_2.9.8.bb             | 4 ----
 meta-oe/recipes-support/nano/{nano.inc => nano_3.0.bb} | 5 ++++-
 2 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 meta-oe/recipes-support/nano/nano_2.9.8.bb
 rename meta-oe/recipes-support/nano/{nano.inc => nano_3.0.bb} (72%)

diff --git a/meta-oe/recipes-support/nano/nano_2.9.8.bb b/meta-oe/recipes-support/nano/nano_2.9.8.bb
deleted file mode 100644
index aa6e9ff16..000000000
--- a/meta-oe/recipes-support/nano/nano_2.9.8.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-include nano.inc
-
-SRC_URI[md5sum] = "31714360342f9baa344e2fa574c144db"
-SRC_URI[sha256sum] = "c2deac31ba4d3fd27a42fafcc47ccf499296cc69a422bbecab63f2933ea85488"
diff --git a/meta-oe/recipes-support/nano/nano.inc b/meta-oe/recipes-support/nano/nano_3.0.bb
similarity index 72%
rename from meta-oe/recipes-support/nano/nano.inc
rename to meta-oe/recipes-support/nano/nano_3.0.bb
index 22f0fb2a0..43ab9343b 100644
--- a/meta-oe/recipes-support/nano/nano.inc
+++ b/meta-oe/recipes-support/nano/nano_3.0.bb
@@ -8,10 +8,13 @@ SECTION = "console/utils"
 DEPENDS = "ncurses file"
 RDEPENDS_${PN} = "ncurses-terminfo"
 
-PV_MAJOR = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
+PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
 
+SRC_URI[md5sum] = "74196427a09ec2f82a88facd220d2787"
+SRC_URI[sha256sum] = "e0a5bca354514e64762c987c200a8758b05e7bcced3b00b3e48ea0a2d383c8a0"
+
 inherit autotools gettext pkgconfig
 
 PACKAGECONFIG[tiny] = "--enable-tiny,"
-- 
2.17.1


