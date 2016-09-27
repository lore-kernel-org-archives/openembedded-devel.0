Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id DE97360123
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 04:30:36 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 21so157223pfy.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 21:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=F7drXH3Mwq1GKwrSzVXh1Lvf8pykJZPn1e6M6VtAonM=;
	b=gzRQ/yHKoFNS7AKOh5PWyrGGVMXt0pHFnYgU2/cNxxnQnVdvk+URmk2ivyrzl+BL0d
	jrlXv520D8/EyGGL4XzphTVZrDjU1EY69SIPB7LsRCvMvFUfDZ5/WEXMpuez77aAi7jw
	vKGsqybEWHMSkxRYciFnZeoFxACpSMUvfc/sMYJbmJDtDT951iNCjaoFDOVoIElqyZbR
	nX5VDlvkCOCU/SWyrSAUMhJByK2a61W0O4x3K1nLFfOZAa7Ux7+SSgcALFzqKqHL0vcQ
	+/EgaQ80QYL6YNJLENRyh8CTixpTYJlisps8HZxWnxuynKlroxujVT9MZl8yqZ+Y5FQD
	RLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=F7drXH3Mwq1GKwrSzVXh1Lvf8pykJZPn1e6M6VtAonM=;
	b=ilLBxXOQMwh5+REd69YhUjaoroaewiGX6KLy+gqxyzKaE5eFhckDiBwROhxmR9MwnQ
	LdrB07X4Gh9/C5eF3WS10gh/Uxcrf6WVJfbWA6W/hobJeklRpbwLpcPFWxfURLCEnjNv
	Ozz2dUKXhtOe+0thOb5pSj+8crRQAgzIkuBiiETGaN7S7R+6p6cOh4QUP/+86Z0gIroc
	fyWLlD8Y/0DyFtBFp/zccfSFFamuPMLB+GencDPlkWny54KWVBso2CKONiQntrgQHDs/
	/Kg3idoTcfmnkWhe9PdgP2PTvS3XVRbEKC0BV12oIhNEzQ1QivQrN3P6cHxa5xKApGNy
	m/cA==
X-Gm-Message-State: AE9vXwMFkx46Ih0YG5/nOM4psQAxlkPeNjQNBMygx5lclSD1ibMHYtrG/diusT7x9QCwqg==
X-Received: by 10.98.204.85 with SMTP id a82mr43799788pfg.180.1474950637922;
	Mon, 26 Sep 2016 21:30:37 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	([2601:202:4001:9ea0:14c9:2492:f96a:525f])
	by smtp.gmail.com with ESMTPSA id
	b188sm534578pfa.82.2016.09.26.21.30.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Sep 2016 21:30:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Mon, 26 Sep 2016 21:30:36 -0700
Message-Id: <1474950636-9528-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] php: update 5.6.25
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
X-List-Received-Date: Tue, 27 Sep 2016 04:30:39 -0000

This update includes the following security fixes:
CVE-2016-7411 CVE-2016-7412 CVE-2016-7413
CVE-2016-7414 CVE-2016-7416 CVE-2016-7417
CVE-2016-7418

plus other bug fixes.
http://www.php.net/ChangeLog-5.php#5.6.26

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{php-5.6.25 => php-5.6.26}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch | 0
 meta-oe/recipes-devtools/php/{php_5.6.25.bb => php_5.6.26.bb}         | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php-5.6.25 => php-5.6.26}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
 rename meta-oe/recipes-devtools/php/{php_5.6.25.bb => php_5.6.26.bb} (51%)

diff --git a/meta-oe/recipes-devtools/php/php-5.6.25/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-5.6.26/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-5.6.25/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
rename to meta-oe/recipes-devtools/php/php-5.6.26/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
diff --git a/meta-oe/recipes-devtools/php/php_5.6.25.bb b/meta-oe/recipes-devtools/php/php_5.6.26.bb
similarity index 51%
rename from meta-oe/recipes-devtools/php/php_5.6.25.bb
rename to meta-oe/recipes-devtools/php/php_5.6.26.bb
index 8620ee1..cbd0615 100644
--- a/meta-oe/recipes-devtools/php/php_5.6.25.bb
+++ b/meta-oe/recipes-devtools/php/php_5.6.26.bb
@@ -3,5 +3,5 @@ require php.inc
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b602636d46a61c0ac0432bbf5c078fe4"
 
 SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
-SRC_URI[md5sum] = "f63b9956c25f1ae0433015a80b44224c"
-SRC_URI[sha256sum] = "58ce6032aced7f3e42ced492bd9820e5b3f2a3cd3ef71429aa92fd7b3eb18dde"
+SRC_URI[md5sum] = "cb424b705cfb715fc04f499f8a8cf52e"
+SRC_URI[sha256sum] = "d47aab8083a4284b905777e1b45dd7735adc53be827b29f896684750ac8b6236"
-- 
2.7.4


