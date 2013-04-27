Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UW0hr-0006lY-2v
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Apr 2013 10:42:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2013 01:24:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,562,1363158000"; d="scan'208";a="328529440"
Received: from unknown (HELO helios.localnet) ([10.255.12.79])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2013 01:24:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 27 Apr 2013 09:24:17 +0100
Message-ID: <68356141.McDxtR3Bre@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <klesac$abk$1@ger.gmane.org>
References: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
	<klesac$abk$1@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] smartmontools: import from OE classic
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
X-List-Received-Date: Sat, 27 Apr 2013 08:42:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 26 April 2013 23:41:38 Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Op 26-04-13 22:39, Nicolas Dechesne schreef:
> > Import smartmontools recipe from OE classic, and updated to upstream
> > v5.40.
> > 
> > Also added cosmetic changes in the recipe: INC_PR support and homepage.
> > 
> > Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org> ---
> > meta-oe/recipes-support/smartmontools/smartmontools.inc     | 10
> > ++++++++++ meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb |
> > 5 +++++ 2 files changed, 15 insertions(+) create mode 100644
> > meta-oe/recipes-support/smartmontools/smartmontools.inc create mode
> > 100644 meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb
> > 
> > diff --git a/meta-oe/recipes-support/smartmontools/smartmontools.inc
> > b/meta-oe/recipes-support/smartmontools/smartmontools.inc new file mode
> > 100644 index 0000000..6f23055 --- /dev/null +++
> > b/meta-oe/recipes-support/smartmontools/smartmontools.inc @@ -0,0 +1,10
> > @@ +SECTION = "console/utils" +DESCRIPTION = "Control and monitor storage
> > systems using S.M.A.R.T." +HOMEPAGE =
> > "http://smartmontools.sourceforge.net/" +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM =
> > "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f" +INC_PR = "r1"
> 
> Drop that

It would help for the sake of the uninitiated if you specified what to drop, 
since your mail client has wrapped the quoted text incorrectly.

> > + +SRC_URI =
> > "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz" +
> > +inherit autotools diff --git
> > a/meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb
> > b/meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb new file
> > mode 100644 index 0000000..93dc4db --- /dev/null +++
> > b/meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb @@ -0,0
> > +1,5 @@ +require smartmontools.inc +PR = "${INC_PR}.1"
> 
> And drop that.
> 
> And do you really need a .inc?

Are we removing inc files if they were present in OE Classic? First I've heard 
if we are...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


