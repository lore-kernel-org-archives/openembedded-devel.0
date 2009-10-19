Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Mzp6v-0000sD-Rb
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Oct 2009 12:05:08 +0200
Received: by fg-out-1718.google.com with SMTP id d23so1838367fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2009 03:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=QMZHAVJnUrLSq7xiiwWjsXABQHpJfTRnYfmC9T42xdY=;
	b=cHTVkTJeCQDrMHiNy1GZeBDWp9vSwZeAPjG2kKelaMTvDTyvStpwanUAvYpWVGdKn2
	G+tpeo9DHzIfYWvqCNjLjBi2fnvDdI7NaKdYFa5oXIG0Zrn6pR1p7QQk6DGxrL870qvX
	CDrF7UcOOWfMznb3Gtn88fz1rnzUIEnxtN8vc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=eOzwYYuWc7HbvtocUazfSn3++Jwol57/oAXBGnrYy+Cp/HCmdVNVwES+6ukGf8tNqa
	q4b/WvRBuQ7UuaPWgaZ9GuVJqExyTgrd7EwppAItPAdGPkjOjSn5hY3L1idnUdB7qU7P
	7acgR6/czmPTisS4Mlrn0Oaet6vMIaipFxlJ0=
MIME-Version: 1.0
Received: by 10.223.4.84 with SMTP id 20mr919649faq.97.1255946648593; Mon, 19 
	Oct 2009 03:04:08 -0700 (PDT)
In-Reply-To: <4ADC274A.7080406@dresearch.de>
References: <4AD59AF2.50003@dresearch.de> <4AD8531B.6070208@dresearch.de>
	<4AD87CF8.8040706@dresearch.de>
	<1255704318.28050.19.camel@mill.internal.reciva.com>
	<4AD8888E.2080108@dresearch.de>
	<19c1b8a90910161354h7540f865m6d04f29902d3dcfb@mail.gmail.com>
	<d1b08f940910161407m643e3f61t2161ed66b719d734@mail.gmail.com>
	<4ADC274A.7080406@dresearch.de>
Date: Mon, 19 Oct 2009 12:04:08 +0200
Message-ID: <d1b08f940910190304j1dd22178g2b3b29f313324424@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.154
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: glibc_2.9 compile failed for armv5te
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
X-List-Received-Date: Mon, 19 Oct 2009 10:05:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

> Did you build on a multiprocessor system? It seems that the problem
> just occurs there. I've a single cpu system where the build runs
> without problems too.
It's a SMP kernel (Core 2 Duo)

BB_NUMBER_THREADS = "2"
PARALLEL_MAKE = "-j 3"

Regards

Andrea


