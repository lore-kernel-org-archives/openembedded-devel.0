Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TLWHo-0002Vz-RH
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 11:39:37 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Oct 2012 02:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,560,1344236400"; d="scan'208";a="202252190"
Received: from unknown (HELO helios.localnet) ([10.252.122.38])
	by azsmga001.ch.intel.com with ESMTP; 09 Oct 2012 02:26:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 09 Oct 2012 10:26:26 +0100
Message-ID: <1349777441.KzOilE1YnY@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-31-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <k50p40$558$2@ger.gmane.org>
References: <1349606858-7635-1-git-send-email-paul.eggleton@linux.intel.com>
	<k50p40$558$2@ger.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] lcdproc: add recipe from OE-Classic and update/clean up
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
X-List-Received-Date: Tue, 09 Oct 2012 09:39:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 October 2012 11:00:55 Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Op 07-10-12 12:47, Paul Eggleton schreef:
> > * Update to latest upstream version 0.5.5 * Add an Ubuntu patch to fix
> > incompatibility with current automake * Use automatic package splitting
> > for drivers * Allow specifying drivers to build via LCD_DRIVERS * Allow
> > specifying default enabled driver via LCD_DEFAULT_DRIVER * Disable g15
> > driver by default (but allow it to be re-enabled using PACKAGECONFIG,
> > assuming the required recipes are also provided). * Fix conf files not
> > going into lcdvc and lcdd packages due to override expansion not
> > happening at the expected time (for CONFFILES_*) * Remove some
> > unnecessary cruft * Move packaging parts of recipe below do_install * Add
> > LIC_FILES_CHKSUM * Make LICENSE more accurate * Add SUMMARY
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> [..]
> 
> > +# Driver packages + +# USB / no USB trickery +
> > +RCONFLICTS_lcdd-driver-hd47780nousb = "lcdd-driver-hd44780"
> > +RCONFLICTS_lcdd-driver-hd47780 = "lcdd-driver-hd44780nousb" +
> > +INITSCRIPT_PACKAGES = "lcdd lcdproc" +INITSCRIPT_NAME_lcdd = "lcdd"
> > +INITSCRIPT_NAME_lcdproc = "lcdproc" +INITSCRIPT_PARAMS_lcdd = "defaults
> > 70 21" +INITSCRIPT_PARAMS_lcdproc = "defaults 71 20"
> 
> Those the stock initscript have LSB headers? They help a lot when using
> systemd to work out dependencies in sysv-compat mode.

Yes they do. I haven't tested them in conjunction with systemd, but they are 
present.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


