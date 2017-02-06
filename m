Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 71B7F60043
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Feb 2017 04:49:14 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id 204so24805183pge.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Feb 2017 20:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=QLgd+S2IPzF5/1v4FzkHfJQ+KjGKCKKZukonPismaMI=;
	b=pvYfRkjuO/TDBrT+shU1y52AE7OUir5bVFOthQt0xfmikKQ/6+qB9U93VUyKDQjFI/
	Vx7vF6AJwjsNlutuzI5xKI7cyqOIfuJVgpGfUZ/FgHu1h+qPQ6vg0f43fHpmr9fiPvP5
	3hzvch2A0qyGvBPYn2h7CJjjmaMFu9LFqLWRFzo87L/f4570jJWII1gKX88E7lnQucTv
	c0WILo2h9qxCclk4Z1/JQ2NoNOQP6SZ+ca94cAfzmv1iQLMAvPJTDDnCnTxtgwknqnb3
	xhnrKVv36kOHi+yyKQWtXdiNagWmNwnjV1zAAy3m6ty5pVYaB03S3bXit3Lc5OhtqjmC
	lPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QLgd+S2IPzF5/1v4FzkHfJQ+KjGKCKKZukonPismaMI=;
	b=GQENb7B5Fo97djoarVB7bC6qdvv70ayjUrS/yAJRLJq/J2mVhxts2fj04JzOM+/20Z
	E0/ifS10m8qDb5jNpiANB1dOVoTwqM3zdH5B8Ag237UxhDzeePjCugezc+w5es4D8eRH
	JuuZv5W0O/M36QqW05gFtJLt/bRlJSuQrMLtsjruVqRBcSJO3iQaHrCSHeJKZ3YW0Rqh
	JLq0vMnT/lZBAETD7AigAyr3Zk+U2yNYP2bqPa7qC/Q4ln+9ur6kSoGK9NlXCzLKTEhl
	Th9hlHwXwmy5UBI+ysLavhwpctbZO1GPMwQlc64cMBoazN5wHWnvgw2nGPUMZPpcvZOF
	FUYw==
X-Gm-Message-State: AIkVDXLs5wylU2KOzzusyofjnRyOlK/6xbv8oc6QnEo+0U7+iFtFc2UhOUxV1uUS5zM5hA==
X-Received: by 10.84.229.143 with SMTP id c15mr14705618plk.177.1486356554546; 
	Sun, 05 Feb 2017 20:49:14 -0800 (PST)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:ac48:9a90:c71a:12ad])
	by smtp.gmail.com with ESMTPSA id
	t133sm85392137pgc.24.2017.02.05.20.49.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Feb 2017 20:49:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Feb 2017 20:49:12 -0800
Message-Id: <1486356552-12363-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] ipmiutil: fix build issue
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
X-List-Received-Date: Mon, 06 Feb 2017 04:49:14 -0000

| In file included from lanplus.c:78:0:
| ./inc/ipmitool/ipmi.h:51:25: fatal error: openssl/evp.h: No such file or directory
|  #include <openssl/evp.h>
|                          ^
| compilation terminated.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb b/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
index bdb3d47..8d36a32 100644
--- a/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
+++ b/meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb
@@ -15,6 +15,8 @@ HOMEPAGE = "http://ipmiutil.sourceforge.net"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f9372493401f309e6149dd2ce0a044b"
 
+DEPENDS = "openssl"
+
 PARALLEL_MAKE = ""
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ipmiutil/ipmiutil-${PV}.tar.gz \
-- 
2.7.4


