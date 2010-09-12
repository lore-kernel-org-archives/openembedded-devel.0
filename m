Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OuriS-0007rL-IX for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 20:55:53 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ourhg-0002vt-RT for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 20:55:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 20:55:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 20:55:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 12 Sep 2010 20:52:20 +0200
Message-ID: <i6j7h4$m7t$1@dough.gmane.org>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>	<AANLkTi=o8sM5eBxtMLbB3WVk4vQ8r5mL7g5SKSrK0h34@mail.gmail.com>	<i6629i$d5c$1@dough.gmane.org>	<201009081609.32135.pieterg@gmx.com>	<4C879EC5.10402@balister.org>	<4C8ADB7A.4000303@techsol.ca>	<i6f9uu$39o$1@dough.gmane.org>
	<i6fc40$90f$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <i6fc40$90f$1@dough.gmane.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patch to fix libstdc++ problem, was Re: Images no longer automatically include libstdc++6
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
X-List-Received-Date: Sun, 12 Sep 2010 18:55:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Apart from bikeshedding on PR bumps, does this patch work for people
besides me and is the solution acceptable for gcc-cross?

On 11-09-10 09:46, Koen Kooi wrote:
> Can people ack or nack the following please:
> 
> 
> diff --git a/recipes/gcc/gcc-package-cross.inc
> b/recipes/gcc/gcc-package-cross.inc
> index 0c4ea2d..59e7dde 100644
> --- a/recipes/gcc/gcc-package-cross.inc
> +++ b/recipes/gcc/gcc-package-cross.inc
> @@ -2,6 +2,8 @@ PACKAGE_STRIP ?= ""
>  OLD_PACKAGE_STRIP := "${PACKAGE_STRIP}"
>  PACKAGE_STRIP = "no"
> 
> +SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
> +
>  PACKAGES = "libgcc libssp libstdc++ libg2c libgfortran"
> 
>  # Called from within gcc-cross, so libdir is set wrong
> 
> 
> On 11-09-10 09:09, Koen Kooi wrote:
>> On 11-09-10 03:29, Dallas Foley wrote:
>>> On 10-09-08 07:33 AM, Philip Balister wrote:
>>>> On 09/08/2010 10:09 AM, pieterg wrote:
>>>>> On Tuesday 07 September 2010 21:03:14 Koen Kooi wrote:
>>>>>> On 07-09-10 18:18, Khem Raj wrote:
>>>>>>> On Tue, Sep 7, 2010 at 5:52 AM, Koen Kooi<k.kooi@student.utwente.nl>
>>>>> wrote:
>>>>>>>> it happens when you build 'gcc' after 'gcc-cross', gcc will doesn't
>>>>>>>> create a libstdc6++ package, but it does create a libstdc-dev
>>>>>>>> package.
>>>>>>>
>>>>>>> I see thats plausible. I think its time to look into separating gcc
>>>>>>> runtime from gcc on the lines of poky.
>>>>>>
>>>>>> I put back libgcc and libstdc++ for the time being:
>>>>>>
>>>>>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=241b8865f20
>>>>>>
>>>>>> b9e3c3beb334535e6cd8452cbf47d
>>>>>>
>>>>>> I have a feeling the others needs to put back as well (e.g. fortran),
>>>>>> but this fixes the immediate problem.
>>>>>
>>>>> Not for me, after a clean build today packages are still missing
>>>>> libstdc++
>>>>> in their deps (and as a result the images are still missing libstdc++).
>>>>> So there must be more to it.
>>>>
>>>> Does anyone have any idea what commit caused this breakage? It is
>>>> causing a lot
>>>> of problems for people.
>>>>
>>>> Philip
> 
>>> With git bisect I get commit d2a283ad002660e46b2f8d40a8ddfabad457d8a4
>>> that causes libstdc++ to not get included.
> 
>> Yep, that's the one:
> 
>> ./x86_64-linux/shlibs/libssp.ver
>> ./x86_64-linux/shlibs/libstdc++.ver
>> ./x86_64-linux/shlibs/libgfortran.list
>> ./x86_64-linux/shlibs/libssp.list
>> ./x86_64-linux/shlibs/libstdc++.list
>> ./x86_64-linux/shlibs/libgfortran.ver
>> ./x86_64-linux/shlibs/libgcc.list
>> ./x86_64-linux/shlibs/libgcc.ver
> 
>> For gcc we probably need to add the following to gcc.inc:
> 
>> SHLIBSDIR = "${STAGING_DIR}/${BASEPKG_HOST_SYS}/shlibs"
> 
>> That should put the shlibs back where they belong for gcc.
> 
>> regards,
> 
>> Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMjSFkMkyGM64RGpERAkPvAJwPBO4vhW/iXLTQVdr6AjMoacCJnACeJhyy
N5VkQ1ouu2dCj1tet4p4z6Y=
=9JPc
-----END PGP SIGNATURE-----



