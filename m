Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Oz2D7-0004hw-94
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 08:56:47 +0200
Received: by pzk37 with SMTP id 37so559861pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 23:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=6/bZcBkrcGWaZ0MRClbGonKqcVdZLATTDHWMIiSSSdk=;
	b=dxmDvSdXHNkseS9IUuh/HG5bcCJ+eRpxVwBniKItPaNlOkxwxnJ685qgr3w51qofwQ
	VnB4FCSi2WutXFxASAXhGiUZDvTG0oy0taJTGf0lvp4ldDE+ZB83sdxiCchhkVOhE3Ph
	lRunB3dyvXxN3fWHAU032T88FM2i6JhLX3PMw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=SymTdKcBThuSOCFW72Za+fY2otqkuzFkJRp6Y4FZbOLq7djoRRJGwXaifXhj0lgUGm
	gtxxoXEevmmlcSIutm9qoGKadf5Mnh+CDZPGcXG4SxeVTu1R1sBwJbnREKG2DwZL1s8L
	s0NdQTC/dc0wlRXZhNYmz7QXHunAt1GcQG1Iw=
Received: by 10.114.39.7 with SMTP id m7mr3045260wam.201.1285311397937;
	Thu, 23 Sep 2010 23:56:37 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	c24sm2950786wam.19.2010.09.23.23.56.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 23 Sep 2010 23:56:37 -0700 (PDT)
Message-ID: <4C9C4BA0.2090200@gmail.com>
Date: Fri, 24 Sep 2010 16:26:32 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gtk+_2.20.1.bb: Fix build with --disable-xkb.
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
X-List-Received-Date: Fri, 24 Sep 2010 06:56:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

See https://bugzilla.gnome.org/show_bug.cgi?id=619114

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/gtk+/files/xkb-ifdef.patch |   24 ++++++++++++++++++++++++
 recipes/gtk+/gtk+_2.20.1.bb        |    1 +
 2 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gtk+/files/xkb-ifdef.patch

diff --git a/recipes/gtk+/files/xkb-ifdef.patch b/recipes/gtk+/files/xkb-ifdef.patch
new file mode 100644
index 0000000..b74d9c9
--- /dev/null
+++ b/recipes/gtk+/files/xkb-ifdef.patch
@@ -0,0 +1,24 @@
+commit eff1fe2500f07fa2b4683ff52fe92e39e6487b05
+Author: Matthias Clasen <mclasen@redhat.com>
+Date:   Fri May 21 12:13:05 2010 -0400
+
+    Make the !xkb build survive a little longer
+    
+    This fixes bug 619114.
+
+diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
+index c0cbc99..6cded79 100644
+--- a/gdk/x11/gdkdisplay-x11.c
++++ b/gdk/x11/gdkdisplay-x11.c
+@@ -690,7 +690,11 @@ gdk_display_beep (GdkDisplay *display)
+ {
+   g_return_if_fail (GDK_IS_DISPLAY (display));
+ 
++#ifdef HAVE_XKB
+   XkbBell (GDK_DISPLAY_XDISPLAY (display), None, 0, None);
++#else
++  XBell (GDK_DISPLAY_XDISPLAY (display), 0);
++#endif
+ }
+ 
+ /**
diff --git a/recipes/gtk+/gtk+_2.20.1.bb b/recipes/gtk+/gtk+_2.20.1.bb
index ca5e197..f9367b7 100644
--- a/recipes/gtk+/gtk+_2.20.1.bb
+++ b/recipes/gtk+/gtk+_2.20.1.bb
@@ -4,6 +4,7 @@ SRC_URI_append_virtclass-native = " file://no-demos.patch \
 "
 SRC_URI_append = "file://gtk-dnd-grab-deadlock-fix.patch \
 		  file://cross-nm.patch \
+		  file://xkb-ifdef.patch \
 		 "
 
 SRC_URI[gtk.md5sum] = "53e6f3a93bd22934878fc4a4a34c68aa"
-- 
1.7.1



