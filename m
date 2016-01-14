Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 37645731E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:37:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 14 Jan 2016 04:37:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="860404000"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by orsmga001.jf.intel.com with ESMTP; 14 Jan 2016 04:37:38 -0800
Date: Thu, 14 Jan 2016 14:40:01 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Jens Rehsack <rehsack@gmail.com>
Message-ID: <20160114124000.GA2747@mbabyjoh-mobl.fi.intel.com>
References: <315045FB-F742-4125-826E-210A07B68780@gmail.com>
MIME-Version: 1.0
In-Reply-To: <315045FB-F742-4125-826E-210A07B68780@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: meta-java Workflow
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
X-List-Received-Date: Thu, 14 Jan 2016 12:37:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

On Wed, Jan 13, 2016 at 07:03:51PM +0100, Jens Rehsack wrote:
> Hi,
> 
> to avoid such a problem as it occurred with ec7b984f, 04d5d0bf and dfb21b44, I strongly suggest that meta-java follows the merge-workflow from other meta-layers:
> 
> cherry-pick new stuff into master-next, when settled - merge to master

Agree with this suggestion. Current state of meta-java isn't that great 
mostly because of the absence of a Continuous Integration process. 

I have briefly tried to incorporate automated testing for meta-java layer
in github using travic CI. However, it is not yet completed due to space 
limitation and timeout problems in Travis CI. Hoping to fix that soon.

https://github.com/maxinbjohn/meta-java/blob/master/.travis.yml

> Branch releases as other layers do and same, push back-ported patches into ${rel_branch}-next and merge the behaving ones into ${rel_branch}.
> 
> The current way - pushing to master and live only there result in the happened revert - and to continue my work I would have to revert the reverts without any nice word in the commit message as I did in reverting 24b98ac3 with a88718b6.
> 
> Cheers
> Jens Rehsack - rehsack@gmail.com

Best Regards,
Maxin



