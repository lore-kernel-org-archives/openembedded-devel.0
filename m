Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QjdvE-0003D0-79
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jul 2011 23:03:12 +0200
Received: by mail-fx0-f51.google.com with SMTP id 10so2387421fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2011 13:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+EM0BLpb7KJ1h+BHkz0GQQk0v5J8Q9F1YO5xPCdvlp8=;
	b=sgex+LtyxlY4MtXHzcb17knvMxj0Di/KLFjRN2DGnW4HzE0QSwO2N381vjTArwfktP
	V8xEYJZ26+4rPkmTwESD/ME6rn7cj2ErEpg1bL/MhQ6CrG1I7iWaL8j+XmhsSYH//z24
	S4WXFZ//CnCdonf20+GsE0WREAmTfsUTHOKOc=
Received: by 10.223.14.204 with SMTP id h12mr8852840faa.89.1311195547880;
	Wed, 20 Jul 2011 13:59:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 28sm930458fax.27.2011.07.20.13.59.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 13:59:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2011 22:58:47 +0200
Message-Id: <6b97e0156fb4c6b2d208ade8221d1a216f420dc3.1311195484.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <ac2a5d6d9f55737cc5a6297303722d9188e37b33.1311195484.git.Martin.Jansa@gmail.com>
References: <ac2a5d6d9f55737cc5a6297303722d9188e37b33.1311195484.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311195484.git.Martin.Jansa@gmail.com>
References: <cover.1311195484.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/5] pidgin: inherit perlnative
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
X-List-Received-Date: Wed, 20 Jul 2011 21:03:12 -0000

* otherwise perl from host is used and if there isn't libxml-parser-perl
  installed on host it fails with:
  checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin.inc b/meta-oe/recipes-support/pidgin/pidgin.inc
index 91d5176..9d21976 100644
--- a/meta-oe/recipes-support/pidgin/pidgin.inc
+++ b/meta-oe/recipes-support/pidgin/pidgin.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls virtual/libintl gstreamer dbus"
 INC_PR = "r0"
 
-inherit autotools gettext pkgconfig gconf
+inherit autotools gettext pkgconfig gconf perlnative
 
 EXTRA_OECONF = " \
 		--enable-vv \
-- 
1.7.6



