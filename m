Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OFab9-0003qz-9o
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 May 2010 00:21:50 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id BFB3716606D6; Fri, 21 May 2010 16:17:40 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 8D4F016606D2;
	Fri, 21 May 2010 16:17:39 -0600 (MDT)
Message-ID: <4BF70683.3090704@mlbassoc.com>
Date: Fri, 21 May 2010 16:17:39 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BF69D04.5060506@mlbassoc.com>
	<AANLkTik1pMbRIMYx01oR0eA4xwruqMaSI8qoggbgPHwd@mail.gmail.com>
In-Reply-To: <AANLkTik1pMbRIMYx01oR0eA4xwruqMaSI8qoggbgPHwd@mail.gmail.com>
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
X-List-Received-Date: Fri, 21 May 2010 22:21:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2010 02:27 PM, Khem Raj wrote:
> On Fri, May 21, 2010 at 7:47 AM, Gary Thomas<gary@mlbassoc.com>  wrote:
>> Trying a clean build
>>   MACHINE="beagleboard"
>>   DISTRO="angstrom-2008.1"
>>   org.openembedded.dev 2c153f33b8ebb807a622ad9ae92ed5341a356740
>>
>> I get failures like this (in many packages):
>>   /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:138:
>> error: expected '=', ',', ';', 'asm' or '__attribute__' before 're_void'
>>   /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:298:
>> error: expected '=', ',', ';', 'asm' or '__attribute__' before 'int'
>>   /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:307:
>> error: expected '=', ',', ';', 'asm' or '__attribute__' before 'int'
>>   /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:309:
>> error: expected '=', ',', ';', 'asm' or '__attribute__' before 're_void'
>>   /local/Angstrom_BeagleBoard/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/regex.h:310:
>> error: expected '=', ',', ';', 'asm' or '__attribute__' before 'size_t'
>>
>> The problem is that the compiler include file<regex.h>  is
>> not the standard/default one, rather the file from tcl!
>> I replaced the bogus regex.h file with the correct one and
>> my build completes&  runs.
>
> its tcl dev package bug it should have installed its version into
> /usr/include/tcl<ver>  instead of overwriting the existing version in sysroot.
>
> I can see the problem in the recipes if you are using 8.5.8 then
> try this untested patch and let me know if it helps
>
> diff --git a/recipes/tcltk/tcl_8.5.8.bb b/recipes/tcltk/tcl_8.5.8.bb
> index 220e858..dd5c810 100644
> --- a/recipes/tcltk/tcl_8.5.8.bb
> +++ b/recipes/tcltk/tcl_8.5.8.bb
> @@ -33,7 +33,8 @@ BINCONFIG_GLOB = "*Config.sh"
>   do_install() {
>          autotools_do_install
>          # Stage a few extra headers to make tk happy
> -       install -m 0644 ../generic/*.h ${D}${includedir}
> +       install -d ${D}${includedir}/tcl8.5/generic/
> +       install -m 0644 ../generic/*.h ${D}${includedir}/tcl8.5/generic/
>          install -m 0644 *.h ${D}${includedir}
>          ln -sf tclsh8.5 ${D}${bindir}/tclsh
>   }
>

Sorry, that patch/file does not line up at all with what's in
my tree.  Is it valid for org.openembedded.dev commit 0609b025f410ed09400404ab6af8775c78685b17?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


