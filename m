Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIi0-0005nC-4H
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:13:10 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2705899eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=KWKmQlV8OBzHvlCFVb6BzNmvoNcwRUcQsKANvytjWkQ=;
	b=mFnQq0qGTmestprLJzKdphbIxir7wqueu6yZ5Ged5xlUCj45miHkGaH2gl8+EGgXKP
	Yxg7CX0ICeQt9vZEo+XPmMj7m8npY9Z4OSylXl3VMebTcz82GtbmBkTsQWY7a9eKgtqf
	hGNWYKdoRlisC9PFwGbFqTTmavqPL+ScCKnE3og2DJxUrbJgmrA+aIlmi7YzE9WfPc5O
	uUaf4/tLhz7Dtl/ulIwdJy2I/Rd4ygZi57FPoS6az229HONw9VRTpTO+mgu/bbQ69g6Q
	YmH/1W5uCSSetuilkcT0JxYgiqIua7rMuIAxtBZz1G55CYcfcJi6XgKp9vFdgietQO+f
	msbA==
Received: by 10.14.173.65 with SMTP id u41mr33815015eel.13.1355680705140;
	Sun, 16 Dec 2012 09:58:25 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d3sm23868893eeo.13.2012.12.16.09.58.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:57:53 +0100
Message-Id: <c4586cf82bb2fa701dfcdca967e329f5ed1c49d8.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/26] gtk+3: add libxi dependency
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
X-List-Received-Date: Sun, 16 Dec 2012 18:13:11 -0000

From: Marko Lindqvist <cazfi74@gmail.com>

Without even compile fails:
| In file included from gdkdevice-xi.c:24:0:
| gdkdeviceprivate-xi.h:28:35: fatal error: X11/extensions/XInput.h: No such file or directory

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
index 854ba41..55397cc 100644
--- a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
+++ b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 
 DEPENDS = "glib-2.0 pango atk jpeg libpng libxext libxcursor \
            gtk-doc-native docbook-utils-native libxrandr libgcrypt \
-           libxdamage libxrender libxcomposite cairo gdk-pixbuf gtk+-native"
+           libxdamage libxrender libxcomposite libxi cairo gdk-pixbuf gtk+-native"
 
 LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
 
-- 
1.8.0.2



