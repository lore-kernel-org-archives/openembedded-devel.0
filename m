Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UDXmS-0003e5-0J
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 11:10:32 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Mar 2013 01:53:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,800,1355126400"; d="scan'208";a="296645464"
Received: from unknown (HELO helios.localnet) ([10.255.12.181])
	by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2013 01:53:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 07 Mar 2013 09:53:57 +0000
Message-ID: <2959506.8RtJirsyX5@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-24-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <1362649734-1730-1-git-send-email-koen@dominion.thruhere.net>
References: <1362649734-1730-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie][PATCH] various: fix pkg_postinst/rm to be package specfic
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
X-List-Received-Date: Thu, 07 Mar 2013 10:10:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 07 March 2013 10:48:54 Koen Kooi wrote:
> ...
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes-opie/nonworking/opie-dasher/opie-dasher.inc                | 4 ++--
> recipes-opie/opie-autorotateapplet/opie-autorotateapplet.inc       | 4 ++--
> recipes-opie/opie-batteryapplet/opie-batteryapplet.inc             | 4 ++--
> recipes-opie/opie-brightnessapplet/opie-brightnessapplet.inc       | 4 ++--
> recipes-opie/opie-cardapplet/opie-cardapplet.inc                   | 4 ++--
> recipes-opie/opie-clipboardapplet/opie-clipboardapplet.inc         | 4 ++--
> recipes-opie/opie-clockapplet/opie-clockapplet.inc                 | 4 ++--
> recipes-opie/opie-dvorak/opie-dvorak.inc                           | 4 ++--
> recipes-opie/opie-handwriting/opie-handwriting.inc                 | 4 ++--
> recipes-opie/opie-irdaapplet/opie-irdaapplet.inc                   | 4 ++--
> recipes-opie/opie-jumpx/opie-jumpx.inc                             | 4 ++--
> recipes-opie/opie-keyboard/opie-keyboard.inc                       | 4 ++--
> recipes-opie/opie-keyview/opie-keyview.inc                         | 4 ++--
> recipes-opie/opie-kjumpx/opie-kjumpx.inc                           | 4 ++--
> recipes-opie/opie-kpacman/opie-kpacman.inc                         | 2 +-
> recipes-opie/opie-lockapplet/opie-lockapplet.inc                   | 4 ++--
> recipes-opie/opie-memoryapplet/opie-memoryapplet.inc               | 4 ++--
> recipes-opie/opie-multikey/opie-multikey.inc                       | 4 ++--
> recipes-opie/opie-multikeyapplet/opie-multikeyapplet.inc           | 4 ++--
> recipes-opie/opie-networkapplet/opie-networkapplet.inc             | 4 ++--
> recipes-opie/opie-notesapplet/opie-notesapplet.inc                 | 4 ++--
> recipes-opie/opie-pickboard/opie-pickboard.inc                     | 4 ++--
> recipes-opie/opie-pyquicklaunchapplet/opie-pyquicklaunchapplet.inc | 4 ++--
> recipes-opie/opie-screenshotapplet/opie-screenshotapplet.inc       | 4 ++--
> recipes-opie/opie-ttf-support/opie-ttf-support_1.1.bb              | 2 +-
> recipes-opie/opie-unikeyboard/opie-unikeyboard.inc                 | 4 ++--
> recipes-opie/opie-vmemo/opie-vmemo.inc                             | 4 ++--
> recipes-opie/opie-volumeapplet/opie-volumeapplet.inc               | 4 ++--
> recipes-opie/opie-wirelessapplet/opie-wirelessapplet.inc           | 4 ++--
> recipes-qtopia/portabase/portabase_1.9.bb                          | 2 +-
> recipes-qtopia/qpe-games/crossword_0.0.3.bb                        | 2 +-
> recipes-qtopia/qpealarmclock/qpealarmclockapplet_1.0.9.bb          | 4 ++--
> recipes-qtopia/shopper/shopper_1.2.1.bb                            | 2 +-
> recipes-qtopia/subapplet/subapplet_1.0.8.bb                        | 4 ++--
> recipes-qtopia/tasklistapplet/tasklistapplet_1.0.5.bb              | 4 ++--
> 35 files changed, 65 insertions(+), 65 deletions(-)

Applied, thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


