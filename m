Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B13AB779D5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 01:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490059688; x=1521595688;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=lu1Z02Z6fgx5m9sOt7pb5/TwQLsbb0NyjzU/wQ5lhG0=;
	b=BFt+PFH0Reirw5orz4ZXwLIqrrXlSOmlCpZkrW2Nnol7hqKOtO/07MH4
	Np0D4ivBCtnt60wTVtmo0UpaYa0nwQ==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2017 18:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,197,1486454400"; d="scan'208";a="78758157"
Received: from tripathp-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.106])
	by fmsmga005.fm.intel.com with ESMTP; 20 Mar 2017 18:28:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Mar 2017 14:28:02 +1300
Message-ID: <2498742.AAUrN6UYvp@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <5562363.iutz0928xU@peggleto-mobl.ger.corp.intel.com>
References: <20170319002834.17953566@danielf.thecshore.com>
	<4029724.Rx6oKKANKd@peggleto-mobl.ger.corp.intel.com>
	<5562363.iutz0928xU@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Cc: Gary Thomas <gary@mlbassoc.com>
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
X-List-Received-Date: Tue, 21 Mar 2017 01:28:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 20 March 2017 11:46:06 AM NZDT Paul Eggleton wrote:
> On Monday, 20 March 2017 11:33:16 AM NZDT Paul Eggleton wrote:
> > On Monday, 20 March 2017 10:51:46 AM NZDT Max Krummenacher wrote:
> > > Am Sonntag, den 19.03.2017, 12:04 -0400 schrieb Daniel Dickinson:
> > > > On Sun, 19 Mar 2017 15:39:38 +0100
> > > > 
> > > > Gary Thomas <gary@mlbassoc.com> wrote:
> > > > > > With that change all tools which must be installed on the host
> > > > > > need
> > > > > > to be present, even if in your use case some of them might not be
> > > > > > used. Did you install the prerequisites?
> > > > > > http://www.yoctoproject.org/docs/2.2.1/ref-manual/ref-manual.html#
> > > > > > re
> > > > > > qu
> > > > > > ired-packages-for-the-ho st-dev
> > > > > > elopment-system
> > > > > 
> > > > > The real point is that it's not his host - it's the [remote]
> > > > > autobuilder tool for OpenEmbedded (IIRC)
> > > > 
> > > > Yes, thank you.  I'm not sure it's a full autobuilder or just parses
> > > > recipes for generating the web pages, but either way it's not my host,
> > > > it's an openembedded.org host.  Apparently I'm not good at explaining
> > > > that...
> > > 
> > > My bad, sorry.
> > > 
> > > And it looks like the host fails to update any of the layers, e.g. also
> > > openembedded-core:
> > > https://layers.openembedded.org/layerindex/layerupdate/323749/
> > > Adding Paul, as he maybe knows how to get those tools onto the server.
> > 
> > Ah yes - I think I may just take the cheap way out and clear HOSTTOOLS
> > when
> > parsing in the index - we're not doing any actual building, after all, so
> > we're not going to be calling any of these tools).
> 
> Well, perhaps I spoke too soon. We call gcc to check its version just when
> parsing, I suspect there may be others, so maybe the safest thing is to just
> install these tools. Things are rarely as simple as they first appear...

FYI I have merged a patch for this, just waiting for it to be applied in the 
OE infrastructure now.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

