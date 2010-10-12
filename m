Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5eKV-0000KJ-Qt
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 14:51:46 +0200
Received: by iwn2 with SMTP id 2so1025139iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 05:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NyzQAZCf6D24oG8q1DwqGhwQ4E6dkp6qzqJV3+ELFPA=;
	b=vaFuejqfE67abOaq8pnKV5pF10TD/3ZBMzKxH8101lOwKaZiGEfVm7AR2hEB67zteZ
	nY4QMqXDn4BVD0vFT8wObQ0E+1x6wXIKZWqROR8lL+q/nC6JGg188gImIA59CXS4FJUX
	SKeUNh8tfTcxqnYLqUdmeAwVh77ye8q8F9gnU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=q1kcbwbXSOjbZa2Kqur1eAvNbgT/TN5BVNGbrcUGW8OvT1DlPs/rKhbgWDU9l0Hq8y
	qkBw33zzRBzZCXsihZ+/CDfCw4Dxw0rsbVgJ/LMoDA1vEEIfyZVsvLN7smEJ/Ah2dyE8
	QHzsTx64dgYs0Ah5idZu25iJ3wwM2iMbA2IHM=
MIME-Version: 1.0
Received: by 10.231.162.13 with SMTP id t13mr5667216ibx.160.1286887876827;
	Tue, 12 Oct 2010 05:51:16 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 12 Oct 2010 05:51:16 -0700 (PDT)
In-Reply-To: <i91dk0$7lv$1@dough.gmane.org>
References: <1286783755-19145-1-git-send-email-koen@openembedded.org>
	<i9154e$2rk$1@dough.gmane.org>
	<AANLkTimnE3nuhgQQpCrZ0ymjzmLUkK0wxNX8bqJwa=AF@mail.gmail.com>
	<i91dk0$7lv$1@dough.gmane.org>
Date: Tue, 12 Oct 2010 14:51:16 +0200
Message-ID: <AANLkTimGkxUA_LLHhaeSXTAcmC6D+n7qsxBUZOU6hVbQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
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
X-List-Received-Date: Tue, 12 Oct 2010 12:51:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/12 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 12-10-10 12:08, Frans Meulenbroeks wrote:
>> 2010/10/12 Koen Kooi <k.kooi@student.utwente.nl>:
>
>>>> +}
>>>> +
>>>> +do_compile_kernelmodules() {
>>>> + =A0 =A0 unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>>
>> Is it needed/required?
>
> It is, and it's in kernel.bbclass already:
>
> fe938bbe (Michael Lauer 2004-12-14) kernel_do_compile() {
> 0448ec0d (Richard Purdie 2006-11-20) =A0 =A0 unset CFLAGS CPPFLAGS CXXFLA=
GS
> LDFLAGS MACHINE
> fe938bbe (Michael Lauer 2004-12-14) =A0 =A0 oe_runmake
> include/linux/version.h CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}"
>
>
>> I'm a little bit concerned by this.
>> (actually this was the only worry I had after reading the patch, don't
>> want to loose additional CFLAGS settings here
>
> You actually want to do that, since the kernel is bare-metal, not userspa=
ce.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMtDm/MkyGM64RGpERAuFwAKCBzAXJwVvcQ6oh2DSISA/7Hhh8zACgp9M9
> muqzjUd8tGg/RCZoEKmsU/4=3D
> =3D1SOi
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Thanks for the answer.

Did a quick peek on CFLAGS in the recipes, saw there is a CFLAGS_KERNEL.
That one is only used on one place:
linux-wrt_2.4.30.bb:export CFLAGS_KERNEL=3D"-fno-delayed-branch "

Haven't tested this, but my understanding on how things work is good
enough and the change simple enough for to give an ack
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


