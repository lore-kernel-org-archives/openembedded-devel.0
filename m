Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oh5Vu-000219-Mx
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 20:50:03 +0200
Received: by fxm12 with SMTP id 12so3305645fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 11:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=E/5Ed0+gTkQPVcGUuft1rwSNnGR7A/SKEVSe7pbBXJc=;
	b=r5q5g8bZ++/eWn/HUIVLXOQmIEOj6Qi3K8nl416tt5xGB1/aRypoxImc0a3g44ee7U
	R5jU4EKHyFTubyTUTJWUsaEybXr6QiAHyH/gX93y+9nw3nOeRN7+VcDHDE5awnILMk/L
	ceyIgBu5HjvGKjvX+XvwP13Ad51JEjjqKowfU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=GRnsJAKyjGroMAN9+blrYkjYYvJZRMxGqbwnbTcSO7YAD+e2TWXFSkdZUFRYperwlS
	ru864PXIx1vxXJXannWdF06ZcZBsRgGPcY/a5RK0OWxgjW4dX9+fNupSUYjBHNJQZq5C
	nqOvhlBRj/8N2fQFrd8K2Js/bREO4HRxKODPc=
MIME-Version: 1.0
Received: by 10.204.83.84 with SMTP id e20mr7282741bkl.214.1281034188688; Thu, 
	05 Aug 2010 11:49:48 -0700 (PDT)
Received: by 10.204.21.202 with HTTP; Thu, 5 Aug 2010 11:49:48 -0700 (PDT)
In-Reply-To: <AANLkTik=13a7k7D1n=VfJnqO5DdPy5PUVdLdnDHtZh1d@mail.gmail.com>
References: <AANLkTik=Xm39yJcLnLH12heRyvS0gUEvSwFCJMBtWeLi@mail.gmail.com>
	<1280926084-7605-1-git-send-email-henri.bragge@dcombus.com>
	<AANLkTinnz+cB5Au1hMsniwFbCSjo-EaNWoR=9Xae4krA@mail.gmail.com>
	<loom.20100805T104704-558@post.gmane.org>
	<AANLkTik=13a7k7D1n=VfJnqO5DdPy5PUVdLdnDHtZh1d@mail.gmail.com>
Date: Thu, 5 Aug 2010 20:49:48 +0200
Message-ID: <AANLkTim41rfG5eqwrEu5goiqFZqhZK3XY2Pq=shdANTU@mail.gmail.com>
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
X-List-Received-Date: Thu, 05 Aug 2010 18:50:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

This one also failed building with a similar QA issue:

NOTE: Running task 629 of 630 (ID: 10,
/home/frans/oe/openembedded/recipes/gsnmp/gsnmp_0.3.0.bb,
do_qa_staging)
ERROR: QA Issue with staging: libexslt.pc failed sanity test (tmpdir)
in path /home/frans/oe/tmp_angstrom/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/pkgconfig
ERROR: QA Issue with staging: libxslt.pc failed sanity test (tmpdir)
in path /home/frans/oe/tmp_angstrom/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/pkgconfig
ERROR: QA staging was broken by the package built above


see http://tinderbox.openembedded.net/builds/81312

No idea how exactly to fix this.

Frans


