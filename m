Received: from [209.85.218.208] (helo=mail-bw0-f208.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ilya.muromec@gmail.com>) id 1Mcbw3-0001Kx-Pg
	for openembedded-devel@openembedded.org; Sun, 16 Aug 2009 11:21:58 +0200
Received: by bwz4 with SMTP id 4so1880145bwz.0
	for <openembedded-devel@openembedded.org>;
	Sun, 16 Aug 2009 02:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=e48GKU4UlkzyD5jWFXmwwF1aXmH8snLcnZa20MNiuGw=;
	b=ntuhKqgXdK85L6yQXfaO1XIf2z8P3CQM5nSzo7ZLLUCRuT/ECF1ybInybIKs85CsEr
	NpBom41JYZNVAi193toILNWQ6odwu2Jmmg1frACLuq0i9vCEQA5HW/ZFGoR+6Fe5XR1W
	xSIO75Efif/oJPP5KRghFNMYkWPfYr4wpGxkE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=pZpCcwu3BXX3c0abcmLakE00Nj42s7X+rAQm+4deFGmWgP8c+3LUbqnebn9jHwArb+
	O1n4w7dBkzF87AQc8xH84jW1Klv/MG+fREjFMdFzvDRt02dA9PRHidGsQ8Bi1uW6fpC6
	PB90t1dSxpfPK96Dtk7NOPCnfONcrWVcrWMGc=
MIME-Version: 1.0
Received: by 10.204.67.146 with SMTP id r18mr2026122bki.88.1250413504305; Sun, 
	16 Aug 2009 02:05:04 -0700 (PDT)
In-Reply-To: <20090816102727.8412bc97.ospite@studenti.unina.it>
References: <800a98740908151812r65a3c267h104241a2e32a1222@mail.gmail.com>
	<20090816102727.8412bc97.ospite@studenti.unina.it>
Date: Sun, 16 Aug 2009 12:05:04 +0300
Message-ID: <800a98740908160205l47ea33c3x36d7a953e48b959d@mail.gmail.com>
From: Ilya Petrov <ilya.muromec@gmail.com>
To: Antonio Ospite <ospite@studenti.unina.it>
Cc: openembedded-devel@openembedded.org,
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
X-List-Received-Date: Sun, 16 Aug 2009 09:22:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2009/8/16 Antonio Ospite <ospite@studenti.unina.it>:

> usually they call this 'depth' as a shorthand for 'color depth', naming
> it 'color' would make people think to the actual color _value_.

ok

> Maybe you may want to add some spaces around binary operators, that's
> the style used just below.

ok

diff -ru psplash/psplash-fb.c /home/muromec/psplash/psplash-fb.c
--- psplash/psplash-fb.c        2007-08-29 21:27:49.000000000 +0300
+++ /home/muromec/psplash/psplash-fb.c  2009-08-16 11:59:57.000000000 +0300
@@ -72,6 +72,7 @@
   fb->real_width  =3D fb->width  =3D fb_var.xres;
   fb->real_height =3D fb->height =3D fb_var.yres;
   fb->bpp    =3D fb_var.bits_per_pixel;
+  fb->depth  =3D fb_var.red.length + fb_var.green.length + fb_var.blue.len=
gth;
   fb->stride =3D fb_fix.line_length;
   fb->type   =3D fb_fix.type;
   fb->visual =3D fb_fix.visual;
@@ -176,7 +177,7 @@
     }

   /* FIXME: handle no RGB orderings */
-  switch (fb->bpp)
+  switch (fb->depth)
     {
     case 24:
     case 32:
@@ -184,6 +185,10 @@
       *(fb->data + off + 1) =3D green;
       *(fb->data + off + 2) =3D blue;
       break;
+    case 18:
+      *(fb->data + off)     =3D (red >> 2) | ((green & 0x0C) << 4);
+      *(fb->data + off + 1) =3D ((green & 0xF0) >> 4) | ((blue & 0x3C) << =
2);
+      *(fb->data + off + 2) =3D (blue & 0xC0) >> 6;
     case 16:
       *(volatile uint16 *) (fb->data + off)
        =3D ((red >> 3) << 11) | ((green >> 2) << 5) | (blue >> 3);
=D0=A2=D0=BE=D0=BB=D1=8C=D0=BA=D0=BE =D0=B2 /home/muromec/psplash: psplash-=
fb.c.orig
diff -ru psplash/psplash-fb.h /home/muromec/psplash/psplash-fb.h
--- psplash/psplash-fb.h        2007-08-29 21:27:49.000000000 +0300
+++ /home/muromec/psplash/psplash-fb.h  2009-08-16 11:58:39.000000000 +0300
@@ -26,6 +26,7 @@
   int            visual;
   int            width, height;
   int            bpp;
+  int            depth;
   int            stride;
   char         *data;
   char         *base;


--=20
 wbr, Ilya
 ICQ: none, Jabber: ilya.muromec@jabber.ru


