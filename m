Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id D525660167
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 13:35:22 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so1354277wiw.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 06:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Xa6jTKxuXRkl2WlNzCl/skW+UM9qLtedyrdb1DOgn1w=;
	b=O1a/015zPQLC7BYKg8k5kb0oBx09nknqd+5q+Tc51SNBngZp8eW7sn8dlxC34DkUgG
	bE9VI9QOcntxG2DhJuF7iZtwnswr2GSNiXz44+XCx5nqlRbNItrO4w0Q1V1cU0AG8W7C
	V6YrmJohDvGylehCh0JleGcRU8JcmNOI6cHq4SvGXHsUfC87wVusDEwTKzV1WI+eZWeV
	9iXBPbHDAEALZmQkmkuCpJbh4rwZNpatIO+s1SXsfB1lR3SBKxj6niLAZv4HXv9kXNt4
	esmh/Y3GEJGJpyn/FH/4u0NyagmFFFw+5JIqCWKo6aMFu/3xIa7yqjAgK5JRP6VNMWiX
	WOFw==
X-Gm-Message-State: ALoCoQll1jknR8Xn9X+wAjm3eh0zZezKWscU2TeE/FYCn7HJnAOXx+sSQvkcSRfj2k7uNB0FkC7H
X-Received: by 10.194.60.35 with SMTP id e3mr8312832wjr.12.1406900122711;
	Fri, 01 Aug 2014 06:35:22 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	ey16sm8791040wid.14.2014.08.01.06.35.21 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Aug 2014 06:35:21 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Aug 2014 15:34:55 +0200
Message-Id: <1406900096-31368-9-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
References: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH 09/10] gnumeric: remove blacklist. libgsf has been fixed
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
X-List-Received-Date: Fri, 01 Aug 2014 13:35:23 -0000

Also fix S!=B issue.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
index 955148d..71f99ca 100644
--- a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
+++ b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
@@ -5,8 +5,6 @@ S = "${WORKDIR}/gnumeric-${PV}"
 DEPENDS = "gdk-pixbuf libgsf gtk+3 libxml2 libglade libart-lgpl intltool-native libgnomecanvas libgnomeprint libbonoboui orbit2-native goffice"
 SUMMARY = "Gnumeric spreadsheet for GNOME"
 
-PNBLACKLIST[gnumeric] = "BROKEN: depends on broken libgsf"
-
 GNOME_COMPRESS_TYPE = "xz"
 
 inherit gnome
@@ -33,7 +31,7 @@ FILES_gnumeric-goffice = "${libdir}/goffice/*/plugins/gnumeric/*"
 # This hack works around the problem mentioned here:
 # https://mail.gnome.org/archives/gnumeric-list/2010-February/msg00006.html
 do_install_prepend() {
-    sed -i ${S}/doc/C/Makefile -e 's/\tfor file in $(omffile); do/\t-for file in $(omffile); do/'
+    sed -i ${B}/doc/C/Makefile -e 's/\tfor file in $(omffile); do/\t-for file in $(omffile); do/'
 }
 
 python populate_packages_prepend () {
-- 
1.9.0


