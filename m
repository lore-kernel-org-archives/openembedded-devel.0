Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RXGXo-00073b-Ud for openembedded-devel@lists.openembedded.org;
	Sun, 04 Dec 2011 19:12:10 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RXGRD-00087i-ND for openembedded-devel@lists.openembedded.org;
	Sun, 04 Dec 2011 19:05:19 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Dec 2011 19:05:19 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Dec 2011 19:05:19 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 04 Dec 2011 19:02:15 +0100
Message-ID: <jbgcj8$tmh$2@dough.gmane.org>
References: <cover.1322969413.git.elizabeth.flanagan@intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <cover.1322969413.git.elizabeth.flanagan@intel.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [[RFC] 0/4] license.bbclass: License Manifest Stage 1
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
X-List-Received-Date: Sun, 04 Dec 2011 18:12:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 04-12-11 04:42, Beth Flanagan schreef:
> Please see commit messages for full description: This RFC includes:
> 
> - License manifest implementation in preparation for SPDX manifests. -
> fixes to how licenses are collected. We now can support accurate
> licenses during a parallel bitbake. - optional addition of license
> manifest to the generated image. - optional addition of full
> common-license directory to the generated image. - additional licenses,
> more SPDX mappings. - ability to add custom license directories instead
> of adding license files to common-licenses. - some recipe fixes to fix
> LICENSE fields. - removal of license functionality of base-files as it's
> now redundant.
> 
> These patches require the included commits by Paul Eggleton in order to 
> function. Specifically, it requires list_installed_packages in rootfs_*.
> 
> Please note. License manifest does not work with .deb packaging yet. When
>  list_installed_packages is working in rootfs_deb, I'll patch include
> deb.
> 
> The following changes since commit
> 9be6d59b78510443d0944513503d515df13caa45:
> 
> dpkg-native: Fix perl path (2011-12-02 15:31:08 +0000)
> 
> are available in the git repository at: 
> git://git.yoctoproject.org/poky-contrib eflanagan/license_m1 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/license_m1

Do
> 
you have a version that is actually again OE so people can test it?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7btacACgkQMkyGM64RGpE0uwCgroPmuq0cAQXy/V5suGRxwR6q
k3AAn2czaaK4EWcDacN1foA+VkWibZZV
=I2Tj
-----END PGP SIGNATURE-----



