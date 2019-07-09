Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF217ED44
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 20:52:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45jvdw2K5lz56;
	Tue,  9 Jul 2019 22:52:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562705556;
	bh=opOgqtgGbhAuaSLINQFe/xenYSq+ZGhayn7gpTEhWsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xk2giz4T7btcyE8YUdohVVuOF4NOMm/eYYyE5MIfoWMLiYwjdtqVlqk5KRkC+3cm0
	ur0mYmCoHHtCP61zcO1uNwNxxLxmsYR9Ui8TwY8IJhi/ylaH72/F93jKEBSXYmAFQe
	tws79zm0S5mpUGBi8SoxA0C9dcTH7dUKwnuFqLM0XvlP6BVDcBvw4g3iXPu9EZR8ll
	DQgWh7YnOaIGeK6kIlVirqF+TAlHrpLLfkIVX81gdHh4ayTElxe/sO9A0RiGx2/hrQ
	cTeSd7gG6O03wH/eqWzzeXc5T7oXg12Vx8103ILRm9b7tZ4xaraoMYPBtAcl5nmisf
	6qpdcJfri0oABqMB4bx48KctwmNrpBLlntQS3bDXHYLxHVeYvmB1nGrVHL5X7d2qjl
	Cg/0zmJc/qBnAA9mG/EtqWdEwTjxjBg+jpqkMoq5V8FuC//SNmx3DBspyFN+jfYLXI
	xKNT35EbmhBjFAHllZp3KFv2FnI4k27+tUx4EL7z3CZMCdhpF0pRhKYfT3RgqO1ama
	h2AnaF+W2hupL5bEDuwxPqbhz8IKjO0Ywy3tQ2HrAhrkrqLZ09LFgnKnctKyuHmmVD
	Hby0qZDDR+jSLIml64TMAoQ3JUVym1Fnm1nziYMUUIzpFVZvur1KNkRbvdLJ6f/Uh+
	RToGalnMu/H9eMH7WCjxJJN4=
Date: Tue, 9 Jul 2019 23:52:34 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190709205234.GA26669@localhost>
References: <20190709172623.26073-1-bunk@stusta.de>
	<CAMKF1sp_S44k9HRapQiOLps3ZCbR6c6xPsjW3vOdhniU5nZ6DA@mail.gmail.com>
	<20190709191754.GB19705@localhost>
	<CAMKF1sox4uZoZK1zv9dE_NO1ySyLJkK7Lp8raKsrLcACHczMHQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sox4uZoZK1zv9dE_NO1ySyLJkK7Lp8raKsrLcACHczMHQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gpsd: Don't build without optimization
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
X-List-Received-Date: Tue, 09 Jul 2019 20:52:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jul 09, 2019 at 12:23:35PM -0700, Khem Raj wrote:
> On Tue, Jul 9, 2019 at 12:17 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Tue, Jul 09, 2019 at 11:54:19AM -0700, Khem Raj wrote:
> > > On Tue, Jul 9, 2019 at 10:26 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > >
> > > > The upstream build system adds -O0 when debug is enabled.
> > > >
> > > > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > > > ---
> > > >  meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
> > > > index 6716f402a..43bf25a93 100644
> > > > --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
> > > > +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
> > > > @@ -36,8 +36,8 @@ PACKAGECONFIG[qt] = "qt='yes' qt_versioned=5,qt='no',qtbase"
> > > >  EXTRA_OESCONS = " \
> > > >      sysroot=${STAGING_DIR_TARGET} \
> > > >      libQgpsmm='false' \
> > > > -    debug='true' \
> > > > -    strip='false' \
> > > > +    debug='false' \
> > > > +    nostrip='true' \
> > >
> > > I think this change is improvement over what we have, however it will
> > > be nicer if it was knobbed with
> > > DEBUG_BUILD flag, then we can get proper debug info when doing a debug
> > > build as user will expect.
> > >...
> >
> > Sorry for being terse in the description.
> >
> > For gpsd "debug" means adding -g here, and this is already additionally
> > inserted through the normal OE CFLAGS.
> 
> I see, then the patch subject and commit msg should be updated, thanks

v2 sent with updated commit msg, subject looks OK to me.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


