Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8265773BB8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 13:50:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 22 Jul 2015 06:50:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,523,1432623600"; d="scan'208";a="752248615"
Received: from gwhaley-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.55])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jul 2015 06:50:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jul 2015 14:50:57 +0100
Message-ID: <3048124.JhGOlONExd@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.7-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAK5mtexxVJ2uZeahegoJ=+8pOztcPufUHYmXWrhwy9hMzc3tLw@mail.gmail.com>
References: <CAK5mtexdmYF7ivs+nwa7WZSqVb8sZCq5Euvt8oK2HimiXy7PMA@mail.gmail.com>
	<55AE8445.60302@linux.intel.com>
	<CAK5mtexxVJ2uZeahegoJ=+8pOztcPufUHYmXWrhwy9hMzc3tLw@mail.gmail.com>
MIME-Version: 1.0
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	Gary Thomas <gary@mlbassoc.com>
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
X-List-Received-Date: Wed, 22 Jul 2015 13:51:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 July 2015 14:51:55 Victor Rodriguez wrote:
> On Tue, Jul 21, 2015 at 12:41 PM, Leonardo Sandoval
> 
> <leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> > On 07/21/2015 10:45 AM, Victor Rodriguez wrote:
> >> On Tue, Jul 21, 2015 at 10:36 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> >>> On 2015-07-21 09:26, Victor Rodriguez wrote:
> >>>> Hi team
> >>>> 
> >>>> I have a question , according to documentation there is a difference
> >>>> between
> >>>> 
> >>>> IMAGE_INSTALL_append
> >>>> 
> >>>> and
> >>>> 
> >>>> CORE_IMAGE_EXTRA_INSTALL
> >>>> 
> >>>> Specifies the list of packages to be added to the image. You should
> >>>> only set this variable in the local.conf configuration file found in
> >>>> the Build Directory.
> >>>> 
> >>>> When I use the second one and try to build a core-image-minimal-xfce
> >>>> bitbake does not install what I wanted in my image . I had a really
> >>>> hard time few weekends ago because of this.
> >>>> 
> >>>> I wonder If I am missing something or if this is a bug
> >>> 
> >>> The core-image-minimal-xfce recipe does not "play nice" with
> >>> the core-image class and is not respecting CORE_IMAGE_EXTRA_INSTALL.
> >>> 
> >>> I think this should be filed as a bug (and feel free to suggest a patch)
> >>> 
> >>> BTW, this question should really be on the OpenEmbedded development
> >>> list.
> >> 
> >> Thanks Gary
> >> 
> >> I will submit the BUG , do you know the Bugzila where I should submit it
> >> ?
> > 
> > Victor, you can file a bug at https://bugzilla.yoctoproject.org
> 
> I think we have one already
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7616

That's not the right bug.

If the suggestion is that core-image-minimal-xfce needs to be fixed, that's not 
a bug we would track in the Yocto Project bugzilla (since the Yocto Project is 
not actively involved in maintaining meta-xfce).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

