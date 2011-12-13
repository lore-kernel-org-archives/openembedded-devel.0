Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rac5b-0007aM-2H
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 00:48:51 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Dec 2011 15:41:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86956033"
Received: from unknown (HELO helios.localnet) ([10.252.122.62])
	by orsmga002.jf.intel.com with ESMTP; 13 Dec 2011 15:41:41 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Tue, 13 Dec 2011 23:41:40 +0000
Message-ID: <2795170.GPyksbkBvZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <CALT56yNowfmEegV6OFQEdnk47YaaFOd9S_g0vdt3YKQf91DYHg@mail.gmail.com>
References: <1323811550-876-1-git-send-email-dbaryshkov@gmail.com>
	<1545212.W5z1uACr0M@helios>
	<CALT56yNowfmEegV6OFQEdnk47YaaFOd9S_g0vdt3YKQf91DYHg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie][PATCH] opie-bluetoothd: fix compilation issues
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
X-List-Received-Date: Tue, 13 Dec 2011 23:48:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 14 December 2011 03:32:08 Dmitry Eremin-Solenikov wrote:
> <paul.eggleton@linux.intel.com> wrote:
> > On Wednesday 14 December 2011 01:25:50 Dmitry Eremin-Solenikov wrote:
> >> rfkill.cpp uses symbols from libsysfs. However opie-bluetoothd recipe
> >> lacks dependency on sysfsutils (package containing libsysfs) and
> >> project
> >> file also lacks -lsysfs in the LIBS rule. Fix those issues.
> > 
> > Rather than apply this patch I've merged the change upstream and updated
> > the OPIE_SRCREV in meta-opie to
> > f5c8bd6272b5bee393736f401232ce0ccc984fec (which includes a few other
> > fixes as well.) Thanks!
> 
> Thanks! I just didn't want to touch SRCREV, so I provided oe patch instead
> :)

I guess I prefer updating SRCREV to carrying around a bunch of patches given 
that I'm the upstream in this case ;) I realise it forces a rebuild of 
everything, but I'd imagine people building from git are prepared to put up 
with a little pain for the benefit of getting the absolute latest code.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


