Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 13F7B7092A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 13:35:21 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so1386406wiv.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 06:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QFUnXMX2rvWDrhi6LrVl/N3O7frlwIEZGmqe43E+im0=;
	b=bnz+Da4LKyl7twnuZG4h6frz4aj+IGbdo9HTSkxWWpX/K9wQTdyTmQ/uEl0jnw3Q5a
	vKhMrmVFjar5o8uUslt9CrTO6h6UiEvq19VNJ78fPl4B5lnFKdJZJ1+YJMd1WHvIGhys
	cIGZusfV/C9TelBh72cTc0cg7rQNxoquDoZmuoW3T+FJvJzpdJ+BfpWpAeff0NaU44JW
	bUCXNR8aYDl6ewLc83mE4w0cGLVDHx2B5wQFuY+b4aLRAOH1CVy39LWYRJi9YSpt5ikD
	CnONDbxwZFPWWNcOE8v9xTZyr6XljJfj08fxtF8nYal9BO9EMgSx+WOeyPr6oy0WGLL8
	NwbA==
X-Gm-Message-State: ALoCoQlFFY0W0irrjRu8gom0qgXHrRRzkhvcGjeHtawdyaaEWUv1qDuAvO/i0c3iQLSpHgTTbVm/
X-Received: by 10.194.3.74 with SMTP id a10mr8223403wja.85.1406900120449;
	Fri, 01 Aug 2014 06:35:20 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id ub11sm8850390wib.1.2014.08.01.06.35.19
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Aug 2014 06:35:19 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Aug 2014 15:34:54 +0200
Message-Id: <1406900096-31368-8-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
References: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH 08/10] goffice: remove blacklist. libgsf has been fixed
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

Also add missing dependency on intltool.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-support/goffice/goffice_0.10.1.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
index b64119d..1e9ec4c 100644
--- a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
+++ b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
@@ -3,9 +3,7 @@ DESCRIPTION="Gnome Office Library"
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6dc33ff21e1ba1ac1a2a1069d361e29e"
 
-PNBLACKLIST[goffice] = "BROKEN: depends on broken libgsf"
-
-DEPENDS = "libxml-parser-perl-native glib-2.0 gtk+3 pango cairo libgsf libpcre libxml2 libart-lgpl librsvg"
+DEPENDS = "libxml-parser-perl-native glib-2.0 gtk+3 pango cairo libgsf libpcre libxml2 libart-lgpl librsvg intltool"
 
 inherit gnomebase pkgconfig perlnative
 
-- 
1.9.0


