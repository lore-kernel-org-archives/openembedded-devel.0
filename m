Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PKgOY-0000fJ-Uf
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 01:06:03 +0100
Received: by wwb29 with SMTP id 29so362182wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 16:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=3lD9G5Mmhb+YC45fmy92k5LPTyuzsnGhGh8H/OTCxi0=;
	b=adSDPFfc2ceC1QOdj6SJWwSQeAgppi2C0cElX0o4/sJqwq3G15X9CO/93glg9vMu0O
	xN9URYfOe3hWsWLVeELZQJNOXiw/7aOknoZFWWHFtIWKHLQx4pJhBvJi8MzC0qS8Z6og
	tEG+YJhyE0hGQf2J1XSyFhbD+a052Jm+a0N+c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=bJYX5PUjLmqhwWsRlx0Qy7yicpdceOytwgOHBkXhVhJTopsr4PfleicMbNonLBjqeF
	cMFDUA++vYLSzNAGIOhjP3KC4mVl/AuOXZFaJOiZwM0ElJMC7pRVyMRdcU4c21PVwmcg
	aJGuOx3OLPHLQmOsPi64BcNpz/pDmBZysq3U8=
MIME-Version: 1.0
Received: by 10.216.38.84 with SMTP id z62mr255439wea.70.1290470690722; Mon,
	22 Nov 2010 16:04:50 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Mon, 22 Nov 2010 16:04:50 -0800 (PST)
In-Reply-To: <AANLkTimt7_P96yJMtLVd5S8ZOgH-=6VgTny=CezhOJ7P@mail.gmail.com>
References: <AANLkTimt7_P96yJMtLVd5S8ZOgH-=6VgTny=CezhOJ7P@mail.gmail.com>
Date: Tue, 23 Nov 2010 01:04:50 +0100
Message-ID: <AANLkTikQLnSYpAF4YivEWQODjHpOdHowndLOkyh3LJAp@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: automake-1.11 vs. host $perl_threads
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
X-List-Received-Date: Tue, 23 Nov 2010 00:06:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

I found something in run.do_configure of automake-1.11

do_configure() {
        if false
        then
                export
ac_cv_path_PERL="${ac_cv_path_PERL=/oe/build/tmp/sysroots/i686-linux/usr/bin/perl}"
        fi
        autotools_do_configure

}

It comes from


do_configure_prepend () {
        if ${@['true', 'false'][bb.data.inherits_class('native', d)]}
        then
                export ac_cv_path_PERL="${ac_cv_path_PERL=${bindir}/perl}"
        fi
}

test fails...


Andrea


