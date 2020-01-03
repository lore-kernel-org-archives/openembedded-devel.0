Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id BB2FD7F957
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:41 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id y8so18518364pll.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LZWUSdFcf1EZxM5n4QDuU/a43MyIxjfsRN9xV1I/po0=;
	b=GzbQbeeNiAOWFnCpWUUcSbAmldbtneD0i+Cm/dxYUQW38OYR9tfI3Qr0Skrtx/Lyp1
	jvM3mvFW/4a4M2gDE6x5ho/087Y+aMixJyBZVJvu/Y0AiqguBvv/3naa15QWIPPT3aoM
	FTk4W1nhsP+Po2gOgsJj59t1tLuXQ8zrtLjNIL2/tZMiwhfaQXyRLI6J0shx27dJ0S4T
	838eKcuYe8ZpyvKKdquTBQ2QT++3s1n/ptbAgwbFmBU0R+J8zgZ+eTm6kD8u4aE7oBO0
	tax7OPqMsL8NiIfugZIvuBkZexGVH+wD/MDF10aBc/fy8qCsYgmKCxivoER8Bpn4+By6
	Ow+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LZWUSdFcf1EZxM5n4QDuU/a43MyIxjfsRN9xV1I/po0=;
	b=envI0mFajWbe7JacRDqaDUpKlUWaf/nhm3SN2VCBKX8tbepeGul4r8tbYYr5YS+QiD
	cCr2/5gWwypmfuZPBjDNRhrpfNjuyXUWyxY8EUSVHg504OIy9g2wBS68Smg2C6wZuQjv
	z3HoWYe/ajDQHnvJeDLdXfqEriDsZPO5Wjw9pw7E1cMkyydgpPz8CjACVQsMV4lHmzh5
	vAVb7s47GV5w1LKqEDdiQTcRKVqQMhwiTrbEvxqVDgpwwpoVpGnjAiNwhb3fxA9Kq7Xt
	rZwP5ZaGudd5ztT1rMf1NTO990KRh5fDF84Oh+VbVoxtasZV+YoFWlTVWwRBUJKkXUNz
	ONog==
X-Gm-Message-State: APjAAAWeTyjmhJppzVTd86NvfqPToKBee3RHhR/2Ukj6cOQB2N3ZnC/l
	8mdbQDjZxJga6WV1awveN+M5nlctRZo=
X-Google-Smtp-Source: APXvYqzWbXVygnAkfY18h5FrMiGt5ylbISc7DQLNA49P27jEuqXqT3X3UziUAasiNXaTaUaP8L9mxA==
X-Received: by 2002:a17:902:b097:: with SMTP id
	p23mr89424341plr.45.1578019782737; 
	Thu, 02 Jan 2020 18:49:42 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:49:10 -0800
Message-Id: <c8e2d8af16e8859d933a7f63bd830e738bbf497c.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
Subject: [zeus 13/17] networkmanager: Upgrade 1.18.2 -> 1.18.4
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
X-List-Received-Date: Fri, 03 Jan 2020 02:49:41 -0000

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1db745db41e31c61448743842104d92a61e7ddfb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{networkmanager_1.18.2.bb => networkmanager_1.18.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.18.2.bb => networkmanager_1.18.4.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
index 0d6e1a0b0d2..085807c4ce9 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
@@ -31,8 +31,8 @@ SRC_URI_append_libc-musl = " \
     file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
     file://musl/0002-Fix-build-with-musl.patch \
 "
-SRC_URI[md5sum] = "ca1e6175c6ba97ca1adf65a67861ccd9"
-SRC_URI[sha256sum] = "4dd97ca974cd1f97990746527258f551f4257cbf011fecd01d10b7d74a6fa5c3"
+SRC_URI[md5sum] = "fc86588a3ae54e0d406b560a312d5a5d"
+SRC_URI[sha256sum] = "a3bd07f695b6d3529ec6adbd9a1d6385b967e9c8ae90946f51d8852b320fd05e"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.17.1


