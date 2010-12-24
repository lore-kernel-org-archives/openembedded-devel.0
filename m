Received: from 29.mail-out.ovh.net ([87.98.216.213])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PW9G9-0001gv-GB
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 16:08:45 +0100
Received: (qmail 27428 invoked by uid 503); 24 Dec 2010 15:24:34 -0000
Received: from b6.ovh.net (HELO mail642.ha.ovh.net) (213.186.33.56)
	by 29.mail-out.ovh.net with SMTP; 24 Dec 2010 15:24:34 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 24 Dec 2010 17:09:25 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 24 Dec 2010 17:09:24 +0200
Message-ID: <4D14B770.3000601@eukrea.com>
Date: Fri, 24 Dec 2010 16:08:32 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinBFLqKJci1P1UZFx6FrrzK5gpm7unsjxEpZ8qk@mail.gmail.com>	<AANLkTikXVCmv0phk5OLOMciBOpC296Z2XtF9jO=Bn1Jn@mail.gmail.com>
	<20101216154854.GB22134@gmail.com>
In-Reply-To: <20101216154854.GB22134@gmail.com>
X-Ovh-Tracer-Id: 13232701605616069961
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: testing branch 2010-12-10
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
X-List-Received-Date: Fri, 24 Dec 2010 15:08:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Khem,

On 16/12/2010 16:48, Khem Raj wrote:
> On (16/12/10 08:55), Cliff Brake wrote:
>> beagleboard beagleboard-linuxtag2010-demo-image is failing with:
>>
>> http://tinderbox.openembedded.net/packages/1321155/
>>
>> ti-c6accel
>>
>> Linking c6accel_app from appMain.o c6accel_testfxns.o
>> ../c6accelw/lib/c6accelw_omap3530.a470MV
>> c6accel_app_config/linker.cmd..
>> /lib/libgcc_s.so.1: file not recognized: File format not recognized
>
>
> Have you tried with latest .dev ? It might work with latest .dev
> I have fixed libgcc install locations
>
I tested beagleboard-linuxtag2010-demo-image for machine beagleboard with 
today's master and it still fails with the following messages :

Linking c6accel_app from appMain.o c6accel_testfxns.o 
../c6accelw/lib/c6accelw_omap3530.a470MV c6accel_app_config/linker.cmd..
/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: 
warning: c6accel_app_config/linker.cmd contains output sections; did you 
forget -T?
/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: 
skipping incompatible /lib/libgcc_s.so.1 when searching for libgcc_s.so.1
/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: 
skipping incompatible /lib/libgcc_s.so.1 when searching for libgcc_s.so.1
/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: 
.gnu.attributes not found for insert
collect2: ld returned 1 exit status
make[2]: *** [c6accel_app] Error 1

Do you have any idea on how to fix this ?

Eric


