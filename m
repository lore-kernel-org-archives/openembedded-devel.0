Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1C5887833C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 21:01:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBIL1mU9021902
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Dec 2017 13:01:48 -0800 (PST)
Received: from yow-masselst-lx1.localnet (128.224.25.142) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 18 Dec 2017 13:01:47 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Tim Orling <ticotimo@gmail.com>
Date: Mon, 18 Dec 2017 16:01:46 -0500
Message-ID: <21648831.s208P8NGHT@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <1712771F-CFE1-4566-BC40-FD3D8D72F729@gmail.com>
References: <1513359926-17087-1-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1qS8U_+PraE2zBc7T28XhADftoo+7ffmbQhT2Jg674bbg@mail.gmail.com>
	<1712771F-CFE1-4566-BC40-FD3D8D72F729@gmail.com>
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][rocko][PATCH 2/2] python-twisted: restore RDEPENDS on -news for py2
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
X-List-Received-Date: Mon, 18 Dec 2017 21:01:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, December 15, 2017 10:33:10 PM EST Tim Orling wrote:
> > On Dec 15, 2017, at 12:01 PM, Derek Straka <derek@asterius.io> wrote:
> > 
> > That would be useful.  I'm working through automated tests that build
> > every
> > package into a minimal rootfs and then attempt to perform all of imports
> > to
> > make sure everything is available for use.  I'm hoping to roll that out in
> > the next couple of weeks.  Thanks for catching this regression.
> 
> The same type of testing is needed in OE-core. One would hope not, but then
> there is reality.

Tim,

Not sure if you are following the discussion on my other patch series (python-
pyroute2). But yes, if there is an effort to force python recipes to list 
stdlibs this is the only valid approach as the python "vehicles" (setup.py, 
requirements.txt...) don't _ever_ list stdlibs. Even with an automated 
approach I am not enthusiastic about forcing the listing of required stdlibs 
for the sake of a few MB of space.

Mark

> > On Dec 15, 2017 2:35 PM, "Mark Asselstine" <mark.asselstine@windriver.com>
> > 
> > wrote:
> >> I work with a lot of python recipes in meta-cloud-services and
> >> especially the openstack packages have a large number of dependencies.
> >> Find attached a basic script I have written to help parse
> >> requirements.txt files. It might help you out with this work.
> >> 
> >> Anyway, I will send out a V2 with the additional cherrypicks.
> >> 
> >>> On Fri, Dec 15, 2017 at 2:30 PM, Derek Straka <derek@asterius.io> wrote:
> >>> Yeah.  Agreed.  These commits are me cleaning up the RDEPENDS to work
> >> 
> >> with
> >> 
> >>> minimal python installs.  Meta-python has been pretty bad about setting
> >> 
> >> the
> >> 
> >>> dependencies.  I just missed the news package.  Thanks.
> >>> 
> >>> On Dec 15, 2017 2:22 PM, "Mark Asselstine" <
> >> 
> >> mark.asselstine@windriver.com>
> >> 
> >>> wrote:
> >>>> No problem. Unfortunately your commit log was thin on information so I
> >>>> had to make some assumptions as to what you were doing in the commit.
> >>>> I could have easily misinterpreted.
> >>>> 
> >>>> On Fri, Dec 15, 2017 at 2:19 PM, Derek Straka <derek@asterius.io>
> >> 
> >> wrote:
> >>>>> Sure.  I wasn't clear and even then I misread the 1/2 patch and
> >> 
> >> thought I
> >> 
> >>>>> removed news from core and not the base package RDEPENDS.
> >>>>> 
> >>>>> On Dec 15, 2017 2:08 PM, "Mark Asselstine" <
> >>>> 
> >>>> mark.asselstine@windriver.com>
> >>>> 
> >>>>> wrote:
> >>>>> 
> >>>>> The RDEPENDS are not for core, these are RDEPENDS_${PN}, ie. if you
> >>>>> don't know what parts you want you install ${PN} and get everything.
> >>>>> We can straighten this up though if my thoughts are incorrect. I have
> >>>>> to send a V2 anyway as I was hasty and missed the cherrypick of a
> >>>>> bunch of dependencies you added for automat and others.
> >>>>> 
> >>>>> Mark
> >>>>> 
> >>>>> On Fri, Dec 15, 2017 at 1:32 PM, Derek Straka <derek@asterius.io>
> >> 
> >> wrote:
> >>>>>> Is it actually required for core?  I thought I went through and
> >> 
> >> verified
> >> 
> >>>>>> that news was a stand alone module.
> >>>>>> 
> >>>>>> On Dec 15, 2017 12:46 PM, "Mark Asselstine" <
> >>>> 
> >>>> mark.asselstine@windriver.com
> >>>> 
> >>>>>> wrote:
> >>>>>>> Although this plugin has not yet been ported to py3 it is available
> >> 
> >> in
> >> 
> >>>>>>> py2. The previous commit isn't clear about what is being addressed
> >> 
> >> but
> >> 
> >>>>>>> I assume it is:
> >>>>>>> 
> >>>>>>> nothing provides python3-twisted-news needed by
> >>>>> 
> >>>>> python3-twisted-17.9.0-r0.
> >>>>> 
> >>>>>>> corei7_64
> >>>>>>> 
> >>>>>>> For py2 this package is valid and so we should maintain the
> >> 
> >> RDEPENDS,
> >> 
> >>>>>>> restore this RDEPENDS for py2.
> >>>>>>> 
> >>>>>>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> >>>>>>> ---
> >>>>>>> meta-python/recipes-devtools/python/python-twisted_17.9.0.bb | 6
> >>>> 
> >>>> ++++++
> >>>> 
> >>>>>>> 1 file changed, 6 insertions(+)
> >>>>>>> 
> >>>>>>> diff --git a/meta-python/recipes-devtools/python/python-
> >>>> 
> >>>> twisted_17.9.0.bb
> >>>> 
> >>>>>>> b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
> >>>>>>> index 2be1709..7fc8c65 100644
> >>>>>>> --- a/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
> >>>>>>> +++ b/meta-python/recipes-devtools/python/python-twisted_17.9.0.bb
> >>>>>>> @@ -2,3 +2,9 @@ inherit pypi setuptools
> >>>>>>> require python-twisted.inc
> >>>>>>> 
> >>>>>>> RDEPENDS_${PN}-core += "${PYTHON_PN}-contextlib"
> >>>>>>> +
> >>>>>>> +# Not yet ported to py3 yet available in py2
> >>>>>>> +# See src/twisted/python/_setup.py -- notPortedModules
> >>>>>>> +RDEPENDS_${PN} += "\
> >>>>>>> +    ${PN}-news \
> >>>>>>> +    "
> >>>>>>> --
> >>>>>>> 2.7.4
> >>>>>>> 
> >>>>>>> --
> >>>>>>> _______________________________________________
> >>>>>>> Openembedded-devel mailing list
> >>>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>>> 
> >>>>>> --
> >>>>>> _______________________________________________
> >>>>>> Openembedded-devel mailing list
> >>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>> 
> >>>>> --
> >>>>> _______________________________________________
> >>>>> Openembedded-devel mailing list
> >>>>> Openembedded-devel@lists.openembedded.org
> >>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>> 
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



