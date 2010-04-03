Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1Ny5Jo-0003A0-GM
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Apr 2010 17:31:29 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 987FA1660568; Sat,  3 Apr 2010 09:28:10 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id CD10A1660559;
	Sat,  3 Apr 2010 09:28:09 -0600 (MDT)
Message-ID: <4BB75E89.6030708@mlbassoc.com>
Date: Sat, 03 Apr 2010 09:28:09 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BB35552.9070508@mlbassoc.com>	<v2q19c1b8a91003311006zc7a7eff8o9f2a88a1f42b6c1d@mail.gmail.com>	<4BB382AA.3040901@mlbassoc.com>
	<1270056997.6277.89.camel@trini-m4400>
In-Reply-To: <1270056997.6277.89.camel@trini-m4400>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: FireFox on PowerPC
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
X-List-Received-Date: Sat, 03 Apr 2010 15:31:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/31/2010 11:36 AM, Tom Rini wrote:
> On Wed, 2010-03-31 at 11:13 -0600, Gary Thomas wrote:
>> On 03/31/2010 11:06 AM, Khem Raj wrote:
>>> On Wed, Mar 31, 2010 at 6:59 AM, Gary Thomas<gary@mlbassoc.com>   wrote:
>>>> Has anyone had success building FireFox for a PowerPC
>>>> target - I'm using the development branch (org.openembedded.dev)
>>>>    MACHINE=efika
>>>>    DISTRO = "angstrom-2008.1"
>>>>
>>>> I've tried to build a number of different FireFox packages,
>>>> none with success.  So far I've tried 2.0.0.3, 3.5.2&   3.6.2
>>>>
>>>> Any pointers?
>>>>
>>>> Query: is there an easy way to build a particular package version?
>>>> What I've done is just add a line like this to my local.conf:
>>>>    PREFERRED_VERSION_firefox="3.5.2"
>>>
>>>
>>> what errors do you get.
>>
>> It depends on the version.  For 3.6.2 (latest), I get this:
>>
>> ccache powerpc-angstrom-linux-g++ -mcpu=603e -mhard-float  -L/local/Angstrom_BeagleBoard/tmp/staging/ppc603e-angstrom-linux/usr/lib
>> -Wl,-rpath-link,/local/Angstrom_BeagleBoard/tmp/staging/ppc603e-angstrom-linux/usr/lib -Wl,-O1 -Wl,--hash-style=gnu -o jsbool.o -c -fvisibility=hidden -DOSTYPE=\"Linux\"
>> -DOSARCH=Linux -DEXPORT_JS_API  -DJS_USE_SAFE_ARENA  -I. -I. -I./../../dist/include -I./../../dist/include/nsprpub
>> -I/local/Angstrom_BeagleBoard/tmp/work/ppc603e-angstrom-linux/firefox-3.6.2-r0/mozilla-1.9.2/dist/include/nspr   -I.    -fPIC
>> -isystem/local/Angstrom_BeagleBoard/tmp/staging/ppc603e-angstrom-linux/usr/include  -fno-rtti -fno-exceptions -Wall -Wpointer-arith -Woverloaded-virtual -Wsynth
>> -Wno-ctor-dtor-privacy -Wno-non-virtual-dtor -Wcast-align -Wno-invalid-offsetof -Wno-variadic-macros -Wno-long-long -pedantic
>> -isystem/local/Angstrom_BeagleBoard/tmp/staging/ppc603e-angstrom-linux/usr/include -Os -fsigned-char -fno-strict-aliasing -fpermissive -fvisibility-inlines-hidden
>> -fno-strict-aliasing -pthread -pipe  -DNDEBUG -DTRIMMED -g -fno-inline -O2  -isystem/local/Angstrom_BeagleBoard/tmp/staging/ppc603e-angstrom-linux/usr/include  -DMOZILLA_CLIENT
>> -include ./js-confdefs.h -Wp,-MD,.deps/jsbool.pp jsbool.cpp
>> jsapi.cpp: In function 'JSBool JS_ConvertArgumentsVA(JSContext*, uintN, jsval*, const char*, __va_list_tag*)':
>> jsapi.cpp:289: error: cannot convert '__va_list_tag**' to '__va_list_tag (*)[1]' for argument '5' to 'JSBool TryArgumentFormatter(JSContext*, const char**, JSBool, jsval**,
>> __va_list_tag (*)[1])'
>> jsapi.cpp: In function 'jsval* JS_PushArgumentsVA(JSContext*, void**, const char*, __va_list_tag*)':
>> jsapi.cpp:398: error: cannot convert '__va_list_tag**' to '__va_list_tag (*)[1]' for argument '5' to 'JSBool TryArgumentFormatter(JSContext*, const char**, JSBool, jsval**,
>> __va_list_tag (*)[1])'
>> make[4]: *** [jsapi.o] Error 1
>> make[4]: *** Waiting for unfinished jobs....
>> make[4]: Leaving directory `/local/Angstrom_BeagleBoard/tmp/work/ppc603e-angstrom-linux/firefox-3.6.2-r0/mozilla-1.9.2/js/src'
>> make[3]: *** [libs_tier_js] Error 2
>> make[3]: Leaving directory `/local/Angstrom_BeagleBoard/tmp/work/ppc603e-angstrom-linux/firefox-3.6.2-r0/mozilla-1.9.2'
>> make[2]: *** [tier_js] Error 2
>> make[2]: Leaving directory `/local/Angstrom_BeagleBoard/tmp/work/ppc603e-angstrom-linux/firefox-3.6.2-r0/mozilla-1.9.2'
>> make[1]: *** [default] Error 2
>> make[1]: Leaving directory `/local/Angstrom_BeagleBoard/tmp/work/ppc603e-angstrom-linux/firefox-3.6.2-r0/mozilla-1.9.2'
>> make: *** [build] Error 2
>> FATAL: oe_runmake failed
>>
>> Note: to even get this far, I had to apply the attached patch
>> as the default setup falls apart with regard to va_list processing.
>
> Oh man that takes me (and I bet you too) back... Sounds like mozilla
> needs some patching again.  Maybe the ppcnux folks have one somewhere
> already tho?
>

I didn't find anything there.

That said, this seems to be a [Make] parallelism problem, not clear why/how.
If I just rerun 'bitbake firefox' which restarts the compile step, it will
run to completion.  I do normally use -j4, but disabling this did not seem
to make any difference.

Note: the previous version I built (3.5.2) did not exhibit this behaviour.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


