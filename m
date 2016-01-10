Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id AEFDE762AF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 01:00:06 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id n128so2219464pfn.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 17:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=1vXontq5h6/u4aLHo3Tb21ogv73S/YWUQdqcDfP2yQo=;
	b=FbNgqG7ujbwC685QHyu41250naNcGNppGZCRaqBbxhWHrSgLN4Vw5RjVx8H/3r2ux/
	ifupUOaZn2FUHj9bYwK7Jxisyqvc5GSw58OsPJmZKxHGhncYY+28QXvxfTc36n7XczxE
	nP+a/GoOcoAr0bxVQTMo0t0WQq5mVm7WDV285I6aT3NSinZjhuIiEBpIomZzwQuo7IW/
	A1H99v4CYI2mXZfjn8GxUZ6s/icys0acyxZHePR9WF3ZGbX+SBCqnGNIpJHbIBfUvzQv
	OzVoUkrmLgFH7GrjbfJ2ueqaed1garND2P93jk4D9vNKJpWXeTjIMVTnPCB4VqMj8PZN
	EqdQ==
X-Received: by 10.98.14.25 with SMTP id w25mr15590616pfi.88.1452387607755;
	Sat, 09 Jan 2016 17:00:07 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ya4sm10384896pab.22.2016.01.09.16.59.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 17:00:05 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 0CE01FCC845; Sat,  9 Jan 2016 16:59:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:36 -0800
Message-Id: <c07f9fea2004138c7f5c91fe461326fd829b52c7.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 13/22] samba: Fix typo in PACKAGECONFIG for "acl" and "aio"
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
X-List-Received-Date: Sun, 10 Jan 2016 01:00:06 -0000

From: "mike.looijmans@topic.nl" <mike.looijmans@topic.nl>

There's a "-" too many in PACKAGECONFIG[acl] and PACKAGECONFIG[aio]
resulting in errors like this if built without acl:
  waf: error: no such option: ---without-acl-support

Remove the extra "-" to fix the issue.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.1.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
index cb29ab9..5eab07e 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.1.12.bb
@@ -55,8 +55,8 @@ PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
 
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'lsb', '', d)}"
 
-PACKAGECONFIG[acl] = "--with-acl-support,---without-acl-support,acl"
-PACKAGECONFIG[aio] = "--with-aio-support,---without-aio-support,libaio"
+PACKAGECONFIG[acl] = "--with-acl-support,--without-acl-support,acl"
+PACKAGECONFIG[aio] = "--with-aio-support,--without-aio-support,libaio"
 PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
 PACKAGECONFIG[pam] = "--with-pam --with-pam_smbpass --with-pammodulesdir=${base_libdir}/security,--without-pam --without-pam_smbpass,libpam"
 PACKAGECONFIG[lsb] = ",,lsb"
-- 
1.9.1


