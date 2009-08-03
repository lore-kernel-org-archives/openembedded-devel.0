Received: from [58.185.154.238] (helo=cassis-intl.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <galvez.andy@cassis-intl.com>) id 1MXp19-0003U9-Ux
	for openembedded-devel@openembedded.org; Mon, 03 Aug 2009 06:19:24 +0200
Received: (qmail 15516 invoked by uid 509); 3 Aug 2009 11:58:05 +0800
Received: from 10.65.9.1 by postman.cassis-intl.com (envelope-from
	<galvez.andy@cassis-intl.com>,
	uid 501) with qmail-scanner-1.25-st-qms 
	(clamdscan: 0.83/1213. spamassassin: 3.0.4. perlscan: 1.25-st-qms.  
	Clear:RC:1(10.65.9.1):. 
	Processed in 0.033065 secs); 03 Aug 2009 03:58:05 -0000
X-Antivirus-MYDOMAIN-Mail-From: galvez.andy@cassis-intl.com via
	postman.cassis-intl.com
X-Antivirus-MYDOMAIN: 1.25-st-qms (Clear:RC:1(10.65.9.1):. Processed in
	0.033065 secs Process 15510)
Received: from unknown (HELO galvezljxpdt1) (10.65.9.1)
	by cassis-intl.com with SMTP; 3 Aug 2009 11:58:05 +0800
Message-ID: <DAE7325AE217459DAF9E0769B867ED98@sg01.cassis>
From: "Leandro Q. Galvez" <galvez.andy@cassis-intl.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 3 Aug 2009 12:12:38 +0800
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5512
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
Subject: libtool/libltdl problem
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
X-List-Received-Date: Mon, 03 Aug 2009 04:19:24 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit


Hi,

    I am trying to compile opie-image from a newly fetched sources from 
openembedded. But I hit this stumbling block that prevented me to make any 
progress for the whole day. My openembedded environment already built the 
libtool 2.2.4-r16 based on the dependency requirements of the opie-image 
receipe. But when the build process reached pulseaudio 0.9.15-r8.4, the 
process stopped with an error about liltdl not being found. searched through 
the directory and I confirmed that all the install and devel files are in 
the staging/../user/lib folder. Searched through the net and all the hits 
point that libtool 2.2 is required for this pulseaudio version. But all the 
files are there. Can anybody help me through this?

exact message extracted from oe's tmp/log.do_configure:
checking for lt_dladvise_init in -lltdl... no
configure: error: Unable to find libltdl
FATAL: oe_runconf failed

exact message extracted from pulseaudio's config.log:
configure:12966: checking ltdl.h usability
configure:12983: ccache 
arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork 
 -mno-thumb -std=gnu99 -c -isystem/media/OpieDrive/oebase/dragon/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/include 
 -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 
 -Wall -W -Wextra -pipe -Wno-long-long -Winline -Wvla -Wno-overlength-strings 
 -Wunsafe-loop-optimizations -Wundef -Wformat=2 -Wlogical-op -Wsign-compare  
-Wformat-security -Wmissing-include-dirs -Wformat-nonliteral -Wold-style-definition 
 -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes 
 -Wstrict-prototypes -Wredundant-decls -Wmissing-declarations -Wmissing-noreturn 
 -Wshadow -Wendif-labels -Wcast-align -Wstrict-aliasing=2 -Wwrite-strings -Wno-unused-parameter 
 -ffast-math -Wp,-D_FORTIFY_SOURCE=2 -fno-common -fdiagnostics-show-option -isystem/media/OpieDrive/oebase/dragon/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/include 
conftest.c >&5
configure:12990: $? = 0
configure:13004: result: yes
configure:13008: checking ltdl.h presence
configure:13023: 
arm-angstrom-linux-gnueabi-gcc -E -isystem/media/OpieDrive/oebase/dragon/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/include 
conftest.c
configure:13030: $? = 0
configure:13044: result: yes
configure:13077: checking for ltdl.h
configure:13084: result: yes
configure:13089: checking for lt_dladvise_init in -lltdl
configure:13124: ccache 
arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork 
 -mno-thumb -std=gnu99 -o 
conftest -isystem/media/OpieDrive/oebase/dragon/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/include 
 -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 
 -Wall -W -Wextra -pipe -Wno-long-long -Winline -Wvla -Wno-overlength-strings 
 -Wunsafe-loop-optimizations -Wundef -Wformat=2 -Wlogical-op -Wsign-compare  
-Wformat-security -Wmissing-include-dirs -Wformat-nonliteral -Wold-style-definition 
 -Wpointer-arith -Winit-self -Wdeclaration-after-statement -Wfloat-equal -Wmissing-prototypes 
 -Wstrict-prototypes -Wredundant-decls -Wmissing-declarations -Wmissing-noreturn 
 -Wshadow -Wendif-labels -Wcast-align -Wstrict-aliasing=2 -Wwrite-strings -Wno-unused-parameter 
 -ffast-math -Wp,-D_FORTIFY_SOURCE=2 -fno-common -fdiagnostics-show-option -isystem/media/OpieDrive/oebase/dragon/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/include 
 -L/media/OpieDrive/oebase/dragon/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/lib -Wl,-rpath-link,/media/OpieDrive/oebase/dragon/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=gnu conftest.c -lltdl >&5conftest.c:38: warning: function declaration isn't a prototype[-Wstrict-prototypes]conftest.c:41: warning: function declaration isn't a prototype[-Wstrict-prototypes]conftest.c: In function 'main':conftest.c:41: warning: old-style function definition[-Wold-style-definition]/media/OpieDrive/oebase/dragon/tmp/staging/armv5te-angstrom-linux-gnueabi/usr/lib/libltdl.so: undefined reference to `lt_libltdl_LTX_preloaded_symbols'collect2: ld returned 1 exit statusThanks and best regards,Andy


