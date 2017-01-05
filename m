Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 62CB071984
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 17:11:40 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l2so72337013wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2017 09:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S6EZ2Caq1Juzh1wapOxzN1FrrKCgdCT3HuuLHWeO/3Q=;
	b=b35MgUsuxYttYdH9EGA/phIzJPHd2RlcvPNQDIc2yMzLjgj/B2HoRpxblBonsGRe0l
	HZzlo324LzEYfkuB/qjyIETbV/IARMwpyqvs3f6xsoOYJPBO94/O5+HlGxLp7v9yK/L+
	Rr8agyKBf0Y/n4yesdCeT1vUzFxtgY4azQFBGLTXCQGqEOGaKkHUEKLGN6ylTtkyovVc
	j7LtuOU9mCphy5S8xCIZc08ry41Lh4Slv613dJqj4xmJRVDG5Rmvd25mKJHLHvKvKEcW
	gdyli3ER7W3SSWz+D+svlXO6lJ2VfJbqJQ2DgYGl2aXa1DJMK3JijO1QnqQQIufC+/LS
	It0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S6EZ2Caq1Juzh1wapOxzN1FrrKCgdCT3HuuLHWeO/3Q=;
	b=entmwRzme1+11eZINrq+0dUICs0LWz7cjSoBjK72AfFfQS/4UpFz+JpVNQAabBLDmV
	Qfg/mD+5oPfzOIrABk9aoD+yCcoq8cdINAGXDZfIWVqNQi7z2nPdYeVK6p5JjTCC/Fn2
	TX+cC4h7lAmlPqgrqeoWkseaz2wkzfRX8eFvcPH54vJw8Oab+DLuTwrDjUqXW99gKkTu
	22VhMg09ahP+dmizCiC4/yMGII20bunTfbXWhkg4htGxym7gDYVrBDXWuQa9WqVSJwxI
	w5b1xF2M0wy3UPFcKr7Iqx+4yWB6k050hEZttMkcMKZzOpXA9VTJoESHvKxxpgAr6lVx
	k6WQ==
X-Gm-Message-State: AIkVDXKNYz7I5tdAJZT3utwOkWNVTRS3AXxx01lq21T78CEi2oGaayW5yrJfhC0neI7OJw==
X-Received: by 10.28.148.6 with SMTP id w6mr64518877wmd.43.1483636300823;
	Thu, 05 Jan 2017 09:11:40 -0800 (PST)
Received: from localhost.localdomain (p579F79CC.dip0.t-ipconnect.de.
	[87.159.121.204]) by smtp.googlemail.com with ESMTPSA id
	81sm101153107wmw.7.2017.01.05.09.11.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jan 2017 09:11:40 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2017 18:11:17 +0100
Message-Id: <1483636284-6351-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/8] mm-common: update 0.9.8 -> 0.9.10
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
X-List-Received-Date: Thu, 05 Jan 2017 17:11:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../mm-common/{mm-common_0.9.8.bb => mm-common_0.9.10.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/mm-common/{mm-common_0.9.8.bb => mm-common_0.9.10.bb} (51%)

diff --git a/meta-oe/recipes-core/mm-common/mm-common_0.9.8.bb b/meta-oe/recipes-core/mm-common/mm-common_0.9.10.bb
similarity index 51%
rename from meta-oe/recipes-core/mm-common/mm-common_0.9.8.bb
rename to meta-oe/recipes-core/mm-common/mm-common_0.9.10.bb
index 943343b..899eb8a 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_0.9.8.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_0.9.10.bb
@@ -2,8 +2,8 @@ inherit gnomebase
 
 GNOME_COMPRESS_TYPE="xz"
 
-SRC_URI[archive.md5sum] = "00fd5c6850cd5fecc2e02b04d0dd1637"
-SRC_URI[archive.sha256sum] = "c9ab5fd3872fbe245fbc35347acf4a95063111f81d54c43df3af662dad0a03d5"
+SRC_URI[archive.md5sum] = "49dc47af8c89ce5b3c768306b9a0f922"
+SRC_URI[archive.sha256sum] = "16c0e2bc196b67fbc145edaecb5dbe5818386504fe5703de27002d77140fa217"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-- 
2.5.5


