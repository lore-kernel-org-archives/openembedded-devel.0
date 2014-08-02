Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id AFFCC65E48
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Aug 2014 08:08:29 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id w62so5279877wes.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Aug 2014 01:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LMbJC59Yn4VXQXc0b4fz/Zq+Wb5XXX5DVAbUPQZwWAs=;
	b=DTSqFp6GaL69Vk/iwG+kpkW7hGxFGnIilqmwgGI6LPa/5u2q7I410Gl2zpALZhhBtI
	vKsL6dc55i+0LqahNqj82RgNJZ6efGRmIczIgWl0Y4PE9X2w0YVRKLSYsFG5C+Xl1dJM
	g9AYLSUjxFdVJGUedPBrV1o9P3lBOBFje/5wyFCwcoE/tI/+yh0sKon6/wXV0A/qj62A
	2z5z0DFbADmIKbgZZx7RXZ+JI9MNIz6mkdswxMGcLZhZdxOvaDqkxgPsBywSrD7eSYGs
	CmY4guBO5KzoXhh8NCfsHW6yP0IRfVW9o8sMSYF3WYgAAQVghm3FDFoQHcrp+0utWiqQ
	TCrQ==
X-Gm-Message-State: ALoCoQn89WuNCPtke54b0rQFAoMOYx42k8AFAMmOTER/Aw7R775KsldgOzsstnjhwNRdTFbB0ITE
X-Received: by 10.180.80.225 with SMTP id u1mr13732310wix.69.1406966910416;
	Sat, 02 Aug 2014 01:08:30 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	ek3sm26605646wjd.17.2014.08.02.01.08.28 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 02 Aug 2014 01:08:29 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Aug 2014 10:08:24 +0200
Message-Id: <1406966904-25964-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1406966904-25964-1-git-send-email-koen@dominion.thruhere.net>
References: <1406966904-25964-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH 2/2] epiphany: add missing dependencies
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
X-List-Received-Date: Sat, 02 Aug 2014 08:08:30 -0000

WARNING: QA Issue: epiphany rdepends on libavahi-common but its not a
build dependency? [build-deps]
WARNING: QA Issue: epiphany rdepends on libnotify but its not a build
dependency? [build-deps]
WARNING: QA Issue: epiphany rdepends on libavahi-gobject but its not a
build dependency? [build-deps]
WARNING: QA Issue: epiphany rdepends on libavahi-client but its not a
build dependency? [build-deps]

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb b/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
index 3d7fc18..4c8c58a 100644
--- a/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
+++ b/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb
@@ -2,7 +2,7 @@ SUMMARY = "GNOME default webbrowser"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "gnome-doc-utils libsoup-2.4 webkit-gtk gtk+ gconf iso-codes startup-notification ca-certificates libgnome-keyring"
+DEPENDS = "gnome-doc-utils libsoup-2.4 webkit-gtk gtk+ gconf iso-codes startup-notification ca-certificates libgnome-keyring avahi"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "0c566b3ffd428d2135e3c8cb65352d64"
-- 
1.9.0


