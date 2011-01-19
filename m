Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PfUIx-0005f6-HN
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 10:26:16 +0100
Received: by iyj18 with SMTP id 18so606120iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 01:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=jOMltxZ/1y432kJ460FhCblYSI2pZrdA8KY5gxfNB80=;
	b=PSBJ140+teyqP6oF1T1WXk5go0jSsD2TP497WZj0/NqWpS6BBjPWsNDBvVwTwWMdS9
	Ld3tJ866OxaMHI1PEBnv3vJT5BQ39IAXOod467Fvt6jPwQVylLKSgAPTcC3zlJcH1wew
	tSLrvc3j/c6bMzEtlrt+cJnWeGWQwMmamFzFc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HYxSGJ78xcZg30dfEpSiIWzJO7WDeAb9Var6xezFt4QKDoN3KAhCJTR8AeCpN7bTzH
	oDOKmS471eotwPIwkM01cyQBfh0KT6VEUpLp+bTYhl+swk66jfrzeLpTgdkfWaKtOCUh
	Os8Z09HtImjmUJnDLpjASOuBjC1/ilZk5ehxE=
MIME-Version: 1.0
Received: by 10.231.39.74 with SMTP id f10mr486191ibe.84.1295429134086; Wed,
	19 Jan 2011 01:25:34 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Wed, 19 Jan 2011 01:25:34 -0800 (PST)
In-Reply-To: <AANLkTi=A2kgqgkhfw4p_Og8k9y1MBMrZLDvgwuq5Mxfj@mail.gmail.com>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
	<4D35FC8B.1090404@mentor.com> <ih52qr$l1v$1@dough.gmane.org>
	<AANLkTi=A2kgqgkhfw4p_Og8k9y1MBMrZLDvgwuq5Mxfj@mail.gmail.com>
Date: Wed, 19 Jan 2011 10:25:34 +0100
Message-ID: <AANLkTimHg3tkDnm93ycBGokAOsWomT6n+bfTduYPA=G+@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 19 Jan 2011 09:26:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/19 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2011/1/18 Koen Kooi <k.kooi@student.utwente.nl>:
> =A0if we make the delta between the 3 be just
>>> the SRC_URI + checksums?
>>
>> Something like:
>>
>> * keep gplv2 around if upstream switched to gplv3 at some point
>
> agree; as said before suggest to reflect the switch in the name of the re=
cipe.
>
>> * allow old stable, stable and dev (e.g. glib 2.24, 2.26 and 2.27+git)
>
> I'd say retire old stable after a while (e.g. after stable is there
> for half a year, unless of course there are compelling reasons to keep
> it).
> Wrt dev: if we want to go to a maintainers model similar to u-boot and
> linux, I would expect this to live in a separate branch or layer.
> Once proven stable the maintainers pulls it into the core archive.
>
>> * allow active contributers some leeway to test multiple subreleases
>> (e.g. busybox 1.18.[0-99]
>
> Again here, I feel it is much better to put it into a different branch
> or layer, and once stable it is pulled into the mainline.
> Again similar to what Linus and Wolfgang do.
>
>> * The maintainer can have as many versions as he wants to.
>
> my preference: not in the main layer.
>
>> * toolchain is exempt from all that since having 20 binutils versions is
>> sometimes needed when building for 20 different archs[1].
>
> Fully agree.
>>
>> But I seriously think we are overengineering this. We should have people
>> actually working on oe-core and meta-oe reach a consensus when
>> encountering problems.
>
> I beg to disagree on this.
> We have a unique opportunity at hand to improve, so it seems wise to
> raise the bar quality wise.
>
> E.g. wrt what Richard wrote in the start post
>
> [quote]
> * Creation of a subset of metadata that has a consistent high quality
> =A0standard:
> =A0 - removal of legacy components (pkgconfig hacks, libtool hacks,
> =A0 =A0 legacy staging, unneeded compiler arguments)
> =A0 - consistent metadata layout, spacing, use of variables
> =A0 - migration away from outdated practises (e.g. use BBCLASSEXTEND)
> [/quote]
>
> I feel when migrating recipes we should also assure that they adhere
> to a certain quality standard. That would need us to define a minimal
> standard though.
> Currently I feel we are just moving recipes, only fixing what is
> really needed to get things running (like removing legacy staging)
> whereas we could do much better.
> There are currently some things in OE that could use some improvement
> and we should take the opportunity to improve.l
>
> And yes, I have no problem in spending time to improve things, but if
> there is no consensus on where we should go this is not going to be
> effective (and actually makes it harder to improve quality wise).
> To take the bikeshed analogy up again. It does not really help if
> everyone start to paint in his own favourite color (unless maybe if
> you are still stuck in the flower power era).
>
> Frans
>
I know it is fairly schizofrenic to reply on ones own post, but I just
peeked into the meta-oe layer and found an excellent case on what we
should try to avoid when bringing over recipes from oe to meta-oe.
path: root/recipes-graphics/directfb
Mode	Name	Size=09
d---------	++dfb	48	logplain
-rw-r--r--	++dfb_1.0.0.bb	588	logplain
d---------	directfb-1.2.8	50	logplain
d---------	directfb-1.4.6	41	logplain
-rw-r--r--	directfb-examples_1.0.0.bb	406	logplain
-rw-r--r--	directfb-examples_1.2.0.bb	409	logplain
-rw-r--r--	directfb.inc	2038	logplain
-rw-r--r--	directfb_1.4.6.bb	615	logplain
d---------	files	415	logplain
d---------	fusionsound-1.1.0+git20070709	54	logplain
-rw-r--r--	fusionsound_1.1.0+git20070709.bb	1479	logplain
-rw-r--r--	lite_0.9.26+cvs20070207.bb	1140	logplain

Why is there a directfb-examples_1.0.0.bb? In OE no-one is pinning
this version, and given the fact that these are examples there is
probably little reason to keep it.
Something similar for directfb-1.2.8. Maybe I overlooked things but I
could not find a the user of this dir. I guess it could be gone.

If we want to improve on quality it is probably not a bad idea to at
least have a checklist with improvement actions that should be done
when migrating recipes (e.g. remove stale patches, unused & unpinned
older versions etc etc). I know it takes time, but it can also
increase the overall quality. Let's take that opportunity.

Frans.

PS: as part of the migration it might also be a good plan to see if
recipes should be updated. I don't know too much about directfb but
maybe it makes sense to move to newer versions of e.g. fusionsound and
lite.


