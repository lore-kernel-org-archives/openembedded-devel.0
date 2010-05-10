Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OBWCK-0000PB-1N
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 May 2010 18:51:18 +0200
Received: by pvc30 with SMTP id 30so60555pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 May 2010 09:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=WiXbHd8mFA/Vk1GRVJoVD6PO08Fs8xSv4e8wQhFaHXM=;
	b=VTCOSkDWRJGTqINSxU1LcEPpe9jNNvFeICdVDqsCA65shs31zSwSD1KWAHlNHw8JcS
	O1zUksZ9OdL1RoFOaLbbu1aaCvNfEB7udsumIBRUuh4UizhrjkYBCEYildqGRWqez4ZG
	j1CTLc+G8UePHvhCGlHVlC2vG7BTN1kA0b1R0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=nNkpQwU4KPRsztfvEkmdcYfgGbHB/IxmrnTP8kSaYwRFXAaK7u3NN/Kl0o74tfYe6w
	EPq5mJAjKHOILHWBO/p+tbiJ8fdpFJZ3+85RFd4pTwHQHkSgpSQ7zt8FVw1SJYiOjmzp
	6yKabiAjGOjEDDmQyorAXgqKuUxPeeH6SmaYw=
Received: by 10.140.251.20 with SMTP id y20mr2809349rvh.206.1273510042524;
	Mon, 10 May 2010 09:47:22 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b10sm1989352rvn.3.2010.05.10.09.47.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 10 May 2010 09:47:20 -0700 (PDT)
Date: Mon, 10 May 2010 09:47:31 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100510164731.GB11797@gmail.com>
References: <1273249883.457.336.camel@trini-m4400>
	<g2zac9c93b11005080006zb474ea8dj506101d1dde2ed42@mail.gmail.com>
	<1273331468.22943.217.camel@trini-m4400>
	<1273429494.22943.225.camel@trini-m4400>
	<AANLkTimOAdWye_9cLGryBlVJjsSVSVrlM7Lz9ikQAmQh@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimOAdWye_9cLGryBlVJjsSVSVrlM7Lz9ikQAmQh@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Mon, 10 May 2010 16:51:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (10/05/10 10:40), Frans Meulenbroeks wrote:
> 2010/5/9 Tom Rini <tom_rini@mentor.com>:
> > On Sat, 2010-05-08 at 08:11 -0700, Tom Rini wrote:
> >> On Sat, 2010-05-08 at 09:06 +0200, Frans Meulenbroeks wrote:
> >> > 2010/5/7 Tom Rini <tom_rini@mentor.com>:
> >> > > Hey all,
> >> > >
> >> > > With DISTRO=minimal and MACHINE=calamari, I see the following failure in
> >> > > gnutls (using fe4ff6940b06c73d5b88224b99750bf65accf13d in oe.dev):
> >> > > http://pastebin.com/cjAStcLb and I confirmed this prior to the RP merge,
> >> > > so this is unrelated.
> >> >
> >> > Which eglibc is that?
> >> > The issues I had seemed due to some catch22 situation that I cured; I
> >> > started a clean build yesterday before I left work & can tell the
> >> > results on monday.
> >> > My distro was angstrom, machine calamari, this uses eglibc 2.10. Is
> >> > minimal also using 2.10 or is it at 2.11
> >> >
> >> > I can also try to kick off a minimal build on monday
> >>
> >> minimal is eglibc 2.10.  I'll try an Angstrom build.
> >
> > With Angstrom, gcc-cross-initial fails building libgcc, config.log has:
> > cc1: error: not configured for ABI: 'spe'
> > configure:2591: $? = 1
> > configure: failed program was:
> > ... standard empty program ...
> > configure:2605: error: cannot compute suffix of object files: cannot
> > compile
> >
> > Ubuntu 9.10 x86_64 host
> >
> 
> I made a mistake when doing the clean build, and kicked it off again.
> I don't think I saw your error.
> In  my local.conf I have:
> 
> MACHINE = "calamari"
> DISTRO = "angstrom-2008.1"
> ANGSTROMLIBC = "eglibc"
> 
> # e500v2 supports the SPE instruction set.
> TARGET_OS = "linux-gnuspe"
> 
> Perhaps the TARGET_OS line influences how libgcc is build.

yes. if you look at the gcc-configure-cross.inc then it disables
optspace for SPE targets. thats why it works for gnuspe but when I
did that I only saw the problem on gnuspe and wanted to keep the 
effect minimal. But it seems now we need this ppc wide thats why
the new patch. 

Although using -Os in kernel might cause the same problem even if we
sort out libgcc because kernel does not use libgcc and I dont know if
it implements these functions.

If this causes the issue then we have to do same fix for kernel where
we compile kernel with -O2 and not with -Os

Thx
-Khem

> 
> Frans
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


