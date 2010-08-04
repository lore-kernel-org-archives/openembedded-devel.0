Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OghZd-0002me-81
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 19:16:17 +0200
Received: by bwz10 with SMTP id 10so2949998bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 10:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=N9S6LagihJqT95kTC8l87Imb+jmM5zQI/Q+2MQy6Ol4=;
	b=bBai/FPZRXO8s7zDWQDb03SXI/7u6jGOrmZYRiqpy+OCZOWXcQKk7L8eZtJ9HsoaEh
	smqH6gi6aic59gM4851jwV2iWbx9HC5hkozA+tUkLaIrNcB1tPNXnbEEe58aS6GERdNJ
	2IPbO2O0iE8mesj3TXQ5WrZc9mm8/waO4ZKTE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UjjhAW3FFcu0n6xic1JdeKXsHZJtACjy75IJpkn6Y7JnUugNmRXJK7iv49pA9+e72J
	LkkYG4mMDUzq4crewOWzMQOFKhSuXhhIcvi9RBvG1L2lLBKRXoFL9eVVeLHxXd24wCrj
	rWa6xU7fuNijfvN/B5+CIFP83Z2wo57fCl9qc=
MIME-Version: 1.0
Received: by 10.204.79.221 with SMTP id q29mr6528524bkk.49.1280942165026; Wed, 
	04 Aug 2010 10:16:05 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Wed, 4 Aug 2010 10:16:04 -0700 (PDT)
In-Reply-To: <20100804165030.GG28187@mx.loc>
References: <1280780382-11697-1-git-send-email-fransmeulenbroeks@gmail.com>
	<i38mr6$ng8$1@dough.gmane.org> <20100803235811.GC17391@denix.org>
	<20100804001040.GE17391@denix.org>
	<AANLkTi=QDw_sf4H8Kdt7L7nfNZ24bjVBJ4hdW6HPUupB@mail.gmail.com>
	<20100804165030.GG28187@mx.loc>
Date: Wed, 4 Aug 2010 19:16:04 +0200
Message-ID: <AANLkTin7L42p5JHP3SV9Gbo9VLtZyOHkeKx1OxEx9-bS@mail.gmail.com>
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
Subject: Re: [PATCH] 500+ recipes: remove do_stage
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
X-List-Received-Date: Wed, 04 Aug 2010 17:16:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/4 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>

>
> Hi,
>
> i'm seeing this:
> ERROR: This recipe recipes/libidl/libidl_0.8.3.bb) has a
> do_stage_prepend or do_stage_append and do_stage now doesn't exist.
> Please rename this to do_stage()
>
> given that only preferred-om-2008-versions.inc pins this to a specific
> version (0.8.10) i'd remove the "broken" version and .2 too, while at
> it:
> $ git rm recipes/libidl/libidl*0.8.{2,3}.bb && git commit -s -m 'libidl:
> Remove old versions' recipes/libidl/
>

Yeah it is risk that if e.g. an inc contains a do_stage and the recipe
appends or prepends to that.
Actually I should have checked that, but didn't think of it.

As far as your removal of recipes concerns:
I saw that Koen yesterday already removed them.

Frans.

(PS: how did you find this/why where you building such an old version?)

