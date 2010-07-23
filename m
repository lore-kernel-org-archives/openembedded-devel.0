Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OcLo9-00022M-1U
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 19:13:32 +0200
Received: by ywe9 with SMTP id 9so88260ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 10:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=idy52TYLvmjoLvLRjs/SXNR41V/xStF9Fbj8mYmDQUE=;
	b=Jtqw7d5eI9ku7S6J+z1/iEsAwcvzQhi6xk/DpA9B6pIci+OOc/I6InmHZM8XBHlKLW
	fozdOiP7pKAOr0Tpd1TD77146e5ZKq1h4E1n1Hk6sS3nW8xZOIi9iCYgylj5qnUWsyJp
	TsWLWcKLSZNH3B0bUw+gt8aYaS8NVQ53E9NJQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=A4NZGANCvLsPW13evQjqSvf2e0+m19hswMeZo2Fxa1xEYhtHCM4ddFvHifIBDmG2pE
	5khAjJptXbLpEHylsaXl1J7JibN5H2RdTr3HrbRPPLEZHrK/6m5ZwcbqecX6+G+iT8f4
	TSU5WkDcUhIrZ+ShKL7vk2h3Ja8AtT8wWXEb0=
Received: by 10.101.170.3 with SMTP id x3mr4219143ano.142.1279905179428; Fri, 
	23 Jul 2010 10:12:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.186.88 with HTTP; Fri, 23 Jul 2010 10:12:39 -0700 (PDT)
In-Reply-To: <1279884267.13006.45.camel@rex>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com> 
	<i2bg5t$mvp$1@dough.gmane.org>
	<1279872152.21888.149.camel@lenovo.internal.reciva.com> 
	<i2bir6$un3$1@dough.gmane.org> <1279875548.13006.32.camel@rex> 
	<AANLkTik8CaoY=od-BH7_ymJf1Yet5e-cJGJ3PFyPm42N@mail.gmail.com> 
	<1279880630.2692.21.camel@mill.internal.reciva.com>
	<1279884267.13006.45.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Jul 2010 10:12:39 -0700
Message-ID: <AANLkTi=2f4eH9kXpArA7RbMVpOP7e5FrM0mkjB=7Z+NQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/4][RFC] Remove CROSS_DIR, install cross-packages 	into native sysroot
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
X-List-Received-Date: Fri, 23 Jul 2010 17:13:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 23, 2010 at 4:24 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Fri, 2010-07-23 at 11:23 +0100, Phil Blundell wrote:
>> On Fri, 2010-07-23 at 11:35 +0200, Esben Haabendal wrote:
>> > config.sub will generally not accept something like armv7a-*
>>
>> That's probably true, but it ought to accept armv7a-*-* (and has done
>> for about fifteen years, so I expect almost all packages should now have
>> picked up that change). =A0I think OE always uses the triple so there
>> oughtn't to be any problem in practice.
>
> With tune-atom.inc active you'd have core2-*-* which I suspect
> config.sub will not accept. The point is the names we choose for sets of
> optimisation flags are not necessarily going to map well to config.sub
> and we shouldn't be crossing what are currently two independent
> namespaces...


if we want to be able to build per machine then we have to add put the
tools under MACHINE dir in native sysroot
but subfamilies can be differentiated like arm5t, armv5teb, armv7 etc
thats how far compiler/toolchains can
differentiate. There is no problem with two  different architectures
e.g. mips, arm



>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


