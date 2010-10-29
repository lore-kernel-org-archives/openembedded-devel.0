Received: from smtplq-out4.aruba.it ([62.149.158.24] helo=smtplq02.aruba.it)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <pierluigi.passaro@phoenixsoftware.it>)
	id 1PBmDf-00032f-G6 for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 12:30:08 +0200
Received: (qmail 3164 invoked by uid 89); 29 Oct 2010 09:29:09 -0000
Received: from unknown (HELO smtp1.aruba.it) (62.149.158.221)
	by smtplq02.aruba.it with SMTP; 29 Oct 2010 09:29:09 -0000
Received: (qmail 26689 invoked by uid 89); 29 Oct 2010 09:29:09 -0000
Received: from unknown (HELO ?192.168.8.32?)
	(pierluigi.passaro@phoenixsoftware.it@78.12.130.33)
	by smtp1.ad.aruba.it with SMTP; 29 Oct 2010 09:29:09 -0000
Message-ID: <4CCA93E5.3070008@phoenixsoftware.it>
Date: Fri, 29 Oct 2010 11:29:09 +0200
From: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CC0C67C.6060806@phoenixsoftware.it>	<AANLkTi=ir567dGvzgOTgwvba3M0k1wyWmAJiwG4HNeJG@mail.gmail.com>	<4CC2029C.5070106@phoenixsoftware.it>
	<AANLkTimYkjGN62vRYHTZD2ykW5X_uP=oUGpOvhbbzd4G@mail.gmail.com>
In-Reply-To: <AANLkTimYkjGN62vRYHTZD2ykW5X_uP=oUGpOvhbbzd4G@mail.gmail.com>
X-SA-Exim-Connect-IP: 62.149.158.24
X-SA-Exim-Mail-From: pierluigi.passaro@phoenixsoftware.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: external-toolchain-csl and libtool 2.4
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
X-List-Received-Date: Fri, 29 Oct 2010 10:30:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for your patches, however the problem is still reproducible 
building libusb-compat with codesourcery toolchain: for some reason, the 
rpath flag is pointing to /usr/lib instead of $lt_sysroot/usr/lib.

The rpath flag, usually not present, is introduced cause generating a 
".lo" file.

Any suggestion?

Following the final part of the log

| /bin/sh ../arm-none-linux-gnueabi-libtool --tag=CC   --mode=link 
arm-none-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon 
-mfloat-abi=softfp -mthumb-interwork -mno-thumb -fvisibility=hidden 
-std=gnu99 -fgnu89-inline -Wall -Wundef -Wunused -Wstrict-prototypes 
-Werror-implicit-function-declaration -Wno-pointer-sign -Wshadow 
-I/home/gigi/code/tmp/sysroots/armv7a-none-linux-gnueabi/usr/include/libusb-1.0   
-isystem/home/gigi/code/tmp/sysroots/armv7a-none-linux-gnueabi/usr/include 
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 
-ggdb2 -version-info 8:4:4 -release 0.1 -Wl,-O1 -Wl,--hash-style=gnu -o 
libusb.la -rpath /usr/lib libusb_la-core.lo -lusb-1.0
| arm-none-linux-gnueabi-libtool: link: arm-none-linux-gnueabi-gcc 
-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp 
-mthumb-interwork -mno-thumb -shared  -fPIC -DPIC  
.libs/libusb_la-core.o   -lusb-1.0  -march=armv7-a -mtune=cortex-a8 
-mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb -O2 -Wl,-O1 
-Wl,--hash-style=gnu   -Wl,-soname -Wl,libusb-0.1.so.4 -o 
.libs/libusb-0.1.so.4.4.4
| 
/opt/codesourcery/arm-2010q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.4.1/../../../../arm-none-linux-gnueabi/bin/ld: 
cannot find -lusb-1.0
| collect2: ld returned 1 exit status
| make[2]: *** [libusb.la] Error 1
| make[2]: Leaving directory 
`/home/gigi/code/tmp/work/armv7a-none-linux-gnueabi/libusb-compat-1_0.1.3-r0/libusb-compat-0.1.3/libusb'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory 
`/home/gigi/code/tmp/work/armv7a-none-linux-gnueabi/libusb-compat-1_0.1.3-r0/libusb-compat-0.1.3'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed
NOTE: package libusb-compat-1_0.1.3-r0: task do_compile: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of 
/home/gigi/code/import/openembedded/recipes/libusb/libusb-compat_0.1.3.bb 
do_compile failed
ERROR: Task 1885 
(/home/gigi/code/import/openembedded/recipes/libusb/libusb-compat_0.1.3.bb, 
do_compile) failed with 256
Waiting for 1 active tasks to finish:
1: gettext-native-0.18-r3 do_configure (pid 2450)
ERROR: 
'/home/gigi/code/import/openembedded/recipes/libusb/libusb-compat_0.1.3.bb' 
failed
NOTE: package gettext-native-0.18-r3: task do_configure: Succeeded
ERROR: 
'/home/gigi/code/import/openembedded/recipes/libusb/libusb-compat_0.1.3.bb' 
failed
ERROR: 
'/home/gigi/code/import/openembedded/recipes/libusb/libusb-compat_0.1.3.bb' 
failed





Khem Raj wrote:
> I have posted a patch to address this issue please try that out
>
> On 10/22/10, Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it> wrote:
>   
>> Khem Raj wrote:
>>     
>>> On Thu, Oct 21, 2010 at 4:02 PM, Pierluigi Passaro
>>> <pierluigi.passaro@phoenixsoftware.it> wrote:
>>>
>>>       
>>>> Hi all,
>>>> LIBTOOL_HAS_SYSROOT feature has been recently enabled on Angstom 2010.x
>>>> distro.
>>>>
>>>> However, using CodeSourcery toolchain, this feature lead to use CSL
>>>> sysroot
>>>> as search path, that is generally different from
>>>> ${STAGING_DIR_TARGET}${libdir} folder used for packages.
>>>>
>>>>         
>>> hmmm yes I see the problem. Right now its left upto the compile to provide
>>> the sysroot which works well with internal toolchain but will not work
>>> with
>>> external toolchains or the compilers which dont support --print-sysroot
>>> option
>>>
>>> I will come up with a patch so specify the sysroot for libtool so that it
>>> does not rely upon the compiler to compute it.
>>>
>>>
>>>       
>> I'm not expert of libtool mechanisms but please let me know I can
>> provide any support.
>>     
>>>> At present I worked around the problem with the attached patch, but I was
>>>> wondering if this could be a misconfiguration or a bug.
>>>>
>>>> Any suggestion will be appreciated.
>>>>
>>>>
>>>>         
>>> With libtool 2.4 I dont see a reason to disable sysroot. The variable is
>>> only
>>> provided to keep libtool 2.2.6 functional as same time. So when using 2.4
>>> please
>>> do not disable the sysroot feature.
>>>
>>>
>>>       
>> I agree with you, I will just keep the patch for personal use, until
>> libtool will not rely on CSL compiler to compute sysroot.
>>     
>>>> Regards
>>>> Gigi
>>>>
>>>> --
>>>> Ing. Pierluigi Passaro
>>>> Viale Don Luigi Sturzo 34
>>>> 30174 Venezia Mestre
>>>> Cel: +39 348 355 4119
>>>> Tel: +39 041 862 3373
>>>> Fax: +39 041 862 3173
>>>> Web: www.phoenixsoftware.it
>>>> P.IVA 03884060272
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>         
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>       
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>     


