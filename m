Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TP9Sf-0001S8-KE
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Oct 2012 12:05:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2012 02:52:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,612,1344236400"; d="scan'208";a="208043731"
Received: from unknown (HELO helios.localnet) ([10.252.122.112])
	by orsmga001.jf.intel.com with ESMTP; 19 Oct 2012 02:52:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 19 Oct 2012 10:52:25 +0100
Message-ID: <3702962.llSKJscLnq@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <k5r74s$r0$1@ger.gmane.org>
References: <1350565318-13026-1-git-send-email-ferlandm@sonatest.com>
	<1350565318-13026-2-git-send-email-ferlandm@sonatest.com>
	<k5r74s$r0$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] lmsensors: Initial commit.
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
X-List-Received-Date: Fri, 19 Oct 2012 10:05:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 19 October 2012 11:39:50 Koen Kooi wrote:
> > +DEPENDS = "sysfsutils virtual/libiconv bison-native flex-native
> > rrdtool" 
> > +PROVIDES = "\ +${PN}-libsensors \ +${PN}-sensors \
> > +${PN}-sensord \ +${PN}-fancontrol \ +${PN}-sensorsdetect \
> > +${PN}-sensorsconfconvert \ +${PN}-pwmconfig \ +${PN}-isatools \
> 
> Anything listed in PACKAGES is already in (R)PROVIDES, so drop the above

Items in PACKAGES do get into RPROVIDES but not PROVIDES. I can't see these as 
being especially useful in PROVIDES (as build time targets) though, so I agree 
they should go unless there's a compelling reason to have them.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


