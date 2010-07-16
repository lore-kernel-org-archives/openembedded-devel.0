Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OZnbC-0002Co-Du
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 18:17:56 +0200
Received: by pwi10 with SMTP id 10so975173pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 09:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=Rnqd53mMqu4BOLZSE7EKqbfaoOF20nAL7qo834pQUzc=;
	b=QkkjjfPfJEg2KHiuNBp84+rxTApLmPNokfsrPWFJ/yYngUQRkgOloPa3f/v+kzUFlL
	DVMI9MsgRxtjyi9fpPCcMnNCUJ0jl8z2EXwF0xjKHxCEESh8U4cg2GWporcrZpFMP8AP
	a6oA5mzZXpgRJhgcLtXyniT/NZuaoFXNROs4E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=SmnggZY1djl4NlK/sNnwG8EDVyFrE9c8zs5RCiDRMKLsMDHBG5AnS8d/5K895d3u6G
	szUbEgdwwOpKlBYdR6AUSvCDbfRxXowya+dsYhG9eneF1s0RoFvAyv28wCbZHQzJJHOb
	SFa1s0J57cOQXchVNijNZGP9IJZuqmgOvPfzQ=
Received: by 10.142.185.13 with SMTP id i13mr1750285wff.234.1279297030706; 
	Fri, 16 Jul 2010 09:17:10 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.212.11 with HTTP; Fri, 16 Jul 2010 09:16:50 -0700 (PDT)
In-Reply-To: <4C407EE5.6050802@cbnco.com>
References: <1279290319.10837.1747.camel@rex> <4C407EE5.6050802@cbnco.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 16 Jul 2010 09:16:50 -0700
X-Google-Sender-Auth: BF532Pcv3hQ4hOmlYHVVsDo5KpU
Message-ID: <AANLkTinCV6RmFz560GUhNF_OCnsMxHS5enGl1OIYma0V@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: [Bitbake-dev] A new bitbake extension: .bbappend files
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
X-List-Received-Date: Fri, 16 Jul 2010 16:18:21 -0000
Content-Type: text/plain; charset=UTF-8

It basically solves the same problem.  It's slightly less flexible, in that
it has to apply to a specific .bb, whereas an amend.inc can apply to any
version of a recipe, etc, depending on where it resides in the FILESPATH,
but amend.inc cannot be integrated into bitbake without a performance
impact, because we don't necessarily know the FILESPATH until after the
finalizing steps at the end of the parsing process, and then it has to
re-finalize after the amend.inc is parsed, to ensure its anonymous python
functions are executed.  The advantage to this is its simplicity in
implementation and the miniscule performance impact.  One slight concern is
its assumption that the basename of the filename is unique, but I expect
that's okay in most real world cases.

I hope to spend some time poking at this today.

-Chris

On Fri, Jul 16, 2010 at 8:46 AM, Michael Smith <msmith@cbnco.com> wrote:

> Hi Richard,
>
> Does this do anything different than amendrecipes.bbclass?
>
> Mike
>
>
> Richard Purdie wrote:
>
>> The idea is that if bitbake finds any X.bbappend files, when it loads
>> X.bb, it will also include these files after it parses the base .bb file
>> (but before finalise and the anonymous methods run). This means that
>> the .bbappend file can poke around and do whatever it might want to the
>> recipe to customise it.
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

