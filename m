Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OWa6t-0006ej-OD
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 21:16:47 +0200
Received: by bwz10 with SMTP id 10so32818bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 12:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3gZ20Iz8P4uSL+kVAanxm/doFiRwPASU/T7M1uNkOr8=;
	b=ZXmCk0dFUWzHCpLVbJHl5HyI70as6kqqRX2vzqhpY9/qrkZbbFZAs0xk9zWJLcIv+7
	41imto8cdWpR6B6eqVMdKaSx/ZNHvbnQNBm/25FNz55Mk16RLy+5FPypwSPPU4y+svSF
	E4qA90sCBI8m1Yl57R9s+LcnmsAxKzFToyroE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PutLMcBde333XcOWWf7gourqBZl/WcLCRO8FQGPXWyVYoVl0HWgX4bPoMR7C6ilx5H
	hOMLfAfIxZsV7UhthxU7PHsL8pDS3RQ7ItJlOdC1X2FnW7SId8+CTV3mjgqko3kDrHMu
	nmWy+ajlVlFTxVcBJmC1MgU0o7EO8QEwvtgK4=
MIME-Version: 1.0
Received: by 10.204.58.206 with SMTP id i14mr3236592bkh.31.1278529912847; Wed, 
	07 Jul 2010 12:11:52 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 7 Jul 2010 12:11:52 -0700 (PDT)
In-Reply-To: <1278529036.4413.67.camel@lenovo.internal.reciva.com>
References: <1278527926-5065-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTikso9BfJHslU0Ss6nQ5SfnOdgy8RIU0WF383jXX@mail.gmail.com>
	<1278529036.4413.67.camel@lenovo.internal.reciva.com>
Date: Wed, 7 Jul 2010 21:11:52 +0200
Message-ID: <AANLkTil6ZzCLdFEKksqKwjzCj_DV2DT7eifCJakP1HhR@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] classes/base.bbclass: add INCOMPATIBLE_MACHINE
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
X-List-Received-Date: Wed, 07 Jul 2010 19:16:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/7/7 Phil Blundell <philb@gnu.org>:
> On Wed, 2010-07-07 at 20:49 +0200, Frans Meulenbroeks wrote:
>> 2010/7/7 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>> > added INCOMPATIBLE_MACHINE
>> > we have COMPATIBLE_MACHINE but that does not allow to say that
>> > a package is supported by all except a certain machine.
>> > a regexp like "(?!arch)"
>> > This mechanism can be used to exclude certain machines.
>> > Idea is that in binutils and gcc you can use this to specify that
>> > a certain version does not support a certain machine
>>
>> actually what I wanted to say in the commit message is that a regexp
>> like (?!arch) does not work.
>> \b(?!arch) or ^(?!arch) didn't work either and consulting #python did
>
> This might just be an accident of wording, but you do realise that
> COMPATIBLE_MACHINE is tested against ${MACHINE} (i.e. not any of the
> ${xx_ARCH} variables), right? =A0If you want to test arches then you want
> ${COMPATIBLE_ARCH}.
>
> I just did a quick test with (?!foo) in C_M and it seemed to work ok for
> me. =A0Specifically:
>
> MACHINE =3D goodmach
> COMPATIBLE_MACHINE =3D "(?!badmach)"
>
> works, whereas
>
> MACHINE =3D badmach
> COMPATIBLE_MACHINE =3D "(?!badmach)"
>
> is rejected. =A0What exactly goes wrong for you?

Aargh, yes I was using COMPATIBLE_MACHINE to test against an arch.

COMPATIBLE_ARCH does not exist at the moment.
Is there interest in it? (or in other words, do I have a chance I get
acks for it, if not I'd rather save myself the effort writing a patch

Frans


