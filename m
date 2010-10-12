Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5elC-0007U9-IE
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 15:19:20 +0200
Received: by ywl5 with SMTP id 5so1466077ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 06:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ExrIppgKKtBKetZTkflWYpxklUZLLf65OiRYwGpcXBc=;
	b=ijP+eM1zCqOwK9UEWpT+uncfVeECzBpAqxKH/h7u/Kmn9JD76otugwsYZDEi7vL1mD
	+hCvElcIkUFJWVRnyjf4OkZB0uW3Nma6nCYMjBQRHun2zKOEc9lfiAWx6PKCpVIX12yM
	ONSepcbT0e3sBt+OA3aMX16C63TYJeXXVwSpE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FsFhZyyvYqyJ5seOQ6fr/gZtr2ob0kNAe1Wq4Owu2pXYTmFkY7sC7fVbk6MysG6K86
	+Pd5zal5OO2ZNGXojZX7nIUcl4m+/tgnVPegP+7cEpXUMI8uFRNR+MTs9v2TqNKZKzgG
	Xjq68NSXt9vfjTG6w4Ha0G9AKUgN7JwU7TG9Q=
MIME-Version: 1.0
Received: by 10.42.210.6 with SMTP id gi6mr2651968icb.501.1286889531028; Tue,
	12 Oct 2010 06:18:51 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 12 Oct 2010 06:18:50 -0700 (PDT)
In-Reply-To: <i91m8o$efr$1@dough.gmane.org>
References: <1286783755-19145-1-git-send-email-koen@openembedded.org>
	<i9154e$2rk$1@dough.gmane.org>
	<AANLkTimnE3nuhgQQpCrZ0ymjzmLUkK0wxNX8bqJwa=AF@mail.gmail.com>
	<i91dk0$7lv$1@dough.gmane.org>
	<AANLkTimGkxUA_LLHhaeSXTAcmC6D+n7qsxBUZOU6hVbQ@mail.gmail.com>
	<AANLkTi=cZr6FCfssVCyrYaTYH9DM3WEQn+ZT7DM+uvuJ@mail.gmail.com>
	<i91m8o$efr$1@dough.gmane.org>
Date: Tue, 12 Oct 2010 15:18:50 +0200
Message-ID: <AANLkTi=ZDJcuoDzLcf+T2mJ62DAUNnRFbTMtnauOynJx@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv3 1/3] kernel bbclass: split do_compile into do_compile and do_compile_modules
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
X-List-Received-Date: Tue, 12 Oct 2010 13:19:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/12 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 12-10-10 14:53, Frans Meulenbroeks wrote:
>> 2010/10/12 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>>> 2010/10/12 Koen Kooi <k.kooi@student.utwente.nl>:
>> On 12-10-10 12:08, Frans Meulenbroeks wrote:
>>>>>> 2010/10/12 Koen Kooi <k.kooi@student.utwente.nl>:
>>
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +do_compile_kernelmodules() {
>>>>>>>> + =A0 =A0 unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>>>>>>
>>>>>> Is it needed/required?
>>
>> It is, and it's in kernel.bbclass already:
>>
>> fe938bbe (Michael Lauer 2004-12-14) kernel_do_compile() {
>> 0448ec0d (Richard Purdie 2006-11-20) =A0 =A0 unset CFLAGS CPPFLAGS CXXFL=
AGS
>> LDFLAGS MACHINE
>> fe938bbe (Michael Lauer 2004-12-14) =A0 =A0 oe_runmake
>> include/linux/version.h CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}"
>>
>>
>>>>>> I'm a little bit concerned by this.
>>>>>> (actually this was the only worry I had after reading the patch, don=
't
>>>>>> want to loose additional CFLAGS settings here
>>
>> You actually want to do that, since the kernel is bare-metal, not usersp=
ace.
>>>>
>
>>>
>>> Thanks for the answer.
>>>
>>> Did a quick peek on CFLAGS in the recipes, saw there is a CFLAGS_KERNEL=
.
>>> That one is only used on one place:
>>> linux-wrt_2.4.30.bb:export CFLAGS_KERNEL=3D"-fno-delayed-branch "
>>>
>>> Haven't tested this, but my understanding on how things work is good
>>> enough and the change simple enough for to give an ack
>>> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>>>
>
>> Actually on 2nd thought one tiny remark left:
>> after seeing patch 2:
>> what about renaming:
>> do_compile_kernelmodules
>> to something with a kernel prefix
>> e.g. kernel_do_compile_modules.
>> That makes the naming scheme somewhat more consistent.
>
> Namespacing the class is only used for methods overridden from
> base.bbclass. Again, look at the rest of kernel.bbclass methods like
> uboot-mkimage, menuconfig and friends don't use that namespace.

Well I don't care too much about it, this just bubbled up because this:
>         kernel_do_compile
> +        do_compile_kernelmodules
>         kernel_do_install
looks a little bit better/more consistent; i did not evn consider
overriding or so, just peeked at the aesthetics.
as I wrote before it is a nit (and absolutely no deal-breaker afaic)

Frans
>
> And it doesn't actually work since _modules is a local override.
>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMtFxYMkyGM64RGpERArFyAKCr5HipFKmy8xsYIoF/U0NIXFfDlwCfferR
> yhTvF+MOCupbbMMstKVvkmk=3D
> =3D6zMs
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


