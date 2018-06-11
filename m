Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A099978B30
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2018 11:38:05 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jun 2018 04:38:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,501,1520924400"; d="scan'208";a="62147045"
Received: from mbabyjoh-desk.ger.corp.intel.com ([10.237.72.84])
	by fmsmga004.fm.intel.com with ESMTP; 11 Jun 2018 04:38:05 -0700
Date: Mon, 11 Jun 2018 14:30:35 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: prvs=68935beb6=Richard.Leitner@skidata.com
Message-ID: <20180611113035.GA17777@mbabyjoh-desk.ger.corp.intel.com>
References: <10630413.xVAl2E7OaH@yow-masselst-lx1>
	<20180606204244.GA16170@mail.itconsulting-heinold.de>
	<fcaab484-d381-92f7-04d7-2a7edca6f903@skidata.com>
	<20180607132234.GA19704@mail.itconsulting-heinold.de>
	<91e19a88-1a03-b772-b6be-bf6bf27037c8@skidata.com>
	<CAP9ODKrFomJ2Rvp5mku81Op-rYCNt-AXm4TVV2-aSg6QSfEoFQ@mail.gmail.com>
	<d8462836-e655-4bb4-7b03-bce18cb3e24c@skidata.com>
MIME-Version: 1.0
In-Reply-To: <d8462836-e655-4bb4-7b03-bce18cb3e24c@skidata.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [meta-java] maintainer status
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
X-List-Received-Date: Mon, 11 Jun 2018 11:38:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard,

Sorry for my long silence here in the list ( was away due to a personal loss).


On Thu, Jun 07, 2018 at 04:32:36PM +0200, prvs=68935beb6=Richard.Leitner@skidata.com wrote:
> On 06/07/2018 03:56 PM, Otavio Salvador wrote:
> > On Thu, Jun 7, 2018 at 10:53 AM, Richard Leitner
> > <richard.leitner@skidata.com> wrote:
> > ....
> >> As I'm using this layer now for quite a few years I'll be glad to help you with
> >> the maintainership of meta-java. Nonetheless I have to admit that I have no
> >> experience in maintaining an openembedded layer ;-)
> >> Therefore if you're still interested I'd have some questions regarding the
> >> "strategic" targets, workflows and stuff like that...
> > 
> > Awesome, new energy!

Great ! 

> > Sure, go ahead and ask :-D
> > 
> 
> Thanks :-)
> 
> So here are some question that currently came to my mind:
> 
>  * do you use some kind of patch management software (like patchwork)?

meta-java doesn't use patchwork till now.

>  * are there any "quality gate tests" for patches being applied to master or stable branches?

At the moment, we dont have enough tests in meta-java (It will be good to have more selftests). Moving
from manual build/testing to a Jenkins based automated one was briefly tested in a personal setup.

>  * is there something like a build/test robot for patches and/or branches?
Not yet. Tested a travis based setup in github. Testing wasn't successful due to the resource restrictions
(mainly storage) there.

>  * should we use the master-next branch for staging new patches?

Preferably - yes.

>  * is there a reason for not having OpenJDK >8 recipes?

Nothing that I can remember :)

>  * if the above is answered with something like "because nobody submitted them": Should we try to follow the current OpenJDK release model (a feature release every six month)?

+1, That will be nice. 

>  * based on what scheduling are the stable branches created? Yocto Project release dates I guess?

Yes.

>  * what kind of patches should be applied/backported to the stable branches?

Depends. Mostly security based patches and others, based on urgency/demand.

> 
> I think that's all for now (but presumably some more question will follow during the next weeks) ;-)
>
> regards;Richard.L

Best Regards,
Maxin

