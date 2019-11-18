Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF6C60291
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 03:13:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Nov 2019 19:13:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,318,1569308400"; d="scan'208";a="289127543"
Received: from klee9-mobl.ccr.corp.intel.com (HELO shodan.localnet)
	([10.255.168.134])
	by orsmga001.jf.intel.com with ESMTP; 17 Nov 2019 19:13:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org,
	Jeroen Hofstee <jhofstee@victronenergy.com>
Date: Mon, 18 Nov 2019 16:12:56 +1300
Message-ID: <314811743.THUKncEJB5@shodan>
Organization: Intel Corporation
In-Reply-To: <20191117214427.20073-1-jhofstee@victronenergy.com>
References: <20191117214427.20073-1-jhofstee@victronenergy.com>
MIME-Version: 1.0
Cc: Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-qt4][PATCH 0/2] fix qt4 for zeus
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
X-List-Received-Date: Mon, 18 Nov 2019 03:13:26 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Jeroen

On Monday, 18 November 2019 10:44:37 AM NZDT Jeroen Hofstee wrote:
> Gcc 9.2 miscompiles the foreach resulting in broken applications.
> This backports a fix from qt5 to make it work again. The fix is
> not written for this issue, but it does solve it.
> 
> As a prepartion it includes some whitespace fixes, so the patches
> are aligned in the SRC_URI.
> 
> Jeroen Hofstee (2):
>   qt4: fix whitespace so it aligns
>   qt4: updates for gcc 9.2

I've merged both of these. I've also created zeus and warrior branches. (For 
now I have assumed these two should not be on warrior - let me know if that's 
not correct.)

Cheers
Paul

-- 

Paul Eggleton
Intel System Software Products



