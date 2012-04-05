Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SFiaA-0002qs-3U
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2012 11:02:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Apr 2012 01:53:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125564302"
Received: from unknown (HELO helios.localnet) ([10.252.120.33])
	by orsmga001.jf.intel.com with ESMTP; 05 Apr 2012 01:53:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Thu, 05 Apr 2012 09:52:59 +0100
Message-ID: <4237778.fYL2t0UXRO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <CAGiJk9fvBvuR8ftcLpYXcucJPX8zaJ=6UOnbDxkq409KZcGOFw@mail.gmail.com>
References: <20120402210435.GA10553@hermes>
	<CAE4k239hqHFZQKy=hrds4EtRSoLh32Af4gSD-wQdNHN-+Vvieg@mail.gmail.com>
	<CAGiJk9fvBvuR8ftcLpYXcucJPX8zaJ=6UOnbDxkq409KZcGOFw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Package build failure
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
X-List-Received-Date: Thu, 05 Apr 2012 09:02:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 05 April 2012 10:47:05 Samuel Stirtzel wrote:
> So if the recipe states:
> -
> SRC_URI = "git://anongit.kde.org/calligra.git;protocol=git;branch=master"
> SRCREV = "92ff51b5c0f388729f466041b34ab165a7d80987"
> PV = "2.3.87+git${SRCPV}"
> -
> 
> Will it still look up the remote SRCPV instead of using the SRCREV?
> Is there a "best practice" or something like that?

No, if the SRCREV is a full commit hash as above then it will not look it up 
remotely.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


