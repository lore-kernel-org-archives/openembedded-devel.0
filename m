Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6D5187616D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2015 09:21:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 24 Jul 2015 02:21:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,537,1432623600"; d="scan'208";a="529505499"
Received: from poconnor-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.237])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jul 2015 02:21:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Victor Rodriguez <vm.rod25@gmail.com>
Date: Fri, 24 Jul 2015 10:21:26 +0100
Message-ID: <3121111.SBSyRjc1Bo@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.8-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAK5mtezCMOyUvN9y8ds4heV-p2AN5Ndv5F-gic3BY0TKDP3sKg@mail.gmail.com>
References: <CAK5mtexdmYF7ivs+nwa7WZSqVb8sZCq5Euvt8oK2HimiXy7PMA@mail.gmail.com>
	<3048124.JhGOlONExd@peggleto-mobl.ger.corp.intel.com>
	<CAK5mtezCMOyUvN9y8ds4heV-p2AN5Ndv5F-gic3BY0TKDP3sKg@mail.gmail.com>
MIME-Version: 1.0
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Gary Thomas <gary@mlbassoc.com>,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Subject: Re: [yocto] Question about IMAGE_INSTALL_append and CORE_IMAGE_EXTRA_INSTALL
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
X-List-Received-Date: Fri, 24 Jul 2015 09:21:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 23 July 2015 15:28:43 Victor Rodriguez wrote:
> On Wed, Jul 22, 2015 at 8:50 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Tuesday 21 July 2015 14:51:55 Victor Rodriguez wrote:
> >> On Tue, Jul 21, 2015 at 12:41 PM, Leonardo Sandoval
> >> 
> >> <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> >> > On 07/21/2015 10:45 AM, Victor Rodriguez wrote:
> >> >> On Tue, Jul 21, 2015 at 10:36 AM, Gary Thomas <gary@mlbassoc.com> 
wrote:
> >> >>> On 2015-07-21 09:26, Victor Rodriguez wrote:
> >> >>>> Hi team
> >> >>>> 
> >> >>>> I have a question , according to documentation there is a difference
> >> >>>> between
> >> >>>> 
> >> >>>> IMAGE_INSTALL_append
> >> >>>> 
> >> >>>> and
> >> >>>> 
> >> >>>> CORE_IMAGE_EXTRA_INSTALL
> >> >>>> 
> >> >>>> Specifies the list of packages to be added to the image. You should
> >> >>>> only set this variable in the local.conf configuration file found in
> >> >>>> the Build Directory.
> >> >>>> 
> >> >>>> When I use the second one and try to build a core-image-minimal-xfce
> >> >>>> bitbake does not install what I wanted in my image . I had a really
> >> >>>> hard time few weekends ago because of this.
> >> >>>> 
> >> >>>> I wonder If I am missing something or if this is a bug
> >> >>> 
> >> >>> The core-image-minimal-xfce recipe does not "play nice" with
> >> >>> the core-image class and is not respecting CORE_IMAGE_EXTRA_INSTALL.
> >> >>> 
> >> >>> I think this should be filed as a bug (and feel free to suggest a
> >> >>> patch)
> >> >>> 
> >> >>> BTW, this question should really be on the OpenEmbedded development
> >> >>> list.
> >> >> 
> >> >> Thanks Gary
> >> >> 
> >> >> I will submit the BUG , do you know the Bugzila where I should submit
> >> >> it
> >> >> ?
> >> > 
> >> > Victor, you can file a bug at https://bugzilla.yoctoproject.org
> >> 
> >> I think we have one already
> >> 
> >> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7616
> > 
> > That's not the right bug.
> > 
> > If the suggestion is that core-image-minimal-xfce needs to be fixed,
> > that's not a bug we would track in the Yocto Project bugzilla (since the
> > Yocto Project is not actively involved in maintaining meta-xfce).
> > 
> > Cheers,
> > Paul
> 
> Hi Paul
> 
> Where can I track this ?

Layers under meta-openembedded don't have a bug tracker that I know of. 
Honestly for something as simple as this I'd just send a patch to the 
openembedded-devel mailing list (with [meta-xfce] in the subject).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

