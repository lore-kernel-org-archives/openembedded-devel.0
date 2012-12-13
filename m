Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TjF9x-0003gD-Rd
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 21:13:33 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1240142bkw.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 11:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Gi7GqwCz5qO/RLiW31NN58w7T1f7553FzRmbE6AOVB4=;
	b=H5PRp0AUK0wLBUwgJJz4D3elXI+WX114UwRt7nNZ6+SyBfRML8JiovRJgE1jYSILz/
	NtDzDboyfqz4Q0O2uWvZeEj5Q8Aw9jfHdP2Ah8oRqxlrBp/5rzX+tMLlXdTiumEMRk0q
	lnF4ZfoGO/fvEW4MDCLf/ZPlw81CbiGeFu35qIrnvYwky0KxunSSKyAXuxvKhAtEGHed
	MveuYyEro2+MM3hrZiv+jLlBPFU+1qXlzqoLgqzQZ+pFUlJ+/IcssUESLhZC4lpm+pE4
	M35dPB7cMgqBnDjG8SRl07HknAt1mjKyT2jwwFlqpVcbD2JKw8yQbTF4NHhHOzpDuRrW
	ZtaA==
Received: by 10.204.4.145 with SMTP id 17mr1641671bkr.34.1355428738800;
	Thu, 13 Dec 2012 11:58:58 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id m20sm2509442bkw.4.2012.12.13.11.58.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 11:58:57 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TjEvn-0004p4-FK; Thu, 13 Dec 2012 21:58:55 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 21:58:50 +0200
Message-Id: <1355428730-18495-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1355428730-18495-1-git-send-email-cazfi74@gmail.com>
References: <1355428730-18495-1-git-send-email-cazfi74@gmail.com>
Subject: [meta-gnome][PATCH] gtk+3: add libxi dependency
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
X-List-Received-Date: Thu, 13 Dec 2012 20:13:34 -0000

Without even compile fails:
| In file included from gdkdevice-xi.c:24:0:
| gdkdeviceprivate-xi.h:28:35: fatal error: X11/extensions/XInput.h: No such file or directory

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb |    2 +-
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
1.7.10.4



