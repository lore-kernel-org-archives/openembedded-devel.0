Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PNMMp-00082P-61
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 10:19:19 +0100
Received: by iwn8 with SMTP id 8so4262358iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 01:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=6OfWtOLX+/p+4rgE1JY574fIfoGl6b1vP2Y88MwZ1fs=;
	b=tMT+uc9AFYIJe/+1nRycQj6tRacwYnplfXYLaAp+6/BvqYLr0ILxhUDHiIERK16pGY
	trOSkgDVb7FHBGIWOlptlhprdbdo3+chZpXGDIRqwyAfem12PznayDFlpoz3/6NpInhe
	zhBVVaDQQBd0TaCgrUe4HQPaY0Ps8QXBMIIT0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=jpFY4rqn5BZYVVsxD2peSJVbdvfkLSVJy3TOoJZn7eH0ugd7Ho6fIWqHQcsZ0lV5VL
	/6fq1pyUQCX7d/+JR/q5CJYPyph2vwZTsI2OE96lncVVdNgzOsNTynqZROms7B2/29lH
	HKCQChZSjQA3zl2rj1AgIotFVup+vp5krZlQg=
MIME-Version: 1.0
Received: by 10.231.35.75 with SMTP id o11mr7000558ibd.107.1291108679732; Tue,
	30 Nov 2010 01:17:59 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Tue, 30 Nov 2010 01:17:59 -0800 (PST)
In-Reply-To: <20101130082314.GL10755@ibawizard.net>
References: <AANLkTinyc8Pnpd3XMnTu=psPPHAmGKi4+DjvgWhSE1jt@mail.gmail.com>
	<20101130082314.GL10755@ibawizard.net>
Date: Tue, 30 Nov 2010 10:17:59 +0100
Message-ID: <AANLkTin+D5JmWZXt4xkX=wqfa-A+kNjpN8R-2dFDssxZ@mail.gmail.com>
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
Subject: Re: release-2010 - last moment hot fixes
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
X-List-Received-Date: Tue, 30 Nov 2010 09:19:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

Just committed the following 3 things to master, they could also go
into the release (at least the last two ones wrt php).
Still looking for a solution to get php working with iconv as without
it it breaks another recipe (I think ampache).
Open for ideas on that one.

Frans

commit 7aa6b49cabce5f85705508a0ead01433b2dafbbe
Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Date:   Tue Nov 30 09:30:36 2010 +0100

    mythtv: removed 0.22

    probably does not build with qt4.7
    this one was not maintained anyway and only stayed because a few
distro's pinned it.
    it is now unpinned by all so rm.
    we already have 0.23 for almost a year, and the metadata for 0.23 is better

    Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

commit b0d9ce644c7847533e7b362441e45d8f7c7748b6
Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Date:   Tue Nov 30 09:29:14 2010 +0100

    php: reinstated --without-iconv, this seems to generate configure issues

    issues are wrt native paths being used.
    e.g. get that fork is not found
    adding --with-iconv-dir did not help
    This needs further investigation

    Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

commit 9d3d91887fe4c36d89466dd08520449fd017928f
Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Date:   Tue Nov 30 09:28:13 2010 +0100

    php: removed --enable-memory-limit configure argument; does not
exist any moe

    Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


