Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 136596060F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Mar 2017 22:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489963571; x=1521499571;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=JfdLLnE9fbIxT2Ly0d8Gchv7lQDN3GQFC/4Las4GsWY=;
	b=MzjUyFDBjqoG49mpaJhOwvD6cSWO3ksvDzUniCuMaGNKDfHcHDq9aS+K
	fTrnKw8zfSyEMF54BrCznIRP9lydRA==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2017 15:46:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,191,1486454400"; d="scan'208";a="78210212"
Received: from cloy-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.161.201])
	by fmsmga005.fm.intel.com with ESMTP; 19 Mar 2017 15:46:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Date: Mon, 20 Mar 2017 11:46:06 +1300
Message-ID: <5562363.iutz0928xU@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <4029724.Rx6oKKANKd@peggleto-mobl.ger.corp.intel.com>
References: <20170319002834.17953566@danielf.thecshore.com>
	<1489960306.2834.31.camel@gmail.com>
	<4029724.Rx6oKKANKd@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Cc: Gary Thomas <gary@mlbassoc.com>, openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded Layer Index autobuild errors
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
X-List-Received-Date: Sun, 19 Mar 2017 22:46:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 20 March 2017 11:33:16 AM NZDT Paul Eggleton wrote:
> On Monday, 20 March 2017 10:51:46 AM NZDT Max Krummenacher wrote:
> > Am Sonntag, den 19.03.2017, 12:04 -0400 schrieb Daniel Dickinson:
> > > On Sun, 19 Mar 2017 15:39:38 +0100
> > > 
> > > Gary Thomas <gary@mlbassoc.com> wrote:
> > > > > With that change all tools which must be installed on the host need
> > > > > to be present, even if in your use case some of them might not be
> > > > > used. Did you install the prerequisites?
> > > > > http://www.yoctoproject.org/docs/2.2.1/ref-manual/ref-manual.html#re
> > > > > qu
> > > > > ired-packages-for-the-ho st-dev
> > > > > elopment-system
> > > > 
> > > > The real point is that it's not his host - it's the [remote]
> > > > autobuilder tool for OpenEmbedded (IIRC)
> > > 
> > > Yes, thank you.  I'm not sure it's a full autobuilder or just parses
> > > recipes for generating the web pages, but either way it's not my host,
> > > it's an openembedded.org host.  Apparently I'm not good at explaining
> > > that...
> > 
> > My bad, sorry.
> > 
> > And it looks like the host fails to update any of the layers, e.g. also
> > openembedded-core:
> > https://layers.openembedded.org/layerindex/layerupdate/323749/
> > Adding Paul, as he maybe knows how to get those tools onto the server.
> 
> Ah yes - I think I may just take the cheap way out and clear HOSTTOOLS when
> parsing in the index - we're not doing any actual building, after all, so
> we're not going to be calling any of these tools).

Well, perhaps I spoke too soon. We call gcc to check its version just when 
parsing, I suspect there may be others, so maybe the safest thing is to just 
install these tools. Things are rarely as simple as they first appear...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

