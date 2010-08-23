Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OnRBC-0002wo-JJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 09:10:51 +0200
Received: by iwn2 with SMTP id 2so2770486iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 00:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=SKtOdt5pE/jUEvg2XY3BqdYDBTIr5fuM23W/bS5SAXw=;
	b=COwjT3pPzLQGtF9DDMS5WQGyc+T4TPdnIa543ZvbdePZPbfbIh9wQdPjq97wJQS4IJ
	KRSmzqfeGQW5TfakGB3fiYCTf9Y4Okw6io4Ft5PuaJkqe9f4OgjyIPE/Rgr4Tz72nQce
	in8DJzE3dGo0giC5qif/G+Ap8SraU63r0y9/U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=JSeUH8Kl3D1K86yVXIubXZTHxinBFXEcU8xqD8D0hHk4TVF7iGlJSkAX+bM/x/Ad4r
	fKzIt9+B+BMjavtHM5ImGzRVev82SckuHFh37giG5rMALqVgPh6Dg6hUqaWZGC9NEHUI
	yAdlvqmOy8nsRkQJTLnoAPawjNzokjC9Nokfg=
MIME-Version: 1.0
Received: by 10.231.13.77 with SMTP id b13mr5206414iba.28.1282547427627; Mon,
	23 Aug 2010 00:10:27 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Mon, 23 Aug 2010 00:10:27 -0700 (PDT)
In-Reply-To: <AANLkTim6ZrUFLWNzGAfPF5f9BJZvFM2h+Cj50Zac7bRV@mail.gmail.com>
References: <1282537594-18263-1-git-send-email-raj.khem@gmail.com>
	<AANLkTim6ZrUFLWNzGAfPF5f9BJZvFM2h+Cj50Zac7bRV@mail.gmail.com>
Date: Mon, 23 Aug 2010 09:10:27 +0200
Message-ID: <AANLkTimgEBu3rddBLU6OvFvjMJ3HMM1XscUOgFS-yg9A@mail.gmail.com>
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
Subject: Re: [PATCH, v2] ncurses_5.7.bb, recipes: Make DEFAULT_PREFERENCE
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
X-List-Received-Date: Mon, 23 Aug 2010 07:10:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/23 Martin Jansa <martin.jansa@gmail.com>:
> On Mon, Aug 23, 2010 at 6:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> * Select 5.7 if none pinned.
>> * Bump PR for recipes which have ncurses dependency.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>

Do packages with curses in RDEPENDS also need a PR bump?
E.g. the task packages

Apart from that things look good.
I did not compare a full list of grep -l ncurses recipes/*/* with the
files you have modified.
Probably the extra's are recipes that have things like --without-ncurses in it

Frans


