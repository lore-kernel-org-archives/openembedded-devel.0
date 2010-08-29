Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Opmby-0005qK-Be
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 20:28:28 +0200
Received: by iwn2 with SMTP id 2so4171499iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 11:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=1BjHuchyBZUlFA7Dv2I4vYiRrPG/TnOFTQiajI08dUE=;
	b=DiKBxmbmzQKMHoUD42E9whultuQph3l6r3DrthyV3nSn79hT14D44isVp+52aXuIDE
	FeVNtxlgXegXXwHmHnZqWSGdAPtmTmPc29QApRnqEXkB1wJxxhMIaZo/BKDre0+3QDKE
	UvbsIgiYr+9+3Jq2jEO0yfAoMe2rGpnEQduyA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=R5MyoG32cWXOB4dnoG7Uchy8UvBpNVvKepYftQUCrlBLWuWn9PWveCEgK+UK6LZF+k
	OgeVvTku6m80WdoUw6HBrL3aDc/1SB6A8RK/qvLSiypzUooERS28yT+ZAMilBtUHONRE
	u31pwHHc2YsNFc/2QnlcDn7uPCojdxdkoLJ4M=
Received: by 10.231.152.146 with SMTP id g18mr4345332ibw.48.1283106403641;
	Sun, 29 Aug 2010 11:26:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Sun, 29 Aug 2010 11:24:11 -0700 (PDT)
In-Reply-To: <AANLkTinJ7rUj8jq=PYeVXk7yZiLB6AtxQm9JKDcXZswR@mail.gmail.com>
References: <AANLkTinvhMiZhHC4GrR8Muf-7oPa-j3zBeDWCZrkTd-z@mail.gmail.com>
	<AANLkTimH2YnW3CnLFxa6NyNCeC0-jNqy0dhDXS_ddWX_@mail.gmail.com>
	<AANLkTinJ7rUj8jq=PYeVXk7yZiLB6AtxQm9JKDcXZswR@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Aug 2010 11:24:11 -0700
Message-ID: <AANLkTikONxUinXtW0V6nxzt11MWE0Qt3HUxsZ9N+0_48@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Simple srctree example seems not depend on toolchain
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
X-List-Received-Date: Sun, 29 Aug 2010 18:29:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Aug 29, 2010 at 7:30 AM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Hello,
>
> On Sun, Aug 29, 2010 at 12:27 AM, Leon Woestenberg
> <leon.woestenberg@gmail.com> wrote:
>> On Sat, Aug 28, 2010 at 10:46 PM, Leon Woestenberg
>> <leon.woestenberg@gmail.com> wrote:
>>> in an attempt to learn how to use srctree I am hitting either 1) an
>>> oversight on my behalf or 2) a bug in srctree.bbclass 3) something
>>> else
>>>
>> After further debugging I am more sure I'm seeing wrong behaviour from
>> srctree.bbclass.
>>
>
> This was a bogus report. I thought I was working against latest OE
> GIT, but in fact, it seems the GIT service is unreliable currently and
> I have probably hit an aborted pull.
> Download speed from GIT is ~20 kB/s.
>
> I'm interested in adding this helloworld2 as helloworld-srctree as an
> srctree example.

Yes please go ahead that will be a good template to have.

>
> Regards,
> --
> Leon
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


