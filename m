Return-Path: <ka6sox@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3E74260169
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 15:37:18 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id wm4so4098436obc.30
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Aug 2014 08:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=tgrwmnhhum/RwIa9N4Pe76h2h21zo9jahNgVeP+A0HY=;
	b=e4zR3BWPxRdDjh+1kyxMSOB7nA6fL/US1VEnWGW6iuetd8bEWjjFW+1nJFeqmxBUbu
	cjT1AH8sNY+lJUU/RmXoVaqwCQBX4NDb7IsYqkZ6djlaRd1faRxshGRhEP4u/nKJS1r0
	ruk4EaH5dWkxhdZaxjAlWxXD/hFE5vOawxjp0QQsBav88GeZmgX5FdhHLQwlfQYQUwvR
	XlA6MnAzomm9AMunH4DlbXGcx5/VGKmZVAa4FJRuc95Wf+ShiFEK0dvHBB+UexZbifOy
	T+QTzh9HkpHN0wiGjg62anDDA/b1drpP81CBlg5hSCXsAYCz3Fv+sG2o7oVc5raSNSzp
	lTqw==
MIME-Version: 1.0
X-Received: by 10.60.63.166 with SMTP id h6mr3362434oes.79.1408376239918; Mon,
	18 Aug 2014 08:37:19 -0700 (PDT)
Received: by 10.76.108.238 with HTTP; Mon, 18 Aug 2014 08:37:19 -0700 (PDT)
Date: Mon, 18 Aug 2014 08:37:19 -0700
Message-ID: <CAHQecY7-LZLcobjszRWZn=M2-qQHeUYT6QZt072=pRe68DpLtQ@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-navigation][Patch 1/1] gypsy: fix QA issue by removing oe-extraconf
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
X-List-Received-Date: Mon, 18 Aug 2014 15:37:24 -0000
Content-Type: text/plain; charset=UTF-8

Signed-off-by: Tom King <ka6sox@gmail.com>
Signed-off-by: Ron Lockwood-Childs <rchilds@vctlabs.com>
---
 meta-oe/recipes-navigation/gypsy/gypsy.inc |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gypsy/gypsy.inc
b/meta-oe/recipes-navigation/gypsy/gypsy.inc
index 747b61d..7c93d0a 100644
--- a/meta-oe/recipes-navigation/gypsy/gypsy.inc
+++ b/meta-oe/recipes-navigation/gypsy/gypsy.inc
@@ -11,8 +11,6 @@ DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt-native
libxslt"
 inherit autotools pkgconfig gtk-doc
 PACKAGES += "libgypsy"

-EXTRA_OECONF += "--with-distro=debian"
-
 FILES_${PN} = " \
   ${sysconfdir}/gypsy.conf \
   ${sysconfdir}/dbus-1 \
-- 
1.7.9.5

