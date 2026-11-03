Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4249.1793738637896750307
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 12:43:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=R2nTp/VC;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so109717c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 12:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738637; x=1794343437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+HLN8dgQEq7wnKeNhSBp/XEaxPG4LZowiBwTJEzuEIY=;
        b=R2nTp/VCwZtE4UI+w9zXvC2A11lK11w/wfRuC9uCg5nyG372GsA4j4jz/q6SAGmHY7
         AsI656z8NQM/k7+HHxPmRhbtZYk0rBtbpPQMUWqS9X1efBnx/x0VDVJSGVi5p61w6f6d
         Gh509yAdJIAsVdwHDHvNWYBvsVxEUvC3RzZHDV2E7B9qxZuCyhJOrRixdkZZJ4WhFJuI
         ooY3nF5uT6Jl/EmTf/8txKG8nJi3xDmyuDtN8K6/8hXPKCMAClgq3NPaJxWnlmpDYVV3
         s4AJE4Dxafbx9GtOtH627VPf3meB3ZecryPtpNZ83TPgP36Kj79LmMt4IbV5X66vBuWX
         PrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738637; x=1794343437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HLN8dgQEq7wnKeNhSBp/XEaxPG4LZowiBwTJEzuEIY=;
        b=OGYTlFYOscGq+1KCOV9abV7EN/CN6nnrCz21Xx4TfRX9Q8yJOKc1h9Q+08OCsGpINV
         QEkNSEwszmVrJ0IIv3KcZs/ri9Y+uJdVSXSe54rgrQb/woQiOsxpmivybbVe21TaTdYZ
         jINg4cOpVJ3B6gnCAzcuaFeGOx9qHYBj7TRCjoDCO9DqV0OjNPtaOhFxBOwnB2icO8uM
         sf8JcHa3KnEzof2DyHwu8lfcbcvyFRVQp8z+5v5U1j7/xcrBaV4TY5mkBrXJDSkKX8J2
         qgitgHXQkDZL4nMsKn27VgbwVn5jNkhq68F3r6lsgElC/o8VSO1a7i9EJiAhrglNT1Kg
         rY9w==
X-Gm-Message-State: APuU4Z/v1/4/3L1FNQbsou1JnhavrV6PBwRH1PK18zNu+TzmUcxClBUn
	d7XW243N5GTwNd54s+lHvbL3NVbQOICZ2noB1ze6qF1M+Maa//FaVcs6BrvxUg==
X-Gm-Gg: AYBFou18WdHAQN0BQtUbcix1YCc4imFu/MNJMZsDO+uZN/562whaqdGHavd2PIv/RmP
	K+YVVzqJRx8JEnqeM7uqULgV0CAjJtZ9zto0IpPssYbovyIHDZLHSahl8YTA2CHtmYIffDsFZSq
	qhh/uyo6Bnz+rMMouj2I+/DPUIcgmdnKDjDm+PDc5BODXEvGav8QarP7hzPfYUb0rHjHOItuBc2
	oCkYYQiboeylZyGO5APVcSUlS5F/svhkjr1XkoHtVZZDe1yeL2nMRvXW6FVW1enuJ66DC9i93SS
	RNRgmCkTIVa+RzaVEhBZIVyA4rHD51ZJ6uinLVZajrhlm2i11zhBdMquKS3H31m9/z6TWQyWZ9o
	DbN/RP5w6MD+8HLoB+JcEH8pDyOSVe84VhHazY/f0JO9RlkxpNOucbCCJy1iVGVs9GtgkMgns7b
	0WtuIzJ79fobcXi1VkY/oxFpbNYuEnDp9QDukWWSxTq9SG4ZgNNACrSGNNgN8jt/70b1BwNciat
	DJotmn5DTR0xV7eb157tx1KOLstS5+iFN/kxKH2jlUD1UuVebLa7ZoCgk55DDQDmowUKZdGD3Zh
	ffT/3JYzLiB4tWHskskbwqwXJ4crUSfKmuylrhajpD6I2dL9BLXFO9R+LPg2m0k0
X-Received: by 2002:a05:7022:b042:10b0:19e:1ad9:1c2 with SMTP id a92af1059eb24-1ac5c92da1amr20901148c88.38.1793738636950;
        Tue, 03 Nov 2026 12:43:56 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm1544834c88.21.2026.11.03.12.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:43:56 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][master-v1][PATCH 1/5] uriparser: upgrade 1.0.2 -> 1.0.3
Date: Wed,  4 Nov 2026 09:43:46 +1300
Message-ID: <20261103204350.1092741-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 20:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131819
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/uriparser/uriparser/blob/uriparser-1.0.3/ChangeLog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../uriparser/{uriparser_1.0.2.bb => uriparser_1.0.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_1.0.2.bb => uriparser_1.0.3.bb} (91%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb b/meta-oe/recipes-support/uriparser/uriparser_1.0.3.bb
similarity index 91%
rename from meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
rename to meta-oe/recipes-support/uriparser/uriparser_1.0.3.bb
index 161073103d..1ef8b15553 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_1.0.2.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_1.0.3.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://src/COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168 \
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "963554c32d40fb6cba5644f1ba63e6dd7a182b2948bd71ee448c532f53b07f1e"
+SRC_URI[sha256sum] = "b5014a630e61e085787f760c83675a35ef8e719972b05e8f61ff2f48692b15dc"
 
 inherit cmake github-releases ptest
 
