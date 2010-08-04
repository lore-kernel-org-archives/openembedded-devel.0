Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OgTUR-00059w-Ls
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 04:14:18 +0200
Received: by pvg13 with SMTP id 13so1886899pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 19:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=ML7u+ThlBPrO7GERMwfMDCAm0h/MDgLtfmxooY8COBA=;
	b=wLiXUL6vw+5ggEYuSiPM+94bY7YoVgXDJ27kA2tn7xYjUngmgGa8f5H/8ZwJQCgLmo
	SIjkMwoJCzrOEVRRfCxGureee1O0hFhpa2X0eAOi0AWyGa7jZihB8rkfqzlf/7Q3iApf
	xExJqciZkv8Tg3FupDa1Olsyj+sNmlpGL9ozw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=O4U+/qa5dKkC8nyQLjDr4SptKLNjd9wow2n+ayDMpVdWT7GJmSr8P2HGPGgYgWVqCC
	3s2PmEpONhhhHykW1htHkvu08Cg1uPzQJ/wVFAYMkTWF/QdI52Ty1ZRqYxSSTjTGBOFa
	6x4rzHUhgccNaKsshvD2ylZvQxPEhJW1DkrS0=
Received: by 10.142.148.2 with SMTP id v2mr7275935wfd.115.1280888030327;
	Tue, 03 Aug 2010 19:13:50 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q27sm9915245wfc.6.2010.08.03.19.13.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 03 Aug 2010 19:13:49 -0700 (PDT)
Date: Tue, 3 Aug 2010 19:13:40 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100804021340.GA6206@gmail.com>
References: <1280780382-11697-1-git-send-email-fransmeulenbroeks@gmail.com>
	<i38mr6$ng8$1@dough.gmane.org> <20100803235811.GC17391@denix.org>
	<20100804001040.GE17391@denix.org>
	<AANLkTi=EvHvOcpqYp1rZx-C0hBnQbZneJW2L5og6eBZ4@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=EvHvOcpqYp1rZx-C0hBnQbZneJW2L5og6eBZ4@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] 500+ recipes: remove do_stage
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
X-List-Received-Date: Wed, 04 Aug 2010 02:14:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (03/08/10 19:02), Khem Raj wrote:
> On Tue, Aug 3, 2010 at 5:10 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Tue, Aug 03, 2010 at 07:58:11PM -0400, Denys Dmytriyenko wrote:
> >> On Tue, Aug 03, 2010 at 11:17:26AM +0200, Koen Kooi wrote:
> >> > -----BEGIN PGP SIGNED MESSAGE-----
> >> > Hash: SHA1
> >> >
> >> > On 02-08-10 22:19, Frans Meulenbroeks wrote:
> >> > > This patch removes all occurrences of
> >> > > do_stage() {
> >> > >         autotools_stage_all
> >> > > }
> >> > > including all kind of variants w.r.t whitespace
> >> >
> >> > [..]
> >> >
> >> > > my proposal would be to apply it, and if there are a
> >> > > few recipes broken after that, accept is as collateral damage and fix
> >> > > it afterwards.
> >> >
> >> > Agreed
> >> >
> >> > Acked-by: Koen Kooi <koen@openembedded.org>
> >>
> >> First collateral damage - libxcb was broken, due to xcb-proto.inc having
> >> do_stage(). Worked with Khem to find the cause and thanks for pushing the fix:
> >>
> 
> I dont think this has been pushed yet. I have it staged in my tree though
> I am building from scratch lets see.

oh indeed it is pushed. Well well. We should have got rid of inherit
autotools_stage in mass as well but I have a patch for that.

> 
> >> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=b0061845a60d7781f9287ae6955585485f5ba8e9
> >
> > BTW, just wanted to mention - if corresponding PRs had been bumped, it would
> > have been spotted sooner and not only by people with clean TMPDIR... :)
> >
> > --
> > Denys
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >


