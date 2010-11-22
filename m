Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PKK21-0006Dg-Ai
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 01:13:17 +0100
Received: by wwb34 with SMTP id 34so175610wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 16:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=z/c736hNwgsukAqpE2K6YNHzrDYbqOYPf50TeiCRFbk=;
	b=tTF9Mgp+QfsW+NH7T2yEO2BU2yWHnN/bp0+wrNY1zHIr1Y4xAEc8UPhjrasd01CAGh
	PaqfOwcpfrANa9VbF7u4MaUbEoHJIJr0W9Y64KetK4SpGbQYEMxSekME87YmhtnRzoBP
	GdVenDOYmPlio2eQ6ghHXclJK+bguQ1DPYeeE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=TBIqumVLIHxznnVkA4fN0cwFMqF4iBMcxCQbmv9DSBSmuJb3q9e/5FEMgxy59X2muV
	CcgqTO+EBvPPyGDH2I0/YGpEJoJY3BzqCI44k/SgVyJ/OZfSQ9dM0C1vz1Q5bixeEdkk
	bp2cvilkduZFkkjv5x1xl7w9A1IQ6Qib1/YY0=
MIME-Version: 1.0
Received: by 10.216.240.198 with SMTP id e48mr146874wer.0.1290384725868; Sun,
	21 Nov 2010 16:12:05 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Sun, 21 Nov 2010 16:12:05 -0800 (PST)
In-Reply-To: <AANLkTimHfcqX1ZkbD+c2gx5ujupyw-hA2mpUf=LJvjcY@mail.gmail.com>
References: <AANLkTinXYcNN=iozP-aXPDuFzQqM13KDf5my1W6DTap6@mail.gmail.com>
	<4CC500A2.7020702@gmail.com>
	<AANLkTikzjkHxbXd3iCBny0yoNPBVTH4_LyhuYfSpg-SV@mail.gmail.com>
	<AANLkTimXqxS4rCPXuxx=_MhdKfG1yTA8gbnowUEYB0vn@mail.gmail.com>
	<AANLkTimHfcqX1ZkbD+c2gx5ujupyw-hA2mpUf=LJvjcY@mail.gmail.com>
Date: Mon, 22 Nov 2010 01:12:05 +0100
Message-ID: <AANLkTi=Z8jNP+cQUqNppkju7Fe0K6rEB8nn_GYzuRh6A@mail.gmail.com>
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
Subject: Re: Race issues (lzma-native)
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
X-List-Received-Date: Mon, 22 Nov 2010 00:13:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

I though tthe issue had disappeared (in the meanwhile I remove an
obsolete dependency on zlib)
but yesterday again...

run.SRC_DISTRIBUTECOMMAND was malformed, broken at line 122 (export
docdir="/oe/bu ).

On second build the size is much bigger (1102 lines).

Retrying..
Andrea


