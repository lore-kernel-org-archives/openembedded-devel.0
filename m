Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id E43B57F4BF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:31:54 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id m3so5264696pgv.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Cw48HHedrSSkg7R4t77FO1i9bKE1TigXKX3lkAvyfUA=;
	b=BkvxzhfvtnoFBQg4tJ/rbduzo57hInE4DlSufbyMQErtTvlUFHrRXdpGSf5C+lfj+1
	rsFECniMCg7hO27x2jnKQ7Dao1ns1K+3GibjvK+kqAzV7J1EV9bUUysUVxKlZafAy7JN
	mRa2X8tYiJzWJdh6HVcxPxV/0TDDRZhvNvkurQbPEgJ7vwGzZMkCBJkZ6IGSzSjXOdXl
	2ouM1fXF6Sp1AQLxVhzxOK/EXhkN3d2XwdWptzQHTnJUUoXmFYWpwppK3/iClNF9jLm1
	v/qGxHEX95cwxSje3novJmV5dtlMdX19M0r3uLEJQG0X6h0gE4iSKixagtEi3jkO5g5L
	TUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Cw48HHedrSSkg7R4t77FO1i9bKE1TigXKX3lkAvyfUA=;
	b=jpSyMG4lQIqk1qIfz10TRpCF7BldpIgFXRpLBzsPQm6opnqQw+k8iVOahmRkRbSlT9
	+zuVg3TDkPiV7c2rU60EirSlTTgDfnde1MrJl0ehCyG2h7x35ARPa3RP/0KGIX2sn7v9
	0m+UbrBiOwjt+gkQGO/5U80J2wNoblwymAso4Yc4ee0DoAYdTVPA55bvuLaSkj+xy6iN
	RqzS4VkENP7VM6nf1Y/uiKZC9SoITttprp+lNR8eWqyv5FJSnFy4gYJCaMUzlznVP70n
	LeHW1q+4Skarechyv9GwDrJ2awD5toKdP0Jyvf88Ku+8u2CXIZwvs9C+d774gOJEOWx7
	AYzQ==
X-Gm-Message-State: APjAAAVh3rIkYJIf0lAT7uaJjS921EorxVWkCXsO6l5AqTb1lwursJMK
	tBIbCiNmxU55yt5QlAZLiHCmJIvq
X-Google-Smtp-Source: APXvYqyfTfcBnYdEpYQkmdgp4AgLSlVgYjK6BLa/iwlKsoZ+MzYMWPW6p/xGe2Rlwszh3SKnewk9Ag==
X-Received: by 2002:a63:2f44:: with SMTP id v65mr1118637pgv.380.1567287115902; 
	Sat, 31 Aug 2019 14:31:55 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.31.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:31:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:30 -0700
Message-Id: <b76e61f4288d057b06013526d5690a678b34efd2.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 09/23] exfat-utils: moved to github
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
X-List-Received-Date: Sat, 31 Aug 2019 21:31:55 -0000

From: Luca Ceresoli <luca@lucaceresoli.net>

exfat-utils has been moved long ago to github. Update HOMEPAGE.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb b/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb
index 440f336..f423a24 100644
--- a/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb
+++ b/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb
@@ -7,7 +7,7 @@ contains \
  - exfatlabel to label a exFAT filesystem \
  - mkexfatfs / mkfs.exfat to create a exFAT filesystem. \
 "
-HOMEPAGE = "http://code.google.com/p/exfat/"
+HOMEPAGE = "https://github.com/relan/exfat"
 SECTION = "universe/otherosfs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.7.4


