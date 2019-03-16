Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id A31D47C6FD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 02:13:43 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id r124so7656301pgr.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 19:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7Usc6Q6BizB8uCqrnI4DWVIevTuUd1IaokAnxY1knPE=;
	b=MZEedL/Snoznsrk7tbchQgAFc25+86UebKitqimGJ6GSaShBPkkT5VePxPpZLmzKzA
	2vpBpXrfPRAZM3aoP6o+g8a2mB9QZIEsZHokdoBzeAcK1Guu0HTaffhfYvfZuw+obVh3
	3103lnWhV2fx58ig1AIHk1K+0kWpL2SyFAx82Vwj5v6UhA37AtCoFYqev7idR1zBYbGk
	yv8de48KedJjW8tpDeGWYWeqnKbS98JkfZhrEouIlrvWfe1FlvUNuhru3jFcGOMl04cS
	LOSQl80YmvU8w1Yoq9Ms5dUMKB6tr10AdbfP/k/BbjddyjcIrV2Jl6QQHvs+Yot02h8T
	YhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7Usc6Q6BizB8uCqrnI4DWVIevTuUd1IaokAnxY1knPE=;
	b=RQA2s3c6Bg569wBEsvnQnVFZC1nktV4kJO+5br9RUZy/TtPcPWBIZawyDur2sZkEKH
	dA5MF4kRtjRjCzDeT6vq+Phhg99pbXvOLGxrSNaz5IiF5q8i7geVgpY+XzNd85QLW7fN
	+xmpiK+wvBci+gFGdV+02DBkPbsTSg7QAbsFKPGZ4Q6cuOtyvTFxTgAMCWSpPHMPzN5b
	5eyNPDhu5zKKFUvyqTvAb1T7G18w3ym3uOGQJt+JTgeAjMMxSWaMdJ87nueGLoEpmTuz
	O3t+ksZjMAZspevtVXtqeF56cQpkrf8OZsrBNi2NEw8PqMhqrdju9VpVMsmc/Y3mRumJ
	xOkQ==
X-Gm-Message-State: APjAAAVUXidCH7FJpqlkgWov+Kv2bWpTlwiMr5+ntb1OJah+F0ndtOMa
	GX60rhHgiLhYt4hWYuOEgErPi9yk
X-Google-Smtp-Source: APXvYqzTyGlX7l7canmznNV+xa7iIDK0P9O2BFTCVZhyIrpQ3//uW6ySWd7tnpLGXFRQtXRnVhIxZA==
X-Received: by 2002:a17:902:9b98:: with SMTP id
	y24mr7521414plp.167.1552702424308; 
	Fri, 15 Mar 2019 19:13:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b8f7])
	by smtp.gmail.com with ESMTPSA id
	h64sm6180724pfj.40.2019.03.15.19.13.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 19:13:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Mar 2019 19:13:37 -0700
Message-Id: <20190316021337.4724-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] live555: Upgrade to 20190306 release
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
X-List-Received-Date: Sat, 16 Mar 2019 02:13:43 -0000
Content-Transfer-Encoding: 8bit

location of SRC_URI has changed as main site is offline

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/live555/live555.inc                | 2 +-
 .../live555/{live555_20190227.bb => live555_20190306.bb}      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-multimedia/live555/{live555_20190227.bb => live555_20190306.bb} (58%)

diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
index 14ea664422..4fe744c1ab 100644
--- a/meta-oe/recipes-multimedia/live555/live555.inc
+++ b/meta-oe/recipes-multimedia/live555/live555.inc
@@ -8,7 +8,7 @@ LICENSE = "LGPLv3"
 SECTION = "devel"
 
 URLV = "${@d.getVar('PV')[0:4]}.${@d.getVar('PV')[4:6]}.${@d.getVar('PV')[6:8]}"
-SRC_URI = "http://www.live555.com/liveMedia/public/live.${URLV}.tar.gz \
+SRC_URI = "http://www.live555.com/live.${URLV}.tar.gz \
            file://config.linux-cross"
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
 MIRRORS += "http://www.live555.com/liveMedia/public/ http://distcache.FreeBSD.org/ports-distfiles/ \n"
diff --git a/meta-oe/recipes-multimedia/live555/live555_20190227.bb b/meta-oe/recipes-multimedia/live555/live555_20190306.bb
similarity index 58%
rename from meta-oe/recipes-multimedia/live555/live555_20190227.bb
rename to meta-oe/recipes-multimedia/live555/live555_20190306.bb
index 36798fd978..fa6057dc2b 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20190227.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20190306.bb
@@ -3,6 +3,6 @@ require live555.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                    "
+SRC_URI[md5sum] = "a84ca3946d899f5592c7d31012ed2fe3"
+SRC_URI[sha256sum] = "0bd0c26d980425d9a419d835193e292a08a968f175da1902da4b495f126d5abd"
 
-SRC_URI[md5sum] = "71e096f7b3055a141fb902d7ea45ef61"
-SRC_URI[sha256sum] = "7653c44ac1c8255dd34d9151a92db8ef4af224e8b980e4af2f8937b3a30d38af"
-- 
2.21.0


