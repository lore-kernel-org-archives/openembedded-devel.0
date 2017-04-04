Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0249060069
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Apr 2017 14:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491315153; x=1522851153;
	h=message-id:subject:from:to:cc:date:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=ALi7zRYnPgouBmcmyPho/VQsXNNgjiWaIiChhi/E1Nw=;
	b=KvCjvu7yU+SN0sLLMVnPZixP0O86zgcekDVov+AUp1t5H1RhoJ3Da22+
	z13glKfSbPJWaBtjsIhB2XblMoQn9g==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2017 07:11:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,275,1486454400"; d="scan'208";a="243903355"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by fmsmga004.fm.intel.com with ESMTP; 04 Apr 2017 07:11:48 -0700
Message-ID: <1491315607.17259.98.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Boszormenyi Zoltan <zboszor@pr.hu>
Date: Tue, 04 Apr 2017 09:20:07 -0500
In-Reply-To: <b6d5c349-8caa-4bc7-a6d4-9de24a6a0083@pr.hu>
References: <20170403170132.19588-1-zboszor@pr.hu>
	<CA+chaQeh0DU630Bp2sd+Mzk+Fq-1=h1oJveKSeSOrsGU0+8Wfg@mail.gmail.com>
	<b6d5c349-8caa-4bc7-a6d4-9de24a6a0083@pr.hu>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Extend to kernel-module-split.bbclass
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
X-List-Received-Date: Tue, 04 Apr 2017 14:12:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-04-04 at 15:19 +0200, Boszormenyi Zoltan wrote:
> Catch 22.
> 
> I subscribed to openembedded-core ML two days ago, no confirmation or
> admin approval yet.
> 
> A day later I sent this series to the openembedded-core ML, the automatic
> reply said subscription is needed to send mail to the list.
> 
> Please someone wake up the list admins.
> 

CC Phillip, he solved a similar issue on the architecture mailing list.



> 2017-04-03 20:04 keltezéssel, Martin Jansa írta:
> > This needs to go to openembedded-core ML.
> >
> > On Mon, Apr 3, 2017 at 7:01 PM, Zoltan Boszormenyi <zboszor@pr.hu <mailto:zboszor@pr.hu>>
> > wrote:
> >
> >
> >     The changes are in two topics:
> >
> >     Support kernel module compression, both gz and xz. It needs
> >     the kmod package to be built with zlib and/or lzma support.
> >     The space saving is substantial.
> >
> >     The kernel-modules meta-package should refer to module subpackages
> >     with versions, so if someone upgrades only a limited number of
> >     packages at once instead of everything, the kernel upgrade can be
> >     done by typing the kernel and kernel-modules package.
> >
> >     Signed-off-by: Zoltan Boszormenyi <zboszor@pr.hu <mailto:zboszor@pr.hu>>
> >
> >      meta/classes/kernel-module-split.bbclass | 21 ++++++++++++++++++---
> >      1 file changed, 18 insertions(+), 3 deletions
> >
> >     --
> >     _______________________________________________
> >     Openembedded-devel mailing list
> >     Openembedded-devel@lists.openembedded.org
> >     <mailto:Openembedded-devel@lists.openembedded.org>
> >     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
> >
> >
> 



