Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BBAD87029A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Oct 2014 08:05:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 08 Oct 2014 00:55:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="396969110"
Received: from davidgil-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.79])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Oct 2014 00:58:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 08 Oct 2014 09:05:06 +0100
Message-ID: <4128802.ejxINkx0CB@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.1 (Linux/3.16.3-200.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <20141007152508.GD12322@jama>
References: <CA+chaQdOUkViSuuZF+Fn1hfz+1P7ijgFYGTjgaRGUWTdVLCVZA@mail.gmail.com>
	<1801470.RIdAKMambK@peggleto-mobl5.ger.corp.intel.com>
	<20141007152508.GD12322@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCHv2] modphp, xdebug: blacklist because of conflict with php
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Oct 2014 08:05:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 07 October 2014 17:25:08 Martin Jansa wrote:
> On Tue, Oct 07, 2014 at 09:39:34AM +0100, Paul Eggleton wrote:
> > On Tuesday 07 October 2014 06:53:17 Martin Jansa wrote:
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > > 
> > >  meta-webserver/recipes-php/modphp/modphp5.inc     | 3 +++
> > >  meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb | 1 +
> > >  2 files changed, 4 insertions(+)
> > > 
> > > diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc
> > > b/meta-webserver/recipes-php/modphp/modphp5.inc index 6932429..8707950
> > > 100644
> > > --- a/meta-webserver/recipes-php/modphp/modphp5.inc
> > > +++ b/meta-webserver/recipes-php/modphp/modphp5.inc
> > > @@ -14,6 +14,9 @@ S = "${WORKDIR}/php-${PV}"
> > > 
> > >  LIC_FILES_CHKSUM =
> > >  "file://LICENSE;md5=52dd90569008fee5bcdbb22d945b1108"
> > > 
> > > +PNBLACKLIST[modphp] = "CONFLICT: 466 header files conflict with php"
> > > +# e.g. sysroots/qemux86-64/usr/include/php/main/win95nt.h
> > > +
> > 
> > I'm sorry, but we are not going to blacklist this recipe for everyone. I
> > appreciate that stricter tests mean these can't be built side-by-side,
> > that's just unfortunate and something we will have to live with for now.
> 
> It was motivated by discussion with RP and Ross on #yocto.
> 
> 23:52:26 < JaMa|Off> RP: would it make sense to change populate-sysroot
> conflicts to use package_qa_handle_error function so it would be fatal QA
> error (by default) with option to disable it? 23:53:31 < JaMa|Off> RP: I
> think part of this problem was that normal bb.warn messages are less
> visible than QA messages (which are also collected in qa.log) so easy to
> check after the build 23:55:49 < RP> JaMa|Off: To be honest, I don't want
> people to turn that on off. The issues are too nasty 23:56:42 < RP>
> s/on/one/
> 23:56:46 < JaMa|Off> OK, fair enough, I agree it's nasty
> 23:57:32 < JaMa|Off> it's last 6 failures in world builds (after including
> all my pending fixes), I've sent the list earlier today 23:57:45 < RP>
> JaMa|Off: if it stops there and then, the issue can usually be recovered.
> If you continue past that you no longer know what in the sysroot is
> corrupted 23:58:47 < JaMa|Off> the problem is that if I go with PNBLACKLIST
> (to blacklist one from the conflicting duo) then I'm blacklisting something
> which alone is fine (unless you're building the other recipe as well)
> 23:59:41 < JaMa|Off> e.g. Paul won't be happy if I blacklist modphp, just
> because it conflicts with php and vice-versa 00:20:27 < rburton> JaMa|Off:
> blacklisting both php and modphp is clearly the answer, and improves the
> world 00:22:43 < JaMa|Off> should I send patch for oe-core to blacklist xz
> and lzma as well? :)
> 
> You can still disable that PNBLACKLIST in your local.conf or distro.conf.

Yes, I am aware of that. I just don't accept that this is the right way to 
handle this. Unlike other recipes we have blacklisted, there's nothing 
inherently wrong with the modphp recipe on its own, particularly considering 
that most users that wish to build it will have no interest in building it 
side-by-side with the separate php recipe.

The overlap will be fixed in due course. Until that time, can I ask that if you 
wish to blacklist this one for the sake of avoiding world build failures that 
you do it in your distro config?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

