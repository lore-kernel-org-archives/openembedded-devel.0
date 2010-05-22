Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OFnJ5-00043L-16
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 May 2010 13:55:57 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 1435216603B3; Sat, 22 May 2010 05:51:50 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id D54ED166037F;
	Sat, 22 May 2010 05:51:47 -0600 (MDT)
Message-ID: <4BF7C553.2090901@mlbassoc.com>
Date: Sat, 22 May 2010 05:51:47 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BF69D04.5060506@mlbassoc.com>
	<AANLkTik1pMbRIMYx01oR0eA4xwruqMaSI8qoggbgPHwd@mail.gmail.com>
	<4BF70683.3090704@mlbassoc.com>
In-Reply-To: <4BF70683.3090704@mlbassoc.com>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: staging problem
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
X-List-Received-Date: Sat, 22 May 2010 11:55:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2010 04:17 PM, Gary Thomas wrote:
> On 05/21/2010 02:27 PM, Khem Raj wrote:
>> On Fri, May 21, 2010 at 7:47 AM, Gary Thomas<gary@mlbassoc.com> wrote:
>>> Trying a clean build
>>> MACHINE="beagleboard"
>>> DISTRO="angstrom-2008.1"
>>> org.openembedded.dev 2c153f33b8ebb807a622ad9ae92ed5341a356740
>>>
>>> I get failures like this (in many packages):
>>> /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:138:
>>>
>>> error: expected '=', ',', ';', 'asm' or '__attribute__' before 're_void'
>>> /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:298:
>>>
>>> error: expected '=', ',', ';', 'asm' or '__attribute__' before 'int'
>>> /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:307:
>>>
>>> error: expected '=', ',', ';', 'asm' or '__attribute__' before 'int'
>>> /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:309:
>>>
>>> error: expected '=', ',', ';', 'asm' or '__attribute__' before 're_void'
>>> /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:310:
>>>
>>> error: expected '=', ',', ';', 'asm' or '__attribute__' before 'size_t'
>>>
>>> The problem is that the compiler include file<regex.h> is
>>> not the standard/default one, rather the file from tcl!
>>> I replaced the bogus regex.h file with the correct one and
>>> my build completes& runs.
>>
>> its tcl dev package bug it should have installed its version into
>> /usr/include/tcl<ver> instead of overwriting the existing version in
>> sysroot.
>>
>> I can see the problem in the recipes if you are using 8.5.8 then
>> try this untested patch and let me know if it helps
>>
>> diff --git a/recipes/tcltk/tcl_8.5.8.bb b/recipes/tcltk/tcl_8.5.8.bb
>> index 220e858..dd5c810 100644
>> --- a/recipes/tcltk/tcl_8.5.8.bb
>> +++ b/recipes/tcltk/tcl_8.5.8.bb
>> @@ -33,7 +33,8 @@ BINCONFIG_GLOB = "*Config.sh"
>> do_install() {
>> autotools_do_install
>> # Stage a few extra headers to make tk happy
>> - install -m 0644 ../generic/*.h ${D}${includedir}
>> + install -d ${D}${includedir}/tcl8.5/generic/
>> + install -m 0644 ../generic/*.h ${D}${includedir}/tcl8.5/generic/
>> install -m 0644 *.h ${D}${includedir}
>> ln -sf tclsh8.5 ${D}${bindir}/tclsh
>> }
>>
>
> Sorry, that patch/file does not line up at all with what's in
> my tree. Is it valid for org.openembedded.dev commit
> 0609b025f410ed09400404ab6af8775c78685b17?
>

I applied the patch manually and while it does fix the /usr/include
pollution, it breaks building of 'tk'.  You'll probably need a
completely fresh build to see the problem.

ccache arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -c -O2 
-isystem/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3 -pipe 
-isystem/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include -Wall -fPIC 
-I/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/tk-8.5.8-r1/tk8.5.8/unix/../unix 
-I/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/tk-8.5.8-r1/tk8.5.8/unix/../generic 
-I/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/tk-8.5.8-r1/tk8.5.8/unix/../bitmaps 
-I/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/generic 
-I/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/unix -I/local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include 
-DPACKAGE_NAME=\"tk\" -DPACKAGE_TARNAME=\"tk\" -DPACKAGE_VERSION=\"8.5\" -DPACKAGE_STRING=\"tk\ 8.5\" -DPACKAGE_BUGREPORT=\"\" -DPACKAGE_URL=\"\" -DSTDC_HEADERS=1 
-DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 
-DHAVE_LIMITS_H=1 -DUSE_THREAD_ALLOC=1 -D_REENTRANT=1 -D_THREAD_SAFE=1 -DHAVE_PTHREAD_ATTR_SETSTACKSIZE=1 -DHAVE_PTHREAD_GETATTR_NP=1 -DGETATTRNP_NOT_DECLARED=1 -DTCL_THREADS=1 
-DMODULE_SCOPE=extern\ __attribute__\(\(__visibility__\(\"hidden\"\)\)\) -DTCL_SHLIB_EXT=\".so\" -DTCL_CFG_OPTIMIZED=1 -DTCL_CFG_DEBUG=1 -D_LARGEFILE64_SOURCE=1 
-DTCL_WIDE_INT_TYPE=long\ long -DHAVE_STRUCT_STAT64=1 -DHAVE_OPEN64=1 -DHAVE_LSEEK64=1 -DHAVE_TYPE_OFF64_T=1 -DHAVE_SYS_TIME_H=1 -DTIME_WITH_SYS_TIME=1 -Dstrtod=fixstrtod 
-DHAVE_INTPTR_T=1 -DHAVE_UINTPTR_T=1 -DHAVE_PW_GECOS=1 -DHAVE_LIBXFT=1 -DHAVE_XFT=1     -DTCL_NO_DEPRECATED  -DUSE_TCL_STUBS 
/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/tk-8.5.8-r1/tk8.5.8/unix/../generic/tkOption.c
/local/Angstrom_BeagleBoard/tmp/work/armv7a-angstrom-linux-gnueabi/tk-8.5.8-r1/tk8.5.8/unix/../generic/tkMain.c:22:20: error: tclInt.h: No such file or directory

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


