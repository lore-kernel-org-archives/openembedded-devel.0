Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E22AA65CA8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 10:30:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Jul 2014 03:30:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,763,1400050800"; d="scan'208";a="551200692"
Received: from cfitzsim-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.251])
	by orsmga001.jf.intel.com with ESMTP; 30 Jul 2014 03:30:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>, Tim Orling <ticotimo@gmail.com>
Date: Wed, 30 Jul 2014 11:30:15 +0100
Message-ID: <3193777.KGUVVojpmr@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.6-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <20140730081205.GI16445@jama>
References: <1406053708-24207-1-git-send-email-TicoTimo@gmail.com>
	<CANx9H-AuCdp4dnFKmA7Ygq0J=2nNR_E2c-LN-1_1OaZF2LLSPg@mail.gmail.com>
	<20140730081205.GI16445@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] meta-python: fix conf/layer.conf, follow typical structure
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
X-List-Received-Date: Wed, 30 Jul 2014 10:30:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 30 July 2014 10:12:05 Martin Jansa wrote:
> On Sat, Jul 26, 2014 at 10:34:35AM -0700, Tim Orling wrote:
> > Ping.
> > I haven't seen any comment on this patch at all.
> 
> I don't have strong opinion on this, but I don't like much the structure
> with 1 recipe per directory, so I prefer single python directory with
> all python modules together.
> 
> Also using the original structure from meta-oe has the advantage that
> additional layers which were using include or require of some file from
> python directory don't need any adaptation after meta-python was
> separated (I've noticed it in one of our layers and that's why I've
> submitted recipes-python -> recipes-devtools change).

Good point - I hadn't thought of this. FWIW I'm happy to have the meta-oe 
directory structure retained in meta-python if it makes this easier.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

