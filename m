Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nnt7B-0005E5-5f
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Mar 2010 13:28:17 +0100
Received: by gwj23 with SMTP id 23so1189107gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Mar 2010 04:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LF0GfR7gqK/BfVt1TWOQ42s9ClV7VBstEwq4LgeKMFE=;
	b=kR8gd/l9ECBtO5hyjxYxvc1jF9LaRAlkyIDAr8Xxpv6VVb4OiBKVO1Sm/1qfNDWqxb
	t7oPQkbo+Ql+m8OkHCoMX0EzFg8akNXjxIFke7KONEywzMBYLlPwmr59SlZMM0PoCoYv
	hzrVhBoixi35cUdDHfokVeBDtdQBCXxqpcLT0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uOqRx+IyrThm5g4SJ0NjNI9EyFeinRnkdnydEXbQQ81vtcKyS3pHV5JiafCMapoLFK
	sIHpPm3TWLLb3wEn7d2EgXVSPlLrJdh2Jde1myPjmYCE5wA4TSu/8kYmHaXBVExBxrGg
	UQNQBoHM1iKkvA+jBgZRObZS0bJ4gbMkel83c=
MIME-Version: 1.0
Received: by 10.101.64.18 with SMTP id r18mr4006408ank.24.1267878322572; Sat, 
	06 Mar 2010 04:25:22 -0800 (PST)
In-Reply-To: <hmrg46$6m7$1@dough.gmane.org>
References: <1267616149.2259.4.camel@rex>
	<ac9c93b11003030459h499fa3ban6f6884910ef785a@mail.gmail.com>
	<1267624062.2259.58.camel@rex>
	<ac9c93b11003030628n357a820elede742097eafee42@mail.gmail.com>
	<1267629590.2259.92.camel@rex> <hmrg46$6m7$1@dough.gmane.org>
Date: Sat, 6 Mar 2010 13:25:22 +0100
Message-ID: <ac9c93b11003060425w221ce721re9c0bae052b099c0@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meeting 2010/03/02
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
X-List-Received-Date: Sat, 06 Mar 2010 12:28:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/3/5 Rolf Leggewie <no2spam@nospam.arcornews.de>:

[...]
>
> Frans, I hope I did not paraphrase your sentiments incorrectly. =A0Feel
> free to correct me if I did.

You didn't :-)

I've indeed come to the conclusion that apparently OE has come to a
point where it is very hard to move forward.
One of the reasons is the perception of quality for some people.

Quality to me does not mean having 26 glib recipes around or 8 abiword
ones or whatever most of which are likely to be unused and even more
likely to be unmaintained.
We currently have close to 9000 recipes, 3000+of which are older versions.
I understand why people feel they should keep old versions, but that
is where a version control system is for.

Development head should reflect the latest state-of-the-art, and
probably should have only one version per recipe.
(probably with the exception of things like gcc, linux and u-boot).
If things do not work with a version, they should be fixed. Keeping
the old version around and pin it, means that in the end you end up
with a system which is lagging behind.

If you want stability use a stable branch. head should focus on moving forw=
ard.

Some people seem to think differently about it. As an alternative an
obsolete directory has been proposed.
The latter does not really help. It gives the crud a home, but it does
not really solve the problem.

However as discussions on what to remove are time consuming and
progress is hard, I have abandoned that path.

Instead I decided to create a branch called sanity (for now local, but
once it is more reliable I'll probably push it)
In this branch I intend to
- remove all old versions of recipes (sometimes tough as there are
recipes that have both numbered and cvs/svn/git variants (I believe
there is a case where there is even cvs and svn for package))
  exceptions: gcc (but some versions will go there), linux, u-boot)
- crude convert to BBCLASSEXTEND=3D"native". I feel this should in
general work. (btw and I noticed we have packaged that do have native
variants for older versions but not for the recent one, and I have
even seen a case where the native recipe is newer than the target
one).
Plan was also to remove all do_deploy stuff, but apart from
u-boot/linux this is nearly done.

Note that the above edits may sound harsh, but frankly I doubt that
anyone will ever convert those 3000 legacy devices, and even if they
are converted, I strongly doubt that they are tested.
This seems to be a better way forward.

After that I have some ideas for further improvements, but let's get
this started first.

If anyone wants to work with me on this, feel free to get in touch with me.
And for those who feel that effort should be directed elsewhere. Make
me an interesting offer and we can talk. But until that it are my
weekends and evenings I am spending on this, and I'll spend them as I
see fit, not as someone else sees fit (ok, with the exception of the
Mrs :-) )

Have fun!
Frans


