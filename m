Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C02DE6CB7C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2014 16:36:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2014 08:32:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,691,1384329600"; d="scan'208";a="469574018"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.239])
	by orsmga002.jf.intel.com with ESMTP; 20 Jan 2014 08:36:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jacques Guillou <jacques.guillou@pelagicore.com>
Date: Mon, 20 Jan 2014 16:36:29 +0000
Message-ID: <1427871.Y3J8HSbtnZ@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.7-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <CAAfCovAVrxamEtAz0ZyNJ5Eu6D71gydM-UGnN=pnL3MFb8FdNQ@mail.gmail.com>
References: <CAAfCovAgZXFnAJa+OsFUUOAiJ=t13ZuzEn-Y0AR-TXdkjTta+A@mail.gmail.com>
	<1506569.WRZEAJxoig@peggleto-mobl5.ger.corp.intel.com>
	<CAAfCovAVrxamEtAz0ZyNJ5Eu6D71gydM-UGnN=pnL3MFb8FdNQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Bitbake command to clean dependees ?
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
X-List-Received-Date: Mon, 20 Jan 2014 16:36:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 January 2014 17:28:18 Jacques Guillou wrote:
> On 20 January 2014 16:34, Paul Eggleton <paul.eggleton@linux.intel.com>
> wrote:
> > On Monday 20 January 2014 15:57:39 Jacques Guillou wrote:
> >> By default (at least with Yocto), it seems like forcing the rebuild of a
> >> specific package (via "bitbake -c cleanall MyPackage") does not mark
> >> dependees as "to be rebuilt", which is a problem for me. Is there a way
> >> to change that behavior ? Maybe there is a specific command or parameters to
> >> be passed to bitbake so that performing a "cleanall" on a given package
> >> also performs a "cleanall" on all dependees ?
> > 
> > OpenEmbedded uses signatures for each task (derived from the task's
> > dependencies, both in terms of variable values and other tasks) to
> > determine whether tasks need re-executing; so, for example if you changed
> > SRC_URI in a recipe then the system knows that do_fetch depends upon the
> > value of SRC_URI, so the signature of do_fetch changes and it will
> > re-execute followed by items it depends upon such as do_unpack, do_patch
> > etc. for the same recipe. Just forcing a recipe to rebuild by cleaning it
> > with -c cleanall and then building it again doesn't change any of its
> > task signatures, so BitBake will assume no dependees need rebuilding.
> > 
> > The correct way to force a task and all of its dependencies to re-execute
> > is to use bitbake -c <command> -f or bitbake -C <command>, where
> > <command> is the task name without the do_ prefix. However, under most
> > circumstances the build system is already capable of determining itself
> > when tasks need re-executing, e.g. if you change a variable value or edit
> > a local file mentioned in SRC_URI. The question is why do you want to do
> > this forcing, i.e. what change(s) have you made that the build system
> > otherwise would not be picking up?
>
> What I would like to do is to be able to trigger the build of a
> complete image whenever a new commit has been pushed into a specific
> GIT repository. I understand that the normal way to proceed is to
> update the corresponding recipe so that it points to the new commit.
> Since the recipe would have been updated, the packages which have a
> dependency to the updated packages would be rebuilt as well, but I
> would really prefer a solution where I don't have to update any
> recipe. Please note that what I am trying to do would only be good for
> internal testing. I understand that it is a much better practice to
> use well defined commit-ID as soon as some kind of delivery, since it
> is the only way to properly identify a version.
> 
> I am currently testing using a recipe which contains the following lines:
> 
> SRC_URI =
> "git://git@git.mycompany.com/mycomponent.git;protocol=ssh;branch=master"
> SRCREV = "master"
> PV = "1.0${SRCREV}"
> 
> Using that recipe, if I first clean the package with "bitbake -c
> cleanall mypackage" and trigger a complete image build, bitbake always
> retrieves the head of the master branch when the package is to be
> fetched, and compiles the package, which is the result I expect.
> Unfortunately, after that package is rebuilt, bitbake seems to
> consider that the dependees of that package do not have to be rebuilt,
> since no change has been done to any recipe.
> 
> Is there any way to get this to work properly ? Maybe there is a way
> to tell bitbake to dynamically generate the value of the "PV"
> attribute based on the GIT commit-ID which is actually used ?

Indeed there is:

SRCREV = "${AUTOREV}"
PV = "1.0+git${SRCPV}"

You should also enable the PR service if you want the prefix numbers to
increment properly such that the version is always greater when the git hash
changes (allowing on-target upgrades to work):

http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#working-with-a-pr-service

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

