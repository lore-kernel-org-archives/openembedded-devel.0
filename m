Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A52787148D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 10:26:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 Sep 2014 03:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,540,1406617200"; d="scan'208";a="592545265"
Received: from cfitzsim-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.123])
	by fmsmga001.fm.intel.com with ESMTP; 17 Sep 2014 03:26:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Rongqing Li <rongqing.li@windriver.com>
Date: Wed, 17 Sep 2014 11:26:29 +0100
Message-ID: <2290847.YcZyNWaetr@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.16.2-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <53F40A50.4030509@windriver.com>
References: <53F40A50.4030509@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Should we set the LICENSE_FLAGS = "commercial" in meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
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
X-List-Received-Date: Wed, 17 Sep 2014 10:26:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Roy,

On Wednesday 20 August 2014 10:39:12 Rongqing Li wrote:
>      I see the recipes is using the binary file,
> http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2013.01.1
> 1-regulatory.bin Should we set the LICENSE_FLAGS = "commercial" in ]
> meta-networking/recipes-connectivity/crda/crda_1.1.3.bb

It depends on what the terms of distribution are for that binary. I could be 
wrong, but it looks to me as if this is a binary version of the wireless-regdb 
database [1], which is ISC licensed. If that is the case then LICENSE_FLAGS = 
"commercial" wouldn't be needed.

Cheers,
Paul

[1] http://wireless.kernel.org/en/developers/Regulatory/wireless-regdb

-- 

Paul Eggleton
Intel Open Source Technology Centre

