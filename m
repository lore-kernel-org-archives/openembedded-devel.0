Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RpFnP-0006fE-Dl
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Jan 2012 10:02:35 +0100
Received: by mail-ey0-f175.google.com with SMTP id l12so265605eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2012 00:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=BIXzNU2kjVIvwwORjjo2giJZS9i/ZKmYd8FJY4qJ+NI=;
	b=CEON61TgbS10jasvm9nu/Rjb2G7jVQUB3vSwYnZaIY5ymEKQbSTOK8eZkKvFb6gBGq
	0O5BzcNQRQSz15SbNxfUdUIPxwJ2V3cSZw0qR/POzpdfOSAJf7yjA1JcMBDIGgLEz/co
	/Vd4wd9NvXnR9CCmVtgBWSBhKR+54MAu7UmK4=
Received: by 10.213.36.8 with SMTP id r8mr1419989ebd.78.1327308893769;
	Mon, 23 Jan 2012 00:54:53 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x43sm51250184eef.8.2012.01.23.00.54.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 00:54:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2012 09:54:20 +0100
Message-Id: <4e5eac73b0359b6689dad0bf13c8dc37f66d124a.1327308791.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <26b55fdded7124f4666f372ceda4d8c4d959cc94.1327308791.git.Martin.Jansa@gmail.com>
References: <26b55fdded7124f4666f372ceda4d8c4d959cc94.1327308791.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1327308791.git.Martin.Jansa@gmail.com>
References: <cover.1327308791.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome][PATCH 4/8] gtk+: add native BBCLASSEXTEND
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
X-List-Received-Date: Mon, 23 Jan 2012 09:02:35 -0000

* it's needed to provide gtk-update-icon-cache for gtk+3 build
* RRECOMMENDS needs to be empty as we don't want liberation-fonts-native etc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend

diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend b/meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend
new file mode 100644
index 0000000..7df58c3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend
@@ -0,0 +1,3 @@
+BBCLASSEXTEND = "native"
+RRECOMMENDS_${PN}_virtclass-native = ""
+EXTRA_OECONF_virtclass-native += "--disable-introspection"
-- 
1.7.8.4



