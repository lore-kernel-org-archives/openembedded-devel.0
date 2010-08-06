Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OhJIJ-0004st-7U
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 11:32:53 +0200
Received: by fxm12 with SMTP id 12so3820100fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 02:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=8JaUxtsC2kU2SrJ2NWNRQabX8TC+USoeL95rH209Sx0=;
	b=HYySh+b0lfPa/f3B0MdRkm7y9031uJ4fo9xG60jTTBeYn4/RXW7HlOmYht5nPHd4TH
	zQRhumUZDjr5kYkf5AsbNLOhERIv/2cXxizFq+85MRB/boDct2SDsyj4HoHrKRFvzOea
	2rEqUAS7TkBwBcm87i7LBUQeBwqxLIqMR+QMU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=o07P6K3Q0wjiJBsrza2kuBbSEb0zH0l9knjzFsputpi/KWAA1H7gXUfSfUmNISe1fx
	3yOajWha1+oxVGt2wWL94nAMBOFgpjlVl6LltUhStRXWb4+0Hv/wE26CvX9e43yK57BH
	sv0Hg7WvmaN9wj5L+aXZ+X7jOJlOz6CWwwIa0=
MIME-Version: 1.0
Received: by 10.204.47.214 with SMTP id o22mr7610188bkf.17.1281087164986; Fri, 
	06 Aug 2010 02:32:44 -0700 (PDT)
Received: by 10.204.21.6 with HTTP; Fri, 6 Aug 2010 02:32:44 -0700 (PDT)
In-Reply-To: <AANLkTim41rfG5eqwrEu5goiqFZqhZK3XY2Pq=shdANTU@mail.gmail.com>
References: <AANLkTik=Xm39yJcLnLH12heRyvS0gUEvSwFCJMBtWeLi@mail.gmail.com>
	<1280926084-7605-1-git-send-email-henri.bragge@dcombus.com>
	<AANLkTinnz+cB5Au1hMsniwFbCSjo-EaNWoR=9Xae4krA@mail.gmail.com>
	<loom.20100805T104704-558@post.gmane.org>
	<AANLkTik=13a7k7D1n=VfJnqO5DdPy5PUVdLdnDHtZh1d@mail.gmail.com>
	<AANLkTim41rfG5eqwrEu5goiqFZqhZK3XY2Pq=shdANTU@mail.gmail.com>
Date: Fri, 6 Aug 2010 11:32:44 +0200
Message-ID: <AANLkTincP+hP1RSsA+u5+HQ3xKLFgDkt7x4R-hN3kOsP@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2 1/2] recipe for gsnmp-0.3.0
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
X-List-Received-Date: Fri, 06 Aug 2010 09:32:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/5 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> This one also failed building with a similar QA issue:
>
> NOTE: Running task 629 of 630 (ID: 10,
> /home/frans/oe/openembedded/recipes/gsnmp/gsnmp_0.3.0.bb,
> do_qa_staging)
> ERROR: QA Issue with staging: libexslt.pc failed sanity test (tmpdir)
> in path /home/frans/oe/tmp_angstrom/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/pkgconfig
> ERROR: QA Issue with staging: libxslt.pc failed sanity test (tmpdir)
> in path /home/frans/oe/tmp_angstrom/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/pkgconfig
> ERROR: QA staging was broken by the package built above
>
>
> see http://tinderbox.openembedded.net/builds/81312
>
> No idea how exactly to fix this.
>
> Frans
>
Please disregard ths comment and the one on the other recipe.
Apparently some other recipe (libxslt) left a faulty pc file in pkgconfig.
That is something that needs to be repaired (although I woudl not know
how), but does not affect your recipe.

Your recipes have been tested, build nicely and have been pushed.
Thank you for your contribution, and again apologies for any
inconvenience caused by the above mail)

Frans


