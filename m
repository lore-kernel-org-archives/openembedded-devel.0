Received: from web110214.mail.gq1.yahoo.com ([67.195.8.190])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <kaijun61@yahoo.com>) id 1Nn7yk-0000vP-2Z
	for Openembedded-devel@lists.openembedded.org;
	Thu, 04 Mar 2010 11:08:30 +0100
Received: (qmail 71637 invoked by uid 60001); 4 Mar 2010 09:58:51 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1267696730; bh=lC0/5lQONpH32CGDqDKHBkOI4dRPn20xdZcTT308JZ4=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=BO0znWDGsGUEbZP6ugPUtT2UaDpEP5veCxiEv95ZQKOCHdVwWdw8GFvd8Yq/aoKf1NlNfaEiH7wsDSobdRDyFw/pySJ8aFWE3UKMiCJX4YQnl+8rUuUH2DrqrvWwoNKJiPrGE4OHJK5M4HD1Qk/dNxZO9e0+rgi4pgvetJkU1sY=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=CGQmoDsrUpkL88f4ixofz8cE2luK0TJjqz437/n881MM5kTTBvHQNfBGrIpBwSb1H4r9dQLJt/tdfYs33/iaw+BiGBGlf/KaqGzDWYpElCvTwRmjBioqlLZrdoKOQW9sEwL3qBhXK1N3vjYEtiahjXnHWA9R2WRTm5ndCGWr6DM=;
Message-ID: <930003.70932.qm@web110214.mail.gq1.yahoo.com>
X-YMail-OSG: TCop6I8VM1koTPvGW3VDl9CYoM.bX0jn7R77hRDZhvuNAmX
	vN3jNP6yVcM4KZkx4.mkNHqXopp7v5.7M4KdPAs8RMKS1j62uPBLWpDqCnZX
	3BbgqOxWHoGpBkijJwnH2vPVl9KSl7NTkEe79ICvcgpuUBmCQHcu6bR4lLWS
	wC5AEa5grF_8E2MmuLIFT7V5329bh_Z08EBtNyNtCWgAxw29MsUc07BFocZz
	2itHMOY.UXswz6llOB9W7X1xT2aTXBLhistCl9rJDBnnB.zX6AF5V09l_g_r
	UKtvxhKzxo.LHpzW3jf6aMeyjBLlruc3fewcHwX9KyTli_67CBjuCiNwpWrO
	3FDbC264F69JNgnD7lzfMWsWD2gdMIqQV1KnGlizaA7Z5Isk-
Received: from [82.22.157.34] by web110214.mail.gq1.yahoo.com via HTTP;
	Thu, 04 Mar 2010 01:58:50 PST
X-Mailer: YahooMailRC/300.3 YahooMailWebService/0.8.100.260964
Date: Thu, 4 Mar 2010 01:58:50 -0800 (PST)
From: Kaijun Tang <kaijun61@yahoo.com>
To: Openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 67.195.8.190
X-SA-Exim-Mail-From: kaijun61@yahoo.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: beagleboard-demo-image compiling errors in Fedora 12
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
X-List-Received-Date: Thu, 04 Mar 2010 10:08:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I got the following beagleboard-demo-image compiling errors in Fedora 12, x=
86_64 i7 core.=20

=20
| ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a=
8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -Wall -g -DGTK2_12_ENABLED -DGLIB2_14_E=
NABLED -DGIO_ENABLED -DHAVE_ASOUNDLIB -DHAVE_GCONF -DNOTIFY_ENABLED -DHAVE_=
GPOD -DGPOD_06 -DHAVE_MUSICBRAINZ -isystem/home/tang/Project/OE/build/tmp/s=
taging/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations =
-frename-registers -fomit-frame-pointer -O2 -ggdb3  -L/home/tang/Project/OE=
/build/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-rpath-link,/h=
ome/tang/Project/OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi/usr/lib=
 -Wl,-O1 -Wl,--hash-style=3Dgnu -o gnome-mplayer gui.o playlist.o support.o=
 mntent_compat.o main.o dbus-interface.o thread.o libgmtk/libgmtk.a libgmli=
b/libgmlib.a -lX11   -pthread -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2=
.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lf=
reetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-=
2.0=20
  -lgio-2.0 -lgobject-2.0 -lgmodule-2.0 -lglib-2.0   -ldbus-glib-1 -ldbus-=
1 -lpthread -lrt -lgobject-2.0 -lglib-2.0   -lgconf-2 -lglib-2.0   -lasound=
   -lnotify -lgtk-x11-2.0 -ldbus-glib-1 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -=
lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lfreet=
ype -lfontconfig -lgmodule-2.0 -ldbus-1 -lpthread -lrt -lgobject-2.0 -lglib=
-2.0   -lgpod -lgobject-2.0 -lglib-2.0    -lmusicbrainz3 -lneon -lz -lgnutl=
s -lexpat -ldiscid -lcurl   -lXss
| /home/tang/Project/OE/build/tmp/cross/armv7a/lib/gcc/arm-angstrom-linux-=
gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: warning: libst=
dc++.so.6, needed by /home/tang/Project/OE/build/tmp/staging/armv7a-angstro=
m-linux-gnueabi/usr/lib/libmusicbrainz3.so, not found (try using -rpath or =
-rpath-link)
| /home/tang/Project/OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi/us=
r/lib/libmusicbrainz3.so: undefined reference to `std::basic_string<char, s=
td::char_traits<char>, std::allocator<char> >::basic_string(std::basic_stri=
ng<char, std::char_traits<char>, std::allocator<char> > const&, unsigned in=
t, unsigned int)@GLIBCXX_3.4'
| /home/tang/Project/OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi/us=
r/lib/libmusicbrainz3.so: undefined reference to `__cxa_free_exception@CXXA=
BI_1.3'
| /home/tang/Project/OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi/us=
r/lib/libmusicbrainz3.so: undefined reference to `__cxa_guard_acquire@CXXAB=
I_1.3'
| /home/tang/Project/OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi/us=
r/lib/libmusicbrainz3.so: undefined reference to `__cxa_end_catch@CXXABI_1.=
3'
.
.
.

Kind Regards


Kai




From jaume@fqingenieria.es Thu Mar 04 11:13:24 2010
Received: from llsa987-a03.servidoresdns.net ([82.223.190.28])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaume@fqingenieria.es>) id 1Nn83W-00017K-8n
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Mar 2010 11:13:24 +0100
Received: from [127.0.0.1] (ip24258.vig.altecom.net [212.121.242.58])
	by smtp-03.servidoresdns.net (Postfix) with ESMTP id 75B7A604F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Mar 2010 11:01:28 +0100 (CET)
Message-ID: <4B8F84F7.10806@fqingenieria.es>
Date: Thu, 04 Mar 2010 11:01:27 +0100
From: FQ | Jaume Ribot <jaume@fqingenieria.es>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset
