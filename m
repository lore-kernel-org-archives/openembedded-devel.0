Received: from [209.85.198.241] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KrxAa-0005ad-Gk
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Oct 2008 17:59:49 +0200
Received: by rv-out-0708.google.com with SMTP id f25so2284000rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2008 08:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=AMyvmoX7hpI4eKa5nIfmJ8zqHO2wz02aYDJfxODvchE=;
	b=rNDW7E9J4o5XjE6wbsxZ1Lo1Pa6XRMUW9NhvvIfG36tVvok+VN+3HJaBa9lIXG89Mb
	MaPBuRp/5e4UT0ruBPPYKZA1BKlU4ALokaHBp0yVWLVqIp+jK4tuQaIhGU7wWhzqvU2v
	q93Cg/yl4xKKxLttIeoYp8AEtGdFkhc6LCWWk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=WxF65F+j+X+7D2FP45q+AawF7JTQhxitX/YMlZqv5JP56LMinSxd5R4dxaIZzXGY4c
	GjS0d5ZReSswU8uxYGAcopujQK5NKKkGl4S6YCmvwAAjUvAcEHIj4jm+TCETKwKnJwmL
	wyuYCK1F+VMEVfd/IwTcs+UAXBvIzS370W1Mg=
Received: by 10.140.166.21 with SMTP id o21mr4928489rve.167.1224518368607;
	Mon, 20 Oct 2008 08:59:28 -0700 (PDT)
Received: by 10.141.129.13 with HTTP; Mon, 20 Oct 2008 08:59:28 -0700 (PDT)
Message-ID: <f96d234e0810200859p70d3e127qa41e01266e2efd47@mail.gmail.com>
Date: Mon, 20 Oct 2008 11:59:28 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF479@hiob.intern.dresearch.de>
MIME-Version: 1.0
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF479@hiob.intern.dresearch.de>
Subject: Re: support another hardware
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
X-List-Received-Date: Mon, 20 Oct 2008 15:59:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Oct 20, 2008 at 11:22 AM, Sledz, Steffen <sledz@dresearch.de> wrote:
> After Alex announced support for the hammerhead board we would try to add another hardware. It is the OXE810SE, an ARM926EJ-S based consumer network-attached storage (NAS) device (see <http://www.oxsemi.com/products/storage/OXE810SE.html>).
>
> We have some experience with OE, made and fixed some bb recipes, but miss the experience in adding a complete new machine. Is there a guide line, manual, tutorial or something like this giving step-by-step help for this (and warning of the pitfalls)? I missed it in the wiki. The only documentation i found is this one: <http://bec-systems.com/oe/html/index.html>. But the part "Adding a new Machine" ist just a three bullet list. :(
>
> I believe, the easiest part is writing the new machine config file. But all the stuff choosing the best kernel configuration (derived/integrated from/with others?) seems the hardest task in my opinion.

There is really not much more to it than create a machine conf, and a
kernel configuration.  For the kernel, the preferred approach seems to
be to use a generic linux-2.6.xx.bb recipe, and add your machine to
the version you support.  Occasionally, other packages will have
machine specific tweaks, but that is not required.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


