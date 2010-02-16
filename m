Received: from mail-yx0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NhJ00-000637-4I
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 09:41:43 +0100
Received: by yxe1 with SMTP id 1so4785738yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 00:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3FhcZS9Me8INWCBDVlNkeg4rj/jzg6D0wt+NZSwdIG8=;
	b=NTjmWueCE3ZQUN0CQ2saww+uv2VtAdw/tXWReT3oPS5XuhbCFCCCcT/7lHf41SC0Ol
	bFAIyvyjsa6VHA7HFR09UZsnC90UHQZ01g5DIVwwTlw/WY4muu3X7xuEV8sqNu8z4s6/
	URZ//9QAezEYt29ALPxZ95MDEpa6SLKcQHBCk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Xh/Js4dGkFrycPEhfhoilYnitreQnlkogxN8bVNE2IgVXFBzhD+IQFNQJ/7NN3Njmp
	lj6j5CReTctedlnVHalFAQUyiHLJFt2/O0qyNPFd3XC6cwXUeduZaQq0t6YarFDpvxck
	Zas+Ce8+puA5iNCejIjXCJWFMF4ODF6AJNGUA=
MIME-Version: 1.0
Received: by 10.101.106.20 with SMTP id i20mr2777893anm.233.1266309541114; 
	Tue, 16 Feb 2010 00:39:01 -0800 (PST)
In-Reply-To: <hldk2b$5tt$2@ger.gmane.org>
References: <b6ebd0a51002151538o524cdf17s228535e93b28d4d4@mail.gmail.com>
	<hldk2b$5tt$2@ger.gmane.org>
Date: Tue, 16 Feb 2010 09:39:01 +0100
Message-ID: <ac9c93b11002160039j717d1611wbdd1d2fac220dd55@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Cleanup / janitors
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
X-List-Received-Date: Tue, 16 Feb 2010 08:41:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/16 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 16-02-10 00:38, Chris Larson wrote:
>> Greetings all,
>>
>> Per discussion in the TSC meeting this month, I'm sending out this email=
 as
>> a probe. =A0Would anyone on the list benefit from a "janitors" type proj=
ect,
>> to outline and document specific cleanup tasks and how they should be do=
ne?
>> There are many tasks that need doing which involve editing of large amou=
nts
>> of files in relatively simple ways, and I suspect, but am not yet certai=
n,
>> that there are a group of individuals who wish to contribute to the proj=
ect,
>> but are new enough that they don't feel confident diving into anything
>> invasive. =A0This sort of a task could be a starting point for that sort=
 of
>> individual. =A0Thoughts? =A0Anyone out there in that camp currently that=
 would
>> benefit from something like this?
>
> The first project that comes to mind is converting simple recipes (e.g.
> not perl) to new style staging. It's a fairly simple job that has a huge
> impact.

Problem is to do that reliable.
It is easy to remove the do_stage section from a recipe, and it is
easy to verify that it builds, but it is already becoming less trivial
to verify that everything that depends on it builds too, and it
becomes complicated if you want to verify that it actually works
(especially if you have no clue what the package does).
(btw actually when trying to build dependend packages you should
either use packaged staging or remove your work dir).

I don't mind spending an hour or so removing some do_stage things, and
I don't mind if my computer hums along a night or so to compile those
packages, but I'd rather not burn my fingers and get blamed for
breaking things outside my control & competenence.

The other thing that comes to mind is better describing the job. If it
indeed is only removing do_stage it is probably better done by someone
with commit access, otherwise someone else has to spend the same
amount of time to apply the patch, remove it from patchwork etc.

Frans


