Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PEGlq-0001Ya-8y
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 08:31:35 +0100
Received: by iwn42 with SMTP id 42so2545865iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 00:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=UUAPN337F3RL3inLnKLlExoljMONS9oFzn3g2qDWqBs=;
	b=r/Uo0ojjcPfyMEy1g7smYLDL5jfqyeXREqZKO6eIReVJqFINAOa7iBJNM7GlXvSrot
	7L9bEifhrZIkjLwMrJ5kOFRtDNn2Rc3wh4oS/ednu8dUcwgysfP9DfGEr6xkoEk/NRMO
	FS9+U6bHenNn0xs92tJjqACMp3QU6/WHyFEKc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=V3Y/oQuWg2BEqL+o2CDHbaJD7yNKYPDKhu8ptgXFCg9o+xdYCfxi06tJWj1wLXBlag
	AJJ/OAHf3JQEh1RJjTQkJnm4DRuOEutVXbgb8csQvpII4Ul4C1wm5RRrEyGIJ0kFtCGI
	OF5LVJweCWRaVYhOo8pYsq+uAyPsS+Euxe/L0=
MIME-Version: 1.0
Received: by 10.231.152.143 with SMTP id g15mr1409770ibw.76.1288942242026;
	Fri, 05 Nov 2010 00:30:42 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Fri, 5 Nov 2010 00:30:41 -0700 (PDT)
In-Reply-To: <20101105010014.GA6115@denix.org>
References: <AANLkTin8J-vi624U2Z4Emr=Zajq0+CsSnFR=a8+kjuOv@mail.gmail.com>
	<20101105010014.GA6115@denix.org>
Date: Fri, 5 Nov 2010 08:30:41 +0100
Message-ID: <AANLkTimy=N0waxtJfEkQ0e_FP4YxvNAwiF3W7=VZtTBZ@mail.gmail.com>
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
Subject: Re: Moving to layered structure of openembedded metadata
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
X-List-Received-Date: Fri, 05 Nov 2010 07:31:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/5 Denys Dmytriyenko <denis@denix.org>:
> On Thu, Nov 04, 2010 at 04:34:42PM -0700, Khem Raj wrote:
>> Hi
>>
>> In recent discussions there seems to be a lot of interest in moving
>> towards more layered structure in OE where we discussed machine
>> layers and arch based layers. There certainly are advantages to this
>> approach as discussed in other threads on mailing list
>> I think poky has already achieved that to a certain extent and has
>> made metadata changes
>> needed for such a structure. There are other polishing to metadata
>> which is beneficial in general like recipe licenses, gcc runtime
>> demystification etc. I would like to suggest that we adopt this
>> structure and use Poky as core layer which we
>> should always maintain in coherence and add the extra
>> machines,architectures and recipes as additional layers around
>> the base layer.
>>
>> This will also help us to scale the project and
>> reduce the to and fro in merges as well as communities at large will
>> benefit by seamless flow
>> of patches and other contributions.
>>
>> This will of course need a lot of work and I wanted to bring to
>> everyone to know if this would be a good approach moving
>> forward.
>
> Khem,
>
> That is already being discussed and decided. See the following previous topics
> on the mailing list...
>
> The raw OEDEM meeting notes, where if you read carefully (and between the
> lines :) you can see the suggestion of using Poky as a new core being
> discussed:
> http://article.gmane.org/gmane.comp.handhelds.openembedded/39108
>
> Call for open discussion and future plans for advancing OpenEmbedded and
> Yocto Project:
> http://thread.gmane.org/gmane.comp.handhelds.openembedded/39114
>
> --
> Denys

Denys, I don't think it is decided yet.
At OEDEM it was suggested and discussed, but not really decided. (and
actually I doubt if OEDEM would be the right place to decide this,
especially in such a short timeframe without getting the rest of the
community involved).
And the call for open discussion is just that, a call for open discussion.

However, I do see consensus emerging, and personally I think the
proposal of Khem is a good idea.
Actually I already did a small test. It seems the most troublesome
issues in merging things are
- the legacy staging that still exists in quite some OE recipes
- bbclasses that are out of sync (or do not exist in yocto, but in
that case they could be in an OE overlay)
- toolchain related issues. E.g. for ppc there is no spe support yet
in yocto; however this is being worked on)

I know merging it will still be a lot of work and won't happen without fallout.
Then again I am more than willing to do my share of the work. My main
concern is how to deal with all the old stuff we accumulated.
In order to move to a layered structure with quality recipes we might
need to move them over one by one (fixing things like LICENSE while
we're at it).

Frans


