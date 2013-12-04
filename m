Return-Path: <joe@deserted.net>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 12ECD6D83F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 21:21:09 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id f15so11038473eak.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 13:21:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xTHS86TKhY9cq6eK7f6JkD+qR51pXKpi+jx/oNJBC0A=;
	b=BFnpDhxuunI3WihqH0ZJHeIn7N97B/6MYH7N8lwk8uQ+bxXyGwbG+D2FaT+VRKIQi+
	OeP22JiBLbonpGq5kLntaLk7xJlxICs+WR0Nfx2i7snF8fn+Tt4wQOCkeR9GJ/PhGy07
	gFtLuLtxXrzo2dgebP1ukT6ihiX74K42T02hiwU8IDMp384y+mE8lumrUeEPncrNc3xd
	wO3zkhJpM2J1G9pQUJKGn0oTOjT17nBszF7TkMyB40K2UEXZphlUg/ttjd8QeNO4YpYN
	9UStHi9GgT5kY5DrG9L5oIdYKXkqCd1pJANDpWRUiRjJQJmKCf5R0j65sm/eNn6Box1r
	6JcQ==
X-Gm-Message-State: ALoCoQmvnaUshHmXf2DlNxU4QXKWEGngpsWBW/XdNJQDa7V65e6tKOdjG59fSs/5ygBEnnPlRYPp
X-Received: by 10.15.86.75 with SMTP id h51mr12967298eez.44.1386192068762;
	Wed, 04 Dec 2013 13:21:08 -0800 (PST)
Received: from burninator.local ([128.224.252.2])
	by mx.google.com with ESMTPSA id o1sm55149238eea.10.2013.12.04.13.21.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 13:21:07 -0800 (PST)
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Dec 2013 16:21:04 -0500
Message-Id: <1386192064-9155-1-git-send-email-joe@deserted.net>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-networking][PATCH] inetutils: correct QA issue (unrecognized configure option)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Dec 2013 21:21:11 -0000

WARNING: QA Issue: inetutils: configure was passed unrecognised options: --with-path-login --with-path-procnet-dev

Neither of these appear to be valid for inetutils-1.9.1, so remove them.

Signed-off-by: Joe MacDonald <joe@deserted.net>
---
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
index edff60a..d12ad39 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
@@ -35,9 +35,7 @@ PACKAGECONFIG[ftp] = "--enable-ftp,--disable-ftp,readline"
 PACKAGECONFIG[uucpd] = "--enable-uucpd,--disable-uucpd,readline"
 
 EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
-        --with-path-procnet-dev=/proc/net/dev \
         ${noipv6} \
-        --with-path-login=/bin/login \
         --with-libreadline-prefix=${STAGING_DIR_HOST}${prefix} \
 "
 
-- 
1.7.10.4


