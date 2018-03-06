Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id EFD1471B69
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 13:38:42 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id z14so24539713qti.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 05:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ThBpvp7ZHfkBs3YhzqOcCzDFUHM7zxFz9B/xonfJXaw=;
	b=G4i2VO1fqwiY7lPxoc9NsW7gDfp/4aRUd99YZSp02wjBtmDxZuo+7QrK3qIexdkagV
	kVDEDqlnIFFyPVJYMDBbiV+Nh2hmh5QBTpUeHI2RM5B+rmgDMcN/vz+NOTtizqyCH/dv
	/E5v1h4bIM7WQWpFa0zgqkDtmPZEF2IiR/RYLr+zkMNxHb15+hUeoylz8LUJJOd6SY26
	FcAR9EYWsufjzS2QV/j7tYfEKnBuk9T8GVU9DeyHAUr6jW1Zt8t3/xnAms+lBIkdXtaC
	N3EjmrqO88QV5dg8mCDanubFhT2HRK7EZbRW0JnOmCrGo4hCkBZs5c8SNpaGFMPS55T9
	Nezw==
X-Gm-Message-State: AElRT7Grq2Dm2YAaHvklA1HUBY6B6GZ5sg+F/ox2DEu8kPiYx89LO5g+
	L8lVNf4XDSq2Rc4FBG0QlBis3B2y
X-Google-Smtp-Source: AG47ELslcBQRANO9AQ4eEeFY0kRMMV3kj5+tNH5cGeIWru92Yd3Y4RsHj/oAIk37AUTTAKiks2aYJA==
X-Received: by 10.200.66.129 with SMTP id o1mr29691718qtl.12.1520343523711;
	Tue, 06 Mar 2018 05:38:43 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	b18sm8895251qkg.90.2018.03.06.05.38.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 05:38:42 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 08:38:35 -0500
Message-Id: <1520343515-30712-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] zsh: update to version 5.4.2
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
X-List-Received-Date: Tue, 06 Mar 2018 13:38:44 -0000

License-Update: Update the license checksum for copyright year and verify the terms remain the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-shells/zsh/{zsh_5.3.1.bb => zsh_5.4.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-shells/zsh/{zsh_5.3.1.bb => zsh_5.4.2.bb} (89%)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.3.1.bb b/meta-oe/recipes-shells/zsh/zsh_5.4.2.bb
similarity index 89%
rename from meta-oe/recipes-shells/zsh/zsh_5.3.1.bb
rename to meta-oe/recipes-shells/zsh/zsh_5.4.2.bb
index 96d21a8..100c449 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.3.1.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.4.2.bb
@@ -6,13 +6,13 @@ HOMEPAGE = "http://www.zsh.org"
 SECTION = "base/shell"
 
 LICENSE = "zsh"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=b7bc853894664be455a922db9805288e"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=1a4c4cda3e8096d2fd483ff2f4514fec"
 
 DEPENDS = "ncurses bison-native libcap libpcre gdbm groff-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
-SRC_URI[md5sum] = "d583fbca0c2410bf9542ce8a651c26ca"
-SRC_URI[sha256sum] = "3d94a590ff3c562ecf387da78ac356d6bea79b050a9ef81e3ecb9f8ee513040e"
+SRC_URI[md5sum] = "dfe156fd69b0d8d1745ecf6d6e02e047"
+SRC_URI[sha256sum] = "957bcdb2c57f64c02f673693ea5a7518ef24b6557aeb3a4ce222cefa6d74acc9"
 
 inherit autotools gettext update-alternatives
 
-- 
2.7.4


