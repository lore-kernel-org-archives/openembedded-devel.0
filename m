Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NZK8a-0006UE-Hn
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 09:17:35 +0100
Received: by ywh8 with SMTP id 8so956395ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2010 00:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=+7G+xZrIpJd7vdJoWTUBgVs/LKmm/Qq+SfO4oy+S6vs=;
	b=cxuYRDSyZqVZ2uQ8+Bmo24nOG5UCN4uC2HlIN8D64Qjbefxus9wDpByZNge38hkiaS
	VF5+UoqWgDIU84rAHlkbcY3MmAAkK9Jqu+BfrDzPUNQHJZjNMUZEEtW/rPIt8SHoGrR3
	IZBVvutd/SWD9gxZoivnmxP/yAWWCzW6ISubk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=w2UNLweNsiwf24SLzH036tg3ggGRZwCCK5HM0yG84lidbBFxDpmNrXCPaYDI6tuGrp
	BuxFQJVibMcajKe/GEO/mhjoGyI4bJVGAhdYuS4BChumwIpZY4ui5rRIc2VNmSmaq+hL
	QCxMcW9pvYXX6QyAlYYE8wr/eKBBaSadXnlW8=
MIME-Version: 1.0
Received: by 10.101.138.20 with SMTP id q20mr7376785ann.160.1264407312124; 
	Mon, 25 Jan 2010 00:15:12 -0800 (PST)
In-Reply-To: <20100125081044.GA26355@gmail.com>
References: <20100125081044.GA26355@gmail.com>
Date: Mon, 25 Jan 2010 09:15:12 +0100
Message-ID: <ac9c93b11001250015h1a8c325fk1eb13229924c40b8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Remove gcc configure option --enable-target-optspace for powerpc
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
X-List-Received-Date: Mon, 25 Jan 2010 08:17:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/1/25 Khem Raj <raj.khem@gmail.com>:
> Hi
>
> I have run into a problem where compiling libgcc with -Os for powerpc SPE
> targets caused some symols like _restgpr_Y_x to be referenced in
> libgcc_s.so.1 due to gcc generating them for out-of-line prologues which
> happens with Os. But these symbols are defined in libgcc.a so when linking
> a shared library which uses libgcc we get errors from linker complaining
> that DSO is accessing a hidden symbol from libgcc.a which is a static
> archive.
>
> I thought we could remove --enable-target-optspace. In general it is only
> used to compiling the gcc libraries e.g. libgcc libstdc++ etc. in OE
> context so its not of a much hit on space usage if we let this option go
> which would mean that these libraries would be compiled with -O2
>
> I propose to remove this option for all powerpc and we can still leave it
> in for other architectures.
>
> Does this sound reasonable ?

What about just removing the option when building libgcc for ppc ?

Frans


