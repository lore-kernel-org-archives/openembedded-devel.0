Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1ObK7P-0007E9-8l
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 23:12:52 +0200
Received: by bwz10 with SMTP id 10so3478755bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 14:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=CEQaQKpki9cjqCtAkkQAORMVUOuxEyu9hJgh+dl3sHI=;
	b=gXqo7VIa6xH92fxqNcVV7Jg0aowD0qltND3Ch2CY1PbD3KY240iviorh9bmbtR25zL
	WF7zHhkl9S2zyO0nBe+mgpid2wQEM+aNstWZq/H5qMatxdPE0wMsno79gD7x7/YtrS0v
	ZG+1Y2F6FPeDS1+7/ri+xC1Pir9utXnakhURk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Sx/Pnh4XBwc/Y7fm6NaOV3JSYaE08pE2Qab7dUXu1qo7fxiF8p+JTCFIRwcHz6/pZs
	+cNOg6EjPG2LaMgL6zIYQnxn8L3Xn6Vbfjue98MmlTb50sVgiBgK+oOeFidrZkYnCcTL
	C3JT84xjDU553Z3tmb3kXBuTP2MM7gQDYRUtk=
MIME-Version: 1.0
Received: by 10.204.178.68 with SMTP id bl4mr5569107bkb.119.1279660360612; 
	Tue, 20 Jul 2010 14:12:40 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 20 Jul 2010 14:12:40 -0700 (PDT)
In-Reply-To: <1279656272.8360.4.camel@utx.lan>
References: <1279656272.8360.4.camel@utx.lan>
Date: Tue, 20 Jul 2010 23:12:40 +0200
Message-ID: <AANLkTinBlA6nAsv2siYYqI0QTHavRuNkeceeOBUvD094@mail.gmail.com>
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
Subject: Re: RDEPENDS_${PN} overwrites RDEPENDS_foo - bug or feature?
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
X-List-Received-Date: Tue, 20 Jul 2010 21:12:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/20 Stanislav Brabec <utx@penguin.cz>

> While verifying all aspects of proposed udev change, I experienced a
> strange behavior of an udev recipe with RDEPENDS_udev:
>
> RDEPENDS_udev is always ignored. Searching in deep, I found that
> RDEPENDS_${PN} defined in update-rc.d.bbclass overwrites RDEPENDS_udev.
>
> Once RDEPENDS_${PN} is defined, RDEPENDS_udev has no effect.
>

Not an expert in this, but would  RDEPENDS_${PN}_udev (or perhaps
RDEPENDS_udev_${PN}) do the trick ?
Ofc this is just a suggested workaround, no idea if what you describe is
desired or not.

Frans

>
> Is it a bug or documented feature?
>
> --
>
> ________________________________________________________________________
> Stanislav Brabec
> http://www.penguin.cz/~utx/zaurus <http://www.penguin.cz/%7Eutx/zaurus>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

