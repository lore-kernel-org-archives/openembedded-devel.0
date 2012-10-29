Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TSoBp-00052B-Ux
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Oct 2012 13:11:34 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Oct 2012 04:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,671,1344236400"; d="scan'208";a="212435086"
Received: from unknown (HELO helios.localnet) ([10.252.122.120])
	by orsmga001.jf.intel.com with ESMTP; 29 Oct 2012 04:57:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: RaNgErS <rangers.av@gmail.com>
Date: Mon, 29 Oct 2012 11:57:56 +0000
Message-ID: <8894147.TkBjTbKHcp@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <CAMQ5J2bC+3514kz1sNsqL_zb10P5rdnsCy_Xd2Z9-Gm1-WdTSg@mail.gmail.com>
References: <CAMQ5J2a8zLVVDPNw6vHhgsQ1pRhz_QdqaJJz7U_aQv2MwEg5zQ@mail.gmail.com>
	<1514371.ACA88Gs2zU@helios>
	<CAMQ5J2bC+3514kz1sNsqL_zb10P5rdnsCy_Xd2Z9-Gm1-WdTSg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Kernal build errors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Oct 2012 12:11:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 29 October 2012 16:49:59 RaNgErS wrote:
> could you please explain how should i check the kernel configuration?

There will probably be a defconfig for your kernel somewhere, in a directory 
next to the kernel recipe.

> and changing RRECOMMENDS to RDEPENDS

Have a look at the recipe (I guess recipes/tasks/task-picop-demo.bb), you will 
see some lines that use RDEPENDS to bring in the kernel modules.

Cheers,
Paul

PS: please CC the mailing list on reply, thanks.

-- 

Paul Eggleton
Intel Open Source Technology Centre


