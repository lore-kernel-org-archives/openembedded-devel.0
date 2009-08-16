Received: from [209.85.220.218] (helo=mail-fx0-f218.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ilya.muromec@gmail.com>) id 1Mcchi-0001XY-1E
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 12:11:10 +0200
Received: by fxm18 with SMTP id 18so1869638fxm.38
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iZzUIE3Xznu7+TMFfZJWWMsvahQP4O4GSfxBUtzyqkI=;
	b=iDvX8V97yJUYRY3MOYBwQ7N4UujbumaWvQttJon1VBcZyqT0a5yhV/gNh3tuCxrLhs
	uEbWKXPlSsPbJzQgyY4TIhTsteM39On8aSBow0HcuKmJBx494FOaSundIDyYmPRL8Pbz
	MrcK6bp62RzFZyZp90yFxFawFxUNUW3tA0j9E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cbwEL574eAazt/Oaxks5SQQCJc4CnyrkKcWbAskJmNAH7oiugzLlG34Q0p98FJudWV
	7ynDq94Fv2qSwIh690najMnS5Fr2DtoVFd0MzAJpoas2eYAJtC18HAmEcZdj0JBP14KC
	DMqgv7El9Bt5WU5IswwyiufVxzR1snO5QAtNI=
MIME-Version: 1.0
Received: by 10.204.99.193 with SMTP id v1mr1127964bkn.51.1250416458352; Sun, 
	16 Aug 2009 02:54:18 -0700 (PDT)
In-Reply-To: <200908161129.58990.holger+oe@freyther.de>
References: <800a98740908151812r65a3c267h104241a2e32a1222@mail.gmail.com>
	<200908161058.24331.holger+oe@freyther.de>
	<800a98740908160216h56e13ac4g6e35768cc71c121a@mail.gmail.com>
	<200908161129.58990.holger+oe@freyther.de>
Date: Sun, 16 Aug 2009 12:54:18 +0300
Message-ID: <800a98740908160254x1ad8fcf5yf5590e7748064ad4@mail.gmail.com>
From: Ilya Petrov <ilya.muromec@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	OpenEzx <openezx-devel@lists.openezx.org>
Subject: Re: [patch] add 18 bpp support to psplash
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
X-List-Received-Date: Sun, 16 Aug 2009 10:11:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

2009/8/16 Holger Hans Peter Freyther <holger+oe@freyther.de>:
> yes, it is not that we don't know people working at intel...

sent.

diff --git a/recipes/psplash/files/psplash-18bpp.patch
b/recipes/psplash/files/psplash-18bpp.patch
new file mode 100644
index 0000000..ce4b563
--- /dev/null
+++ b/recipes/psplash/files/psplash-18bpp.patch
@@ -0,0 +1,44 @@
+upstream: http://bugzilla.o-hand.com/show_bug.cgi?id=1764
+
+diff -ru psplash/psplash-fb.c /home/muromec/psplash/psplash-fb.c
+--- psplash/psplash-fb.c       2007-08-29 21:27:49.000000000 +0300
++++ /home/muromec/psplash/psplash-fb.c 2009-08-16 11:59:57.000000000 +0300
+@@ -72,6 +72,7 @@
+   fb->real_width  = fb->width  = fb_var.xres;
+   fb->real_height = fb->height = fb_var.yres;
+   fb->bpp    = fb_var.bits_per_pixel;
++  fb->depth  = fb_var.red.length + fb_var.green.length + fb_var.blue.length;
+   fb->stride = fb_fix.line_length;
+   fb->type   = fb_fix.type;
+   fb->visual = fb_fix.visual;
+@@ -176,7 +177,7 @@
+     }
+
+   /* FIXME: handle no RGB orderings */
+-  switch (fb->bpp)
++  switch (fb->depth)
+     {
+     case 24:
+     case 32:
+@@ -184,6 +185,10 @@
+       *(fb->data + off + 1) = green;
+       *(fb->data + off + 2) = blue;
+       break;
++    case 18:
++      *(fb->data + off)     = (red >> 2) | ((green & 0x0C) << 4);
++      *(fb->data + off + 1) = ((green & 0xF0) >> 4) | ((blue & 0x3C) << 2);
++      *(fb->data + off + 2) = (blue & 0xC0) >> 6;
+     case 16:
+       *(volatile uint16 *) (fb->data + off)
+       = ((red >> 3) << 11) | ((green >> 2) << 5) | (blue >> 3);
+diff -ru psplash/psplash-fb.h /home/muromec/psplash/psplash-fb.h
+--- psplash/psplash-fb.h       2007-08-29 21:27:49.000000000 +0300
++++ /home/muromec/psplash/psplash-fb.h 2009-08-16 11:58:39.000000000 +0300
+@@ -26,6 +26,7 @@
+   int            visual;
+   int            width, height;
+   int            bpp;
++  int            depth;
+   int            stride;
+   char                *data;
+   char                *base;
diff --git a/recipes/psplash/psplash-angstrom_svn.bb
b/recipes/psplash/psplash-angstrom_svn.bb
index f65fb81..fc5e4c2 100644
--- a/recipes/psplash/psplash-angstrom_svn.bb
+++ b/recipes/psplash/psplash-angstrom_svn.bb
@@ -10,6 +10,7 @@ ALTERNATIVE_PRIORITY = "20"
 # You might also want to patch the colors (see patch)

 SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http \
+          file://psplash-18bpp.patch;patch=1 \
           file://logo-math.patch;patch=1 \
           file://psplash-hand-img.h \
           file://psplash-bar-img.h \





-- 
 wbr, Ilya
 ICQ: none, Jabber: ilya.muromec@jabber.ru


