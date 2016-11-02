Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 31634605FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Nov 2016 03:01:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2016 20:01:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,582,1473145200"; d="scan'208";a="1062644063"
Received: from kgonza2-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.24])
	by fmsmga001.fm.intel.com with ESMTP; 01 Nov 2016 20:01:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Maxin John <maxin.john@intel.com>,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Wed, 02 Nov 2016 16:01:50 +1300
Message-ID: <1852679.faEG3Nt9xx@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.9-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <8af647f4-b068-fba9-a508-ea1fd82ecdac@topic.nl>
References: <1477898963-3759-1-git-send-email-mike.looijmans@topic.nl>
	<CAEHkU3U4wbOuPLCy-Ndj+ScuH2QnyBHd76FhOiTyQJzG1Kxqqg@mail.gmail.com>
	<8af647f4-b068-fba9-a508-ea1fd82ecdac@topic.nl>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt4][PATCH] qt4-embedded: Default to build tslib when touchscreen is defined
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
X-List-Received-Date: Wed, 02 Nov 2016 03:01:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

I have merged both of the patches to master and taken the liberty of merging 
them to morty as well, just so it isn't horribly broken. I appreciate it's 
still slightly broken from some perspectives.

I suspect the reason this was done was to remove the tslib dependency by 
default so that meta-oe wasn't pulled in. Whether or not that's a good idea is 
another question, personally I wouldn't have done it this way. It seems to me 
if you have a touchscreen arguably you need tslib here.

Maxin / Alex, can you please determine what the right course of action is 
going forward and take care of it?

Thanks,
Paul

On Tue, 01 Nov 2016 16:02:06 Mike Looijmans wrote:
> Having some more experience with it, my suggestion would be to REVERT
> c4671873af5ab6c7d15ca397538f154c11c3486e "qt4-embedded.inc: provide
> PACKAGECONFIG for tslib".
> 
> The problem with using MACHINE_FEATURES for building the qt4 libs is that
> the qt4 package becomes machine-specific, and if you're buiding for
> multiple machines (with and without touchscreen), there'll be lots of
> "setstate" activity to take care of that.
> 
> Building tslib hardly hurts, it's a small dependency, while building qt4
> takes something like 5 minutes on our big ass i7 build server. And deciding
> not to install the plugin is quite efficient.
> 
> At the very least, "tslib" should be in the default config.
> 
> I don't know the rationale behind commit c4671873af5, if reducing compile
> time was the incentive, it's not really paying off. Time would be better
> spent avoiding building "perl" or "bash"...
> 
> On 31-10-16 15:12, Max Krummenacher wrote:
> > Hi
> > 
> > I sent a similar patch:
> > https://lists.yoctoproject.org/pipermail/yocto/2016-October/032661.html
> > 
> > Both fix the build error with the HEAD of meta-qt4.
> > 
> > Question is if "touchscreen" in MACHINE_FEATURES should build for
> > tslib by default.
> > If yes, your patch is needed.
> > 
> > However the error will pop up again if someone chooses to set
> > PACKAGECONFIG to not include tslib.
> > That would be handled by the patch above, so applying both patches
> > would fix the problem and default to having tslib support.
> > 
> > Max
> > 
> > P.S.What is the 'correct' mailinglist for meta-qt4?
> > 
> > 2016-10-31 8:29 GMT+01:00 Mike Looijmans <mike.looijmans@topic.nl>:
> >> When "touchscreen" is in the MACHINE_FEATURES, packagegroup-core-qt4e
> >> will RDEPEND on qt4-embedded-plugin-mousedriver-tslib, but that
> >> library is not being built by default, resulting in an error like:
> >> opkg_prepare_url_for_install: Couldn't find anything to satisfy
> >> 'qt4-embedded-plugin-mousedriver-tslib'.
> >> 
> >> To prevent that from happening, add "tslib" to the default
> >> PACKAGECONFIG when touchscreen is defined.
> >> 
> >> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> >> ---
> >> Applies to both morty and master branches.
> >> 
> >>  recipes-qt4/qt4/qt4-embedded.inc | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/recipes-qt4/qt4/qt4-embedded.inc
> >> b/recipes-qt4/qt4/qt4-embedded.inc index 1122080..9c2d9da 100644
> >> --- a/recipes-qt4/qt4/qt4-embedded.inc
> >> +++ b/recipes-qt4/qt4/qt4-embedded.inc
> >> @@ -3,7 +3,7 @@ DESCRIPTION = "Qt is a versatile cross-platform
> >> application framework -- this is>> 
> >>  SECTION = "libs"
> >>  HOMEPAGE = "http://qt-project.org/"
> >> 
> >> -PACKAGECONFIG ??= ""
> >> +PACKAGECONFIG ??= '${@bb.utils.contains("MACHINE_FEATURES",
> >> "touchscreen", "tslib", "",d)}'>> 
> >>  PACKAGECONFIG[tslib] = " -plugin-mouse-tslib, ,tslib"
> >>  
> >>  QT4EDEPENDS = ""
> >> 
> >> --
> >> 1.9.1
> >> 
> >> --
> 
> Kind regards,
> 
> Mike Looijmans
> System Expert
> 
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
> 
> Please consider the environment before printing this e-mail
> 
> 
> 
> 
> 
> _______________________________________________
> 
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 

Paul Eggleton
Intel Open Source Technology Centre

