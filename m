Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SUKh0-0007gy-Vf
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 18:33:47 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 May 2012 09:23:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="140924786"
Received: from unknown (HELO helios.localnet) ([10.252.120.119])
	by orsmga001.jf.intel.com with ESMTP; 15 May 2012 09:23:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Thilo Fromm <fromm@dresearch-fe.de>
Date: Tue, 15 May 2012 17:23:43 +0100
Message-ID: <3578934.ouGGrvIU0p@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-19-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <CADZ6=asJ+xLvpodv=u9duDuWs=dp8mLamv=Sj6yJc6B5sjWMrw@mail.gmail.com>
References: <CADZ6=asJ+xLvpodv=u9duDuWs=dp8mLamv=Sj6yJc6B5sjWMrw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Where do I override DISTRO_FEATURES?
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
X-List-Received-Date: Tue, 15 May 2012 16:33:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 15 May 2012 18:12:35 Thilo Fromm wrote:
> I'm trying to remove an element from DISTRO_FEATURES (specifically
> "ld-is-gold"), but I am unable to find the right spot to do it. The
> distribution we're using (Angstrom, as it happens) sets this in
> conf/distro/angstrom-v2012.x.conf. My machine configuration is the
> wrong spot to modify DISTRO_FEATURES, since it will be processed
> first. local.conf is not working, too.
> 
> So could anybody please tell me where I need to put my
> 
> DISTRO_FEATURES = "${@'${DISTRO_FEATURES}}'.replace('ld-is-gold',  '')}"
> 
> so it applies for the build?

Unfortunately such hacks only work for variables that are not set within the 
distro configuration, which is applied after local.conf.

Ultimately you shouldn't really do this. If you want to change distro policy 
then you really ought to have your own distro configuration, or try to work 
with the existing distro to fix whatever problem exists.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


