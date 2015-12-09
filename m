Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7736D6E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2015 09:22:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 09 Dec 2015 01:22:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,402,1444719600"; d="scan'208";a="867830459"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 09 Dec 2015 01:22:27 -0800
Date: Wed, 9 Dec 2015 11:23:34 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151209092334.GA26033@mbabyjoh-mobl.fi.intel.com>
References: <25114564-8777-4A06-85B9-80284717DAFD@gmail.com>
MIME-Version: 1.0
In-Reply-To: <25114564-8777-4A06-85B9-80284717DAFD@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH v7 2/2] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Wed, 09 Dec 2015 09:22:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

On Tue, Dec 08, 2015 at 02:52:51PM +0100, Jens Rehsack wrote:
> 
> This adds openjdk-8 for native and target builds and allows a stripped
> openjre-8 being built as well instead of trying to cherry-pick jre
> components from jdk-image.
> 
> The recipes allow building openjdk-8 with or without:
> * x11
> * cups
> * alsa/pulseaudio
> and let packager enable unlimited-crypto, if desired.
> 
> To support certificate based java libraries, cacerts is created based on
> ca-certificates from OE-core.
> 
> Since there can be only one PROVIDES for virtual/java-native and virtual/javac-native,
> move the provides to openjdk-8-native (I think everyone agrees it's a better
> choice than ecj-bootstrap-native).
> 
> Plus: Applying a fix from openjdk-9 repository which fixes build issues using gcc5
> 
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
<snip>

I have pushed these two patches to the master branch. Thanks a lot for this work.

Best Regards,
Maxin

