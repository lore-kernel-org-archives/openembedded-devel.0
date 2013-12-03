Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5242B6DEEC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Dec 2013 10:19:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Dec 2013 02:19:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,817,1378882800"; d="scan'208";a="418498871"
Received: from timevans-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.200])
	by orsmga001.jf.intel.com with ESMTP; 03 Dec 2013 02:19:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Qi.Chen@windriver.com
Date: Tue, 03 Dec 2013 10:19:50 +0000
Message-ID: <6163089.YiV9QuLgku@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1385087849-30272-1-git-send-email-Qi.Chen@windriver.com>
References: <1385087849-30272-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH] webmin: fix failures in do_install task
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
X-List-Received-Date: Tue, 03 Dec 2013 10:19:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Qi,

On Friday 22 November 2013 10:37:29 Qi.Chen@windriver.com wrote:
> -    export perl=perl
> +    export perl=${OECMAKE_PERLNATIVE_DIR}/perl

I'm afraid I don't like the look of this - OECMAKE_PERLNATIVE_DIR is set for 
use by cmake, and perlnative.bbclass should be putting our perl binary into 
PATH so it should be run anyway. Is this change actually necessary?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

