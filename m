Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 63DBF6FA2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:47 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u56so6675849wes.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EG7q2JEYj/hbRwE7kBtXdUbGbNLx76oeTFvHbpYTQyU=;
	b=uIMwOhNMDqHKMcJ9q1hPiqeG37y4tocj4GBOfDkAwKNRD+Mncm1q1YV2nA6P9AaUkb
	BdU0NagkBItAAoNQkA8s/CSDJO58lyUKbW28MraMuewc4Nmu0saSKj5NNIjvpU0PMRvN
	k2hhohUjsZD4Z/gUHDA5DNrGU06376vlFLmrOfp5L8pWJmdxhacmr36EFT4YM67cym3T
	KqJNK7IlsCSvqM5QQj7EDOAtotAF/MZvIxzCBoHVx4F4STrFFZgl/cOtlPsUvbqxaqhH
	x5XqV5M0qexwbQn6m9Yu/e10Pa4v6LfBpjVXoB7GW0B3gSntTj9SR6TRy6S3K/IA3WO1
	lKKg==
X-Received: by 10.194.118.163 with SMTP id kn3mr5994352wjb.77.1396372488204;
	Tue, 01 Apr 2014 10:14:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m44sm41865964eep.14.2014.04.01.10.14.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:32 +0200
Message-Id: <1396372434-10710-24-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 24/46] gnome-disk-utility: inherit only gnomebase, gtk-icon-cache
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index 6bfbfaf..6b6e931 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -7,7 +7,7 @@ DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui virtual/libx11 liba
 
 PR = "r4"
 
-inherit gnome
+inherit gnomebase gtk-icon-cache
 SRC_URI[archive.md5sum] = "f0366c8baebca0404d190b2d78f3582d"
 SRC_URI[archive.sha256sum] = "03e461b6bda7f773f8018d25fa3213d3073d4dc83a76e6b39d962652f4de6a98"
 
-- 
1.9.1


