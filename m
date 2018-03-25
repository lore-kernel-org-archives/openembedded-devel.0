Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id CA1667863A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:33 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o8so16219566wra.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=DPuutX+ucdS3VleXQX8PzOkPnQ8WD09Rlose1eLsyZk=;
	b=btaZf6mSlSSS4rPBtw2bCeBDgjGuMRruGKxXIiEYijCX3vgSzjVzfZn7dfVbAa19/j
	G605+9KdkJqTpvs6BRWRn/EcSignl7XzQe+mbEOwyMSgM/l/DbFeWWhVcy3h5WqXsRtY
	7noc3hZd/YB9XkebBEKP/nCe1BxXJzsZ+RNkC3rPB1qBG71wab8S/v5hMbgwBbNHlms0
	brMG9SJd8FYFwKjFRda+m/XljdDUYg0KHV04AyNjlT7TN19DKzrKVQw4q6jIcO7WFUYP
	xGzQi4i43ZvwU6no1I9UYCVMBKxW8NFwE1cF6u4CHLd6Pu/BuUzuEx89btlUFp84liIv
	12Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DPuutX+ucdS3VleXQX8PzOkPnQ8WD09Rlose1eLsyZk=;
	b=AFOoeu1dk2ThxkAQqp+e5QhznwNj+B/Y4cDc8fbxTzpy9gQQ3Z+/3UkEuDuvCUFdXI
	yJ3mLLz0pPUpOylFFTbK0vYQ4WhbB2+HaVDBN1xzX8NB8TGWWE23gk0inGOHefuX8Ocn
	qQP3fp0RmGODD4fzmHAhFMaeMXtrLwO6By0b24EiJtTt80bW59UBhyujnozSPwkWFp1P
	iHOp44HRY2dsbbOwN5wt31HsKLLDndSdmtqP799cw5ZsvG9nxz19sEQ8Ttxu0jK0kIWe
	mxePwI8Q+7f6dR3yw4M5wbsi9YQhSeCU6pxTRp/SP4GsEeHqVwXGg87iHIboquCyCxar
	iB7A==
X-Gm-Message-State: AElRT7EgbLSLgkzyc7n4DXacMn2PLCmVnHFfP8kqnd4+WgdQWwaREfqD
	UpRIfvu2nkJAVHjglUvMZEysNA==
X-Google-Smtp-Source: AG47ELvpSg3n4HM3uUIB7R3jbgNQ4DHk5CkjshfolbE4rA+qYaC+n4GiZ5/HEOQJT1wxFwP+3ewLOQ==
X-Received: by 10.223.199.10 with SMTP id k10mr27220653wrg.186.1521981334289; 
	Sun, 25 Mar 2018 05:35:34 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:02 +0200
Message-Id: <20180325123520.16452-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/20] gtkmm: minor cleanup
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it is enough to inherit gnomebase and distro_features_check
* GNOME_COMPRESS_TYPE = "xz" is default for very long time

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb b/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
index 195bb2183..b780d09bc 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
@@ -8,12 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 
 DEPENDS = "atkmm pangomm glibmm gtk+ cairomm"
 
-inherit gnome autotools pkgconfig distro_features_check
+inherit gnomebase distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-GNOME_COMPRESS_TYPE = "xz"
-
 SRC_URI[archive.md5sum] = "6c59ae8bbff48fad9132f23af347acf1"
 SRC_URI[archive.sha256sum] = "0680a53b7bf90b4e4bf444d1d89e6df41c777e0bacc96e9c09fc4dd2f5fe6b72"
 
-- 
2.14.3


