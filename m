Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OTivG-0005x4-1c
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 00:04:55 +0200
Received: by fxm12 with SMTP id 12so63074fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 15:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=mhvbVsvK9t0g8XaCSkFA88QTWc6HyK2wmdNxbVQzp7o=;
	b=tXSqmZo+6CR/ZtlrJHFcVzg4Ds4SqbkLeT92Chr8H19+RZlnHCbpDiO6hHaYeAVoFT
	62UKjSMSZb20xEfALESFTvbmiz691Fk8czWlG2Cb5YWEun+0kkCW1k0qhVvBRX2iroPN
	EqJOlJlIt5U7r/4azdeeLQS2p+OPb8kodSx3g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=nl+QkjbjceRE0ny23sdMS6Y+NR7bF7Ta51Sl1paDb6Zlk7xSm/8mC0KEsBYycSKLUn
	8+susQeCaPyBZ+lH6uIUB7WbmKbnByzz8sV02fjmHLHEhInA9ZSNcu4lsOpPyyS3rG3T
	y9HDxdz/zWDMY81AhvHMxIa9qU56m10TIAF2M=
Received: by 10.223.119.133 with SMTP id z5mr6446652faq.58.1277848810924;
	Tue, 29 Jun 2010 15:00:10 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l26sm3098734fam.15.2010.06.29.15.00.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 15:00:09 -0700 (PDT)
Date: Tue, 29 Jun 2010 23:59:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100629215920.GD12539@jama>
References: <20100605204019.GA1403@jama>
	<AANLkTilB6QtJOplQmu00-D7TeVHKiz2fbO5_ZZjN7iRZ@mail.gmail.com>
	<20100608172005.GA28481@rainbow>
	<AANLkTinx7ElAXde__dWP6Eufdr4XtPl1uzzXE2srNGRP@mail.gmail.com>
	<20100608200539.GA2568@rainbow>
	<AANLkTimYL2e7H6guEY3NMVq5SZoqeCf_ajxKWf0J_C9k@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimYL2e7H6guEY3NMVq5SZoqeCf_ajxKWf0J_C9k@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Latest binutils-cross-2.20.1-r10.0 build issue with binutils-2.20.1 on gentoo host
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
X-List-Received-Date: Tue, 29 Jun 2010 22:04:55 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jun 08, 2010 at 02:15:56PM -0700, Khem Raj wrote:
> On Tue, Jun 8, 2010 at 1:05 PM, Dmitry Artamonow <mad_soft@inbox.ru> wrote:
> > On 11:13 Tue 08 Jun     , Khem Raj wrote:
> >> On Tue, Jun 8, 2010 at 10:20 AM, Dmitry Artamonow <mad_soft@inbox.ru> wrote:
> >> > On 23:14 Mon 07 Jun     , Martin Jansa wrote:
> >> >> On Sat, Jun 5, 2010 at 10:40 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> >> >> > FYI:
> >> >> >
> >> >> > If you run into issue
> >> >> > ar: can't set BFD default target to `x86_64-pc-linux-gnu': Invalid bfd target
> >> >> >
> >> >> > Like I did in:
> >> >> > http://tinderbox.openembedded.net/packages/601631/
> >> >> >
> >> > Yup. I got this breakage too, only binutils-cross version is 2.18-r10.2
> >> > and error is:
> >> > ar: can't set BFD default target to `i686-pc-linux-gnu': Invalid bfd target
> >> >
> >> > see for example http://tinderbox.openembedded.net/packages/602258/
> >> >
> >> > Though I didn't dig into problem deeply and simply workaround it by
> >> > reverting 208ece17f76686e0faa44b2a9223fcadb692a991
> >> > But I'll gladly test any patches fixing the issue (whatever it is) in a
> >> > proper way.
> >>
> >> proper way is to fix binutils on your host.
> >
> > Ahh, sorry - misread original Martin's post. So it's seems to be
> > Gentoo-specific problem (yes, my OE is on Gentoo too).
> > Still wondering why it worked before and how it's connected with adding
> > "--enable-shared" in 208ece17f766. Weird, because it breaks on building
> > static library.
> 
> it is a latent problem in there which just gets exposed with this change.

Just for reference there is gentoo bug I reported
http://bugs.gentoo.org/show_bug.cgi?id=323319

now it's closed as INVALID

which is not 100% right imho as that broken patch (broken only with
multitarget is applied in ebuild) and --enable-plugins is task for
eclass not upstream.. but you can fix it locally..

Cheers,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


