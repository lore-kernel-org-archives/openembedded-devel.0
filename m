Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RTYk8-00019b-Ey
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 13:49:32 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Nov 2011 04:42:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="79534274"
Received: from unknown (HELO helios.localnet) ([10.252.121.190])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2011 04:42:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Nov 2011 12:42:56 +0000
Message-ID: <11302548.rhDq0zLurQ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <CAAQYJAvgLfieUK43nQOKL+H6omoXjuASrwPP4GZFc66bL+WMrg@mail.gmail.com>
References: <cover.1322129758.git.Martin.Jansa@gmail.com>
	<CAAQYJAv=z6msRfaR3bj7PfWrm=tuv8opBPjfD9nkpSrwAUgRbQ@mail.gmail.com>
	<CAAQYJAvgLfieUK43nQOKL+H6omoXjuASrwPP4GZFc66bL+WMrg@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld 4/6] linux-kexecboot: don't disable DEBUG, PRINTK, BUG with CMDLINE_DEBUG not just loglevel=3
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
X-List-Received-Date: Thu, 24 Nov 2011 12:49:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 24 November 2011 13:38:53 Andrea Adami wrote:
> On Thu, Nov 24, 2011 at 12:01 PM, Andrea Adami <andrea.adami@gmail.com>
> wrote:
> > The weak point is EXTRA_IMAGE_FEATURES = "debug-tweaks" , default in
> > local.conf.
> Hm.. and what about using  "tools-debug" instead?

I realise we've already done it here and elsewhere (e.g. dropbear) but I'm not 
hugely keen on configuration of individual recipes being dependent on 
IMAGE_FEATURES - it's not supposed to be allowed AFAIK.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


