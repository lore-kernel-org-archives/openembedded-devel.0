Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3A4BA6B1F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2013 11:15:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2013 04:12:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,777,1367996400"; d="scan'208";a="354208351"
Received: from unknown (HELO helios.localnet) ([10.252.122.217])
	by orsmga001.jf.intel.com with ESMTP; 30 Jul 2013 04:15:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Jul 2013 12:15:19 +0100
Message-ID: <4071302.P2cxlv2fxA@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20130726174345.GE3280@jama>
References: <1374848729-19835-1-git-send-email-mihai.prica@intel.com>
	<20130726174345.GE3280@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] lvm2: Add dependency on bash
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
X-List-Received-Date: Tue, 30 Jul 2013 11:15:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 26 July 2013 19:43:45 Martin Jansa wrote:
> On Fri, Jul 26, 2013 at 05:25:29PM +0300, Mihai Prica wrote:
> > Fixes rootfs generation error if bash is not included in the image.
> 
> With rpm right?

If it's what you're suggesting technically it's broken with any package 
backend, to some degree.
 
> Find which script it has in shebang and add bash only to that package
> RDEPENDS, if it's something which isn't always needed put it in separate
> package.

Or if practical patch the script(s) to remove the bashisms and change the 
shebang to #!/bin/sh instead.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

