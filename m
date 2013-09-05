Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8E9736160A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 12:15:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Sep 2013 05:15:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,847,1371106800"; d="scan'208";a="398666519"
Received: from unknown (HELO helios.localnet) ([10.252.123.106])
	by orsmga002.jf.intel.com with ESMTP; 05 Sep 2013 05:15:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Emil R. Petersen" <erp@movis.dk>
Date: Thu, 05 Sep 2013 13:15:28 +0100
Message-ID: <1500957.tfn1Jz7R43@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-29-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <52287347.7050808@movis.dk>
References: <1378382068-24795-1-git-send-email-javier.viguera@digi.com>
	<52287347.7050808@movis.dk>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver] cherokee: fix SRC_URI
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
X-List-Received-Date: Thu, 05 Sep 2013 12:15:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Emil,

On Thursday 05 September 2013 14:04:23 Emil R. Petersen wrote:
> I can see that this is hosted on a University website, but is there a
> policy for using non-official mirrors?
> 
> This seems like it opens up a lot of potential security problems IMO.
> Not only could the third-party mirror be easy to compromise, but how
> would be assure we don't use a malicious mirror? Or that a malicious
> contributer doesn't add a deliberatively tainted mirror?

The SRC_URI checksums protect against this being a problem. If the tarball was 
tampered with it could not pass both the md5sum and sha256sum.

> In short, is there some sort of policy on when and how we use
> third-party mirrors? Is security considerations part of the policy?

We use them if we're forced to; however we also have the option of uploading 
files to the openembedded.org mirrors if needed e.g. in the case where upstream 
completely goes away and there are no other stable mirrors.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

