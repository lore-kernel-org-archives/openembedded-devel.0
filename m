Received: from [209.85.217.170] (helo=mail-gx0-f170.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LlWvP-0002q5-D0
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 00:17:51 +0100
Received: by gxk18 with SMTP id 18so4780986gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Mar 2009 16:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=5n2t0pUcEtPsE39B3L5oeWJscC3TV30sDKETTf/qKtg=;
	b=Dl1ZgDRhXv+ageQah41F6xWOaEs0zv3gIAGTq2HVqFQhXq7PIYfx4yUGatnv+F2O5z
	CfLHUfxH07GsgOYwR7YT4pErD0S7OG3BusULPtAEVznEXkJ3kGs/EniFh+hDHjd2VEhd
	9XezEcSI5tjXZ8WF2cf9b3MTwetjJ7wukdOzg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=gdjVtcebaMI6jnX71972ZZqw26Ng3OFtsWWMyR+dJCEhil5X2gP50OQEOZ/CP0ga49
	RNTs7WoTNqeaMtyCcfd8JavJCFuSQgHJ3VucgHSQ/CjCGQ94dS2YhMARJ9vXFS8SlL2x
	raosR6o2rA93xJ52p81J2alApF4wYfSW382Z0=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.150.137.9 with SMTP id k9mr11634465ybd.149.1237763790815; Sun, 
	22 Mar 2009 16:16:30 -0700 (PDT)
In-Reply-To: <b6ebd0a50903221610g15e7aed0q53fd1a4208775cf4@mail.gmail.com>
References: <20090321211351.BAC5718934F@amethyst.openembedded.net>
	<200903222019.02947.marcin@juszkiewicz.com.pl>
	<b6ebd0a50903221610g15e7aed0q53fd1a4208775cf4@mail.gmail.com>
Date: Sun, 22 Mar 2009 16:16:30 -0700
X-Google-Sender-Auth: 39357d6b60e76a8c
Message-ID: <b6ebd0a50903221616tb03772cke373e42a95594c27@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Chris Larson : base.bbclass:
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
X-List-Received-Date: Sun, 22 Mar 2009 23:17:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2009 at 4:10 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Sun, Mar 22, 2009 at 12:19 PM, Marcin Juszkiewicz
> <marcin@juszkiewicz.com.pl> wrote:
>>
>> Why those changes were not sent for review to ML? They touched core of
>> system so should be sent first. Especially when they broke many recipes
>> and added extra work for other developers.
>>
>> Now we can not use wildcards in SRC_URI which broke many recipes
>> (alsa-state for example) which is totally wrong. I hope that fix for it
>> is on a way - otherwise I would vote for reverting those changes.
>
> You're welcome to revert them if you like. =C2=A0I'm fine using my heavil=
y
> patched local branch if that's the way you'd prefer it. =C2=A0FILESDIR wa=
s
> never intended to stick around this long. =C2=A0It was a remnant of the w=
ay
> things were done before FILESPATH was introduced, and the wildcards in
> file:// urls were never intended to function, either, that only worked
> as a side effect of the way do_unpack was implemented, in shell.
>
> Rest assured, I'll be sure to send every single patch to the list in
> the future, even though It's highly unlikely that you would've spotted
> the wildcards bug via inspection.

I just realized the tone of the previous email probably made it sound
unapologetic, but that wasn't intended.  I do apologize, I'd done a
fair number of test builds, but apparently with the wrong combination
of packages.  It won't happen again.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


