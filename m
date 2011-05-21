Received: from 9.26.mail-out.ovh.net ([46.105.56.220] helo=26.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QNmrY-0004rt-A0
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 May 2011 16:09:04 +0200
Received: (qmail 24239 invoked by uid 503); 21 May 2011 13:25:48 -0000
Received: from b9.ovh.net (HELO mail407.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 21 May 2011 13:25:48 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 May 2011 15:59:27 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 21 May 2011 15:59:25 +0200
Message-ID: <4DD7C53C.1090906@eukrea.com>
Date: Sat, 21 May 2011 15:59:24 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1305060012.9982.33.camel@mattotaupa>	<1305061022.9982.44.camel@mattotaupa>
	<4DCE2BF8.50403@eukrea.com>	<1305472473.5838.546.camel@mattotaupa>
	<1305986011.12054.21.camel@mattotaupa>
In-Reply-To: <1305986011.12054.21.camel@mattotaupa>
X-Ovh-Tracer-Id: 14212516000199519561
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: qt4-native: `/usr/include/gnu/stubs.h:9:27: error: gnu/stubs-64.h: No such file or directory` because architecture incorrectly detected
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
X-List-Received-Date: Sat, 21 May 2011 14:09:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Paul,

On 21/05/2011 15:53, Paul Menzel wrote:
> Dear Eric,
>
>
> Am Sonntag, den 15.05.2011, 17:14 +0200 schrieb Paul Menzel:
>
>> Am Samstag, den 14.05.2011, 09:15 +0200 schrieb Eric Bénard:
>>
>>> On 10/05/2011 22:57, Paul Menzel wrote:
>>>> Dear Simon and other OpenEmbedded folks,
>>>>
>>>>
>>>> I am sorry for the wrong subject line. I am fixing it hereby.
>>>>
>>>>
>>>> Am Dienstag, den 10.05.2011, 22:40 +0200 schrieb Paul Menzel:
>>>>
>>>>> task configure of `qt4-native` fails on my build system which is a Xen
>>>>> DomU running a 64-bit Linux kernel but 32-bit user space.
>>>>>
>>>>>           $ uname -a
>>>>>           Linux oe-build-host 2.6.32-5-xen-amd64 #1 SMP Tue Mar 8 00:01:30 UTC 2011 x86_64 GNU/Linux
>>>>>           $ dpkg --print-architecture
>>>>>           i386
>>>>>
>>>>> This seems to be a problem in the Qt4 build system which seems to be
>>>>> using `uname` to determine the architecture.
>>>>>
>>>>>           $ more log.do_configure
>>>>>           + do_configure
>>>>>           + echo o
>>>>>           + echo yes
>>>>>           + ./configure -prefix /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr -L /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/lib -I /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/include -qt-libjpeg -qt-gif -system-zlib -no-libjpeg -no-libpng -no-libmng -no-libtiff -no-accessibility -no-cups -no-nas-sound -no-nis -no-openssl -verbose -release -embedded -no-freetype -no-glib -no-iconv -exceptions -xmlpatterns -qt3support -no-fast -silent -no-rpath
>>>>>           Which edition of Qt do you want to use ?
>>>>>
>>>>>           Type 'c' if you want to use the Commercial Edition.
>>>>>           Type 'o' if you want to use the Open Source Edition.
>>>>>
>>>>>
>>>>>           Determining system architecture... (Linux:2.6.32-5-xen-amd64:x86_64)
>>>>>               64-bit AMD 80x86 (x86_64)
>>>>>               'x86_64' is supported
>>>>>           System architecture: 'x86_64'
>>>>>           Host architecture: 'x86_64'
>>>
>>> this could maybe be fixed by passing -host-arch=i386 to configure but the
>>> problem is to detect you are running a 32bit userland when uname reports 64 bits.
>>> bitbake.conf seems also to use uname :
>>> BUILD_ARCH := "${@os.uname()[4]}"
>>
>> Unfortunately I have not come around a solution to detect this properly.
>> I had the same problem with TeX Live [1] and the solution was to add on
>> option to override this setting [2].
>>
>>> maybe something like file `which init` and analysing the output ?
>>
>> Unfortunately `which init` does not return anything on my Debian
>> Sid/unstable system.
>>
>>          $ which init
>>          $ echo $?
>>          1
>
> searching the WWW for »uname system host architecture 32 64« I found the
> following suggestion [3][4].
>
 From my understanding, lshw only tells you if the CPU has 64bits support or 
not (like cat /proc/cpuinfo). So I can't how that could help here.

Eric


