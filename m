Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EC5BB71D7F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 20:48:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 13 Dec 2016 12:48:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="1071686799"
Received: from oshau-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.66])
	by orsmga001.jf.intel.com with ESMTP; 13 Dec 2016 12:48:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Cagle <rcagle@omnitron-systems.com>
Date: Wed, 14 Dec 2016 09:48:41 +1300
Message-ID: <2668593.4cPb1u5Jh3@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.12-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <44E60BE3F360494194A33E0B8411CB9A62AE16@oscar.ostdom.com>
References: <44E60BE3F360494194A33E0B8411CB9A62ADD8@oscar.ostdom.com>
	<eb581f04-c965-f26c-97c2-3b04fd639515@windriver.com>
	<44E60BE3F360494194A33E0B8411CB9A62AE16@oscar.ostdom.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake dependency question
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
X-List-Received-Date: Tue, 13 Dec 2016 20:48:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

On Tue, 13 Dec 2016 04:47:31 Robert Cagle wrote:
> Robert Yang wrote:
> > Try something like:
> > In recipeD.bb:
> > PLUGIN_RECIPES ??= "A" (or b, c)
> > DEPENDS = "${PLUGIN_RECIPES} other..."
> > 
> > In local.conf:
> > PLUGIN_RECIPES = "A" (or b, c).
> 
> Hi Robert,
> Thanks for the response! My current solution is similar to what you suggest:
> 
> local.conf
> PLUGIN_RECIPES = "recipeA recipeB recipeC"
> 
> recipeD.bb:
> DEPENDS = "${PLUGIN_RECIPES} other"
> 
> I'm assuming the weak reference in 'PLUGIN_RECIPES ??= "A" (or b, c)'  is to
> prevent errors if someone forgets to define PLUGIN_RECIPES in local.conf?

Correct, ??= is a "weak" or "lazy" default.
 
> I was hoping to do something like this in an image recipe:
> my-image.bb:
>    IMAGE_INSTALL_append = " recipeA  recipeB recipeC recipeD"
> and have the rest happen automatically based on the contents of those
> recipes.
> 
> However, maybe I could at least do:
> my-image.bb:
>    IMAGE_INSTALL_append = " ${PLUGIN_RECIPES} recipeD  other..."

This will almost certainly be fine in your case, but something to bear in mind 
is that IMAGE_INSTALL refers to packages, not recipes. By default the main 
package of a recipe is the same name as the recipe, but it doesn't have to be 
that way.

> and have everything controlled from local.conf by one variable. I'd rather
> have it the other way around (defined once in my-image.bb), but I can live
> with this. Thanks again!

FYI, one of the basic principles of the way OE works is that one recipe cannot 
affect the processing of another except by way of the sysroot (and then the 
first recipe must also be in the second's DEPENDS) - many other parts of the 
system rest upon this design. Hence why you can't say "in this image I want 
this other recipe built in this way, and in that image I want it built in that 
other way". All you get to control in an image recipe is which packages to 
include, and maybe do some post-processing. Of course, you can set variables 
at the configuration level and have multiple recipes pick it up, as in the 
above example.

Another way to handle this kind of situation with plugins is to simply build 
them all with all dependencies, and have the runtime design such that it's 
fully flexible as to which plugins are installed - then you just make the 
choice in the image. (Perhaps what you're building is already that way and 
you're just trying to save on build time?)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

