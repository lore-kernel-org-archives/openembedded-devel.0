Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OcCN0-0007cd-JI for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 09:09:04 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OcCMn-0006JA-4T for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 09:08:21 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 09:08:21 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 09:08:21 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 23 Jul 2010 09:08:11 +0200
Message-ID: <i2bf4r$joo$1@dough.gmane.org>
References: <1279235280.6792.7.camel@utx.lan>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <1279235280.6792.7.camel@utx.lan>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] udev: add compatibility package for old kernels
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
X-List-Received-Date: Fri, 23 Jul 2010 07:09:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Looks good to me:

Acked-by: Koen Kooi <koen@openembedded.org>

On 16-07-10 01:08, Stanislav Brabec wrote:
> Attached patch creates udev compatibility package that allows to run
> udev on old kernels.
> 
> Changes in udev recipes should have no effect for udev itself, just
> simplifying the udev-compat recipe.
> 
> People that need even older udev can reuse the recipe, copy it with a
> different name and add it to the image.
> 
> The idea was suggested in past by Koen Kooi:
> Subject: [RFC][PATCH] udev 151: fall back to old, static udev if present when running an old kernel
> Date: Sat, 17 Apr 2010 16:03:27 +0200
> 
> This recipe does not create static binary, but a dynamic binary
> statically linked just with udev. Binary names don't contain version, so
> arbitrary compat version can be used without modifying of the wrapper.
> 
>     udev-compat141: Added compatibility udev package for old kernels.
> 
> diff --git a/recipes/udev/udev-compat141_141.bb b/recipes/udev/udev-compat141_141.bb
> new file mode 100644
> index 0000000..3eb99e8
> --- /dev/null
> +++ b/recipes/udev/udev-compat141_141.bb
> @@ -0,0 +1,32 @@
> +# To use this package, you need:
> +# - udev main package with init scrit that supports udev-compat-wrapper (enable per-platform in the udev.inc and udev*.bb files)
> +# - this package must be embedded into the image (otherwise system will refuse to boot)
> +# - only one compat package is supported (pick the newest udev that supports your oldest kernel)
> +#
> +FILESPATHPKG =. "udev-${PV}:udev:"
> +require udev_141.bb
> +S = "${WORKDIR}/udev-${PV}"
> +DESCRIPTION = "udev compatibility helper package for systems that run old kernels"
> +PACKAGES = "${PN} ${PN}-dbg"
> +
> +# Need udev with udev-compat-wrapper support.
> +RDEPENDS_${PN} += "udev-compat-wrapper"
> +# Remove hotplug RPROVIDES
> +RPROVIDES_${PN} = ""
> +
> +# We cannot use newer library: udev_monitor_new_from_netlink_compat() will fail.
> +# We cannot use older udev_monitor_new_from_netlink_compat(): Structures are incompatible.
> +# That is why we link udev statically with the old library.
> +export enable_shared = "no"
> +EXTRA_OECONF += "--enable-static"
> +
> +# Remove everything except udevd and udevadm and rename these two.
> +do_install_append () {
> +	mv ${D}${base_sbindir}/udevd ${D}${base_sbindir}/udevd-compat
> +	mv ${D}${base_sbindir}/udevadm ${D}${base_sbindir}/udevadm-compat
> +	rm -r ${D}${datadir} ${D}${base_libdir} ${D}${libdir} ${D}${includedir} ${D}${sysconfdir}
> +	rmdir ${D}${prefix} 2>/dev/null || true
> +}
> +
> +# Remove udev init script installation
> +INITSCRIPT_PACKAGES = ""
> diff --git a/recipes/udev/udev.inc b/recipes/udev/udev.inc
> index 1fb75fe..c79da97 100644
> --- a/recipes/udev/udev.inc
> +++ b/recipes/udev/udev.inc
> @@ -63,7 +63,7 @@ do_install () {
>  	install -m 0755 ${WORKDIR}/mount.sh ${D}${sysconfdir}/udev/scripts/mount.sh
>  	install -m 0755 ${WORKDIR}/network.sh ${D}${sysconfdir}/udev/scripts
>          install -m 0644 ${S}/extras/volume_id/lib/libvolume_id.h ${D}${includedir}
> -        oe_libinstall -C extras/volume_id/lib -so libvolume_id ${D}${libdir}
> +        oe_libinstall -C extras/volume_id/lib libvolume_id ${D}${libdir}
>  }
>  
>  PACKAGES =+ "udev-utils libvolume-id libvolume-id-dev"
> diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
> index 27055be..3ef9f7d 100644
> --- a/recipes/udev/udev_141.bb
> +++ b/recipes/udev/udev_141.bb
> @@ -79,7 +79,7 @@ do_install () {
>  
>  	install -m 0755 ${WORKDIR}/mount.sh ${D}${sysconfdir}/udev/scripts/mount.sh
>  	install -m 0755 ${WORKDIR}/network.sh ${D}${sysconfdir}/udev/scripts
> -        oe_libinstall -C udev/lib -so libudev ${D}${libdir}
> +        oe_libinstall -C udev/lib libudev ${D}${libdir}
>          install ${S}/udev/lib/libudev.h ${D}${includedir}
>  }
>  
> @@ -99,7 +99,7 @@ do_install_append_hipox() {
>  }
>  
>  # Create the cache after checkroot has run
> -pkg_postinst_${PN}_append() {
> +pkg_postinst_udev_append() {
>  update-rc.d $OPT udev-cache start 12 S .
>  
>  if [ -d $D/lib/udev/rules.d ] ; then
> diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
> index 13f3a02..7be56d2 100644
> --- a/recipes/udev/udev_151.bb
> +++ b/recipes/udev/udev_151.bb
> @@ -119,7 +119,7 @@ do_install_append_bug() {
>  }
>  
>  # Create the cache after checkroot has run
> -pkg_postinst_${PN}_append() {
> +pkg_postinst_udev_append() {
>  	update-rc.d $OPT udev-cache start 12 S .
>  }
>  
> diff --git a/recipes/udev/udev_154.bb b/recipes/udev/udev_154.bb
> index cd370e8..5e90e88 100644
> --- a/recipes/udev/udev_154.bb
> +++ b/recipes/udev/udev_154.bb
> @@ -120,6 +120,6 @@ do_install_append_bug() {
>  }
>  
>  # Create the cache after checkroot has run
> -pkg_postinst_${PN}_append() {
> +pkg_postinst_udev_append() {
>  	update-rc.d $OPT udev-cache start 12 S .
>  }
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMST/bMkyGM64RGpERAqHzAJ9Ao0RdT+urH4uAzeqDNnRueJs/OgCfZmOF
oI5DQeMUZ5ykSWTBGLcRBFc=
=otZp
-----END PGP SIGNATURE-----



