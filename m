Received: from [128.178.224.219] (helo=smtp0.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MfyXc-0008Rx-P9
	for openembedded-devel@openembedded.org; Tue, 25 Aug 2009 18:06:36 +0200
Received: (qmail 8936 invoked by uid 107); 25 Aug 2009 15:48:29 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Tue, 25 Aug 2009 17:48:29 +0200
Message-ID: <4A9407CD.9020708@epfl.ch>
Date: Tue, 25 Aug 2009 17:48:29 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A937831.2000304@4d-electronics.co.nz> <4A93A9E3.7090605@epfl.ch>
	<200908251303.12718.holger+oe@freyther.de>
In-Reply-To: <200908251303.12718.holger+oe@freyther.de>
Subject: Re: [PATCH] Add toolchain file generation to cmake bbclass
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
X-List-Received-Date: Tue, 25 Aug 2009 16:06:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Tuesday 25 August 2009 11:07:47 Valentin Longchamp wrote:
>> Matthew Dombroski wrote:
>>> It is possible to make cmake use a toolchain file that defines flags,
>>> search
>>> paths and any other cmake options.
>>>
>>> The main reason for making openembedded generate a toolchain file is
>>> to enable the building of complex packages. Without it a package
>>> requiring Qt4 or boost (or one of many other packages) probably wont find
>>> the right libs and won't build properly.
>> I have had no problem with boost and with Qt4, I have been able to
>> achieve similar results without the toolchain file, only by using a
>> qt.conf file as Zecke had suggested to me.
> 
> Hey,
> 
> could you come up with a patch or help me to work on a patch?

With great pleasure.

I have already posted the recipe I use for qt4/cmake build, the 
FindQt4.cmake module patch is the same Matthew posted earlier today, and 
here is my cmake patch.

Don't hesitate to ask if you need more info (I'll try to be on IRC, 
Longfield)

Val

 From 290226efcab3375808924efb03d264534ab97984 Mon Sep 17 00:00:00 2001
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
Date: Thu, 18 Jun 2009 18:49:04 +0200
Subject: [PATCH 1/1] render cmake search path stricter

The search is only done in the STAGING directy: all the needed tools
should be there (already built) and all the libs and header are there
too. With this, we are sure that we do not mix with the host libs,
headers or tools.

Signed-off-by: Valentin Longchamp <valentin.longchamp@epfl.ch>
---
  classes/cmake.bbclass |    5 ++++-
  1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
index b5b7b86..08a4ab5 100644
--- a/classes/cmake.bbclass
+++ b/classes/cmake.bbclass
@@ -20,7 +20,10 @@ cmake_do_configure() {

    cmake ${OECMAKE_SOURCEPATH} \
      -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
-    -DCMAKE_FIND_ROOT_PATH=${STAGING_DIR_HOST} \
+    -DCMAKE_FIND_ROOT_PATH="${STAGING_DIR_HOST};${STAGING_DIR_NATIVE}" \
+    -DCMAKE_FIND_ROOT_PATH_MODE_PROGRAM=BOTH \
+    -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY \
+    -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
      ${EXTRA_OECMAKE} \
      -Wno-dev
  }
-- 
1.6.0.4




