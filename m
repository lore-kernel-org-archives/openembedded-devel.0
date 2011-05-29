Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQlXh-0007aA-LH
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 May 2011 21:20:54 +0200
Received: by bwz5 with SMTP id 5so2753022bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2011 12:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=vH6kqBg6KWB1ujh1amPJW5NUKw3xzYlh+X2JaWXtbQQ=;
	b=q7cnEUeocFhRKdFPi91uXBosNHWIpoRME2uZ0LgDkIimk2TKNcP+JqFYsYXoUWVaof
	+JTn4BZNAfdsaWe2b3S5mDLOFpmMe7BrobqM5dDkTHCYKkBYZnvsD8qU6SFlJEj+IWdO
	fvsswe+rUGYiagt2ysmfySE2+vJY9umjFkIRY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Cby1NM5A6RhZz/rlXxvrxR1VgHLSphgk7SSYyMODeb7vXChjo3EZEJA7fS59TuM8Kt
	NyleVnD8QZOeWUf9Z6u/2Edgh0/8FshOcUIa1eUxR2wvRi/6mXwsXmA3kzd8B8P+EZUF
	lpKWnBSZd2POs+yhV8554I/ZUY5GI4hkzpa4U=
Received: by 10.205.37.2 with SMTP id tc2mr3813160bkb.14.1306696666195;
	Sun, 29 May 2011 12:17:46 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id a28sm339859fak.3.2011.05.29.12.17.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 May 2011 12:17:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 May 2011 21:17:14 +0200
Message-Id: <6d401ed25f77ab1329aa551a18414f3e0fdfdffc.1306696348.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
References: <e6bbc59f3f64c410233cb840174a8972d4ac1664.1306696348.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306696348.git.Martin.Jansa@gmail.com>
References: <cover.1306696348.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 04/16] pidgin: add LIC_FILES_CHKSUM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 May 2011 19:20:54 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin.inc b/meta-oe/recipes-support/pidgin/pidgin.inc
index 96a2345..91d5176 100644
--- a/meta-oe/recipes-support/pidgin/pidgin.inc
+++ b/meta-oe/recipes-support/pidgin/pidgin.inc
@@ -1,6 +1,7 @@
 DESCRIPTION = "multi-protocol instant messaging client"
 SECTION = "x11/network"
-LICENSE = "GPL"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls virtual/libintl gstreamer dbus"
 INC_PR = "r0"
 
-- 
1.7.5.rc3



