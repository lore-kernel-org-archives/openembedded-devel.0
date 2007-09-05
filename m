Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IT01X-000219-Ln
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2007 20:54:47 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 3B74D28C013; Wed,  5 Sep 2007 20:48:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180180217.adsl.alicedsl.de [85.180.180.217])
	by srv043.dedi23.de (Postfix) with ESMTP id 4E46D28C012
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2007 20:48:51 +0200 (CEST)
Date: Wed, 5 Sep 2007 20:52:15 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1434447296.20070905205215@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46DEE9E3.4080206@student.utwente.nl>
References: <20070904202957.GD1429@dodger.lab.datenfreihafen.org>
	<1189011486.7849.35.camel@localhost.localdomain>
	<46DEE9E3.4080206@student.utwente.nl>
MIME-Version: 1.0
Subject: Re: [RFC] How to handle external kernel patches in oe the right way?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2007 18:54:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Richard Purdie schreef:
>> On Tue, 2007-09-04 at 22:29 +0200, Stefan Schmidt wrote:
>>> Due to my work on OpenEZX (http://www.openezx.org) I'm in touch with
>>> external kernel patches used in OE to build working kernels for
>>> different Motorola mobile phones.
>>>
>>> Talking with Koen about the best way to handle this we have some
>>> slightly different opinions on this. So we like to get some more
>>> opinions on this before pinning to a strategy.
>>>
>>> Koen like to pull the patches from a known-good rev into oe to have
>>> them all at one place for less fragile building and tweaking.
>>>
>>> I prefer OE to use our svn server with a fixed SRCREV which gets
>>> updated once a newer version is known good. I'm not a fan of
>>> duplicating the patches in OE if some small tweaking patches can also
>>> handle it.
>> 
>> Personally I agree with this in principle, I've never liked maintaining
>> kernel patches in OE directly either.

> I'm having issues with crap like do_prepatch. Patches are only applied by patch.bbclass,
> not some hand written voodoo <period>.

Very well. If it annoys you so much, feel free to enhance patch.bbclass to
deal with upstream series files while retaining OE-added patches to it.

Until then, I think we shouldn't make life more complicated for the
actual upstream developers just because of going a bit too far wrt. to
our principles.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



