Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oku5m-0006eO-B4
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 09:26:47 +0200
Received: by iwn38 with SMTP id 38so1367552iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Ou3edutS1+MyFp5iweVJXM2C9yjvkaY3QYBEZTKRCII=;
	b=FrfNfyCygvEVDrUCEH+7ciCuMZabWns9byfHIr6UPd9yLswPEaiXuPQs1ovpQtay2g
	/7Ckw8OYwgml6LQE6TE2S2cWiwsbyZFqm7XJKv1P3UDhmmhTwYYMREPmyY5cdXs5Hcrf
	sA/XmYId7xAApAdpoNc2RjAQ3/oWRYPev2vuw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aYgbeoqckCmrj8Y/jepIdbB2eg3nVWdtNIYkWNc4/CwJ8Lr18YjTGQ7CJqaSgrGQcE
	Rrd/ucHtqPYzxfEBByksoltpTj8o+WcDFF4hffb4udpPbOMVqUsHFZdYzNU817EOhtAS
	nomt0TLMuicV/sZeCFQDCdecY0n3kfTOYpWL0=
MIME-Version: 1.0
Received: by 10.231.157.205 with SMTP id c13mr5681410ibx.71.1281943590775;
	Mon, 16 Aug 2010 00:26:30 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 00:26:30 -0700 (PDT)
In-Reply-To: <4C68AE52.8000709@mwester.net>
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
	<4C68AE52.8000709@mwester.net>
Date: Mon, 16 Aug 2010 09:26:30 +0200
Message-ID: <AANLkTikwtrUPv8rQJRY2_XuM6Qv9z-iR=_n0mVZdV0=s@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cleaning recipes
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
X-List-Received-Date: Mon, 16 Aug 2010 07:26:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/16 Mike Westerhof <mike@mwester.net>:
> Frans Meulenbroeks wrote:
>> Dear all,
>>
>> As some of you might have noticed I've been cleaning up our
>> recipes.during the last week or so.
> ...
>> Anyway, if there are issues because of this action, or if you feel
>> removal of a recipe was not in accordance with the TSC guidelines, let
>> me know and I'll repair.
>
> (This is NOT how I read the TSC guidelines, but I'm tired of arguing
> with your obsession!)

Well here's what the TSC said about it:

<quote>
Removing old versions
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The TSC looked into the topic of when to remove versions.


The TSC thinks there can not be a general rule of when to delete
a package. The TSC believes that in some cases a package should
never be deleted, e.g. with GCC/GLIBC to target a specific device
or distribution. For a series of major releases it seems plausible
to only keep the latest minor release of each release series around
given that the quality should increase with each minor release but
a removal of a minor release should not be done if there is a
PREFERRED_VERSION set. The TSC believes that 24 months can be a good
time to remove old major releases but it is certainly not the only
criteria for a removal.
</quote>

I've taken great care not to remove versions that are pinned by a
distro or that have a DEFAULT_PREFERENCE on them.
(but I cannot guarantee that I did not make a mistake). Also i avoided
deleting recent major releases (although major release is sometimes
something that is not too well defined).
I feel I did my best to stay within the guidelines of TSC, but if I
failed miserably to do so, I guess the TSC will tell me so (and I hope
they will be kind enough to accept a few things that have slipped).

>
> Frankly, the issue isn't if YOU put back a missing recipe, or I do it.
> I know how to use an SCM tool, it's about 30 seconds -- or less -- to do
> it. =A0The problem, as I've mentioned before, is in finding that to be th=
e
> issue, of course.
>
> What distros (and their package feeds) have you built to test your
> assumptions?
>
>> Have fun!
>
> Well, thank you for your wishes. =A0But to be honest, it's more fun when =
I
> can focus on fixing REAL problems, rather than worrying about artificial
> ones introduced for no really useful reason -- although I understand
> that you vehemently and stubbornly disagree. =A0I guess you win this
> point, so it's fun for you at least!

Well it would help if recipe maintainers would do their thing and
clean up things instead of leaving a trail of old (and often broken)
recipes.

E.g. we've decided to abandon legacy staging and where possible go to
BBCLASSEXTEND =3D "native".
Unfortunately I see only few people taking action despite several
calls for action.
At least one of the reasons seem to be the large amount of recipes to
be converted. This is also due to the large trail of old versions we
keep around.
At least my action reduced the number of recipes to be looked at. Both
the amount of native recipes and the amount of recipes that use legacy
staging is reduced.

Instead of complaining about my actions, perhaps first answer the
question what you have done?
E.g. how many recipes have you converted from legacy staging? How many
recipes converted to BBCLASSEXTEND?
At least I *do* something, trying to bring this to manageable proportions.

But ofc I guess there is a good reason not to convert e.g.
upslug2-native, and that there are good reasons to keep 3 different
versions around, or to have upslug-native with do_stage.
I don't mind having a few versions around as long as they are useful
and maintained. However for a lot of recipes this does not seem to be
the case. People just add new versions leaving a trail of old junk.
Junk which is sometimes even dangerous (e.g. in case of the
openssh/openssl/openvpn recipes, where the old versions have known
security vulnerabilities.
If the recipe owners did their thing, this would not be needed (but
unfortunately the case is that some maintainers don't do their thing,
and that lots of other recipes are orphaned)

Leaving my soapbox. Have a nice day!
Frans.


