Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKQ4M-000822-LU
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 07:40:17 +0100
Received: by yxd5 with SMTP id 5so4116072yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 22:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=VhwsYOji+VfKGHAzbV2jrf9uOQEGRLKN799nJ7bXMEg=;
	b=nOx7pWEqQCEz9Kb7JunRTK2UbixYql2bBDD4XO/mjBhoKPRJyD6CSxDTcYQeWmEnW9
	ZLB5Dqe0hc7+WkBCcceodEgKpq2Xbo6pJYTJvOE/nTN9U8ALMp8wfOw9g44gcjxRRW7F
	VD2AwHUkN13IOCs9h2Hksf1h7nyj54LSSr9SE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=ucHiXamBfwAz4wqPAyv2s4kCHMBPSwyLhX7Upd+dRrv8EBnhM/RViSoqljfQq1pAEO
	/qNek1+T86vW2y2uJ/Dzg6/7sXoWzj8EiwETyLqC/bFlfDVZTNf5UiZ2hDeLnQi1BPiA
	ysV+aryTkVKiZvYvU32CVriXBKySUmimsERuo=
Received: by 10.91.47.38 with SMTP id z38mr6730871agj.129.1290407933980; Sun,
	21 Nov 2010 22:38:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Sun, 21 Nov 2010 22:38:33 -0800 (PST)
In-Reply-To: <4CE96FE9.2080707@gmail.com>
References: <4CE96FE9.2080707@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Nov 2010 22:38:33 -0800
Message-ID: <AANLkTi=k06bB44UMxsQADDJxbPFkLKk53P9KCtvNH=qt@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: pixman_0.21.2.bb do_compile failed
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
X-List-Received-Date: Mon, 22 Nov 2010 06:40:30 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Nov 21, 2010 at 11:15 AM, Marco Cavallini
<koansoftware@gmail.com> wrote:
> Hi,
> Recently I am facing to a new error using DISTRO=kaeilos-2010 and
> MACHINE=ronetix-pm9263.
> I would be grateful if anybody could give me a hint about how could it
> be caused and how to solve it.

as a quick workaround can you add
ARM_INSTRUCTION_SET = "arm" in the recipe and see if that helps ?

>
> http://pastebin.com/hi2SVSuF
>
> TIA
> /marco
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


