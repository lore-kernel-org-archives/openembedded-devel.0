Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7EAE36B8D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 08:55:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 31 Mar 2014 01:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,763,1389772800"; d="scan'208";a="503386066"
Received: from williams-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.67])
	by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2014 01:54:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Tim Orling <ticotimo@gmail.com>
Date: Mon, 31 Mar 2014 09:54:55 +0100
Message-ID: <1791318.0sP5eWebrA@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.6-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <CANx9H-CJwYaWGe7y1kt7zLzgFTOumB=dy7BZMEf-5U=5L4=d1g@mail.gmail.com>
References: <1391410275-31251-1-git-send-email-ticotimo@gmail.com>
	<1391410275-31251-2-git-send-email-ticotimo@gmail.com>
	<CANx9H-CJwYaWGe7y1kt7zLzgFTOumB=dy7BZMEf-5U=5L4=d1g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl][PATCH v2 01/10] libmodule-metadata-perl: add 1.000019
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
X-List-Received-Date: Mon, 31 Mar 2014 08:55:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Tim,

On Sunday 30 March 2014 20:30:28 Tim Orling wrote:
> Yes. It updates the version built into perl. I will submit a patch with
> insane skip.

INSANE_SKIP isn't the right fix for this - if this recipe is staging duplicate 
files, it should be prevented from doing that by simply deleting the files 
within a do_install_append.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

