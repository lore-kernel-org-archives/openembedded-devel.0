Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORTfE-0005q7-DA
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 19:23:05 +0200
Received: by pvg3 with SMTP id 3so635256pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 10:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=A7W9WO0fd1BLVlcAuGjz8ClTfHRaHD9DXworHM+NmiM=;
	b=GLo4jvOr4Q3uFbrwv5h0FFCeYslNT00yb7tuHctyli8EsQbmsplOBkkDSWNPyHECij
	dqVVAw3SdfZJTcV0kFpjMbNKriEk3WiP5tXod+KRKLg9iB5qYnbthlDPOEGDg+NscMCZ
	L8RqHFeosfDbFg8b3I8y6uOvPFDbFXNNEQNSg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=l0o+J6WTgiJPlATyiHda1+uElOI5vPLL+V1geb+bjDBtt3jkzuSnl2OCM0jQyW3gc6
	R/KTZ3M7d2BZOtL2IPbVgL54lVV5V2agoLdjzvczf5uEslN85r2CiGk2gecyvy1UO4CL
	CNfPV48T/Qig5jC7njH3huZoC+TFTXos5gm0o=
Received: by 10.142.9.15 with SMTP id 15mr7599156wfi.235.1277313507073;
	Wed, 23 Jun 2010 10:18:27 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id s9sm8785343rvl.17.2010.06.23.10.18.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 23 Jun 2010 10:18:26 -0700 (PDT)
Date: Wed, 23 Jun 2010 10:19:33 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100623171933.GB5535@gmail.com>
References: <hvl1uc$bol$1@dough.gmane.org>
	<AANLkTil2-UJTgWzmXJI6eESvqjTowq0y_kZTpm0zNAN8@mail.gmail.com>
	<AANLkTikz8wGLZKz6Z-o4YpC8C62P-whW_znpSKlV8yEx@mail.gmail.com>
	<hvsjso$8bh$1@dough.gmane.org>
	<20100623103600.77c5a6d9@xora-desktop.xora.org.uk>
	<AANLkTimwSjUiEgwAU-l66u9Da5ckM4p2yD4naQq3g_ZZ@mail.gmail.com>
	<20100623110315.16293a95@xora-desktop.xora.org.uk>
	<4C21DCD6.4090509@balister.org> <hvsnsn$mvd$2@dough.gmane.org>
	<AANLkTilv_BG9-Ksq5-fraEY4edmdFhfKTIgM-B2Gojq1@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTilv_BG9-Ksq5-fraEY4edmdFhfKTIgM-B2Gojq1@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: introducing a new architecture/machine; policy ? (and a question)
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
X-List-Received-Date: Wed, 23 Jun 2010 17:23:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (23/06/10 13:16), Frans Meulenbroeks wrote:
> 2010/6/23 Koen Kooi <k.kooi@student.utwente.nl>:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 23-06-10 12:07, Philip Balister wrote:
> >> On 06/23/2010 12:03 PM, Graeme Gregory wrote:
> >>> On Wed, 23 Jun 2010 11:54:21 +0200
> >>> Frans Meulenbroeks<fransmeulenbroeks@gmail.com>  wrote:
> >>>
> >>>> 2010/6/23 Graeme Gregory<dp@xora.org.uk>:
> >>>>>>>> Also I don't feel empowered to make changes in distribution
> >>>>>>>> specific files.
> >>>>>
> >>>>> Why not, chances are Angstrom maintainers would be quite happy for
> >>>>> you to patch angstrom*.conf if you ask us.
> >>>>>
> >>>>> Graeme
> >>>>
> >>>> distribution != angstrom
> >>>> There are more distributions out there.
> >>
> >> Right now, toolchain selection is done in distro files not machine
> >> files. I agree this is not the clearest approach, however adding the
> >> toolchain selection to the machine files may have unexpected side effects.
> >
> > Think of multimachine builds. What happens when someone else adds
> > *another* nios2 based machine with different toolchain versions, how do
> > I know which toolchain avahi_1.0_nios2.ipk was compiled with
> 
> If toolchain is interesting to know in ipk's it should be part of the name.
> And note that I am really in favour of an architecture specific
> solution, not a machine one.
> That is why I used an include file to contain the pinnings.
> 
> And actually the situation with nios2 is much much worse.
> As it is a soft-core people can come up with all kind of variants.
> (e.g. with/without fp). 

not new. Other arches have similar variants already in OE


> Actually nios2 adds pragma's to gcc to select
> which instructions are there and which not.

Well I would have preferred commandline options that way you could
have many variants and we could have overrides like we have arm sub-arches


> Not sure whether the latter is a good idea as it is one of the things
> that fail moving to a newer gcc.
> 
> The good news is that most of the variants used have different
> peripherals, but seem to stick to just a few cpu cores.
> (nios2 is used as a generic name for the SoC as well as the core,
> doesn't help to separate things either).
> 
> Frans
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


