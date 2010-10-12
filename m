Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P5ncP-0005tn-HS
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 00:47:17 +0200
Received: by wyb40 with SMTP id 40so773810wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 15:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=05M9GvUlbPGFPjsvc6sOHAWokQChenym68feJ2J0ryU=;
	b=arStUOmW8yRExO/3MtWkyMW9ultZlUlAPZg31T0/sm6dWxfmOxfAbcUNaG1vx9HwAY
	zu4WPhY0HKnHBxEJfnEQlk/ngkjFIkt3tQjzKT7dVWnEWKP9oQWLLAGPhX7aIZ7sMxGE
	4dDXlnoWkLTsc4GSrVfoAVzfaCnYHT8LR+8ns=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=l5guztvRYImEAJ6EF3DOlT6sgB1Fd8K8E/3Of5rRZtQvPfsDsX0wrlL7H23YQl5eLE
	vDXfyfO66iftuaPS979XXplzSqLeLxz+oUk1Daa83ECsQsxis+o9BqFAtuL7KI1g+wQJ
	N+Ui2vZYcvetRzlgEEwm9lB5zMp8CimaT8ad4=
Received: by 10.216.11.131 with SMTP id 3mr443301wex.92.1286923220248; Tue, 12
	Oct 2010 15:40:20 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Tue, 12 Oct 2010 15:40:00 -0700 (PDT)
In-Reply-To: <AANLkTimwEzFVVdzC7vyBDmv2LvcBTVRb5ngN0g0x-Bdo@mail.gmail.com>
References: <AANLkTi=iNaP53YAKHeTpv9Wsp1VL4GZPhrJTkYdMfdGp@mail.gmail.com>
	<4CB07A28.4050200@opensimpad.org>
	<AANLkTimwEzFVVdzC7vyBDmv2LvcBTVRb5ngN0g0x-Bdo@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 12 Oct 2010 15:40:00 -0700
X-Google-Sender-Auth: GteS76N1u0e93JX9NwwnEJpcjgk
Message-ID: <AANLkTin+Bf8E3u6JrVN+Y3JRe915A7o9KWFdpN1bowK5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: inc file discussion
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
X-List-Received-Date: Tue, 12 Oct 2010 22:47:33 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 9, 2010 at 10:16 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> This gave me the following dilemma:
> 1 add in the recipe with _append  or +=
>

Side note to lurkers: _append and _prepend should be avoided in favor of the
immediate operations (+=, .=, =., =+) unless you're doing a conditional
operation with overrides.


> 2 add to the inc and test the other version(s)
> 3 add to the inc and not test the other version(s) and assume things
> work properly.
> 4 not do the patch.
> 5. remove the old recipe
>
> I expect a lot of people would go for 3, but that *could* introduce a
> problem.
>
> BTW maybe it is indeed time for BBVERSIONS or whatever it was called.
>

BBVERSIONS is supported by 1.10, so it can be used as soon as we bump OE's
minimum bitbake version, if we choose to.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

