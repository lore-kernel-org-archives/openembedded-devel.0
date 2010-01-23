Received: from fg-out-1718.google.com ([72.14.220.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NYdJ1-0005fu-3o
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 11:33:30 +0100
Received: by fg-out-1718.google.com with SMTP id 19so208767fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 02:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:in-reply-to
	:references:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	bh=h7ixxqvrBqdkd35fBYMlJ+y1dwUEeTIdTu114jP7V+U=;
	b=MrSe/va0SMZlXnta9KjqLJs3AyikzoePuEG8QayBb83VKNvwPvlu6lLcP/Y6G8fFbv
	bshs9z14LruZ0J5NNj7iJXH+7lZr0NOaPaQu3ouztBrLR9eLo1ugs3D2VeNsvcQQQS7w
	aFi/0U3a4kn7kiBvU/KfRQuhmdqyCOPhynIbA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id
	:mime-version:x-mailer:content-transfer-encoding;
	b=wZepBiphG/ilN805Sj/6YhQ3LFoa/qArNwOIWf5vEzaWkPtAxkM6kCRMUHS2FpA9BK
	TOglwE2JnKPklTMvBboWSoE1zPdMf0Q3Fy4ysJCW5apMOMebdtLAV2+FunPNmeWY/nNb
	crJv4peveRxjE/MHf2Vw+vRbjsQrDYjrRy1tk=
Received: by 10.103.67.24 with SMTP id u24mr2094657muk.77.1264242670075;
	Sat, 23 Jan 2010 02:31:10 -0800 (PST)
Received: from ?188.45.47.163? ([188.45.47.163])
	by mx.google.com with ESMTPS id t10sm12222743muh.14.2010.01.23.02.31.06
	(version=SSLv3 cipher=RC4-MD5); Sat, 23 Jan 2010 02:31:09 -0800 (PST)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100122222101.GC2074@gmail.com>
References: <n> <1264197527-25414-1-git-send-email-michael.lippautz@gmail.com>
	<20100122222101.GC2074@gmail.com>
Date: Sat, 23 Jan 2010 11:31:21 +0100
Message-ID: <1264242681.10526.2.camel@becca>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 72.14.220.159
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] gpsd: Prepare recipe and inc for version bump
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
X-List-Received-Date: Sat, 23 Jan 2010 10:33:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 recipes/gpsd/gpsd.inc     |    9 ++++++---
 recipes/gpsd/gpsd_2.38.bb |    4 +++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/recipes/gpsd/gpsd.inc b/recipes/gpsd/gpsd.inc
index a917fbe..c3e07ec 100644
--- a/recipes/gpsd/gpsd.inc
+++ b/recipes/gpsd/gpsd.inc
@@ -5,12 +5,14 @@ LICENSE = "GPL"
 DEPENDS = "dbus-glib ncurses python"
 PROVIDES = "virtual/gpsd"
 
+INC_PR = "r2"
+
 EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
                 --x-libraries=${STAGING_LIBDIR} \
                 --enable-dbus \
-                --enable-python"
+"
 
-SRC_URI = "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz \
+SRC_URI = "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz;name=gpsd
\
            file://gpsd-default \
            file://gps-hardware \
            file://gpsd"
@@ -28,6 +30,8 @@ LDFLAGS += "-L${STAGING_LIBDIR} -lm"
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 do_compile_prepend() {
     export BUILD_SYS="${BUILD_SYS}"
     export HOST_SYS="${HOST_SYS}"
@@ -41,7 +45,6 @@ do_install_prepend() {
 
 do_install_append() {
         install -d ${D}/${sysconfdir}/init.d
-        install -d ${D}/dev
         install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/init.d/
         install -m 0755 ${WORKDIR}/gps-hardware
${D}/${sysconfdir}/init.d/gps-hardware.default
         install -d ${D}/${sysconfdir}/default
diff --git a/recipes/gpsd/gpsd_2.38.bb b/recipes/gpsd/gpsd_2.38.bb
index 06a5fe7..7c7a477 100644
--- a/recipes/gpsd/gpsd_2.38.bb
+++ b/recipes/gpsd/gpsd_2.38.bb
@@ -1,5 +1,7 @@
 require gpsd.inc
 
-PR = "r2"
+PR = "${INC_PR}.1"
 # make attempts to link gpspacket.so without waiting for all compiler
tasks:
 PARALLEL_MAKE = ""
+
+EXTRA_OECONF += " --enable-python "
-- 
1.6.4.4

Am Freitag, den 22.01.2010, 14:21 -0800 schrieb Khem Raj:
> On (22/01/10 22:58), Michael Lippautz wrote:
> > 
> > Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> > ---
> >  recipes/gpsd/gpsd.inc     |    9 ++++++---
> >  recipes/gpsd/gpsd_2.38.bb |    4 +++-
> >  2 files changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/recipes/gpsd/gpsd.inc b/recipes/gpsd/gpsd.inc
> > index a917fbe..5efbe2a 100644
> > --- a/recipes/gpsd/gpsd.inc
> > +++ b/recipes/gpsd/gpsd.inc
> > @@ -5,12 +5,14 @@ LICENSE = "GPL"
> >  DEPENDS = "dbus-glib ncurses python"
> >  PROVIDES = "virtual/gpsd"
> >  
> > +INC_PR = "r0"
> > +
> 
> this should be set to r2 or more because that was already revision where
> the recipe was at. 
> 
> Otherwise ok.
> 
> >  EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
> >                  --x-libraries=${STAGING_LIBDIR} \
> >                  --enable-dbus \
> > -                --enable-python"
> > +"
> >  
> > -SRC_URI = "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz \
> > +SRC_URI = "http://download.berlios.de/gpsd/gpsd-${PV}.tar.gz;name=gpsd \
> >             file://gpsd-default \
> >             file://gps-hardware \
> >             file://gpsd"
> > @@ -28,6 +30,8 @@ LDFLAGS += "-L${STAGING_LIBDIR} -lm"
> >  export STAGING_INCDIR
> >  export STAGING_LIBDIR
> >  
> > +TARGET_CC_ARCH += "${LDFLAGS}"
> > +
> >  do_compile_prepend() {
> >      export BUILD_SYS="${BUILD_SYS}"
> >      export HOST_SYS="${HOST_SYS}"
> > @@ -41,7 +45,6 @@ do_install_prepend() {
> >  
> >  do_install_append() {
> >          install -d ${D}/${sysconfdir}/init.d
> > -        install -d ${D}/dev
> >          install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/init.d/
> >          install -m 0755 ${WORKDIR}/gps-hardware ${D}/${sysconfdir}/init.d/gps-hardware.default
> >          install -d ${D}/${sysconfdir}/default
> > diff --git a/recipes/gpsd/gpsd_2.38.bb b/recipes/gpsd/gpsd_2.38.bb
> > index 06a5fe7..7c7a477 100644
> > --- a/recipes/gpsd/gpsd_2.38.bb
> > +++ b/recipes/gpsd/gpsd_2.38.bb
> > @@ -1,5 +1,7 @@
> >  require gpsd.inc
> >  
> > -PR = "r2"
> > +PR = "${INC_PR}.1"
> >  # make attempts to link gpspacket.so without waiting for all compiler tasks:
> >  PARALLEL_MAKE = ""
> > +
> > +EXTRA_OECONF += " --enable-python "
> > -- 
> > 1.6.4.4
> > 
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




