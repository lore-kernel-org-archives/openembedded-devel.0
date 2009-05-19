Received: from [209.85.132.249] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1M6QTl-00020r-7a
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 16:39:41 +0200
Received: by an-out-0708.google.com with SMTP id b6so1939637ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2009 07:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qU6Ck/xm0RnKI8UqRb25c93nvjKLWL1v0yXvDVG/tic=;
	b=e2XPcaGrH5CRFl0DEjlDhb4p5qoJ3LE/9RIP1kYL8Ag6qWYhJxNgxA+Fr5OReLDpWB
	viRVaq97vOBJyh54SikpkPFJeEpyPhS2/QLzNBnnGXMS2faSLyH1Ljxm182LoX4nxUT0
	wQlURC6IO70kTe54cK2NUayTQy0lqvXzwIMyQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=bZxMjXhW6FuJAR7qbpPeap2VySBKaRi3VueUYCgaiFLa0s1xykAONt7AuUMnYn0Fgr
	SdQmYLR1DqEScNSWba0Z8hhAvx8hZzg8AUH9+xUgcZ26YuK4g1I1nws4MzbgFooWhCL7
	F17C+Aoo4OhoKoAGAEYdcBjZdQ9Q8zgYCSb4s=
MIME-Version: 1.0
Received: by 10.100.132.14 with SMTP id f14mr224042and.79.1242743538778; Tue, 
	19 May 2009 07:32:18 -0700 (PDT)
In-Reply-To: <5c5e5c350905190702q56506baaja5a0abaff11e0d9c@mail.gmail.com>
References: <go498c$bqq$1@ger.gmane.org>
	<200902261144.46548.openembedded@haerwu.biz>
	<guq6vh$tmi$1@ger.gmane.org>
	<ac9c93b10905190519h5cfa8a96h688bbc00271de76d@mail.gmail.com>
	<5c5e5c350905190702q56506baaja5a0abaff11e0d9c@mail.gmail.com>
Date: Tue, 19 May 2009 16:32:18 +0200
Message-ID: <ac9c93b10905190732j441b6f40g27cd32e09e5033cc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Tue, 19 May 2009 14:39:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/5/19 Elena of Valhalla <elena.valhalla@gmail.com>:
> On Tue, May 19, 2009 at 2:19 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> I think adding recipes-broken (or broken-recipes) is a bad idea.
>> [...]
>
> How is this different from having recipes/nonworking and
> recipes/obsolete as it currently happens?
>
> more visibility?
>
> --
> Elena ``of Valhalla''

You have a point.
Then again things in recipes/nonworking and recipes/obsolete are
generally considered as very broken.
I would not want the task to repair all packages that are outside
these dirs and also not working on some targets/situations.

That is why I mentioned that if we want such a dir, we need a policy
on what/when could go in there.
(e.g. by requiring that a move to broken is ack-ed by 2 other devs).

Frans


