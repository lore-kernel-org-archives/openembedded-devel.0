Received: from mail-gx0-f220.google.com ([209.85.217.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ni19b-0005uE-Tn
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 08:50:35 +0100
Received: by gxk20 with SMTP id 20so2340441gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 23:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=skENbnavCbNS2Ut4A9euYrlmEdOFyZpM04WRfsx4CpY=;
	b=PUFrHKGuX2s5OEBFK2wWLLO3HIFEXa7YPcAu/EoKqTyMi6Elu8g/wEbtUKQuV5D0TP
	jy96p/+4vPWJ4DShWj8qZ3uoMvxG//GVJyG8vJl0/iFGtcmnRAt7Bx1pe8NshbCAQdO0
	tas44D3cyZElYGSUB0O0pnef245g6Io6x+uaU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XWYziM5A3QEYxHHV4MDim1RfAW9Moi2GaJo4ONZD4qN0Tqnd5Cm1DCyj+Z8CquKBqw
	hhsgV9Ve7f5v9XgE+9xp/6LexAX8ONNXoZFgVbG6H3vHhszkZAoSQvTH4wkjN1A80GHF
	zsPGoAepDHyQ1UoZdeP0DQzdedLUm/glvrGb4=
MIME-Version: 1.0
Received: by 10.100.235.4 with SMTP id i4mr2189098anh.19.1266479271221; Wed, 
	17 Feb 2010 23:47:51 -0800 (PST)
In-Reply-To: <1266334604.6436.159.camel@rex>
References: <1266316492.6436.127.camel@rex>
	<ac9c93b11002160258m2ddee8absd0510adad4179c6d@mail.gmail.com>
	<1266320987.6436.135.camel@rex>
	<b6ebd0a51002160616m462683b3nd2f4b17524395ddf@mail.gmail.com>
	<1266334604.6436.159.camel@rex>
Date: Thu, 18 Feb 2010 08:47:51 +0100
Message-ID: <ac9c93b11002172347r55f75cb1xfe2c384b9ac59cf3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.220
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Improve our default conf file setup
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
X-List-Received-Date: Thu, 18 Feb 2010 07:50:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/16 Richard Purdie <rpurdie@rpsys.net>:
> On Tue, 2010-02-16 at 07:16 -0700, Chris Larson wrote:
>> On Tue, Feb 16, 2010 at 4:49 AM, Richard Purdie <rpurdie@rpsys.net> wrot=
e:
>>
>> > On Tue, 2010-02-16 at 11:58 +0100, Frans Meulenbroeks wrote:
>> > > Sounds quite nice.
>> > > Didn't study the class code, but it would be nice if within layer.co=
nf
>> > > I could use a relative path, which then is turned into an absolute
>> > > path when the layer.conf file is read
>> >
>> > This is what the LAYERDIR variable gives us.
>> >
>> > Having relative paths would lose all context outside the layer.conf
>> > file. We could hardcode a list of variables that needed to be processe=
d
>> > and so on but LAYERDIR removes all that complexity whilst still lettin=
g
>> > you move things around.
>> >
>> > > That means layer.conf can become very standard wrt BBPATH etc. and y=
ou
>> > > can even move layers around.
>> >
>> > You should be able to do that with my proposal, the only file that wou=
ld
>> > need changing is bblayers.conf, not the layers themselves.
>>
>> Can you explain what the use case is for needing this much control? =A0I=
 find
>> it unlikely that it would be problematic to simply add each layer as a f=
ull
>> path to a list of layers in a single file, and leave it at that (i.e.
>> bblayers.conf). =A0If site files aren't in the layer, they won't be used=
. =A0If
>> recipes aren't around, they won't be used. =A0It seems a bit silly if ev=
ery
>> layer.conf ends up being a copy of every other layer.conf. =A0And this s=
ort of
>> blind copying tends to lead to problems and cruft (just look at distros =
that
>> copy angstrom).
>
> Several reasons:
>
> a) I like the idea of a given overlay shipping with a description in
> some form of what it contains. Its intuitive.
> b) I don't want to hardcode behaviour in bitbake (see c/d)
> c) Are recipes in a recipes or a packages directory?
> d) How deep are the paths to the .bb files?
> e) What priority are assigned to the layers?
> f) Should a given layer append or prepend to BBPATH?
>
> It also means that if we add some kind of new functionality we have to
> update bitbake to add the appropriate variables, or add horrible
> anonymous methods to poke around BBLAYERS.
>
> When the alternative is a single .conf file describing a layer, I know
> which I prefer even if most might be two lines of boilerplate.
>
> I was also thinking of your recursive bitbake 'abomination' ;-). With
> this new functionality, its possible some code in one of the layers
> could check ahead and checkout other layers if it noticed they were
> missing. We'd need some additional code for that but its an idea in the
> back of my mind.
>
> Cheers,
>
> Richard

We could also use the layering mechanism to give distro's their own
layer. That way it is clear what files belong to the distro and what
files are generic.

Frans.


