Received: from mail.borenet.se ([213.134.106.117] helo=mail-storage.borenet.se)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xerxes@zafena.se>) id 1OcFvh-0006Mw-Tg
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 12:57:00 +0200
Received: from [192.168.1.106] (labb.zafena.se [213.134.106.61])
	by mail-storage.borenet.se (Postfix) with ESMTP id A3DC830DCC2;
	Fri, 23 Jul 2010 12:56:20 +0200 (CEST)
Message-ID: <4C4975C6.5030405@zafena.se>
Date: Fri, 23 Jul 2010 12:58:14 +0200
From: =?ISO-8859-1?Q?Xerxes_R=E5nby?= <xerxes@zafena.se>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.10) Gecko/20100527 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <i216cf$pju$1@dough.gmane.org>
	<4C46DCE3.1080207@zafena.se>	<20100721142016.GH2189@jama>
	<AANLkTikeJTj01x057Rur8H0haeDehcVVPqaQzDLq2dd6@mail.gmail.com>
In-Reply-To: <AANLkTikeJTj01x057Rur8H0haeDehcVVPqaQzDLq2dd6@mail.gmail.com>
X-SA-Exim-Connect-IP: 213.134.106.117
X-SA-Exim-Mail-From: xerxes@zafena.se
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: Openjdk shark and cacao VMs not working - armv4 LLVM symbol powf, version GLIBCXX_3.4 not, defined
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
X-List-Received-Date: Fri, 23 Jul 2010 10:58:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 2010-07-22 17:15, Martin Jansa wrote:
> On Wed, Jul 21, 2010 at 4:20 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>   
>> FYI:
>>
>> Tested on om-gta02 (armv4t) and only -zero seems to work (built from
>> yesterday oe.dev, waiting for todays fixes to built).
>>
>> SHR root@gojama ~ $ javac -zero Linpack.java
>> Warning: no leading - on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
>> Warning: missing VM type on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
>> Warning: no leading - on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
>> Warning: missing VM type on line 43 of `/usr/lib/jvm/java-6-openjdk/jre/lib/arm/jvm.cfg'
>>     
> With current version jvm.cfg warnings are gone, but cacao and shark still fails
> SHR root@gojama ~ $ java -zero Linpack
> Mflops/s: 1.691  Time: 0.41 secs  Norm Res: 1.43  Precision:
> 2.220446049250313E-16
>   
We are quite happy with the current default zero vm in OE since we do
not have any open bugreports for it, it seems stable and nice. :)

> SHR root@gojama ~ $ java -cacao Linpack
> LOG: [0x40190000] md_signal_handler_sigill: Unknown illegal
> instruction 0xed1c5a06 at 0x441c2790
> LOG: [0x40190000] Aborting...
> Aborted
>   
This regression on armv4 and armv5 are most likely caused by the
"armv7" cacao compatible patches bundled with icedtea6-1.8.

I will check if i can see anything obvious and try to debug it.

> SHR root@gojama ~ $ java -shark Linpack
> dl failure on line 696Error: failed
> /usr/lib/jvm/java-6-openjdk/jre/lib/arm/shark/libjvm.so, because
> /usr/lib/libLLVMCodeGen.so: symbol powf, version GLIBCXX_3.4 not
> defined in file libstdc++.so.6 with link time reference
>   
It looks like a different (older?) libstdc++ are used on your phone
compared to whats got used during the build when linking LLVM.
It would be good to check if a LLVM "HelloWorld" can get executed on the
phone.

Please try this LLVM testcase on your phone and report if it work or not:
======== start of file hello.ll
@hello = internal global [12 x i8] c"Hello World\00"

declare i32 @puts(i8*)

define i32 @main() {
    %r = call i32 @puts( i8* getelementptr ([12 x i8]* @hello, i64 0,
i64 0) )
    ret i32 0
}
======== end of file hello.ll
and then execute the following two commands:
llvm-as hello.ll
lli hello.bc

its possible that you have to type
/usr/bin/llvm2.7/llvm-as hello.ll
/usr/bin/llvm2.7/lli hello.bc

If all goes well then you should see.. yes you guessed it:
HelloWorld

If it fail then try updating the libstdc++ to the same version used when
linking llvm.
check if libm are installed.

> Let me know if you want more info.
>   



