Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ORYMp-0001Uj-QW
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 00:24:38 +0200
Received: by pwj10 with SMTP id 10so1285506pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 15:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=YwWhAk7K/hMfn/e5kibalmFuPWgrHIEOn+tizsli4tg=;
	b=qmj8doznaQuVaWWSJU4WhvDypx3deFpznswPN7hRCfPZztm6yR9S+t14h5iZZN3JUn
	7NubTfsnHopWckBUWFETporhAbxTInpqgq4N7CPaPS+Ob0X1qvbD6llyw8ZmRR+LkB32
	wSZgXVfyVnVi2NFU73SL/nGJn1VFvt1VgbUR4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=aZLtIPF1+wTIRvPeBkCkoyZWr8/rYMLEkoErVDlHzOr98eem43YWTXjnIj8tDy9K3v
	337H8uarskHha5EfuKpeXF48SJhzdy685OdfjTa0yaEdN5if+PI067P2maKJuSY6WdAp
	ghKJSRviu0K+3QqVq5YsykrFShP97RFBWjDRE=
Received: by 10.115.39.24 with SMTP id r24mr8315558waj.166.1277331586115;
	Wed, 23 Jun 2010 15:19:46 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b6sm62352837wam.21.2010.06.23.15.19.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 23 Jun 2010 15:19:45 -0700 (PDT)
Date: Wed, 23 Jun 2010 15:20:53 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100623222053.GC6653@gmail.com>
References: <AANLkTikz8wGLZKz6Z-o4YpC8C62P-whW_znpSKlV8yEx@mail.gmail.com>
	<hvsjso$8bh$1@dough.gmane.org>
	<20100623103600.77c5a6d9@xora-desktop.xora.org.uk>
	<AANLkTimwSjUiEgwAU-l66u9Da5ckM4p2yD4naQq3g_ZZ@mail.gmail.com>
	<20100623110315.16293a95@xora-desktop.xora.org.uk>
	<4C21DCD6.4090509@balister.org> <hvsnsn$mvd$2@dough.gmane.org>
	<AANLkTilv_BG9-Ksq5-fraEY4edmdFhfKTIgM-B2Gojq1@mail.gmail.com>
	<20100623171933.GB5535@gmail.com>
	<AANLkTimou2cL3hKrb7Yrqp1h4MH-AkWVVXFN2MKkv5ic@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimou2cL3hKrb7Yrqp1h4MH-AkWVVXFN2MKkv5ic@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
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
X-List-Received-Date: Wed, 23 Jun 2010 22:24:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (23/06/10 21:55), Frans Meulenbroeks wrote:
> 2010/6/23 Khem Raj <raj.khem@gmail.com>:
> > On (23/06/10 13:16), Frans Meulenbroeks wrote:
> >> 2010/6/23 Koen Kooi <k.kooi@student.utwente.nl>:
> >> > -----BEGIN PGP SIGNED MESSAGE-----
> >> > Hash: SHA1
> >> >
> >> > On 23-06-10 12:07, Philip Balister wrote:
> >> >> On 06/23/2010 12:03 PM, Graeme Gregory wrote:
> >> >>> On Wed, 23 Jun 2010 11:54:21 +0200
> >> >>> Frans Meulenbroeks<fransmeulenbroeks@gmail.com>  wrote:
> >> >>>
> >> >>>> 2010/6/23 Graeme Gregory<dp@xora.org.uk>:
> >> >>>>>>>> Also I don't feel empowered to make changes in distribution
> >> >>>>>>>> specific files.
> >> >>>>>
> >> >>>>> Why not, chances are Angstrom maintainers would be quite happy for
> >> >>>>> you to patch angstrom*.conf if you ask us.
> >> >>>>>
> >> >>>>> Graeme
> >> >>>>
> >> >>>> distribution != angstrom
> >> >>>> There are more distributions out there.
> >> >>
> >> >> Right now, toolchain selection is done in distro files not machine
> >> >> files. I agree this is not the clearest approach, however adding the
> >> >> toolchain selection to the machine files may have unexpected side effects.
> >> >
> >> > Think of multimachine builds. What happens when someone else adds
> >> > *another* nios2 based machine with different toolchain versions, how do
> >> > I know which toolchain avahi_1.0_nios2.ipk was compiled with
> >>
> >> If toolchain is interesting to know in ipk's it should be part of the name.
> >> And note that I am really in favour of an architecture specific
> >> solution, not a machine one.
> >> That is why I used an include file to contain the pinnings.
> >>
> >> And actually the situation with nios2 is much much worse.
> >> As it is a soft-core people can come up with all kind of variants.
> >> (e.g. with/without fp).
> >
> > not new. Other arches have similar variants already in OE
> 
> I know, but at least in those architectures if you have a board the
> situation is static.
> In fpga's capable of having a nios2 machine, it is still possible to
> load different configurations.

how many ? if they are managable you can still use the existing relation of
machine to them but if you really want to make it configurable then you
might think of writing a class which would define these configurations
somehow may be you can denote various configs through some bitbake var
then.


