Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QzqrC-0007If-VQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Sep 2011 16:06:03 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Sep 2011 07:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,324,1312182000"; d="scan'208";a="13760610"
Received: from unknown (HELO helios.localnet) ([10.255.18.187])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Sep 2011 07:01:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mikhail Boiko <mikhailboiko85@gmail.com>
Date: Sat, 3 Sep 2011 15:01:02 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <CAOWBBJx3La704qDcSQ-2jEgv1eOnPJ4VMUoCLzwRNtgaBSh+kg@mail.gmail.com>
In-Reply-To: <CAOWBBJx3La704qDcSQ-2jEgv1eOnPJ4VMUoCLzwRNtgaBSh+kg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201109031501.02421.paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Using external cross-compiler
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
X-List-Received-Date: Sat, 03 Sep 2011 14:06:03 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 03 September 2011 14:26:14 Mikhail Boiko wrote:
> Hi,
> 
> I've got some issues with configuring OE to use external cross compiler
> (CodeSourcery 2011.03).
> II've added this lines to my local.conf file:
> TARGET_VENDOR = "-none"
> TOOLCHAIN_TYPE = "external"
> TOOLCHAIN_BRAND = "csl"
> TOOLCHAIN_PATH = "/home/mike/x-tools/cs_2011_03"
> TOOLCHAIN_SYSPATH = "${TOOLCHAIN_PATH}/arm-none-linux-gnueabi"
> PATH_prepend = "${TOOLCHAIN_PATH}/bin:"
>..
> As you see, it try to use arm-angstrom-linux-gnueabi when I have
> only arm-none-linux-gnueab avaliable.
> Please, give some advices to solve this sissue.

So the distro's TARGET_VENDOR is not being overridden; according to [1] you 
need to set TOOLCHAIN_VENDOR rather than TARGET_VENDOR so that this happens.

Cheers,
Paul

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-
February/030371.html


-- 

Paul Eggleton
Intel Open Source Technology Centre


