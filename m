Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OcfpB-0006lL-Q3
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 16:35:39 +0200
Received: by bwz10 with SMTP id 10so2286998bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 07:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=T914l0jYoLk1EHfcZuQZtCVzBvZjzgnT6j7l4JZFNWA=;
	b=A1zv3OmdVQ05opeGgNxWcmg2p+m3bPTRbwrjhZZVfYcnlEs3mw9XpajmLvjfeDA+FS
	YNLj5fUoE77yucUl+5AVt2LLQNNy+OQO+c3QEHT0r3Oz8xHYjfGBiweZEUAaPxTY5cep
	46A+FCHQWJI4zvdNcSKK3W9Fp1OfGnU4LFDU4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=BW7JRAHPI/cf3bBVXPY463GHyUo9OjELGxqvDCOzCzk9U+FxDoKSo9wl/8ELJ681Ho
	iKqpkSVsat+gsBHfYpDNWiJB8WnyeOGYuQJavaGDjXgbjLxBuAqBL5gCroXeWMSnlFyw
	DDSumQrTvmfTrNZb1/t0Xn6WM2s8bVc1Bc8bo=
MIME-Version: 1.0
Received: by 10.204.82.18 with SMTP id z18mr3746418bkk.125.1279982125583; Sat, 
	24 Jul 2010 07:35:25 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Sat, 24 Jul 2010 07:35:25 -0700 (PDT)
In-Reply-To: <4C4AE42C.5000306@welchs.me.uk>
References: <AANLkTim5aAnNi5VFs7=-gg1XaM=+KBeUs-G494SEbR+V@mail.gmail.com>
	<4C4AE42C.5000306@welchs.me.uk>
Date: Sat, 24 Jul 2010 16:35:25 +0200
Message-ID: <AANLkTimG_U4Gsc9LuK6oKDJO2rE=xB7cDQzGf6dsh2GM@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] get rid of legacy staging
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
X-List-Received-Date: Sat, 24 Jul 2010 14:35:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/24 Martyn Welch <martyn@welchs.me.uk>

> Can anyone point me to any documentation that describes what legacy staging
> is and roughly what needs to be done to remove it?
>
> I've looked on the wiki and find nothing, at the moment "legacy staging"
> might as well be a marketing buzz word. I'm sure I'm not alone. I'm sure
> there are loads of recipes that have been converted and I'm sure I *could*
> spend a few hours trying to work out which changes modified them to remove
> "legacy staging", however I wouldn't have any free time to convert any of
> the un-touched recipes...
>
> Martyn
>

There was a post half a year or so ago from Koen, but I can't find it.
Basically it boils down to removing do_stage from a recipe in which case
do_install is used to install things in staging
in some cases do_install need to be modified to deal with peculiarities that
were done in do_stage

For native recipes NATIVE_INSTALL_WORKS = "1" may need to be added.

If you are interested in tackling some recipes, perhaps also ask for advice
in #oe on freenode irc

Frans.

>
> Frans Meulenbroeks wrote:
>
>> Dear all,
>>
>> The topic of legacy staging has been on the table for probably 8 months or
>> so.
>> Still we have a lot of recipes that use legacy staging.
>> This email tries to stir up the discussion on how to get rid of these.
>>
>> Most of the major recipes seem to be converted.
>> Koen reported 53 recipes with legacy staging after building
>> angstrom-gnome-image and openjdk. [1]
>> This seems an indication that lots of common and actively used recipes are
>> converted.
>> However there are still 1100+ recipes and about 150 .inc files that have a
>> do_stage rule [2]
>>
>> This indicates that quite some work is still needed.
>> Let's have a look at the options. What I see as possibilities are:
>>
>> A: accept that we will have lots of recipes around that use legacy staging
>> B: update and test all recipes (at least up to the level that it is
>> verified
>> that the files stage properly after removing the legacy staging
>> C: with a sed script or so remove all do_stage functions and hope the best
>> for it.
>> D: remove the recipes that still use legacy staging as apparently no-one
>> is
>> enough interested in them to update them.
>>
>> Let us now look at the pro's and con's of these possiblities:
>>
>> From the various calls to fix this that I have seen on the mailing list A
>> is
>> not really too desired.
>>
>> B would be nice, but is a hell lot of work. With 1100 recipes, 150 inc
>> files
>> and 5 minutes per recipe, this takes about 100 hours.
>> Even with one minute per recipe it would be about 20 hours.
>> Given that lots of the recipes for which this applies seem to be rarely
>> used
>> or are older versions of recipes that are not used any more, this seems
>> somewhat a waste of time.
>> Unless someone stands up as volunteer or someone develops an automated
>> solution, I feel this is not going to happen.
>> (and no: I feel no desire at all to spend hours and hours of my spare time
>> to convert recipes most of which I am very unlikely to use).
>>
>> C is a quick hack without warranty that the recipe is not broken.
>> I've no idea how you feel about this, but in my opinion I'd rather have a
>> legacy staging recipe which works than a non-legacy staging one which
>> might
>> or might not be broken.
>>
>> That leaves option D. Of course removing all recipes that still use legacy
>> staging is not desired, as that would also mean e.g. removal of the 53
>> recipes identified by Koen. [1]
>> However, the idea has some merits. Lots of the recipes with legacy staging
>> seem to be old recipes. See e.g. the alsa-lib example [3]. By removing
>> these
>> at least the time and work needed for B would be less.
>>
>> Now how to proceed?
>> Well that is the reason for this email.
>> I would like to hear your opinions on this, so feel free to voice them.
>> If there is consensus we can start deploying things. If not we might ask
>> the
>> TSC for some guidance.
>>
>> To start off the discussion let me give you my personal view.
>>
>> I would be in favour to remove all recipes that use legacy staging and
>> that
>> do not fit into one of the following categories:
>> - it is  the most recent version of the package that is build by the
>> recipe
>> - it is not the most recent version but all more recent versions have
>> DEFAULT_PREFERENCE = "-1"
>> - it is pinned by a distro
>> - it is a toolchain recipe (gcc, binutils, automake, autoconf and probably
>> glibc)
>> - it is a kernel or u-boot recipe
>> The rationale behind this is that it removes a lot of recipes (and hence a
>> lot of work converting).
>> Note that the recipes are not gone. They will remain in the stable 2009
>> branch and they can always be retrieved from git.
>> So should someone for whatever reason need a recipe he/she can recover it,
>> fix it and put it back.
>>
>> After that we can make an inventory of the work remaining.
>> If there are relatively few recipes remaining it will become a lot simpler
>> to find volunteers to clean up those.
>> If there are many e.g. because an orphaned distro or machine pins lots of
>> legacy recipes) we might consider a different scenario.
>>
>> This is my personal view, but ofc I would like to have a discussion on
>> this
>> and hear other opinions so preferably we can come to a consensus.
>> The only request I have is that if you advocate a certain solution that
>> you
>> are willing to participate in realising that solution.
>> E.g. it is easy to say that B is the desired scenario and that others
>> should
>> implement this.
>>
>> Best regards, Frans.
>>
>> PS: if the consensus is to start off removing the legacy recipes as I
>> proposed above, I am more than willing to participate in that.
>> and if someone has a good idea on how to automate identification of
>> qualifying recipes (especially weeding out from the list, the ones we
>> still
>> want to retain), I'd love to learn about that too.
>>
>> [1]
>>
>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-July/021870.html
>> [2]
>>
>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-July/021901.html
>> [3]
>>
>> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg08150.html
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

