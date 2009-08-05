Received: from [209.85.146.176] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MYa8Z-0005tB-A3
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Aug 2009 08:38:13 +0200
Received: by wa-out-1112.google.com with SMTP id m34so583481wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Aug 2009 23:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=Vtb2Y0ays3qsJxjHCYi9sQQnsqB5DcW5AAGc1Lqm3XI=;
	b=wzS/iSV+5Amj+2fShpu8bVHe+pKbw8eiK4dEugkP1Fwt5rIkkD/edyBPCa+uvV3OT+
	tdI6/CDyEMUS4Y0kwFi4YMFZKrRpK6bbHFCvafBwkkhR2LH8VbzuDIl67bpMNNldslvv
	LvIvS5r3Ex3sBIywDkdBfaDp2nIwRrVU9Q5+M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=v8gyDgMIx/Y42e/i3+6T7c3zDZk2fpzX1i3VByYhVvhv6UDdI18wPmoxaXfVm6UssK
	itO8EfveSUOf4Wj5J7sRivRSlFavUx9e+n1/CEAdeEG8/PTyMc6gEEBgq2FqyUmTNPVw
	OWBwP1U3IeJJ4CmG3O2Lw5+qVRGoDYhl2EXPI=
Received: by 10.115.48.5 with SMTP id a5mr11138397wak.132.1249453352728;
	Tue, 04 Aug 2009 23:22:32 -0700 (PDT)
Received: from ?10.0.0.19? (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	j31sm12797722waf.49.2009.08.04.23.22.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 04 Aug 2009 23:22:32 -0700 (PDT)
Message-ID: <4A792519.20506@gmail.com>
Date: Wed, 05 Aug 2009 15:52:17 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] fix portmap on mips, remove old slugos workaround
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
X-List-Received-Date: Wed, 05 Aug 2009 06:38:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Portmap built for mipsel with gcc-4.3.3 segfaults instantly, fails to build
with gcc-4.4 and provides the following:

| /home/grg/oe/tmp/cross/mipsel/lib/gcc/mipsel-angstrom-linux/4.4.1/../../../../mipsel-angstrom-linux/bin/ld: portmap.o: relocation R_MIPS_HI16 against `__gnu_local_gp' can not be used when making a shared object; recompile with -fPIC

The CFLAGS in portmap's Makefile contains -fpie, but is ignored. The
CFLAGS I've added below are constructed from portmap's Makefile. When
built with gcc-4.3.3 the resultant binary no longer segfaults.

RE: Remove this patch when SlugOS upgrades to binutils 1.18
It looks like this is now the case, so I've removed the slugos workaround.

-Graham

diff --git a/recipes/portmap/portmap-6.0/no-pie.patch b/recipes/portmap/portmap-6.0/no-pie.patch
deleted file mode 100644
index 4d7e2da..0000000
--- a/recipes/portmap/portmap-6.0/no-pie.patch
+++ /dev/null
@@ -1,14 +0,0 @@
---- portmap_6.0/Makefile.orig	2007-11-21 00:35:52.000000000 -0600
-+++ portmap_6.0/Makefile	2007-11-21 00:37:23.000000000 -0600
-@@ -125,9 +125,9 @@
- all:	portmap pmap_dump pmap_set portmap.man
- 
- CPPFLAGS += $(HOSTS_ACCESS)
--portmap: CFLAGS   += -fpie
-+#portmap: CFLAGS   += -fpie
- portmap: LDLIBS   += $(WRAP_LIB)
--portmap: LDFLAGS  += -pie
-+#portmap: LDFLAGS  += -pie
- portmap: portmap.o pmap_check.o from_local.o
- 
- from_local: CPPFLAGS += -DTEST
diff --git a/recipes/portmap/portmap_6.0.bb b/recipes/portmap/portmap_6.0.bb
index cb94a48..501aa5d 100644
--- a/recipes/portmap/portmap_6.0.bb
+++ b/recipes/portmap/portmap_6.0.bb
@@ -1,6 +1,6 @@
 require portmap.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/portmap-6.0.tgz \
            file://destdir-no-strip.patch;patch=1 \
@@ -8,12 +8,10 @@ SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/portmap-6.
            file://no-libwrap.patch;patch=1;pnum=0 \
            file://portmap.init "
 
-# Remove this patch when SlugOS upgrades to binutils 1.18
-SRC_URI_append_slugos = " file://no-pie.patch;patch=1 "
-
 S = "${WORKDIR}/${PN}_${PV}/"
 
 CPPFLAGS += "-DFACILITY=LOG_DAEMON -DENABLE_DNS"
+CFLAGS += "-O2 -Wall -Wstrict-prototypes -fpie"
 
 fakeroot do_install() {
     install -d ${D}${mandir}/man8/ ${D}${base_sbindir} ${D}${sysconfdir}/init.d


