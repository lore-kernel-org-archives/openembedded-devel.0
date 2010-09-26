Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ozq7d-0007cy-Fm
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 14:14:26 +0200
Received: by iwn2 with SMTP id 2so2032975iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Sep 2010 05:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=8xVYjIs/3tBP0PjCZoRlISPKC+HOYSKLgMAx9QMBN9w=;
	b=gXU/BtKq6msG3u0nMiFwAynrUn3ptfc/hkzcfQNQWCLTvln+Y5cv/vy3vn4ulcOVgg
	I6i3ZHzamwbR11dt/NKGBXVZB8hrHteAyC22U4sdzQDvKyCeUGJuOgwY+CWYFPBSblGK
	NkrjrNAuBafWEf0li1D0jS9oDLd2gMf0vzDCA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=wbRkZQr1bIrhds8U7cOcTHBAx5JLTz9uRnP/yTUNXz+zFVujABaOFCN/H+T2BmiI/Y
	9LgPud87ErvE699l0OLXu+Yw1tu3TsVICuuycB5B65GMXvllWtsxkrpwzuJuRsknJqd9
	S8Z8KsvmA7jMlFKEdNsBjKVhbbjQaZ5K+ZgDY=
MIME-Version: 1.0
Received: by 10.231.157.135 with SMTP id b7mr6909991ibx.164.1285503254591;
	Sun, 26 Sep 2010 05:14:14 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 26 Sep 2010 05:14:14 -0700 (PDT)
In-Reply-To: <20100926112659.GB6483@jama>
References: <AANLkTi=Wt1eRcSoXzjwMJizLBgQ-+hV=Xj1UWW155MWQ@mail.gmail.com>
	<20100926112659.GB6483@jama>
Date: Sun, 26 Sep 2010 14:14:14 +0200
Message-ID: <AANLkTi=oRDVmJ67UfUHNTtECM1gW_V96Lt3PwEG-OvUh@mail.gmail.com>
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
Subject: Re: some more non fetching recipes
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
X-List-Received-Date: Sun, 26 Sep 2010 12:14:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/26 Martin Jansa <martin.jansa@gmail.com>:
> On Sun, Sep 26, 2010 at 12:21:36PM +0200, Frans Meulenbroeks wrote:
>> Apart from the opensync and uclibc recipes that did not fetch and were
>> reported before, I did get fetch issues for the files below.
>> Haven't had time to dig into these, so some of these might be false alarms.
>> If anyone feels attached to a recipe or can say something about it,
>> please take action.
>
> There was about ~1000 recipes failing to fetch few months ago, I don't
> think this number is that much lower as I haven't seen any changes in
> most of them.
>
> See my download status:
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-April/019206.html
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-April/019234.html
>
> but I was testing not only latest version, but all versions and for all
> ARCHs.

I think we got rid of some of these as some of the recipes have been
moved to non-working, but it could well be the there are still 900 or
so non-fetchers.
(note that I didn't do a full test, I only peeked at recipes that also
contained unused patch files; since I wanted to verify those).

But you've hit an intrinsic problem in OE:
there is a lot of crud/non-working recipes around and if you report it
there are three possible scenarios:
- someone tells you "go fix it"
- nothing happens ( the most likely scenario)
- someone actually takes action (very rare)

And if you go ahead and fix things people will axe you if you make a mistake.
Caused by the latter I have decided for now (maybe to the relief of
some) to only fix recipes that I am really interested in, and for the
rest restrict myself to reporting the issue.
The negative vibes that my attempt to do some generic cleanup caused,
resulted in the conclusion that it is not worthwhile my time and
energy. Sad but true.

What OE really need is a sense of recipe/machine/distro ownership and
a set of QA guidelines for recipes.
My guesstimate is that currently almost half of the recipes are
non-working/obsoleted by newer versions/outdated/non-maintained.

Frans.

PS: I will still work on removing the unused patches. I feel obliged
to fix that as some of it may be relics from my recipe removal in aug.
Anyway that work is fairly well automated by now and requires little
handwork (assuming recipes fetch, so cleaning dirs with non-fetching
recipes might be skipped).


