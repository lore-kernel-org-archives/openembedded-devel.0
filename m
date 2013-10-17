Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F04FF6CC8C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 23:34:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Oct 2013 16:34:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,518,1378882800"; d="scan'208";a="394665043"
Received: from pauljbro-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.120.218])
	by orsmga001.jf.intel.com with ESMTP; 17 Oct 2013 16:34:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Fri, 18 Oct 2013 00:34:33 +0100
Message-ID: <3293039.TKgnPA4p12@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAOLEWZUEBnsnshvavy3tanfPvV-ZeKduZW8_u-MnGF2zsAMsww@mail.gmail.com>
References: <1381296824-30294-1-git-send-email-stephen.arnold42@gmail.com>
	<3526425.HOOTbMNAZg@helios>
	<CAOLEWZUEBnsnshvavy3tanfPvV-ZeKduZW8_u-MnGF2zsAMsww@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-openembedded/meta-webserver][PATCH] nginx: new recipe, updated from aging original in rpi layer (has not been scrubbed for any potential policy issues).
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
X-List-Received-Date: Thu, 17 Oct 2013 23:34:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Steve,

On Thursday 17 October 2013 16:21:58 Stephen Arnold wrote:
> On Wed, Oct 9, 2013 at 2:55 AM, Paul Eggleton <paul.eggleton@linux.intel.com
> > wrote:
> > Thanks for sending this. A few comments below.
> > 
> > On Tuesday 08 October 2013 22:33:44 stephen.arnold42 wrote:
> > > From: "stephen.arnold42" <stephen.arnold42@gmail.com>
> > 
> > Ideally the part of the subject from "updated..." onwards should go into
> > the commit message. You should really specify that the "rpi" layer you
> > refer to is your own.
> 
> So,  [meta-openembedded/meta-webserver][PATCH] nginx: new recipe] and be
> more accurate about lineage.

Use this form:

[meta-webserver][PATCH] nginx: new recipe

You may already be aware, but this would be achieved by using "nginx: new 
recipe" as the first line of the commit message, and then using 
--subject-prefix="meta-webserver][PATCH" as an argument to git send-email (or 
git format-patch if generating the patch first before sending).

> I only know the IRC nick of the original author of the old recipe
> (bencoh).  I wrote the init script and minimal config file, made sure
> everything built and ran correctly in the rpi-image, and made an rpi-data
> package.  That lead to me making a newer (generic) recipe for 1.4.0 (but
> without the rpi-graphics).  How should I describe that?  With bencoh as the
> original author and me as "upstream"?

It's probably not necessary to fully describe the "lineage" although a credit 
to the original author would probably be a good thing. Mainly what I was 
getting at is if you're going to say "meta-rpi" you should probably say that 
that's your layer since it might be assumed by some to refer to the perhaps 
more well-known meta-raspberrypi layer.

> > > +++ b/meta-webserver/recipes-httpd/nginx/files/nginx-cross_1.4.0.diff
> > > @@ -0,0 +1,212 @@
> > > +diff -uraN nginx-1.0.11.orig/auto/feature nginx-1.0.11/auto/feature
> > 
> > Could you please add a header to this patch mentioning what it does, the
> > origin if it wasn't something you wrote, the Upstream-Status and your
> > Signed-
> > off-by?
> 
> So you want a bigger commit message mentioning the above in front of the
> signed-off-by that's already there?  

Here I'm referring to the top of the meta-webserver/recipes-
httpd/nginx/files/nginx-cross_1.4.0.diff file rather than the overall commit 
message. Having this information at the top of the patch file itself makes it 
easy to see what each patch file in the tree is for and whether it needs to be 
upstreamed without having to go digging through the commit history.

> Origin is described above (bencoh and
> then me) but what do you mean by "Upstream-Status"?  Who/what is upstream
> in this case?

Upstream = the nginx project itself; i.e. how does this patch relate to there 
- should it be submitted there, or did it come from there already, or is it 
not appropriate for sending upstream, etc. See:

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

