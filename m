Return-Path: <paul.eggleton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 27B4B65D69
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jun 2014 08:38:05 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Jun 2014 01:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,463,1400050800"; d="scan'208";a="444605390"
Received: from nithyasr-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.63])
	by azsmga001.ch.intel.com with ESMTP; 12 Jun 2014 01:38:03 -0700
From: Paul Eggleton <paul.eggleton@intel.com>
To: Christopher Larson <kergoth@gmail.com>
Date: Thu, 12 Jun 2014 09:38:02 +0100
Message-ID: <1421812.IFbAnSHYII@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.5-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <CABcZAN=C89LopMeHf45bgHsLeFsUcs02FYxrZ9a0tzi00Z0+rA@mail.gmail.com>
References: <1770553.GcPTkVXTr4@peggleto-mobl5.ger.corp.intel.com>
	<CABcZAN=C89LopMeHf45bgHsLeFsUcs02FYxrZ9a0tzi00Z0+rA@mail.gmail.com>
MIME-Version: 1.0
Cc: Phil Blundell <pb@pbcl.net>, openembedded-devel@lists.openembedded.org
Subject: Re: Old OE history
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
X-List-Received-Date: Thu, 12 Jun 2014 08:38:09 -0000
Content-Type: text/plain; charset="us-ascii"

On Tuesday 10 June 2014 20:19:53 Christopher Larson wrote:
> On Mon, Jun 9, 2014 at 10:34 AM, Paul Eggleton <paul.eggleton@intel.com>
> wrote:
> > Looking back through OE-Classic git commit history, the first commit (from
> > Chris) is basically an import; so it seems to me that at one point we did
> > have
> > some more history from before then. This was before my time on the
> > project so
> > I'm not sure what we had before bitkeeper (if anything).
> 
> This doesn't seem accurate to me. The first commit is
> bda361cba6cf49d92d21f44c87a9d2f13511d551, which created an initial mostly
> empty repository, which was followed by
> c11afe579262bdabdf3af8fdfcb24b3598bf0232 which added a couple initial
> recipes, etc.
> 
> At one point we used cvs, which got imported into bk, which got re-exported
> as cvs, which got imported into mtn, which got converted to git, or
> something like that, if I'm remembering correctly, anyway :) And of course
> I did some careful grafting of the earliest histories. I'm pretty sure we
> have most of the historical repositories around somewhere or another. I
> know I have copies of the bkbits repository for bitbake, the oz buildroot
> repo from various places, and  the cvs exports of the bkbits repositories.
> It is of course possible that something got lost in the translations
> between scm types along the way, but I'm not aware of anything missing
> offhand. And of course the initial repository was prior to bitbake being
> split out, the split of the early history between bitbake and openembedded
> was done by me, as carefully as I could, but iirc we still have the old
> 'oe' repository which was prior to the split.
> 
> If I dump a list of every file which has ever existed in the oe classic
> repository, and then grep out qt.*/compile.patch from that, and use git log
> on those files, you can see all the way back to the import of the initial
> qt/qte patches from the oz buildroot, and subsequent changes to it after
> that:
> 
>     git log -- (git rev-list --reverse HEAD | git diff-tree --stdin
> --no-commit-id --name-only -r | sort -u | grep 'qt.*/compile.patch')
> 
> Aside: I have 'git rev-list --reverse HEAD | git diff-tree --stdin
> --no-commit-id --name-only -r | sort -u' as a standalone git-ls-files-ever
> script. this is particularly useful when splitting git repositories up, or
> doing complete svn to git conversions, to ensure that you don't miss any
> files, as git's --follow isn't always sufficient, nor are other uses of its
> copy/move detection.

Ah, thanks for this - this works a lot better. However, I think the reason 
that I was getting confused before is that some of the patch files I'm trying 
to trace appear to start with zero size in the history, which leads git's 
rename detection with --follow down the wrong path. I'd also missed that some 
of the BK merge commits actually have useful information about the commits 
they contained; if you know what you're looking for you can match them up with 
the file(s) they refer to.

Cheers,
Paul
---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


