Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B515277026
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Apr 2016 20:46:31 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 04 Apr 2016 13:46:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,442,1455004800"; d="scan'208";a="78928450"
Received: from adaud-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.168.25])
	by fmsmga004.fm.intel.com with ESMTP; 04 Apr 2016 13:46:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Eduardo Silva <eduardo@monkey.io>
Date: Tue, 05 Apr 2016 08:46:27 +1200
Message-ID: <1898077.8Qsu7883hT@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.6-300.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <20160402181714.GG2567@jama>
References: <1459406572-8144-1-git-send-email-eduardo@monkey.io>
	<CAEaCVQjW0cmMDNyc3LhZQxv+RWfVmx9Bj-qgQx9AH1_+0=sTDA@mail.gmail.com>
	<20160402181714.GG2567@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] fluentbit: add new recipe
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
X-List-Received-Date: Mon, 04 Apr 2016 20:46:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sat, 02 Apr 2016 20:17:14 Martin Jansa wrote:
> On Fri, Apr 01, 2016 at 11:20:49AM -0600, Eduardo Silva wrote:
> > on this case should be "RDEPENDS_${PN} = "zlib" OK ?
> 
> NO

It's build-time so you want zlib in DEPENDS. A runtime dependency will get 
added automatically (since binaries packaged by the recipe will be linking 
against libz.so).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

