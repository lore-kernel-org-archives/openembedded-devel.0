Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OgEMK-0006lT-VJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 12:04:34 +0200
Received: by bwz10 with SMTP id 10so2242830bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 03:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=AS/q7dEOUx/w+qn/mE5l/faOXzjLpyJaHVP4J6XezIo=;
	b=DEqnQmJEZsJfQey4KNqXIk8IqqVJLFhBV7uWH8Ss8vciHQExYWrJP5KfR/cjLbyhf/
	eLsd4L+NH4jRU6SkgsRzNT3m4x0SqeVuQDSxzbAJJvDPk06h/TS7o4F6qRvRRON8gDz/
	bldjw+GRSCXHClvA72uoYoWXfWYUqfqDGjs/k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vaR6Jd8cNagPMHV76zyns3x0ttL7z5Otyct4kPTBL8RDUbyfuvLWyZuqPbtvqN+QMu
	KCzmtdzZIAoBf5I+9GN+MVeCJKnuDosKb6L7BzaF0gQi5uwt8KsxX28AXbBKsI3KsHTk
	WLw3BSNIKrKYAJcoKshQWT/D9AXVM9vQFv0nM=
MIME-Version: 1.0
Received: by 10.204.82.130 with SMTP id b2mr5145859bkl.12.1280829872043; Tue, 
	03 Aug 2010 03:04:32 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 3 Aug 2010 03:04:31 -0700 (PDT)
In-Reply-To: <AANLkTimYqkRKIP2ErEY7ot_l0TtAljJLMTvM-n-KhVfB@mail.gmail.com>
References: <1279290319.10837.1747.camel@rex> <4C44BAB3.8010703@mentor.com>
	<AANLkTild0OtzxFT1GmBoNoUj8spV7jcvp1s_Cd69Frdy@mail.gmail.com>
	<AANLkTinZATYyQw2PEk52Hk71R_4nIzdacjzB2qKt2ZnQ@mail.gmail.com>
	<AANLkTikAmC6Li8IdUfbfZ48Or-dEABfH4ua8JjIgA0JT@mail.gmail.com>
	<AANLkTim1m8AQ4WsVRLu_1BU3VUfOrCgpLNIclgewXhJz@mail.gmail.com>
	<4C45BE9F.7000002@mentor.com> <4C45C63E.70306@cbnco.com>
	<AANLkTilXvrxo8FC6KYsyyxwVPOrzJvp9cleEfdzVANzA@mail.gmail.com>
	<AANLkTikgXfuc1uHq38AHLGUnZgKzODoBuOe2h7oA89wG@mail.gmail.com>
	<AANLkTimYqkRKIP2ErEY7ot_l0TtAljJLMTvM-n-KhVfB@mail.gmail.com>
Date: Tue, 3 Aug 2010 12:04:31 +0200
Message-ID: <AANLkTi=TyLCO9sTNmi_OH29Jm=Pn=p6FJjOKEG-YLa+k@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Tue, 03 Aug 2010 10:04:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Wrt the bbappend / amend.inc discussion:

I was wondering how version management would work.
I can imagine that if I change something in a bbappend file (or amend.inc)
file, I would like to have something like PR that I could bump.
In my case these recipes live in an overlay which is also used by
co-workers. I would like to be able to trigger a rebuild when they get a
modified .bbappend file.

Frans

