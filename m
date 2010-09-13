Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ov27F-00026Z-V9
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 08:02:12 +0200
Received: by iwn2 with SMTP id 2so4878701iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 23:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=b2ZFEqLNuTTxi2rdEEFZXqgtsXr50wol3hASaHtCTGo=;
	b=i9U7i8wnBf2PtAwHIRx/JWlSwr0zfxWBFSPD12lwCScxoUlmTylNYPl6pOQgYlwPOw
	7C387WrMvi79Zx2n0//QcwLOJ6zDzZFFa9QuzBKPXNJ/PK2tLhxFpSEeRVhi55BNE4NK
	3zqwuEBdQSRBffJy/wK/fVuS7oZokFE6XFPDE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=G9IvbNlCUfCgQ6bOGBVUrEsZ6SvnSbq4x3BJhLzXynbUwcdzA8tf0AjBvzxNYftVzs
	4B8voXkvS13d8x42nmQOgHHp6iVZhuEt4LZTtBkDHB5tkBLwrnmmtmjS89IHsmexMgEt
	YQQXn8HHKbh1MN12iHr+QxagE46BraZ43Rjw0=
Received: by 10.231.13.139 with SMTP id c11mr5409512iba.188.1284357684123;
	Sun, 12 Sep 2010 23:01:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Sun, 12 Sep 2010 23:01:04 -0700 (PDT)
In-Reply-To: <i6fc40$90f$1@dough.gmane.org>
References: <AANLkTimErvT=QwSRo25H-Bn2cjdao5x4XMbp_nz4Vc9_@mail.gmail.com>
	<AANLkTi=o8sM5eBxtMLbB3WVk4vQ8r5mL7g5SKSrK0h34@mail.gmail.com>
	<i6629i$d5c$1@dough.gmane.org> <201009081609.32135.pieterg@gmx.com>
	<4C879EC5.10402@balister.org> <4C8ADB7A.4000303@techsol.ca>
	<i6f9uu$39o$1@dough.gmane.org> <i6fc40$90f$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Sep 2010 23:01:04 -0700
Message-ID: <AANLkTi=nBmMMmFj4mm8eNgB8EB=Fz-9cbiCcH_aASUGd@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Mon, 13 Sep 2010 06:02:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 11, 2010 at 12:46 AM, Koen Kooi <k.kooi@student.utwente.nl> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Can people ack or nack the following please:
>
>
> diff --git a/recipes/gcc/gcc-package-cross.inc
> b/recipes/gcc/gcc-package-cross.inc
> index 0c4ea2d..59e7dde 100644
> - --- a/recipes/gcc/gcc-package-cross.inc
> +++ b/recipes/gcc/gcc-package-cross.inc
> @@ -2,6 +2,8 @@ PACKAGE_STRIP ?=3D ""
> =C2=A0OLD_PACKAGE_STRIP :=3D "${PACKAGE_STRIP}"
> =C2=A0PACKAGE_STRIP =3D "no"
>
> +SHLIBSDIR =3D "${STAGING_DIR_TARGET}/shlibs"
> +

the patch itself seems good to me

Acked-by: Khem Raj <raj.khem@gmail.com>


> =C2=A0PACKAGES =3D "libgcc libssp libstdc++ libg2c libgfortran"
>
> =C2=A0# Called from within gcc-cross, so libdir is set wrong
>
>
> On 11-09-10 09:09, Koen Kooi wrote:
>> On 11-09-10 03:29, Dallas Foley wrote:
>>> On 10-09-08 07:33 AM, Philip Balister wrote:
>>>> On 09/08/2010 10:09 AM, pieterg wrote:
>>>>> On Tuesday 07 September 2010 21:03:14 Koen Kooi wrote:
>>>>>> On 07-09-10 18:18, Khem Raj wrote:
>>>>>>> On Tue, Sep 7, 2010 at 5:52 AM, Koen Kooi<k.kooi@student.utwente.nl=
>
>>>>> wrote:
>>>>>>>> it happens when you build 'gcc' after 'gcc-cross', gcc will doesn'=
t
>>>>>>>> create a libstdc6++ package, but it does create a libstdc-dev
>>>>>>>> package.
>>>>>>>
>>>>>>> I see thats plausible. I think its time to look into separating gcc
>>>>>>> runtime from gcc on the lines of poky.
>>>>>>
>>>>>> I put back libgcc and libstdc++ for the time being:
>>>>>>
>>>>>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D241b=
8865f20
>>>>>>
>>>>>> b9e3c3beb334535e6cd8452cbf47d
>>>>>>
>>>>>> I have a feeling the others needs to put back as well (e.g. fortran)=
,
>>>>>> but this fixes the immediate problem.
>>>>>
>>>>> Not for me, after a clean build today packages are still missing
>>>>> libstdc++
>>>>> in their deps (and as a result the images are still missing libstdc++=
).
>>>>> So there must be more to it.
>>>>
>>>> Does anyone have any idea what commit caused this breakage? It is
>>>> causing a lot
>>>> of problems for people.
>>>>
>>>> Philip
>>
>>> With git bisect I get commit d2a283ad002660e46b2f8d40a8ddfabad457d8a4
>>> that causes libstdc++ to not get included.
>>
>> Yep, that's the one:
>>
>> ./x86_64-linux/shlibs/libssp.ver
>> ./x86_64-linux/shlibs/libstdc++.ver
>> ./x86_64-linux/shlibs/libgfortran.list
>> ./x86_64-linux/shlibs/libssp.list
>> ./x86_64-linux/shlibs/libstdc++.list
>> ./x86_64-linux/shlibs/libgfortran.ver
>> ./x86_64-linux/shlibs/libgcc.list
>> ./x86_64-linux/shlibs/libgcc.ver
>>
>> For gcc we probably need to add the following to gcc.inc:
>>
>> SHLIBSDIR =3D "${STAGING_DIR}/${BASEPKG_HOST_SYS}/shlibs"
>>
>> That should put the shlibs back where they belong for gcc.
>>
>> regards,
>>
>> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMizPAMkyGM64RGpERAiAzAJ0SQGxLxecig5hDoAIZxXSBNfYQBwCfQaSb
> fScJkHjvpFg/2t8Jw+dkGdY=3D
> =3DiSyb
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
-Khem


