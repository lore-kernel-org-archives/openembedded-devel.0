Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>)
	id 1PfGZM-0001k2-Ll; Tue, 18 Jan 2011 19:46:16 +0100
Received: by iyj18 with SMTP id 18so6208124iyj.6
	for <multiple recipients>; Tue, 18 Jan 2011 10:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=mt+h2pr+MZszZeehg7WUD3C3gnTEG22sKtIO5M3SDUM=;
	b=JRBfjuzY/HjDpOWU4tRXfQg5l3wjsAnJ5gFmdbsjnMWuNWH86jxeew63yA3BX2h0H+
	gr+ATyy3Mg2t0K/iPtW/2W+EkxGOwM8boHSBDjB8Ic6SGrLwIe0soj4M1LePgTAO5s7n
	Z5Wd/kv/H68EDYLYVJ79Dg2xNBVl8kvq1deGA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vuod+iOgsr2o9WsxuFpnWf4gfdwCw0pmB5/hifWMjKq/L/lSXeRrnVX99ynlmh26jM
	ZU+2FrNEfCmS/eaZVKuU6qaHpCLzfBnCCdmNv4eN0uIKy7c7xVkPHw0jrehVqA5oS+oK
	ZWZNer4XMf1Hl0QjXS4FrZIzSZAkZjtbK4J1A=
MIME-Version: 1.0
Received: by 10.231.34.65 with SMTP id k1mr6549073ibd.9.1295376336656; Tue, 18
	Jan 2011 10:45:36 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Tue, 18 Jan 2011 10:45:36 -0800 (PST)
In-Reply-To: <20110118113145.GA27002@sirena.org.uk>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<20110118113145.GA27002@sirena.org.uk>
Date: Tue, 18 Jan 2011 19:45:36 +0100
Message-ID: <AANLkTik-GRoEKCeEjC2LCg10GQq7CSVG9Ky7Z6Cn0DBO@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-members@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Tue, 18 Jan 2011 18:46:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/18 Mark Brown <broonie@sirena.org.uk>:
> On Tue, Jan 18, 2011 at 06:05:41AM -0200, Otavio Salvador wrote:
>> On Tue, Jan 18, 2011 at 05:21, Graeme Gregory <dp@xora.org.uk> wrote:
>
>> > OE is not a distro so this is a non starter already, please don't bog
>> > down this discussion by re-opening this again. Angstrom 2008, Angstrom
>> > 2010, kaelios and slugos are all released distributions with different
>> > versions of apps just as a starter and they arent even near the total
>> > number of distros in OE.
>
>> I disagree. I think having too many versions of a package just makes
>> difficult to get things done:
>
>> =A0- it increases the amount of maintainence work;
>> =A0- has a bigger time to get bugs spoted;
>
>> Users of old distros ought to use a specific repository and branch.
>> Master ought to be kept clean for 'next distro release'.
>
> I don't think there's a massive conflict between the idea that it's a
> good idea to keep the number of versions that are maintained limited and
> the idea that the limit on the number of versions being maintained
> should be greater than one which seems to be all that's being said here.

To make things a little bit clearer.
I am not opposed to multiple versions per se.
I have a concern wrt maintenance though, and that is one of the
reasons I prefer a limited number of recipes.

As a recipe maintainer I feel that I do not need to carry the burden
caused by a decision of a distro for a specific version of a recipe.
E.g. if I maintain package foo, and that package is at version X and
upstream moves to version Y, I think it is part of the responsibility
of the recipe maintainer to move to Y (after testing of course).
However if Y is proven to be stable, generally as a maintainer I want
to retire X (unless there are compelling reasons to keep it, e.g.
because heavily changed functionality or incompatible api's or so).
If a distro feels it wants to stay at X, I have no problem with that,
but I feel that distro should also take over the maintenance
responsibility (and retire X if it is not used any more). Don't put
the burden of your choices onto someone else!
I have neither the time or the interest to support a substantial
number of variants that IMHO are outdated. If someone else feels (s)he
wants to keep using them, feel free, but then also please take the
maintenance burden.

Unfortunately some of our developers have a habit of creating lots of
new recipes but rarely clean up (but also do not maintain the old
stuff), leaving a trail of undefined/orphaned recipes.
I think we should try to avoid having those orphaned recipes.

Wrt the example of Graeme on abiword (not sure if it was here or on
irc). His reasoning was that he wanted to keep an older version
because it was much smaller. Being in the business of resource
constrained embedded systems I clearly understand this. However I feel
it is better to make that explicit, e.g. by introducing a recipe
foo-small_X.bb adjacent to foo_Y.bb (or maybe even foo_X.bb), than to
have it implicit (like in the case foo_X.bb and foo_Y.bb).
In a few cases we already do so, but typically then it is
function/interface driven. bluez vz bluez4 comes to mind.

Thinking of it, we could also go for a "previous" layer or so where we
move older versions to. Those who want them then can add that layer,
those who do not want them do not include that layer.

Frans.


