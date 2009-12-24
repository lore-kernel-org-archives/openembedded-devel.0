Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NNxZx-0007xs-EY
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Dec 2009 00:58:52 +0100
Received: (qmail 8899 invoked by uid 1003); 24 Dec 2009 23:56:54 -0000
Received: from localhost (HELO ?192.168.1.111?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 24 Dec 2009 23:56:53 -0000
Message-ID: <4B33FFC4.2060803@balister.org>
Date: Thu, 24 Dec 2009 18:56:52 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1261629237-15118-1-git-send-email-raj.khem@gmail.com>	<hgvcnd$9gv$1@ger.gmane.org>
	<19c1b8a90912240928p40d3c391ybb4289c6a987a5a4@mail.gmail.com>
In-Reply-To: <19c1b8a90912240928p40d3c391ybb4289c6a987a5a4@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] u-boot_git.bb: Change SRC_URI to a valid	location for beagleboard.
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
X-List-Received-Date: Thu, 24 Dec 2009 23:58:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/24/2009 12:28 PM, Khem Raj wrote:
> On Thu, Dec 24, 2009 at 1:36 AM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> NAK, uboot_git.bb should fetch from git.
>
> It was intermediate solution measure because I could not track this
> commit-id which is in SRCREV for beagle anywhere in git trees. If
> anyone knows where this commit exist or where this got rebased to then
> we can add that
> secondly at present even for angstrom its fetching snapshot so
> essentially its is not what a git recipe should do either.

We understand your reasoning, but the correct fix is to move from the 
repo that "lost" the commit to a more stable repo. I'm told the HEAD of 
the u-boot repo might work. When I am back from the holidays, I can help 
resolve this issue.

Philip

>
> Thx
>
> -Khem
>
> Thanks
>
> -Khem
>
>>
>> On 24-12-09 05:33, Khem Raj wrote:
>>> * The commit-id it is looking for is not there in upstream git
>>>    repo therefore get the tar file from angstrom mirror.
>>>
>>> * On ARM gcc 4.4 does not allow weak inline, patch them.
>>>
>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>> ---
>>>   conf/checksums.ini                          |    4 ++
>>>   recipes/u-boot/u-boot-git/weak_inline.patch |   51 +++++++++++++++++++++++++++
>>>   recipes/u-boot/u-boot_git.bb                |    3 +-
>>>   3 files changed, 57 insertions(+), 1 deletions(-)
>>>   create mode 100644 recipes/u-boot/u-boot-git/weak_inline.patch
>>>
>>> diff --git a/conf/checksums.ini b/conf/checksums.ini
>>> index 2d59a3a..f87af15 100644
>>> --- a/conf/checksums.ini
>>> +++ b/conf/checksums.ini
>>> @@ -8754,6 +8754,10 @@ sha256=692901194603cc4fb4072d8f907487d867caef6b62161f50f0f44dbeb001066e
>>>   md5=ed8c4fa007a44d51b646865c35461ce8
>>>   sha256=f8ccac357f2c721e735ae16bbb02a420d2aaaed483f5d46043c5fe627ab4b260
>>>
>>> +[http://www.angstrom-distribution.org/unstable/sources/git_git.denx.de.u-boot-ti.git_1590f84007e2b50ad346a482fff89195cb04ff4e.tar.gz]
>>> +md5=6ff9ee1f4d43997b6e533b3c2c2a739f
>>> +sha256=6b3cfb0ae1f35e695da38561877bd185da5f8471f4377c0069f999114d93521a
>>> +
>>>   [http://downloads.sourceforge.net/gizmod/gizmod-2.3.tar.bz2]
>>>   md5=b7200b08149599c4c0f56d88f0c7f208
>>>   sha256=53af32530e58ba23cbb752f063364612bbea57b31de2ee35814973452c2f63f2
>>> diff --git a/recipes/u-boot/u-boot-git/weak_inline.patch b/recipes/u-boot/u-boot-git/weak_inline.patch
>>> new file mode 100644
>>> index 0000000..d0014ff
>>> --- /dev/null
>>> +++ b/recipes/u-boot/u-boot-git/weak_inline.patch
>>> @@ -0,0 +1,51 @@
>>> +From: Ron Lee<ron@debian.org>
>>> +Date: Wed, 5 Aug 2009 18:14:01 +0000 (+0200)
>>> +Subject: ARM Don't inline weak symbols
>>> +X-Git-Url: http://git.denx.de/?p=u-boot%2Fu-boot-arm.git;a=commitdiff_plain;h=f865fcbbb35851e75fee9c3a3fa8e0f71d9e6463
>>> +
>>> +ARM Don't inline weak symbols
>>> +
>>> +------------------------------------------------------------------------
>>> +
>>> +GCC 4.4 complains about this now.
>>> +
>>> +Signed-off-by: Ron Lee<ron@debian.org>
>>> +---
>>> +
>>> +Index: git/lib_arm/board.c
>>> +===================================================================
>>> +--- git.orig/lib_arm/board.c 2009-10-20 04:08:52.000000000 -0700
>>> ++++ git/lib_arm/board.c      2009-12-23 15:30:11.687436024 -0800
>>> +@@ -89,23 +89,23 @@ extern void rtl8019_get_enetaddr (uchar
>>> +  * May be supplied by boards if desired
>>> +  */
>>> + void inline __coloured_LED_init (void) {}
>>> +-void inline coloured_LED_init (void) __attribute__((weak, alias("__coloured_LED_init")));
>>> ++void coloured_LED_init (void) __attribute__((weak, alias("__coloured_LED_init")));
>>> + void inline __red_LED_on (void) {}
>>> +-void inline red_LED_on (void) __attribute__((weak, alias("__red_LED_on")));
>>> ++void red_LED_on (void) __attribute__((weak, alias("__red_LED_on")));
>>> + void inline __red_LED_off(void) {}
>>> +-void inline red_LED_off(void)            __attribute__((weak, alias("__red_LED_off")));
>>> ++void red_LED_off(void) __attribute__((weak, alias("__red_LED_off")));
>>> + void inline __green_LED_on(void) {}
>>> +-void inline green_LED_on(void) __attribute__((weak, alias("__green_LED_on")));
>>> ++void green_LED_on(void) __attribute__((weak, alias("__green_LED_on")));
>>> + void inline __green_LED_off(void) {}
>>> +-void inline green_LED_off(void)__attribute__((weak, alias("__green_LED_off")));
>>> ++void green_LED_off(void) __attribute__((weak, alias("__green_LED_off")));
>>> + void inline __yellow_LED_on(void) {}
>>> +-void inline yellow_LED_on(void)__attribute__((weak, alias("__yellow_LED_on")));
>>> ++void yellow_LED_on(void) __attribute__((weak, alias("__yellow_LED_on")));
>>> + void inline __yellow_LED_off(void) {}
>>> +-void inline yellow_LED_off(void)__attribute__((weak, alias("__yellow_LED_off")));
>>> ++void yellow_LED_off(void) __attribute__((weak, alias("__yellow_LED_off")));
>>> + void inline __blue_LED_on(void) {}
>>> +-void inline blue_LED_on(void)__attribute__((weak, alias("__blue_LED_on")));
>>> ++void blue_LED_on(void) __attribute__((weak, alias("__blue_LED_on")));
>>> + void inline __blue_LED_off(void) {}
>>> +-void inline blue_LED_off(void)__attribute__((weak, alias("__blue_LED_off")));
>>> ++void blue_LED_off(void) __attribute__((weak, alias("__blue_LED_off")));
>>> +
>>> + /************************************************************************
>>> +  * Init Utilities                                                   *
>>> diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
>>> index 5fcf7c5..9f0adb2 100644
>>> --- a/recipes/u-boot/u-boot_git.bb
>>> +++ b/recipes/u-boot/u-boot_git.bb
>>> @@ -16,9 +16,10 @@ SRC_URI_append_afeb9260 = " file://AFEB9260-network-fix.patch;patch=1"
>>>   SRC_URI_append_afeb9260-180 = " file://AFEB9260-network-fix.patch;patch=1"
>>>   SRC_URI_append_cm-t35 = "file://cm-t35/cm-t35.patch;patch=1"
>>>
>>> -SRC_URI_beagleboard = "git://git.denx.de/u-boot-ti.git;protocol=git \
>>> +SRC_URI_beagleboard = "http://www.angstrom-distribution.org/unstable/sources/git_git.denx.de.u-boot-ti.git_1590f84007e2b50ad346a482fff89195cb04ff4e.tar.gz \
>>>                    file://fw_env.config \
>>>                    file://new-pinmux.patch;patch=1 \
>>> +              file://weak_inline.patch;patch=1 \
>>>   "
>>>   SRCREV_beagleboard = "1590f84007e2b50ad346a482fff89195cb04ff4e"
>>>   PV_beagleboard = "2009.08+${PR}+gitr${SRCREV}"
>>
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.5 (Darwin)
>>
>> iD8DBQFLMzYtMkyGM64RGpERAgD4AJ9v/7BVXO6XVuYB5pgBfo1gbOSKFACghaXX
>> jkkIE5R+Z1oMuafdiQpsZf0=
>> =eYjJ
>> -----END PGP SIGNATURE-----
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


