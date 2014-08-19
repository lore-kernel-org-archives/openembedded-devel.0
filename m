Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 34E5065DEB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 14:29:27 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Aug 2014 07:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,894,1400050800"; d="scan'208";a="470344228"
Received: from kmcfarla-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.95])
	by azsmga001.ch.intel.com with ESMTP; 19 Aug 2014 07:29:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 19 Aug 2014 15:29:21 +0100
Message-ID: <7617860.K5AZEFnTkc@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.10-200.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <20140819134752.GU3660@jama>
References: <1408431709-5955-1-git-send-email-b40869@freescale.com>
	<1488715.AFk0jdnqDO@peggleto-mobl5.ger.corp.intel.com>
	<20140819134752.GU3660@jama>
MIME-Version: 1.0
Cc: YangHaibo <b40869@freescale.com>, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-webserver][PATCH] move fcgi-2.4.0 recipe and patch to correct folder
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
X-List-Received-Date: Tue, 19 Aug 2014 14:29:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 19 August 2014 15:47:52 Martin Jansa wrote:
> On Tue, Aug 19, 2014 at 01:53:28PM +0100, Paul Eggleton wrote:
> > On Tuesday 19 August 2014 15:01:49 YangHaibo wrote:
> > > ---
> > > 
> > >  meta-webserver/recipes-support/{ => fcgi}/fcgi_2.4.0.bb                
> > >    |
> > 
> > FYI, I moved this recipe to recipes-support deliberately. We shouldn't
> > need to put it in a recipes-fcgi directory unless you expect to be adding
> > a number of other recipes that would fall into the same category - is
> > that the case?
> It seems that you've removed one directory level, when moving it, so it
> wasn't included in BBFILES mask
> 
> BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
> 
> So this patch is needed and queued in master-next.

Oh, whoops - sorry about that. Finger trouble obviously ;)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

