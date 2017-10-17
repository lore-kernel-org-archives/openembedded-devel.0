Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 8AA19782E0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 21:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5262E20A3B;
	Tue, 17 Oct 2017 21:01:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id O66rGdEJYVI0; Tue, 17 Oct 2017 21:01:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 14115204B1;
	Tue, 17 Oct 2017 21:01:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 688901626FF; Tue, 17 Oct 2017 17:01:07 -0400 (EDT)
Date: Tue, 17 Oct 2017 17:01:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20171017210107.GJ9221@denix.org>
References: <cover.1507147924.git.paul.eggleton@linux.intel.com>
	<4da0611806ae98b10f6ae00200b3e292a068f940.1507147924.git.paul.eggleton@linux.intel.com>
	<CAMKF1sp6TG-LrCUq-FMp+z_mR6Yh-CiRXT0tDvJXVsYr+97VPg@mail.gmail.com>
	<20171017051134.GC9221@denix.org>
	<CAMKF1sro2nuRcguZzsVOj5B2dNzw6P5KKrkK5dmuzpk_eX8e6g@mail.gmail.com>
	<CA+chaQeZpm=FAXVETU4x9scAECJ3EURrjjo54JhddHeDBzXWkg@mail.gmail.com>
	<CAMKF1sqfVVcvf6Hz9tPF7xobT-P64z16mbTQNQ9+t=-kSwo2-A@mail.gmail.com>
	<20171017180932.GF9221@denix.org>
	<CAMKF1sqgSSvfZYY8VwtJduZJNogFddrjv4LUeX1K6FfQFp1+1A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqgSSvfZYY8VwtJduZJNogFddrjv4LUeX1K6FfQFp1+1A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/1] mdns: move from meta-intel-iot-middleware
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Oct 2017 21:01:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 17, 2017 at 12:05:55PM -0700, Khem Raj wrote:
> On Tue, Oct 17, 2017 at 11:09 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Tue, Oct 17, 2017 at 10:01:13AM -0700, Khem Raj wrote:
> >> On Tue, Oct 17, 2017 at 9:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> >> > I agree with Khem, I've merged oprofile even when it fails with musl,
> >> > because that was the main reason for moving it from oe-core to meta-oe, but
> >> > we don't want to burden Khem with more new musl issues when they are
> >> > detected soon enough (my world builds don't use musl, so I depend on Khem to
> >> > provide feedback when he can) .
> >> >
> >> > On Tue, Oct 17, 2017 at 6:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> >>
> >> >> On Mon, Oct 16, 2017 at 10:11 PM, Denys Dmytriyenko <denis@denix.org>
> >> >> wrote:
> >> >> > On Mon, Oct 16, 2017 at 09:19:25PM -0700, Khem Raj wrote:
> >> >> >> On Wed, Oct 4, 2017 at 1:20 PM, Paul Eggleton
> >> >> >> <paul.eggleton@linux.intel.com> wrote:
> >> >> >> > The following improvements have been made over the recipe that was in
> >> >> >> > meta-intel-iot-middleware (a layer which is no longer actively
> >> >> >> > maintained):
> >> >> >> >
> >> >> >> > * Upgrade to latest upstream version (765.50.9)
> >> >> >> > * Fix compilation failures by passing CC and LD
> >> >> >> > * Fix "no GNU hash in the ELF binary" issue
> >> >> >> > * Point S at the correct source subdirectory so that "make clean"
> >> >> >> > works
> >> >> >> > * Fix lack of soname on libdns_sd.so leading to missing RDEPENDS QA
> >> >> >> > error
> >> >> >> > * Add SUMMARY
> >> >> >> >
> >> >> >>
> >> >> >>
> >> >> >> This has been accepted into master but it fails to build with musl
> >> >> >
> >> >> > Is musl a requirement for meta-oe?
> >> >>
> >> >> We have fixed it to a point where we have around 10-12 recipes which
> >> >> don't compile
> >> >> with musl, and it would be better to keep this level as such and
> >> >> especially when we
> >> >> know its failing. its a requirement for oe-core
> >>
> >> I do world builds on master-next with musl on qemumips and rpi3
> >> continuously, with a known set of failures, if a new one shows up
> >> I tend to report.
> >
> > Ok, no problem, it's just demanding someone new, submitting a patch/recipe, to
> > go fix musl, which they probably never heard of, would result in never hearing
> > from them again. :)
> 
> I think, its fair to expect some responsibility from submitters. I do
> not encourage
> shoot and scoot approach. Eventually it feels like dumping ground.
> I myself have fixed plenty of recipes which were added and
> left as it is, orphaned. I had to fix them to work with musl or clang,
> realizing that
> given package has had several releases ever since it was added to OE, but we
> never update the recipe.

I agree with your comments in general - striving for quality should be the 
ultimate goal, just don't forget about balance and compromise... :) It all 
boils down to available resources on both sides, but you already know that.


> We probably should pay attention towards such orphaned
> packages closely.

Maybe some sort of automated notification system for aging recipes? On the 
other hand, the state of the world already provides most of that info, it's 
just too overwhelming...


> > Anyway, I'll look into getting some musl coverage for my submission as well...
> >
> > --
> > Denys
> 

