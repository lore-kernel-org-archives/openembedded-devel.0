Received: from [209.85.132.248] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MQ3n7-0007po-6w
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Jul 2009 20:28:49 +0200
Received: by an-out-0708.google.com with SMTP id c5so966273anc.42
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jul 2009 11:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+gIJ4ATAhjCxZyua/g4OH3UZxcjxp4lCjvqtdyl7o3c=;
	b=AsvRRWGnTBqYkwLK/Ba1XaGQb7ZL3FjTihq8Qn5PCQcbyuXwTyfa2wB+7UBlFTvx8B
	D5sOHF5QH5XCtaj6YVAmXhK57I6P1r3AaW/JqdtykjnPMr7cGs5z64KEIvGBVorLizSX
	pn2yeL0lHZZT+MPeIDEpBak4HzxKH0b7vXzsg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Lje6AThx560gKs6EqVHvViVZXFaADm9K7BZgPfEchh2zB5qTFNq18iFChfRQof9w6b
	G2mj+S2O6fBW5rrVLmh1aGazqDmGI1yBpHaqDsUa9/txYdgC6vSiwNA2/rZ/22uauND3
	SV3Chibl4HrnimxsEMuJNk3eYJhafpcTPXC7g=
MIME-Version: 1.0
Received: by 10.231.33.137 with SMTP id h9mr846951ibd.15.1247422542637; Sun, 
	12 Jul 2009 11:15:42 -0700 (PDT)
In-Reply-To: <4A5A1705.5050302@gmail.com>
References: <4A5A1705.5050302@gmail.com>
Date: Sun, 12 Jul 2009 20:15:42 +0200
Message-ID: <c384c5ea0907121115p4d30e756he86bba75c66cc9e5@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Using git tags with OE
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
X-List-Received-Date: Sun, 12 Jul 2009 18:28:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

On Sun, Jul 12, 2009 at 7:01 PM, Marco Cavallini<koansoftware@gmail.com> wrote:
> Hello,
> anybody knows if is possible to use git tags with OE ?
>
> I'd like to tag a patch (SHA-1) identifying a particular 'state of the
> art' like it was a 'stable' version.
> At the moment I save the last patch SHA-1 and I use it as reference.
> For example if I successfully build just now a particular version, then
> I tag it mck-0.0.1 into OE so everybody can refer to such tag in the future.
>
> I thought it could be a good idea, what do you think?
>
Hmm, I think it would clutter up too much.

And if we use it, the tag should be self-describing.

If you built a particular version succesfully, it doesn't mean someone
else also can build that version
succesfully; anything outside GIT is also a dependence for a succesful build.

For example, today we have some packages that sometimes break a build
(probably due to a race condition).

I'ld say, keep with the commit hash for a known-good-build.

Regards,
-- 
Leon


