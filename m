Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1P1ggT-0003GS-QG
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 16:34:09 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1P1ggE-00031q-SG from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 07:33:46 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 1 Oct 2010 07:33:44 -0700
Received: from [172.30.80.12] ([172.30.80.12]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 1 Oct 2010 08:33:25 -0600
Message-ID: <4CA5F12F.8050103@mentor.com>
Date: Fri, 01 Oct 2010 07:33:19 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1283946231-29039-1-git-send-email-fahad_usman@mentor.com>	<alpine.LNX.2.00.1009091126390.11516@asterix.crazy-teaparty.dyndns.org>	<1285937266.4079.14.camel@mattotaupa>
	<4CA5EAC4.5020400@mentor.com>
In-Reply-To: <4CA5EAC4.5020400@mentor.com>
X-OriginalArrivalTime: 01 Oct 2010 14:33:26.0107 (UTC)
	FILETIME=[9BAD12B0:01CB6175]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [REGRESSION] [PATCH] glib-1.2: merged native and non-native recipes
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
X-List-Received-Date: Fri, 01 Oct 2010 14:34:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Tom Rini wrote:
> Paul Menzel wrote:
>> Dear Fahad, dear Tom,
>>
>>
>> Am Donnerstag, den 09.09.2010, 11:31 +0200 schrieb Vitus Jensen:
>>
>>> On Wed, 8 Sep 2010, Fahad Usman wrote:
>>>
>>>> * removed the glib-1.2-native_1.2.10.bb file
>>>> * added NATIVE_INSTALL_WORKS = "1"
>>>> * added BBCLASSEXTEND = "native"
>>>> * converted do_stage of native recipe to do_install_virtclass-native 
>>>> in the combined recipe
>>>> * added DEPENDS_virtclass-native = "" to avoid dependencies loops
>>>> * added gettext in inherit because it was needed by the native recipes
>>>> * bumped PR
>>>>
>>>> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
>>>> ---
>>>> recipes/glib-1.2/glib-1.2-native_1.2.10.bb |   49 
>>>> ----------------------------
>>>> recipes/glib-1.2/glib-1.2_1.2.10.bb        |   20 ++++++++++-
>>>> 2 files changed, 18 insertions(+), 51 deletions(-)
>>>
>>>> diff --git a/recipes/glib-1.2/glib-1.2_1.2.10.bb 
>>>> b/recipes/glib-1.2/glib-1.2_1.2.10.bb
>>>> index 72ee826..67266d4 100644
>>>> --- a/recipes/glib-1.2/glib-1.2_1.2.10.bb
>>>> +++ b/recipes/glib-1.2/glib-1.2_1.2.10.bb
>>>> @@ -4,7 +4,8 @@ SECTION = "libs"
>>>> PRIORITY = "optional"
>>>> LICENSE = "LGPL"
>>>> DEPENDS = "glib-1.2-native"
>>>> -PR = "r4"
>>>> +DEPENDS_virtclass-native = ""
>>>> +PR = "r5"
>>> I don't know if everyone thinks so but I feel the following line is 
>>> more elegant:
>>>
>>> DEPENDS_pn-glib-1.2 += "glib-1.2-native"
>>>
>>> You skip the DEPENDS_virtclass-native line and may use the "+=" 
>>> operator.
>>
>> […]
>>
>> Tom committed an updated patch in 44af05 [1]. Unfortunately building the
>> recipe fails for me in `do_configure()`.
>>
>>         […]
>>         | checking for arm-oe-linux-gnueabi-gcc... 
>> arm-oe-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon 
>> -mfloat-abi=softfp -mthumb-interwork -mno-thumb
>>         | checking whether the C compiler works... no
>>         | configure: error: in 
>> `/oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/glib-1.2-1.2.10-r5/glib-1.2.10': 
>>
>>         | configure: error: C compiler cannot create executables
>>         | See `config.log' for more details.
>>         | ERROR: Function do_configure failed
>>         NOTE: package glib-1.2-1.2.10-r5: task do_configure: Failed
>>         […]
>>
>> Do you know what might cause this? Reverting this commit the recipe can
>> be build.
> 
> I just built it for angstrom-2008.1 / beagleboard (target and native). 
> I've kicked off a minimal/eglibc/beagleboard build now.

So, a funny thing happened somewhere:

$ (source bitbake.rc ; DISTRO=minimal LIBC=eglibc MACHINE=beagleboard 
bitbake glib-1.2 -e ) | grep ^DEPENDS
DEPENDS_virtclass-nativesdk="autoconf-native automake-native 
libtool-native libtool-cross gnu-config-native coreutils-native 
virtual/arm-oe-linux-gnueabi-gcc virtual/libc"
DEPENDS_virtclass-native="autoconf-native automake-native libtool-native 
libtool-cross gnu-config-native coreutils-native 
virtual/arm-oe-linux-gnueabi-gcc virtual/libc"
DEPENDS="glib-1.2-native"
DEPENDS_GETTEXT="gettext gettext-native virtual/libiconv virtual/libintl"
DEPENDS_pn-glib-1.2="glib-1.2-native"

I believe, from Chris hammering this into my head a few times 
previously, the way that the pn-foo override is applied, the entire 
contents of VAR_pn-foo will replace VAR.  IOW, DEPENDS_pn-glib-1.2 += 
"..." will append to DEPENDS_pn-glib-1.2 and then overwrite DEPENDS.

I'll to and fix everything a git grep shows shortly.

-- 
Tom Rini
Mentor Graphics Corporation


