Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UXx9A-0001VK-7l
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 May 2013 19:18:20 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 May 2013 10:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,597,1363158000"; d="scan'208";a="331398333"
Received: from unknown (HELO helios.localnet) ([10.255.12.165])
	by fmsmga002.fm.intel.com with ESMTP; 02 May 2013 10:00:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 02 May 2013 18:00:23 +0100
Message-ID: <1838142.bVj6QfWozi@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CAHUNapSbKx1baQ++toBir_uw6uWhFun7yA9GwRpNYoTm=7L4BA@mail.gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<CANyK_8d-AUKrqeFexg1HMT7KypQAZjmfgEF2ChXTwsggok9Ucw@mail.gmail.com>
	<CAHUNapSbKx1baQ++toBir_uw6uWhFun7yA9GwRpNYoTm=7L4BA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] State of bitbake world
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
X-List-Received-Date: Thu, 02 May 2013 17:18:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 02 May 2013 12:30:59 Trevor Woerner wrote:
> On Thu, May 2, 2013 at 11:57 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
> > The recipe also has dependencies
> > outside meta-oe (fluidsynth in meta-multimedia IIRC) but that's a
> > separate issue.
> 
> I've noticed that too. Shouldn't dependencies be contained within the
> same layer? Is it normal from these dependencies to be spread out over
> various layers?

For meta-oe, this is unusual yes. In fact having checked recently this is the 
only case I'm aware of where a recipe in meta-oe depends on a recipe in 
another layer other than OE-Core, at least with no PACKAGECONFIG alterations. 

For this specific instance, it would be great if someone would send a patch to 
move fluidsynth to meta-multimedia.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


