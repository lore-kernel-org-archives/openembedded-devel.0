Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PYNsq-000899-1R
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 20:09:56 +0100
Received: (qmail 8005 invoked by uid 503); 30 Dec 2010 18:52:11 -0000
Received: from b9.ovh.net (HELO mail413.ha.ovh.net) (213.186.33.59)
	by 64.mail-out.ovh.net with SMTP; 30 Dec 2010 18:52:11 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 30 Dec 2010 21:09:40 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 30 Dec 2010 21:09:39 +0200
Message-ID: <4D1CD8F2.6000209@eukrea.com>
Date: Thu, 30 Dec 2010 20:09:38 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D1C4E4A.5000705@eukrea.com> <ifhrie$a01$1@dough.gmane.org>
	<ifije4$p3n$1@dough.gmane.org>
In-Reply-To: <ifije4$p3n$1@dough.gmane.org>
X-Ovh-Tracer-Id: 15632838732123188553
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: ti-c6accel-1_01_00_01: link error
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
X-List-Received-Date: Thu, 30 Dec 2010 19:09:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Koen,

same problems exists with ti-dmai (which also shows another one as a bonus ;-)

oe master + angstrom-2010.x + beagleboard leads to :

.../... /usr/include -Dxdc_target_name__=arm/GCArmv5T -g -Wall -Werror -c -o 
obj/linux/Capture.omap3530.o470MV linux/Capture.c
cc1: warnings being treated as errors
In file included from 
/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/beagleboard-angstrom-linux-gnueabi/kernel/include/linux/videodev2.h:66:0,
                  from linux/Capture.c:43:
/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/beagleboard-angstrom-linux-gnueabi/kernel/include/linux/types.h:13:2: 
error: #warning "Attempt to use kernel headers from user space, see 
http://kernelnewbies.org/KernelHeaders"
make[1]: *** [obj/linux/Capture.omap3530.o470MV] Error 1

this can be "fixed" by removing -Werror in the makefile but then I meet the 
same problem as with ti-c6accel :

Linking linux/audio_decode1_omap3530.x470MV from appMain.omap3530.o470MV 
linux/main.omap3530.o470MV linux/audio_decode1_omap3530_config/linker.cmd..
/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/bin/arm-angstrom-linux-gnueabi-gcc 
  -lpthread -lm 
-L/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib 
-lasound -Wl,-Map,linux/audio_decode1_omap3530.x470MV.map -o 
linux/audio_decode1_omap3530.x470MV appMain.omap3530.o470MV 
linux/main.omap3530.o470MV linux/audio_decode1_omap3530_config/linker.cmd
/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: 
warning: linux/audio_decode1_omap3530_config/linker.cmd contains output 
sections; did you forget -T?
/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: 
.gnu.attributes not found for insert
collect2: ld returned 1 exit status

Eric


