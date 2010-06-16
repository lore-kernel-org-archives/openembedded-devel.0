Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OOnEq-0001kY-0x
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 09:40:46 +0200
Received: by bwz14 with SMTP id 14so3313103bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 00:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ntdWMpMFa5x6VYFCe2SaK8154c8b4+AZLL3x2fXqMW4=;
	b=kv1ngjzAXauphSiReeLhspb4hin4aTJbB0gnfKlNfQwb0pjUI6DR6jwJKER7luT6Bk
	UWyoyh/9JTippJEjm1f2w4N8FUREeiFNq2LI/w9PZXQjuVfIGWmSC4HcfvrtiqPjpZ8C
	peBdOVn/nxWVR8CabVEOiJ8qWrBmqiybCLcMU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ebE6ywmf7ZaZnxPd110MxVlFoNJ84THbYeHHQuSX29ANz+lTIzp/g9dQhKIqSen5sN
	5hDFcqPpS8BYqpvPae9kEI0w2LKN4IJo9GWf5Ltp72Wj4tDv9Y1eduFgzr4Akiern/q2
	nAfTgNgNSiezz2zzgA1fUQ1IFFcSuPI6YULa0=
MIME-Version: 1.0
Received: by 10.204.160.74 with SMTP id m10mr6278292bkx.62.1276673777150; Wed, 
	16 Jun 2010 00:36:17 -0700 (PDT)
Received: by 10.204.119.12 with HTTP; Wed, 16 Jun 2010 00:36:17 -0700 (PDT)
In-Reply-To: <4C1831AA.1030005@mentor.com>
References: <4C0D498A.4030709@mentor.com> <4C17BCF4.30109@mentor.com>
	<AANLkTinZ-EFiDW6IK-bRPh9JElAbnwaET56jGKnwm0cr@mail.gmail.com>
	<4C1831AA.1030005@mentor.com>
Date: Wed, 16 Jun 2010 09:36:17 +0200
Message-ID: <AANLkTimnOJ6zeJ308XWUAd9Qsw0DQgo8vd1Nz58pMH6N@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC] Add linux-libc-headers-native, make it default 	dep for native
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
X-List-Received-Date: Wed, 16 Jun 2010 07:40:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/16 Tom Rini <tom_rini@mentor.com>:
> Leon Woestenberg wrote:
>>
>> Hello Tom,
>>
>> On Tue, Jun 15, 2010 at 7:48 PM, Tom Rini <tom_rini@mentor.com> wrote:
>>>
>>> For the second, yes, ASSUME_PROVIDED still works. =A0For the first, I'd
>>> argue
>>> that doing so is a lot harder (at least without some additional
>>> infrastructure and reliance on other external tools) than just adding
>>> another early package.
>>>
>>> So, yay or nay?
>>>
>> I would say the ASSUME_PROVIDED for the native linux headers should be
>> mentioned in the local.conf.sample,
>> commented out, so that users can enable it easily (optimize the build
>> like Khem says).
>>
>> Could you add that to the patch, or as a follow-up patch?
>
> As a follow-up:
> --- a/conf/local.conf.sample
> +++ b/conf/local.conf.sample
> @@ -30,6 +30,11 @@ BBFILES :=3D "${@bb.fatal('Edit your conf/local.conf:
> BBFILES')}"
> =A0# This is a regulary expression, so be sure to get your parenthesis
> balanced.
> =A0BBMASK =3D ""
>
> +# Uncomment this if your host distribution has recent enough Linux
> +# Kernel header files. =A0Utilities we use to generate certain types of
> +# target filesystems need somewhat recent header files.
> +# ASSUME_PROVIDED +=3D "linux-libc-headers-native"
> +
> =A0# Uncomment this if you want to use a prebuilt toolchain. You will nee=
d to
> =A0# provide packages for toolchain and additional libraries yourself. Yo=
u
> also
> =A0# have to set PATH in your environment to make sure BitBake finds
> additional binaries.
>
> --
> Tom Rini
> Mentor Graphics Corporation

Suggest to write a separate email with a catchy title telling people
that this change becomes in effect (after the commit is done).
rationale: after the change is made, people will get the headers by
default, and not everyone reads this thread.

Frans


