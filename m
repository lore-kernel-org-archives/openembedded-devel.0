Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P6eEK-00035h-8A
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 08:57:31 +0200
Received: by yxt3 with SMTP id 3so187774yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 23:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=K3ke/LKc7bulIK1m8shFYCsGOXy+ovZhJmNpL/DbX8c=;
	b=uXJr94cVc1tthprK+xmczBjzpMWpuxApi0Tq+LsPOqSLeAmibIz3yw67xxeT99MGwl
	acrNXq+NtHWvJHlHKW6uIYTXncd1SUrGDfLEGSqqHH1wzu2o869NViMu62iFzJawq75V
	cT+ssiem5UHsW5w8dPezs088V+CUfK9n8a+bw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kI73NQFSknMjxtrUX95cE/85CIw3mrA9B2Y3apJBgf/uGnkIOjoWgDfT3Y3p2IsGdk
	/1EvUr5AmTdlEvaQMN9OZdKen2M5TcXgYtjmC/RHGEWHzqbpmTVc82vB1CfBMc4OJV8a
	4bxqDGLNVZFamRjeUT2Th5fgTv6ZES/qmkoUQ=
MIME-Version: 1.0
Received: by 10.42.108.1 with SMTP id f1mr198232icp.132.1287125804422; Thu, 14
	Oct 2010 23:56:44 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 14 Oct 2010 23:56:44 -0700 (PDT)
In-Reply-To: <AANLkTimjtmWvRCypjwRfyFc7VnaJUL4R_0miq3aC3MRW@mail.gmail.com>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
	<AANLkTimjtmWvRCypjwRfyFc7VnaJUL4R_0miq3aC3MRW@mail.gmail.com>
Date: Fri, 15 Oct 2010 08:56:44 +0200
Message-ID: <AANLkTimgK9mmssx6HraJdzO2_toEOe5FvcDs5DDru8Pa@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Reverse the order of OVERRIDES
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
X-List-Received-Date: Fri, 15 Oct 2010 06:57:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/15 Khem Raj <raj.khem@gmail.com>:
> On Thu, Oct 14, 2010 at 8:36 PM, Chris Larson <kergoth@gmail.com> wrote:
>> From: Chris Larson <chris_larson@mentor.com>
>>
>> Given the current implementation of OVERRIDES in bitbake, the variable i=
s
>> expected to contain elements in the order least specific to most specifi=
c,
>> however, our current usage of it does not match that. =A0As one example,=
 "local"
>> is supposed to always be the most specific override, yet currently it's =
the
>> least specific. =A0As another example, currently the target architecture=
 is seen
>> as more specific than the machine, which is also clearly wrong.
>>
>> It becomes clear that a reversal of the current value will bring us to a=
 more
>> sane behavior, and avoids the need for the dual overrides hack mentioned=
 in
>> the comments, so clean those up as well.
>>
>> This also introduces a MACHINE_OVERRIDES variable as a generic mechanism=
 to
>> inject overrides elements which are more specific than the distro but le=
ss
>> specific than the machine, which is where things like MACHINE_CLASS or
>> SOC_FAMILY or the like would go. =A0This variable is *space* separated, =
to make
>> it easier and more convenient to assemble the variable incrementally, an=
d it's
>> then translated to : separated when used in OVERRIDES.
>>
>> Signed-off-by: Chris Larson <chris_larson@mentor.com>
>
> both things look nice to me. We might need to document MACHINE_OVERRIDES =
though.
>
> Acked-by: Khem Raj <raj.khem@gmail.com>
>
Looks fine to me.
Actually I've wondered several times why local did not have priority
(but I had to do things like X_local).
But before adding an ack, I would like to ask what has been done wrt
testing (as this is potentially quite invasive).

Also is there a way we can detect where the recipes can be simplified
by adding unneeded appendices? (e.g by modifying/extending
recipe_sanity).

Thanks for the patch! Frans


