Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oy9ki-000483-G4
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 22:47:49 +0200
Received: by ywa8 with SMTP id 8so1967174ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 13:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=AQJjMv489XDirJ7Qr2B72dTkehzB3uBrevfbOtXfQ9E=;
	b=QVNjlcVAK5OkZMzyyx4kS2ZDZGGlex+reCp+O/1tsI9bOBYgXsHRZDm727LpHp1zds
	CuVzdJMf5ibYsCfPqHa4FMjIDkpi0zKqEApNI/RYESM0+zx6P1yNx0dQzZJrgaaKTMld
	d1lN2SKx890x6rTGUVFA+obAN3iFAL/NgPKcI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=H8eVSs9GLLWHWQJzsrSYVVatZ+orpn2hoglte495roYlrlmVupZl1usKiji9s1JovW
	3YxyoFwUivqqpWI2dd1lsNl7RObwLfprzy6v3tgaebxOh91bbz9NWJeF65NE05EBTqk2
	LPDOmzQ8zob4kEd83oAAObGA4BJhjSFrBX7UA=
MIME-Version: 1.0
Received: by 10.151.100.12 with SMTP id c12mr11524871ybm.384.1285102063946;
	Tue, 21 Sep 2010 13:47:43 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 21 Sep 2010 13:47:43 -0700 (PDT)
In-Reply-To: <AANLkTinxRAz245hPk4tGx_Q51+kN440pUFpBTYZC53jG@mail.gmail.com>
References: <AANLkTimJj=8JDVsumZDSzNrpWcf6t1t4FA5WrGgWofDX@mail.gmail.com>
	<20100921195156.GF11562@denix.org>
	<AANLkTinxRAz245hPk4tGx_Q51+kN440pUFpBTYZC53jG@mail.gmail.com>
Date: Tue, 21 Sep 2010 22:47:43 +0200
Message-ID: <AANLkTinkXLi3_nwbT02XOyjZ=N2xEGhS7wbQJgc7NPGW@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SRC_URI_arch override. error?
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
X-List-Received-Date: Tue, 21 Sep 2010 20:47:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Denys, I still have the issue.
As explained in the original thread the problem is the bb.fetch.init call.

Chris, appreciate it if you could look into it.
Don't have time to test a change right away though as I will be afk
for the next few days.

Enjoy! Frans


