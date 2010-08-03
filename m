Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgNCP-0004Eg-FT
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 21:30:56 +0200
Received: by pvg13 with SMTP id 13so1821474pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 12:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=2DXPaVneewbIzq4VXSmBuZulxwytICYQQfYO4sshgCo=;
	b=PvYFrsxpJ1l1uPysQDwe0oyk3mABSofO2peWHlTel7WHSKVk7to3rBHuOmkJoNBl0S
	0uRR4XubHpFo6lq9rXuiZ3h51rXepvHFReA1vL+rmV30OvxiKcGtIejLkOTlotYxrlMZ
	3+0b6OE1fkBRo/c4g7oJynzBm0yWaLGZAsqJQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=N6OFLKo81Ffzj/UEZ81OjjEPvuNSeoiXQ2Tm0Y4LHkkzeEW1zvn9449ZPy7R8JO1Zf
	Q+vkmkTFxskE46tgSbYpGfenl6hsd+ppmtRejMN0edFF8bNbAIENUoxok4ZrBFUOuoIG
	rLt/m89gQVUBsKZe9IRC7XNn144bWG4uSsUrM=
Received: by 10.114.103.14 with SMTP id a14mr9613686wac.31.1280863846213;
	Tue, 03 Aug 2010 12:30:46 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n32sm14205133wag.11.2010.08.03.12.30.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 03 Aug 2010 12:30:45 -0700 (PDT)
Date: Tue, 3 Aug 2010 12:30:36 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100803193036.GA5249@gmail.com>
References: <AANLkTild0OtzxFT1GmBoNoUj8spV7jcvp1s_Cd69Frdy@mail.gmail.com>
	<AANLkTinZATYyQw2PEk52Hk71R_4nIzdacjzB2qKt2ZnQ@mail.gmail.com>
	<AANLkTikAmC6Li8IdUfbfZ48Or-dEABfH4ua8JjIgA0JT@mail.gmail.com>
	<AANLkTim1m8AQ4WsVRLu_1BU3VUfOrCgpLNIclgewXhJz@mail.gmail.com>
	<4C45BE9F.7000002@mentor.com> <4C45C63E.70306@cbnco.com>
	<AANLkTilXvrxo8FC6KYsyyxwVPOrzJvp9cleEfdzVANzA@mail.gmail.com>
	<AANLkTikgXfuc1uHq38AHLGUnZgKzODoBuOe2h7oA89wG@mail.gmail.com>
	<AANLkTimYqkRKIP2ErEY7ot_l0TtAljJLMTvM-n-KhVfB@mail.gmail.com>
	<AANLkTi=TyLCO9sTNmi_OH29Jm=Pn=p6FJjOKEG-YLa+k@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=TyLCO9sTNmi_OH29Jm=Pn=p6FJjOKEG-YLa+k@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: A new bitbake extension: .bbappend files
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
X-List-Received-Date: Tue, 03 Aug 2010 19:30:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (03/08/10 12:04), Frans Meulenbroeks wrote:
> Wrt the bbappend / amend.inc discussion:
> 
> I was wondering how version management would work.
> I can imagine that if I change something in a bbappend file (or amend.inc)
> file, I would like to have something like PR that I could bump.
> In my case these recipes live in an overlay which is also used by
> co-workers. I would like to be able to trigger a rebuild when they get a
> modified .bbappend file.

may be use INC_PR 
> 
> Frans
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


