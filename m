Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RPzRA-0000lj-13 for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 17:31:12 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RPzKu-0001Q8-3b for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 17:24:44 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 17:24:44 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 17:24:44 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 14 Nov 2011 17:24:31 +0100
Message-ID: <j9rfbv$l9f$1@dough.gmane.org>
References: <1321284045-13726-1-git-send-email-vitap@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1321284045-13726-1-git-send-email-vitap@ti.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH] bluez4: Add version 4.95 Signed-off-by: Vita Preskovsky <vitap@ti.com> Adds new recipe that builds bluez-4.95 package
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
X-List-Received-Date: Mon, 14 Nov 2011 16:31:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 14-11-11 16:20, Vita Preskovsky schreef:
> Second version of the patch adresses comments made by community members.
> Checked on angstrom, version 2011.09.

Do you have a git tree to pull these patches from? It seems to have been
corrupted along the way.

regards,

Koen

> --- recipes/bluez/bluez4_4.95.bb |   30 ++++++++++++++++++++++++++++++ 1
> files changed, 30 insertions(+), 0 deletions(-) create mode 100644
> recipes/bluez/bluez4_4.95.bb
> 
> diff --git a/recipes/bluez/bluez4_4.95.bb b/recipes/bluez/bluez4_4.95.bb 
> new file mode 100644 index 0000000..290dff6 --- /dev/null +++
> b/recipes/bluez/bluez4_4.95.bb @@ -0,0 +1,30 @@ +require bluez4.inc + 
> +SRC_URI = "\ +
> ${KERNELORG_MIRROR}/pub/linux/bluetooth/bluez-${PV}.tar.gz \ +
> file://bluetooth.conf \ +" +SRC_URI[md5sum] =
> "341294b2849a04a4afff5c96bfbf30b2" +SRC_URI[sha256sum] =
> "d6ea9de410fc2bcd2620d709c2202893b218e2e6a55c3c0ce6bebd27fa4120f6" + 
> +DEFAULT_PREFERENCE = "-1" +DEFAULT_PREFERENCE_angstrom = "1" + +DEPENDS
> += "libsndfile1" + +PR = "${INC_PR}.0" + +# Not all distros have a recent
> enough udev +BTUDEV = " --disable-udevrules" +BTUDEV_angstrom = "
> --enable-udevrules" +BTUDEV_shr = " --enable-udevrules" + +EXTRA_OECONF
> += "${BTUDEV}" +do_configure_append(){ +	echo "#define
> LIBUDEV_I_KNOW_THE_API_IS_SUBJECT_TO_CHANGE" >> ${S}/config.h +} + 
> +FILES_${PN}-dbg += "\ +  ${base_libdir}/udev/.debug \ +
> ${libdir}/*/.debug \ +"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7BQLwACgkQMkyGM64RGpFKeQCgjnEnJ3cOKn36Ibc4BzWWsaaE
84UAmgKh6u4JhlzxzemXqCwujwMQb9Iq
=hA5v
-----END PGP SIGNATURE-----



