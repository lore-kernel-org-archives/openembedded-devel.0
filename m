Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TLW6e-00027A-HE for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 11:28:04 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TLVu3-0003Ti-Fz for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 11:15:03 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 11:15:03 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 11:15:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 09 Oct 2012 11:00:55 +0200
Message-ID: <k50p40$558$2@ger.gmane.org>
References: <1349606858-7635-1-git-send-email-paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <1349606858-7635-1-git-send-email-paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.4.4
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
X-List-Received-Date: Tue, 09 Oct 2012 09:28:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 07-10-12 12:47, Paul Eggleton schreef:
> * Update to latest upstream version 0.5.5 * Add an Ubuntu patch to fix
> incompatibility with current automake * Use automatic package splitting
> for drivers * Allow specifying drivers to build via LCD_DRIVERS * Allow
> specifying default enabled driver via LCD_DEFAULT_DRIVER * Disable g15
> driver by default (but allow it to be re-enabled using PACKAGECONFIG,
> assuming the required recipes are also provided). * Fix conf files not
> going into lcdvc and lcdd packages due to override expansion not
> happening at the expected time (for CONFFILES_*) * Remove some
> unnecessary cruft * Move packaging parts of recipe below do_install * Add
> LIC_FILES_CHKSUM * Make LICENSE more accurate * Add SUMMARY
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

[..]

> +# Driver packages + +# USB / no USB trickery + 
> +RCONFLICTS_lcdd-driver-hd47780nousb = "lcdd-driver-hd44780" 
> +RCONFLICTS_lcdd-driver-hd47780 = "lcdd-driver-hd44780nousb" + 
> +INITSCRIPT_PACKAGES = "lcdd lcdproc" +INITSCRIPT_NAME_lcdd = "lcdd" 
> +INITSCRIPT_NAME_lcdproc = "lcdproc" +INITSCRIPT_PARAMS_lcdd = "defaults
> 70 21" +INITSCRIPT_PARAMS_lcdproc = "defaults 71 20"

Those the stock initscript have LSB headers? They help a lot when using
systemd to work out dependencies in sysv-compat mode.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQc+fHMkyGM64RGpERAozFAKCwqWsRCkx/3z15MXQsX732u3lBzACgqofA
wRA86yRkVOrVPS3i7ZQwDsk=
=3r5B
-----END PGP SIGNATURE-----



