Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Ou8ll-0008Ua-3m
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 20:56:19 +0200
Received: by ewy7 with SMTP id 7so2032978ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 11:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=rjMkW94ela35X2vUNoInxE0boYrZ9vQn9Xa+7uu5MLc=;
	b=Nk3n8gEjJHLjebD2lDuswVucinZuuAlsqmKkSZIxoDmc10lo6auyANV5Y5iDEGoFbT
	jhEyme+v/NEGQBrlEDkVddNkectmsYc+khuBzaL8UmTa86p1rctcoWjPjgawCuwCSma1
	4TCailMxRsEj7GpkJTJZXfgJ21o3O9TVcfwUU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=cAIfr50KCCoGgvwOCL894FvdpDXi/ZR22v64X4ZUTtplxx7YBD45RP6rx0EIsShanY
	BEwEZXDy7XjRlhGeg8l9TKD0KoAPPAC2I3TFhxHKRKWiMx4WG8GFD2Jyub/nq5el3udX
	mf3wDhwIajbu8rUy/h6pUZ3Q3ZHiwnlg3decQ=
Received: by 10.216.179.20 with SMTP id g20mr1291865wem.45.1284144934779; Fri,
	10 Sep 2010 11:55:34 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.168 with HTTP; Fri, 10 Sep 2010 11:55:13 -0700 (PDT)
In-Reply-To: <20100910185004.GF28148@denix.org>
References: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>
	<1284024609.28520.1446.camel@mill.internal.reciva.com>
	<AANLkTimLWtJhYn009OchBss+LJpNx9Pt+nDZ=GGyu=a7@mail.gmail.com>
	<AANLkTimOLsxX_hf6rsOyOCJgFdBrkrL=2LsT9ToCfazv@mail.gmail.com>
	<4C88EC2B.2090208@balister.org> <20100910185004.GF28148@denix.org>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 10 Sep 2010 11:55:13 -0700
X-Google-Sender-Auth: XGyLa1SaEUmPk18jbP7AYlXGoFo
Message-ID: <AANLkTi=mk=GbouoAuh-roSwrKa0Mdt3P+CJN9fzL_gds@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: tsc@openembedded.org
Subject: Re: [PATCH] base.bbclass: fix soc-family test
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
X-List-Received-Date: Fri, 10 Sep 2010 18:56:19 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 10, 2010 at 11:50 AM, Denys Dmytriyenko <denis@denix.org> wrote:

> >> I'd agree with this quite strongly.  I'm generally pretty careful to let
> >> others review the changes from my coworkers, to avoid any bias.
>
> Not to point any fingers, but mishaps happen and numerous reverts would be
> a
> living proof of that in the repository... :) Nobody's perfect.


Mishaps have nothing to do with this, nor does being perfect, or reverts.
 You're missing the point entirely here.  The point is, if the only people
who acked a patch are from the same company as the person who wrote it, they
can't be considered to have been entirely unbiased in their review of it.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

