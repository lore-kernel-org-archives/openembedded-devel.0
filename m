Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P1vfU-00009J-V5
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 08:34:04 +0200
Received: by iwn2 with SMTP id 2so4707393iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Oct 2010 23:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=XXv6gnsc9G5UrGMgOyq0y6bHKm+EEVTkiT9dCFlWozk=;
	b=NHDpVaZElhmdA5fSULga8CaxIwoQOmbMwL/ry2NtremZUuwE66UOV2ybOP3kER3Epx
	yFf7LiQ72BI+Rs2tqrrrplrQ8acL7o0SoRsxWodWB99iPcLal4cMWNWc0O+FT+LHS7qj
	ruZ9oW+kIwB7yiMtfYblOQrWjGYkIsJpEsF+A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NpO5uAh1eIU8V4mfUNQgRc3nbGc3DYDz4dL7kGp+RvUc4wXrDu+6vD47DKUGqyIxcB
	MeaflVyDZRKu1xtJuFOU6i4uUAndtuvct5c3pBzhHXBcKo7lpb208UJwhUzzqZ2EaqYp
	6gZk34vJU5H9andvmRqoKFaJ2bAxorlR8SVZc=
MIME-Version: 1.0
Received: by 10.231.160.17 with SMTP id l17mr6812392ibx.102.1286001226371;
	Fri, 01 Oct 2010 23:33:46 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 1 Oct 2010 23:33:46 -0700 (PDT)
In-Reply-To: <AANLkTinw6Tz0fDEGPBDyvv85KRk4w3v+ygeNemSHceh2@mail.gmail.com>
References: <1285777033-19478-1-git-send-email-t.fromm@dresearch.de>
	<AANLkTikWLrAZaejWvnBGf4hn0CdKV2FgYiMxLEkDn+Wi@mail.gmail.com>
	<4CA46AD8.2070205@dresearch.de>
	<AANLkTimOEDXH3=OrROehD+sVtNdihoO8Q3P6Vy0oJscQ@mail.gmail.com>
	<4CA5B348.1000404@dresearch.de>
	<AANLkTinw6Tz0fDEGPBDyvv85KRk4w3v+ygeNemSHceh2@mail.gmail.com>
Date: Sat, 2 Oct 2010 08:33:46 +0200
Message-ID: <AANLkTimviE5VqivppJTVZvhspZtsiUNpqVjGD4=p=No+@mail.gmail.com>
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
Subject: Re: [PATCH] libunwind: force gcc to be built first
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
X-List-Received-Date: Sat, 02 Oct 2010 06:34:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/1 Khem Raj <raj.khem@gmail.com>:
> On Fri, Oct 1, 2010 at 3:09 AM, Thilo Fromm <t.fromm@dresearch.de> wrote:

>>
>> I tracked it down - libunwind publishes unwind.h, and gcc uses an internal
>> file of the same name while being built.
>
> Yes gcc has its own version of libunwind which it used unless
> configured with --with-system-libunwind
> IIUC the problem happens with target gcc not with cross-gcc. target
> gcc is built using cross-gcc and
> <sysroot>/use/include could be preferred over the location of
> libunwind.h which is in gcc sources
> If thats the case then we need to fix gcc build to not look into
> standard sysroot/usr/include but prefer
> the local unwind.h when its using internal libunwind. The problem
> would not show up if the libunwind versions
> were matching but that may not be the case always and I dont know of
> hand how we can fix the gcc configury/build
> to ignore installed unwind.h
>
> You workaround would only work if build sequence was followed if some
> one just cleaned gcc and rebuild it
> the problem will resurface.
>
Thanks for the analysis Khem.
This is indeed more or less what I had expected.

For me this patch gets a NAK as it does only masks the problvem in
some cases but not really solves it.

Frans.


