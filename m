Received: from [84.16.208.26] (helo=banan.dataparty-mn.biz)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <nail@nslu2-linux.org>) id 1GKJ1x-0000dN-BM
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Sep 2006 20:18:45 +0200
Received: from [10.0.0.6] (104.84-48-48.nextgentel.com [84.48.48.104])
	by banan.dataparty-mn.biz (Postfix) with ESMTP id ED8C413C1C3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Sep 2006 20:16:04 +0200 (CEST)
Message-ID: <44FC6D96.5030201@nslu2-linux.org>
Date: Mon, 04 Sep 2006 20:16:54 +0200
From: =?ISO-8859-1?Q?=D8yvind_Repvik?= <nail@nslu2-linux.org>
User-Agent: Thunderbird 1.5.0.5 (X11/20060728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
References: <5144EF5B0ABC6745BEE64C74E43ABD8F11A0D8@moneypenny.softoption.local>
In-Reply-To: <5144EF5B0ABC6745BEE64C74E43ABD8F11A0D8@moneypenny.softoption.local>
Subject: Re: DVB scan utility
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Sep 2006 18:18:45 -0000
Content-Type: multipart/mixed; boundary="------------030005040007040808010008"

--------------030005040007040808010008
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Mark Howells wrote:
> Hi,
>  
> Can anyone point me toward an OE port (ideally OpenSlug/Slugos binary) o=
f the linuxtv dvb 'scan' utility from HYPERLINK "http://www.linuxtv.org/dow=
nloads/linuxtv-dvb-apps-1.1.1.tar.gz"http://www.linuxtv.org/downloads/linux=
tv-dvb-apps-1.1.1.tar.gz. I've tried creating a bb file to compile it, but =
the Makefile is old and seems only capable of compiling natively. I don't h=
ave a native compiler on my slug - I guess I could install it, but if anyon=
e has a built binary or suitable BB/Make system it would help.

The reason it compiles native binaries is simply that the Makefile=20
defines $CC as 'gcc'.

Applying the included diff should help the Makefile work as it was=20
intended to do

Regards,
=D8yvind Repvik
SlugOS package manager
diff -ur linuxtv-dvb-apps-1.1.1.orig/test/Makefile linuxtv-dvb-apps-1.1.1/=
test/Makefile
--- linuxtv-dvb-apps-1.1.1.orig/test/Makefile	2004-01-17 17:59:46.00000000=
0 +0100
+++ linuxtv-dvb-apps-1.1.1/test/Makefile	2006-09-04 20:08:23.000000000 +02=
00
@@ -1,6 +1,6 @@
 # Makefile for Linux DVB API Version 3 test programs
=20
-CC =3D gcc
+#CC =3D gcc
 CFLAGS =3D -g -O2 -W -Wall -I../include
=20
 TARGETS =3D \
Only in linuxtv-dvb-apps-1.1.1/test: Makefile.orig
diff -ur linuxtv-dvb-apps-1.1.1.orig/util/av7110_loadkeys/Makefile linuxtv=
-dvb-apps-1.1.1/util/av7110_loadkeys/Makefile
--- linuxtv-dvb-apps-1.1.1.orig/util/av7110_loadkeys/Makefile	2004-01-17 1=
7:59:46.000000000 +0100
+++ linuxtv-dvb-apps-1.1.1/util/av7110_loadkeys/Makefile	2006-09-04 20:09:=
16.000000000 +0200
@@ -1,4 +1,4 @@
-CC =3D gcc
+#CC =3D gcc
 CFLAGS =3D -g -Wall -O2
=20
 all: av7110_loadkeys evtest
Only in linuxtv-dvb-apps-1.1.1/util/av7110_loadkeys: Makefile.orig
diff -ur linuxtv-dvb-apps-1.1.1.orig/util/dvbdate/Makefile linuxtv-dvb-app=
s-1.1.1/util/dvbdate/Makefile
--- linuxtv-dvb-apps-1.1.1.orig/util/dvbdate/Makefile	2004-01-17 17:59:46.=
000000000 +0100
+++ linuxtv-dvb-apps-1.1.1/util/dvbdate/Makefile	2006-09-04 20:10:05.00000=
0000 +0200
@@ -1,11 +1,11 @@
=20
-CC      =3D gcc
-CFLAGS  =3D -g -O2 -MD -Wall -I. -I../../include
+#CC      =3D gcc
+#CFLAGS  =3D -g -O2 -MD -Wall -I. -I../../include
 LFLAGS  =3D
=20
 OBJS    =3D dvbdate.o
 TARGET  =3D dvbdate
-DESTDIR =3D /usr/local/bin/
+#DESTDIR =3D /usr/local/bin/
=20
 all: $(TARGET)
=20
@@ -15,8 +15,8 @@
 $(TARGET): $(OBJS)
 =09$(CC) -o $@ $(OBJS) $(LFLAGS)
=20
-install: all
-	install -m 755 $(TARGET) $(DESTDIR)=20
+#install: all
+#	install -m 755 $(TARGET) $(DESTDIR)=20
=20
 clean:
 =09rm -f $(TARGET) $(OBJS) core* *~ *.d
Only in linuxtv-dvb-apps-1.1.1/util/dvbdate: Makefile.orig
diff -ur linuxtv-dvb-apps-1.1.1.orig/util/dvbnet/Makefile linuxtv-dvb-apps=
-1.1.1/util/dvbnet/Makefile
--- linuxtv-dvb-apps-1.1.1.orig/util/dvbnet/Makefile	2004-01-17 17:59:46.0=
00000000 +0100
+++ linuxtv-dvb-apps-1.1.1/util/dvbnet/Makefile	2006-09-04 20:10:30.000000=
000 +0200
@@ -1,11 +1,11 @@
=20
-CC      =3D gcc
+#CC      =3D gcc
 CFLAGS  =3D -g -O2 -MD -Wall -I. -I../../include
 LFLAGS  =3D
=20
 OBJS    =3D dvbnet.o
 TARGET  =3D dvbnet
-DESTDIR =3D /usr/local/bin/
+#DESTDIR =3D /usr/local/bin/
=20
 all: version.h $(TARGET)
=20
@@ -19,8 +19,8 @@
 =09printf '#define VERSION_INFO "%s (Build %s)"\n' \
 =09	"`cat $@.in`" "`date +'%a %b %d %X %Y'`" > $@
=20
-install: all
-	install -m 755 $(TARGET) $(DESTDIR)=20
+#install: all
+#	install -m 755 $(TARGET) $(DESTDIR)=20
=20
 clean:
 =09rm -f $(TARGET) $(OBJS) version.h core* *~ *.d
Only in linuxtv-dvb-apps-1.1.1/util/dvbnet: Makefile.orig
diff -ur linuxtv-dvb-apps-1.1.1.orig/util/dvbtraffic/Makefile linuxtv-dvb-=
apps-1.1.1/util/dvbtraffic/Makefile
--- linuxtv-dvb-apps-1.1.1.orig/util/dvbtraffic/Makefile	2004-01-19 18:10:=
16.000000000 +0100
+++ linuxtv-dvb-apps-1.1.1/util/dvbtraffic/Makefile	2006-09-04 20:10:52.00=
0000000 +0200
@@ -1,6 +1,6 @@
=20
 dvbtraffic: dvbtraffic.c
-	gcc -MD -g -O2 -Wall -I../../include $< -o $@
+	$CC -MD -g -O2 -Wall -I../../include $< -o $@
=20
 clean:
 =09rm -f *.o *.d dvbtraffic
Only in linuxtv-dvb-apps-1.1.1/util/dvbtraffic: Makefile.orig
diff -ur linuxtv-dvb-apps-1.1.1.orig/util/lib/Makefile linuxtv-dvb-apps-1.=
1.1/util/lib/Makefile
--- linuxtv-dvb-apps-1.1.1.orig/util/lib/Makefile	2004-01-17 17:59:46.0000=
00000 +0100
+++ linuxtv-dvb-apps-1.1.1/util/lib/Makefile	2006-09-04 20:11:07.000000000=
 +0200
@@ -1,5 +1,5 @@
=20
-CC =3D gcc
+#CC =3D gcc
 CFLAGS =3D -MD -g -Wall -O2 -I../../include -I.
 LFLAGS =3D -g -Wall
=20
Only in linuxtv-dvb-apps-1.1.1/util/lib: Makefile.orig
diff -ur linuxtv-dvb-apps-1.1.1.orig/util/scan/Makefile linuxtv-dvb-apps-1=
.1.1/util/scan/Makefile
--- linuxtv-dvb-apps-1.1.1.orig/util/scan/Makefile	2006-05-18 01:34:53.000=
000000 +0200
+++ linuxtv-dvb-apps-1.1.1/util/scan/Makefile	2006-09-04 20:11:22.00000000=
0 +0200
@@ -1,5 +1,5 @@
=20
-CC =3D gcc
+#CC =3D gcc
 CFLAGS =3D -MD -g -Wall -O2 -I../../include
 LFLAGS =3D -g -Wall
=20
Only in linuxtv-dvb-apps-1.1.1/util/scan: Makefile.orig
diff -ur linuxtv-dvb-apps-1.1.1.orig/util/szap/Makefile linuxtv-dvb-apps-1=
.1.1/util/szap/Makefile
--- linuxtv-dvb-apps-1.1.1.orig/util/szap/Makefile	2006-05-18 01:31:54.000=
000000 +0200
+++ linuxtv-dvb-apps-1.1.1/util/szap/Makefile	2006-09-04 20:11:51.00000000=
0 +0200
@@ -1,4 +1,4 @@
-CC =3D gcc
+#CC =3D gcc
 CFLAGS =3D -MD -Wall -g -O2 -I../../include -I../lib
 LFLAGS =3D -Wall -g -O2
 RM =3D rm -f
Only in linuxtv-dvb-apps-1.1.1/util/szap: Makefile.orig
diff -ur linuxtv-dvb-apps-1.1.1.orig/util/ttusb_dec_reset/Makefile linuxtv=
-dvb-apps-1.1.1/util/ttusb_dec_reset/Makefile
--- linuxtv-dvb-apps-1.1.1.orig/util/ttusb_dec_reset/Makefile	2004-01-21 2=
3:13:45.000000000 +0100
+++ linuxtv-dvb-apps-1.1.1/util/ttusb_dec_reset/Makefile	2006-09-04 20:12:=
10.000000000 +0200
@@ -1,4 +1,4 @@
-CC	=3D gcc
+#CC	=3D gcc
 RM	=3D rm -f
 CFLAGS	=3D -g -Wall -O2
 LFLAGS	=3D -g -Wall
Only in linuxtv-dvb-apps-1.1.1/util/ttusb_dec_reset: Makefile.orig

--------------030005040007040808010008--
