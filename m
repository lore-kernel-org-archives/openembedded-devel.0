Received: from mail-yw0-f175.google.com ([209.85.211.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NrBf1-00006z-68
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 15:52:56 +0100
Received: by ywh5 with SMTP id 5so293683ywh.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 07:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LDp7Tbx+01jgguVnCPja+37izoBOmOwK7i5CzhEsu/E=;
	b=Y22Dj7iWVeM+pZPhZ/dRy28EnBmrNPEcPmWZkikp8sQn6XJCBXinuqI25f2QArQiqa
	ouKkQR47sORU++wrHMNyY5cMfwVV+wQuEozcYvsP7CmErxR1lFv6XAlo5hRwx0iXCoyN
	hfj6rjTiHZ5bqJ9TdB44qoZ7LRYqqBqRQKpKQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=k6pDQ2drDmw23wIuUpueXdIBgQ1+qldeUgGwtuq5y+s2RQrR12nWWVqQ/+nihuRyxH
	rRsFjvgUuU9ptleouhXq0939ULmMkCjwFJhPJLLIso4lenPKAAs+ZSw8SY1nqyMBoPM+
	8lvhSVEbTW4iiukT0wd4ybKgiUlHBxRXN3Bsk=
MIME-Version: 1.0
Received: by 10.101.131.34 with SMTP id i34mr825999ann.94.1268664588056; Mon, 
	15 Mar 2010 07:49:48 -0700 (PDT)
In-Reply-To: <b6ebd0a51003150721x4378f839raf86d53e82d3b891@mail.gmail.com>
References: <hnl0m8$3al$1@dough.gmane.org>
	<b6ebd0a51003150721x4378f839raf86d53e82d3b891@mail.gmail.com>
Date: Mon, 15 Mar 2010 15:49:48 +0100
Message-ID: <ac9c93b11003150749q6e07c0day7c2111622910eae4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Make autotools.bbclass warn and fixup for "needs newer autoconf" breakage
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
X-List-Received-Date: Mon, 15 Mar 2010 14:52:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/3/15 Chris Larson <clarson@kergoth.com>:
> On Mon, Mar 15, 2010 at 3:03 AM, Koen Kooi <k.kooi@student.utwente.nl>wro=
te:
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> Every now and then the world moves to a more recent autoconf (2.64 is
>> popular nowadays) and distros in OE have to to through a lengthy
>> test-fix-bump cycle to keep up. The workaround for such a problem
>> usually is:
>>
>> do_configure() {
>> =A0 =A0 =A0 =A0gnu-configize
>> =A0 =A0 =A0 =A0oe_runconf
>> }
>>
>> That gets us the config.guess for exotic targets (e.g. avr32) and runs
>> the in-tree configure script. What are your opinions on adding something
>> like this to autotools.bbclass:
>>
>> if ((needed autoconf > installed autoconf) && configure exists)
>> =A0 =A0 =A0 =A0BIG FAT WARNING
>> =A0 =A0 =A0 =A0skip libtoolize + reconf
>>
>> The biggest problem with that is that is "silently" degrades when using
>> the "wrong autoconf" and the possibility for mismatched
>> do_configure_prepend/append =A0methods.
>>
>
> It doesn't *necessarily* have to degrade silently -- you could do a check
> from python, either in the task or in the taskstarted event handler for
> do_configure. =A0(Aside: now that bitbake master can split into client/se=
rver,
> bbnote/bberror/etc scripts that actually output stuff via bitbake rather
> than in the logs should be a real possibility for that branch..)
>
> Do the benefits (not littering recipes with global shortcuts) outweigh
>> the downsides?
>
>
> On the one hand, I like the idea, particularly if we can arrange some sor=
t
> of warning (or, alternatively, add a message to a sanity check task, so i=
ts
> explicit). =A0The only minor concern I have with this is the fact that mi=
nimum
> autoconf versions actually rarely reflect real dependency by upstream. =
=A0Most
> commonly, they just injected the version number they use, not the one the=
y
> actually require.. of course, trying to catch those is a bit of a pain in
> the ass, so it may be that this is best. =A0*shrug*
>
> On a related note, I too dislike the recipe 'litter', and think that we n=
eed
> a way to toggle non-autoreconf behavior from the recipe easily. =A0In the
> autotools branch I started on but never completed, I pushed the common
> autoconf bits into autotools_base.bbclass, and inheriting that rather tha=
n
> autotools resulted in gnu-config update + oe_runconf, but an alternative
> would be to just add a variable for it. =A0Thoughts on that?

According to the handbook using classes to separate common
functionality is good (http://docs.openemb
edded.org/usermanual/html/recipes_classes.html)
and I tend to agree with that.

What would be nice is if adjacent to being implemented, it would
(preferably at the same time) be documented somewhere.
I see lots of variables in recipes for which the only way to find out
is to dig into the classes and see how they are used.
(and actually yesterday I removed an unused/egacy var from all recipes
in my branch. Didn't make the change in dev head, as I don't feel
getting the wrath of some people upon me, even though the change is
good).

Frans.


