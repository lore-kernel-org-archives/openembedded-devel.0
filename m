Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2994472453
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 13:31:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Jan 2015 05:31:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,700,1413270000"; d="scan'208";a="664562140"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by orsmga002.jf.intel.com with ESMTP; 05 Jan 2015 05:31:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 05 Jan 2015 13:31:15 +0000
Message-ID: <2344737.AuP89X4c5h@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <20150105123552.GK2484@jama>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
	<a0ff960271975254d1c2760e4af4d83996a6b388.1420455602.git.paul.eggleton@linux.intel.com>
	<20150105123552.GK2484@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 03/10] ddrescue: update to 1.19
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
X-List-Received-Date: Mon, 05 Jan 2015 13:31:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 05 January 2015 13:35:52 Martin Jansa wrote:
> On Mon, Jan 05, 2015 at 11:00:47AM +0000, Paul Eggleton wrote:
> > * License changed to GPLv2+
> > * Upstream now only releases .lz files for new releases
> 
> Is .lz working correctly now with current bitbake+oe-core (it didn't
> last time I've re-tried)? Shouldn't we wait for base.bbclass change to
> be merged as you mention above do_unpack?

Well, it worked for me, but you do need the lzip recipe which we do have in 
meta-oe. We don't necessarily have to wait since even when base.bbclass has 
been updated the line I added won't cause any issues.

> Duplicates http://patchwork.openembedded.org/patch/82165/
> can you send incremental patch on top of this if needed?

Ah, I missed that. As it happens, the only difference is the aforementioned 
depends line.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

