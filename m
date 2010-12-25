Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PWbSe-0005Zc-Ta
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 22:15:32 +0100
Received: (qmail 19082 invoked by uid 503); 25 Dec 2010 21:51:31 -0000
Received: from b9.ovh.net (HELO mail189.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 25 Dec 2010 21:51:31 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Dec 2010 23:15:23 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 25 Dec 2010 23:15:21 +0200
Message-ID: <4D165EE8.6050700@eukrea.com>
Date: Sat, 25 Dec 2010 22:15:20 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinBFLqKJci1P1UZFx6FrrzK5gpm7unsjxEpZ8qk@mail.gmail.com>	<AANLkTikXVCmv0phk5OLOMciBOpC296Z2XtF9jO=Bn1Jn@mail.gmail.com>	<20101216154854.GB22134@gmail.com>	<4D14B770.3000601@eukrea.com>	<if2l7k$6v8$1@dough.gmane.org>	<4D163892.4070205@eukrea.com>	<4D163B57.8040808@eukrea.com>
	<4D164D30.3080301@gmail.com>
In-Reply-To: <4D164D30.3080301@gmail.com>
X-Ovh-Tracer-Id: 6838716036281511241
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
X-List-Received-Date: Sat, 25 Dec 2010 21:15:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

On 25/12/2010 20:59, Khem Raj wrote:
> On 12/25/2010 10:43 AM, Eric Bénard wrote:
>>>
>>> error: #warning "Attempt to use kernel headers from user space, see
>>> http://kernelnewbies.org/KernelHeaders"
>>> make[1]: *** [obj/linux/Capture.omap3530.o470MV] Error 1
>>>
>> and removing -Werror to workaround this issue leads to a link error :
>>
>> Linking linux/audio_decode1_omap3530.x470MV from appMain.omap3530.o470MV
>> linux/main.omap3530.o470MV linux/audio_decode1_oma
>> p3530_config/linker.cmd..
>> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/bin/arm-angstrom-linux-gnueabi-gcc
>>
>> -lpthread -lm
>> -L/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
>>
>> -lasound -Wl,-Map,linux/audio_decode1_omap3530.x470MV.map -o
>> linux/audio_decode1_omap3530.x470MV appMain.omap3530.o470MV
>> linux/main.omap3530.o470MV
>> linux/audio_decode1_omap3530_config/linker.cmd/home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
>>
>> warning: linux/audio_decode1_omap3530_config/linker.cmd contains output
>> sections; did you forget -T?
>> /home/ebenard/OMAP/2010/angstrom-setup-scripts/build/tmp-angstrom_2010_x/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
>>
>> .gnu.attributes not found for insert
>
> it seems like linker scripts for this need some scrutiny. How can I reproduce
> this problem.
>
I'm using bitbake & openembedded master + beagleboard machine + angstrom 
2010.x distro + bitbake beagleboard-linuxtag2010-demo-image

Thanks,
Eric


