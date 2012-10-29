Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TSm5H-0007nD-Pb
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Oct 2012 10:56:39 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Oct 2012 02:43:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,670,1344236400"; d="scan'208";a="161821020"
Received: from unknown (HELO helios.localnet) ([10.252.122.120])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Oct 2012 02:43:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: RaNgErS <rangers.av@gmail.com>
Date: Mon, 29 Oct 2012 09:43:02 +0000
Message-ID: <1514371.ACA88Gs2zU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <CAMQ5J2aXaBZg3k3Guj=B+KgdKnf_Px3OmKu8C5oKmyiwdG7AFw@mail.gmail.com>
References: <CAMQ5J2a8zLVVDPNw6vHhgsQ1pRhz_QdqaJJz7U_aQv2MwEg5zQ@mail.gmail.com>
	<CAMQ5J2aXaBZg3k3Guj=B+KgdKnf_Px3OmKu8C5oKmyiwdG7AFw@mail.gmail.com>
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
X-List-Received-Date: Mon, 29 Oct 2012 09:56:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 29 October 2012 13:21:50 RaNgErS wrote:
> I am very new to this stuff, and I tried to build an image i got some
> errors which are not solved even i tried for a whole week. It is from the
> kernal side or sth. i am attaching the log file obtained .

The module packages specified don't exist, which means either the functionality 
they would have included is compiled into the kernel (option value = "y") or 
they weren't enabled at all (option value="n"). So you should check your 
kernel configuration.

If they are enabled but you do genuinely want these to be compiled into the 
kernel rather than as modules, the task-picop-demo recipe needs to be changed 
to use RRECOMMENDS rather than RDEPENDS to bring in the kernel modules only if 
they exist; that will fix the error.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


