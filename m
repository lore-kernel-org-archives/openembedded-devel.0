Received: from mail-yx0-f204.google.com ([209.85.210.204])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OBjPX-0007h1-8B
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 09:01:51 +0200
Received: by yxe42 with SMTP id 42so2700783yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 May 2010 23:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=bFQOdgX1yD5ipnGSmrr3XOAZnREHAE12DFluiqlqUHI=;
	b=B6YG6dAfrQmhPCuV2zkpyUSrWvHB7LPE/qWWUEE+mtZbzBxIBGUHI8EU9Pu78di1iq
	Q4zbwKPz5B5Ys78L7ywaNzhyX9AOQIN96VwkoZEZnHgZEtaX+EinnWcbP+qXUKVBPvQg
	w8+EpNcKgzxC6wSrbuZCVVBxJQtPFq6lWR2TY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vlZd4x0DPwBt4oqadmq0QzNol1Fwp93/K/m8Dns79NmDAsJwGkAhyGIjUlWcayxaDM
	eVVlLtghKVZrJQ3F6qfZtZT06x7CFV+OMoWH3/J/c1YGsSgIkZU0+OonPyPz+tFMop72
	0/oHRUBaqUVpJXmWDtQ5A+rrrCHvkSrJ4Vuho=
MIME-Version: 1.0
Received: by 10.91.172.5 with SMTP id z5mr2487316ago.25.1273560833673; Mon, 10 
	May 2010 23:53:53 -0700 (PDT)
Received: by 10.90.71.4 with HTTP; Mon, 10 May 2010 23:53:53 -0700 (PDT)
In-Reply-To: <1273510041.22943.295.camel@trini-m4400>
References: <1273249883.457.336.camel@trini-m4400>
	<g2zac9c93b11005080006zb474ea8dj506101d1dde2ed42@mail.gmail.com>
	<1273331468.22943.217.camel@trini-m4400>
	<1273429494.22943.225.camel@trini-m4400>
	<AANLkTimOAdWye_9cLGryBlVJjsSVSVrlM7Lz9ikQAmQh@mail.gmail.com>
	<1273510041.22943.295.camel@trini-m4400>
Date: Tue, 11 May 2010 08:53:53 +0200
Message-ID: <AANLkTimVI9XVOGxamG2PBswtGO1n2X73751GaGvliTY2@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.204
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: calamari (ppc e500v2) failure
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
X-List-Received-Date: Tue, 11 May 2010 07:03:29 -0000
X-List-Received-Date: Tue, 11 May 2010 07:03:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/5/10 Tom Rini <tom_rini@mentor.com>:
> On Mon, 2010-05-10 at 10:40 +0200, Frans Meulenbroeks wrote:

>> MACHINE = "calamari"
>> DISTRO = "angstrom-2008.1"
>> ANGSTROMLIBC = "eglibc"
>
> This should just be LIBC, btw

Angstrom has ANGSTROMLIBC

From the code (grepping in the conf dir):
conf/distro/include/angstrom.inc:ANGSTROMLIBC ?= "glibc"
conf/distro/include/angstrom.inc:LIBC ?= "${ANGSTROMLIBC}"

No idea why we have ANGSTROMLIBC next to LIBC.

>
>> # e500v2 supports the SPE instruction set.
>> TARGET_OS = "linux-gnuspe"
>
> This should also be picked out automatically, iirc.

Hm, It was there in the conf that I got when I took over this project.
I seem to recall having tried to build without it, and that it failed,
but it is a while ago, so not 100% sure about that.

Frans.


