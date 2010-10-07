Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P3qz8-0004MP-Ng
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 15:58:21 +0200
Received: by iwn37 with SMTP id 37so201782iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 06:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2F9uzaN18vkqnVIyCRVMjHl1nN9ky2CXZqmzpwyFuR4=;
	b=L4lls0LYxdZ7P61GFTpiR7rv3MYvEl9UJwKS+acl28rG14KsdSVQFpSoky/LZgpCkW
	A4SUedBdwokmTRMu1pWU7h2CmmKrkXkf3eCnTtlvY8e/aA04VjITB4OU55AR54N7qsHp
	FZ+hZE9+qmj9hcO22811q1sdjbFOX0EgSYWXo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uAt4/1CbvKoTOil45l3G64xuB3bq9MlKYfkytL9VVGkwkYTlPzaOEGwY4aa97dPt5r
	8Cqvdy9AozrE15AcEwFRwASOG3yJAYfIQGnSTODdR0lgyNbg981e5wLUjoaJKgBsQoYj
	Z32dbcZYaRdqqc09skJjoQPIyz3CZkJ8s+8Xs=
MIME-Version: 1.0
Received: by 10.231.58.198 with SMTP id i6mr906692ibh.43.1286459865427; Thu,
	07 Oct 2010 06:57:45 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 7 Oct 2010 06:57:45 -0700 (PDT)
In-Reply-To: <4CADCF1E.3090602@mentor.com>
References: <4CADCF1E.3090602@mentor.com>
Date: Thu, 7 Oct 2010 15:57:45 +0200
Message-ID: <AANLkTinB3TcFaNxFgsT4xex3xr1tg1H8VAB1Ye3C0Sbp@mail.gmail.com>
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
Subject: Re: Updating libtiff
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
X-List-Received-Date: Thu, 07 Oct 2010 13:58:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/7 Tom Rini <tom_rini@mentor.com>:
> Hey all,
>
> I'm looking to update libtiff to cover some security issues in the versio=
n
> we ship, and I noticed something funny about how we do it today. =A0Curre=
ntly
> tiff_3.9.2.bb sets PV to 3.9.2+4.0.0beta5 and grabs and builds 4.0.0beta5=
.
> =A0While it's possible that in the past 3.9.2 was intended to be the last
> 3.9.x, it wasn't.
>
> I think we should go with:
> - Add tiff_4.0.0beta6.bb which should be compatible with beta5 and will g=
et
> upgrades right.
> - Add tiff_3.9.4.bb as well, in case someone wants to stay on the release=
d
> line.
>
> Anyone see a problem with that?
>

Fine with me. I made the PV after discussion on ML or irc.
People told me that as it was a beta I could not call the recipe 4.0.0.

This is the commit log:

commit c860f51f04d41680100a7fecd2341ecf8f657fe1
Author: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Date:   Thu Mar 11 21:08:45 2010 +0100

    tiff: moved to 4.0.0 beta5

    also renamed to 3.9.2 as that is the latest version before 4.0.0

Frans.


