Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B33F7617B8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Sep 2014 08:42:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Sep 2014 01:42:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,441,1406617200"; d="scan'208";a="584473988"
Received: from ohreyal-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.182])
	by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2014 01:42:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: James Le Cuirot <chewi@aura-online.co.uk>
Date: Mon, 01 Sep 2014 09:42:52 +0100
Message-ID: <2095137.4uCLGZJILL@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.10-200.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <20140828154925.6d63a0dc@red.yakaraplc.local>
References: <20140827223659.1fb55fb4@symphony.aura-online.co.uk>
	<20140828142759.GD16066@jama>
	<20140828154925.6d63a0dc@red.yakaraplc.local>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver] nginx 1.7.4 cross-compiling patches
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
X-List-Received-Date: Mon, 01 Sep 2014 08:42:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi James,

On Thursday 28 August 2014 15:49:25 James Le Cuirot wrote:
> On Thu, 28 Aug 2014 16:27:59 +0200
> Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Thu, Aug 28, 2014 at 10:38:26AM +0100, James Le Cuirot wrote:
> > > On Thu, 28 Aug 2014 11:29:44 +0200
> > > 
> > > Martin Jansa <martin.jansa@gmail.com> wrote:
> > > > On Thu, Aug 28, 2014 at 12:42:08AM -0700, Khem Raj wrote:
> > > > > On 14-08-27 22:36:59, James Le Cuirot wrote:
> > > > > > Hello,
> > > > > > 
> > > > > > I was trying to cross-compile nginx 1.7.4 on Gentoo and found
> > > > > > your nginx-cross.patch. It almost applied, despite being
> > > > > > prepared against 1.0.11. I recreated it and everything worked
> > > > > > except that the --with-endian option is not actually
> > > > > > effective. I have attached the new nginx-cross.patch as well
> > > > > > as a --with-endian fix. Hope this helps. As I don't use
> > > > > > OpenEmbedded, I'll leave updating the nginx package to you.
> > > > > 
> > > > > thanks for the patch. I hope it will appear in patchwork and
> > > > > can be picked by someone doing package upgrade
> > > > 
> > > > It's not correctly picked by patchwork
> > > > http://patchwork.openembedded.org/patch/79247/
> > > > 
> > > > James: Please resend with git send-email as README suggests
> > > > http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> > > 
> > > Hi Martin. I was going to but I figured that wouldn't really make
> > > sense unless the package script was updated as well. If it were
> > > just merged as-is, it would break the package. Would you still like
> > > it submitted in this form anyway?
> > 
> > Please submit it together with upgrade from 1.4.4. to newer 1.7.4
> > version.
> 
> As I already stated, I don't use and have never used OpenEmbedded. I
> just picked the existing patch up for use with Gentoo and was being
> courteous by providing my improvements. I don't have time to update and
> test a package for a distro I have never used. Sorry.

OK, thanks for sending it anyway and we'll keep it aside for when someone gets 
the time to update the nginx recipe.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

