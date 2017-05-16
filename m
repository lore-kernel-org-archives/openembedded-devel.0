Return-Path: <liu.ming50@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1049677D42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 11:23:24 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id u75so22105515qka.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 04:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zxe4r2SZZgdiufhQDoMu+ZrNJ87HygncRtPq1hYPUPg=;
	b=Pnqaxzje4VL7BRnwRFXG0BZjEcq9DCennNNyTKX0QS5/1mJ2lo8IwSXLEhiVJjo8ry
	3ckfNQdLdCme/Wimx1nIvefyPLfAfN6lgt5JBHW0iP11aqXhu0ezvwoo3Uq2RlrTvbJ5
	4lU43GPfKsZl/Ttlbxa5f3GqQS3MeUyYHY11CQl5fM7ljSOvovHfP3tRgcTONvb3Ec1/
	Q7nucXjjHWeZgKhYXKNE1hcO3E4B7HgDP2liXi1hOsjgaUy1kgAqaOih199foYIVuHaN
	EIrdtzxnOcVimDiEL1ZYWXMi/RgsbMVQV9kgDg0BViml6pyTlVhQUT7toV3a8bgFdKFh
	55QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zxe4r2SZZgdiufhQDoMu+ZrNJ87HygncRtPq1hYPUPg=;
	b=qre2OoN/LDU9ntzRWetF9yzgU1UhOW3dhhckjhOThu937Pt4tm6y/uzWdxROkRlrX7
	fwq5mTaa6VWSPkc4B/yGokfmSPbv9G0cFI/aN8iNYUeF0BWIb6KPDsSccYJs0LoqFanM
	fwfF8oW9Ykg8adD4MQ5hxxZ33L6VJOetUgB2hN5Sk5x6RIIF9hxppOFL0mFCM/iyl9Ko
	p+VEecFge0fwYz1cA4ZVxGSlJnsZMX4NEBrBEGapzsiBi3BEHG/qP1iBBGAYONLg5jMu
	3x7LA8GTeeIWf3M7YtY9uJqg3R19ASPltYJGufJGb2Ypprbh4piw2IkV2jwNiQQTFpYG
	HeNA==
X-Gm-Message-State: AODbwcAGRH436c9ZaVKW9e0JQOBtUljQiHjikIrM02Q6waUr2ZBN8LbL
	OrUvkuPY4+ud9w==
X-Received: by 10.80.154.65 with SMTP id o59mr8101627edb.181.1494933805769;
	Tue, 16 May 2017 04:23:25 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.199.218])
	by smtp.gmail.com with ESMTPSA id e11sm545539edd.68.2017.05.16.04.23.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 May 2017 04:23:25 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 May 2017 13:23:18 +0200
Message-Id: <1494933798-24865-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH V3] xerces-c: fix a wrong PACKAGECONFIG option
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
X-List-Received-Date: Tue, 16 May 2017 11:23:25 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

In xerces-c's configure, these options is being referred as follows:
......
    curl_flags="-I$with_curl/include"
    curl_libs="-L$with_curl/lib -lcurl"

    icu_flags="-I$with_icu/include"
    icu_libs="-L$with_icu/lib -licuuc -licudata"
......

so they shouldn't be set to ${STAGING_DIR}, use
${STAGING_DIR_TARGET}${prefix} instead.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
index b848b06..64ac747 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.4.bb
@@ -16,8 +16,8 @@ SRC_URI[sha256sum] = "9408f12c1628ecf80730bedbe8b2caad810edd01bb4c66f77b60c873e8
 inherit autotools
 
 PACKAGECONFIG ??= "curl icu"
-PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR},--with-curl=no,curl"
-PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR},--with-icu=no,icu"
+PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR_TARGET}${prefix},--with-curl=no,curl"
+PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR_TARGET}${prefix},--with-icu=no,icu"
 
 do_install_prepend () {
     sed -i -e 's:-L${STAGING_DIR}/lib:-L\$\{libdir\}:g' ${B}/xerces-c.pc
-- 
2.7.4


