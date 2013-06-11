Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 941466A619
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 05:37:16 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id e52so3470533eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jun 2013 22:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=j5J78TBi1jutGtdId/A+FIjW82I84Endz5plhSWQYak=;
	b=iCEAq9+8lOJKmdf871zvo3UK8xvasodG3JbeW60ihyuAL064xLkKurz5HwQaL5uIbT
	+G/wBd1dgyV1nkGz0zZ2aRjY8NePx/c90IQz+fCt3cUe/HNjD/jOT/S8Q6E0QLgVo0YO
	cx7R/DF8iAcV+EoaCS+aAq5DIbCEBnfG0AvnfktnrIK7oN6Cm0Z1FaQ4eI9bTGTsDIv6
	P8v6YtuvSXipwRWbaSUrGFC3ShnCL+oS388AL9CeqV5BszUUqanvA45m67Ps31b0fm+x
	YFMZP1XmuX3amD3uT+IH8j4RAka37AAeHkFsH0PQbocfBJKfeFwzh3J/Yrs9C+weoivd
	Fbvw==
X-Received: by 10.14.215.5 with SMTP id d5mr8757933eep.143.1370929037297;
	Mon, 10 Jun 2013 22:37:17 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id y10sm28009517eev.3.2013.06.10.22.37.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 22:37:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 07:34:22 +0200
Message-Id: <1370928876-14423-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
References: <1370928876-14423-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 01/15] midori: update to 0.5.2
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
X-List-Received-Date: Tue, 11 Jun 2013 05:37:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../midori/{midori_0.5.0.bb => midori_0.5.2.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-connectivity/midori/{midori_0.5.0.bb => midori_0.5.2.bb} (89%)

diff --git a/meta-gnome/recipes-connectivity/midori/midori_0.5.0.bb b/meta-gnome/recipes-connectivity/midori/midori_0.5.2.bb
similarity index 89%
rename from meta-gnome/recipes-connectivity/midori/midori_0.5.0.bb
rename to meta-gnome/recipes-connectivity/midori/midori_0.5.2.bb
index f046375..f4f6221 100644
--- a/meta-gnome/recipes-connectivity/midori/midori_0.5.0.bb
+++ b/meta-gnome/recipes-connectivity/midori/midori_0.5.2.bb
@@ -6,8 +6,8 @@ DEPENDS = "webkit-gtk libsoup-2.4 openssl python-native python-docutils-native l
 
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.5/midori-${PV}.tar.bz2;name=midori \
 "
-SRC_URI[midori.md5sum] = "ad11685633e23f8173e2cd947d945cce"
-SRC_URI[midori.sha256sum] = "d280c19bb135f2b644a67d9f34d1ec1c148ceb14b5de11ce6c23f64c15be5df0"
+SRC_URI[midori.md5sum] = "e2c1e0b617397ec9f9eef4fdb47b3565"
+SRC_URI[midori.sha256sum] = "a9c5cb4606e8e4967a2b980caa9ada25623c50d927a302b6bf73eeac5815c97c"
 
 inherit gtk-icon-cache pkgconfig vala pythonnative
 
-- 
1.7.6.5


