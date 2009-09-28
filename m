Received: from [212.27.42.91] (helo=wmproxy1-g27.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alain2210@free.fr>) id 1Ms3v5-0004Uf-Jx
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Sep 2009 02:16:50 +0200
Received: from wmproxy1-g27.free.fr (localhost [127.0.0.1])
	by wmproxy1-g27.free.fr (Postfix) with ESMTP id CE06F334F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2009 02:16:07 +0200 (CEST)
Received: from UNKNOWN (imp6-g19.priv.proxad.net [172.20.243.136])
	by wmproxy1-g27.free.fr (Postfix) with ESMTP id BD2F6334D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Sep 2009 02:16:07 +0200 (CEST)
Received: by UNKNOWN (Postfix, from userid 0)
	id BD780C89512C5; Mon, 28 Sep 2009 02:16:07 +0200 (CEST)
Received: from  ([82.123.20.116]) by imp.free.fr (IMP) with HTTP 
	for <alain2210@172.20.243.55>; Mon, 28 Sep 2009 02:16:07 +0200
Message-ID: <1254096967.4ac00047b8abb@imp.free.fr>
Date: Mon, 28 Sep 2009 02:16:07 +0200
From: Alain2210 <alain2210@free.fr>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.8
X-Originating-IP: 82.123.20.116
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 212.27.42.91
X-SA-Exim-Mail-From: alain2210@free.fr
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: xmonobut
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
X-List-Received-Date: Mon, 28 Sep 2009 00:16:50 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello,

xmonobut segfault. I need this patch to get it works again.

Sincerely,

Alain
----------------------------------------------
--- main.c.orig	2006-02-05 12:49:21.000000000 +0100
+++ main.c	2009-09-28 02:11:06.000000000 +0200
@@ -137,7 +137,7 @@
 {
   Display *dpy;
   Window root;
-  unsigned char map[6];
+  unsigned char map[31];

   int buts, rst;

@@ -190,7 +190,7 @@

   if (active_button_num !=3D last_button_num)
     {
-      buts =3D XGetPointerMapping(dpy, map, 5);
+      buts =3D XGetPointerMapping(dpy, map, 32);

       switch (active_button_num)
 	{
@@ -217,7 +217,7 @@
 	  break;
 	}
       mb_tray_app_repaint(app);
-      while((rst =3D XSetPointerMapping(dpy, map, buts)) =3D=3D MappingB=
usy);
+      while((rst =3D XSetPointerMapping(dpy, map, 32)) =3D=3D MappingBus=
y);
       last_button_num =3D active_button_num;
     }
 }


