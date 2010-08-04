Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OgZu5-0007gx-6i
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 11:04:49 +0200
Received: by fxm12 with SMTP id 12so2362899fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 02:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=lELfHeCjoaomU2KsyvqeZIMbvWgEpMYGq++OK12bydM=;
	b=s8fpdLDuhi1bOF83uJZr+ITXPo73+HRw4i8057i6T9PPclC817bZkHvzVuyQbL62zT
	dFZGJ6UUeG1qEQ0ixGLYUym2hx7vFzQfiI1TP1SoczRPeyvB5Xxl/3ZRTtWLYG7ujFEp
	4KvazbGjqVqlMS2xaX9fjZWfd3eyLs37D8VM0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=xkzUkhwrUIR0BDdignEUSeiZ8CdbfmRyv20QBFcEDyICQ23ovsaeBjWo5JGGoN1/Z5
	J/cOQ90Pu3N2LL6jXgzIF6OT5nQ28AHM8DV5M2taj6BTrF9zPk3C+1OLPBym6FFOtUGc
	IohYAOzlhKNvniC7Ehye+cnFzlZkEyYerlxus=
Received: by 10.223.122.146 with SMTP id l18mr8481839far.82.1280912684975;
	Wed, 04 Aug 2010 02:04:44 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y2sm2877341fau.36.2010.08.04.02.04.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 02:04:44 -0700 (PDT)
Date: Wed, 4 Aug 2010 11:04:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100804090455.GE12134@jama>
References: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
	<i30rie$8aq$1@dough.gmane.org> <i318p1$ec3$1@dough.gmane.org>
	<i31rhg$4a8$1@dough.gmane.org> <i363dm$17p$1@dough.gmane.org>
	<AANLkTinE0=x74yBxHsGCpRLFoQfDF+gHeuHFMG=D+rY_@mail.gmail.com>
	<i38q56$4hq$1@dough.gmane.org> <20100803133515.GD12134@jama>
	<i39d10$d2f$1@dough.gmane.org>
	<AANLkTimTwxV7=xOF+t6fB5iC-2p4ODH89z40HwR3kiDp@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimTwxV7=xOF+t6fB5iC-2p4ODH89z40HwR3kiDp@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/5][v4] Make multi-machine toolchains to co-exist (Alternate approach)
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
X-List-Received-Date: Wed, 04 Aug 2010 09:04:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 03, 2010 at 10:20:42AM -0700, Khem Raj wrote:
> On Tue, Aug 3, 2010 at 8:36 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 03-08-10 15:35, Martin Jansa wrote:
> >> On Tue, Aug 03, 2010 at 12:13:58PM +0200, Koen Kooi wrote:
> >>> -----BEGIN PGP SIGNED MESSAGE-----
> >>> Hash: SHA1
> >>>
> >>> Acked-by: Koen Kooi <k-kooi@ti.com>
> >>>
> >>> If noone objects, can we get this in ASAP?
> >>
> >> Building from scratch armv4t then armv6 was ok, building few more
> >> packages for armv4t again still worked, but now I've upgraded gcc/eglibc
> >> and building eglibc-initial for armv4t first fails:
> >>
> >> http://tinderbox.openembedded.org/packages/665289/
> >> http://build.shr-project.org/tests/jama/config.log
> >>
> >> see
> >> configure: error: compiler support for __thread is require
> >> and
> >> Fatal error: Invalid -march= option: `armv4t'
> >
> > I had that with a previous incarnation of that patchset, but it seems to
> > have gone away.
> > Do we want to solve this problem first or apply the patches and solve it
> > later?
> I would suggest that I push these changes and meanwhile
> I will try to reproduce Martin's problem it will take few hours on my
> box. It seems that the binutils got wiped out
> when Martin cleaned stuff and then building eglibc resorted to
> assembler on build machine
> and that bombs later.

I think I had last incarnation (at last latest on patchwork - pw-am.sh
2521 2524 2525 2523 2522).

Khem was right about binutils issue.

I did something like this:
MACHINE=om-gta02 bitbake shr-image
MACHINE=htcdream bitbake shr-image
git pull (for newer gcc+eglibc)
MACHINE=om-gta02 bitbake shr-image - and now it failed to build eglibc-initial
MACHINE=htcdream bitbake shr-image - this upgraded gcc/eglibc fine

export MACHINE=om-gta02
for i in openembedded/recipes/gcc/gcc*4.5*bb \
         openembedded/recipes/eglibc/eglibc*2.12*.bb; do 
  bitbake -c clean -b $i;
done
MACHINE=om-gta02 bitbake shr-image - still failing in eglibc-initial

export MACHINE=htcdream
for i in openembedded/recipes/gcc/gcc*4.5*bb \
         openembedded/recipes/eglibc/eglibc*2.12*.bb; do
  bitbake -c clean -b $i;
done
MACHINE=om-gta02 bitbake shr-image - still failing in eglibc-initial

export MACHINE=om-gta02
for i in openembedded/recipes/gcc/gcc*4.5*bb
         openembedded/recipes/eglibc/eglibc*2.12*.bb
         openembedded/recipes/binutils/binutils*2.20.1*.bb ; do 
  bitbake -c clean -b $i; 
done
MACHINE=om-gta02 bitbake shr-image - seems to pass now

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


