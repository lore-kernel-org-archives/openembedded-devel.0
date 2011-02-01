Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pk9Jx-00078X-3K for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 07:02:33 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pk9J3-0002rh-FN for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 07:01:37 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Feb 2011 07:01:37 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Feb 2011 07:01:37 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 01 Feb 2011 07:01:24 +0100
Message-ID: <ii87jl$55b$1@dough.gmane.org>
References: <1296507563-5509-1-git-send-email-ulf.samuelsson@atmel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1296507563-5509-1-git-send-email-ulf.samuelsson@atmel.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH v2] Add support for at91sam9m10 H/W video decoder
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
X-List-Received-Date: Tue, 01 Feb 2011 06:02:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 31-01-11 21:59, Ulf Samuelsson wrote:

> +do_stage() {
> +	echo staging ...
> +	oe_libinstall -s -a -C ${S}/src/.libs libgstx170   ${STAGING_LIBDIR}
> +	install -m 0644  ${S}/src/gstx170.h  ${STAGING_INCDIR}/

No legacy staging allowed in new recipes

> +do_install() {
> +	echo install ...

remove

> diff --git a/recipes/at91sam9m10-vdec/on2-8170-libs_1.0.bb b/recipes/at91sam9m10-vdec/on2-8170-libs_1.0.bb
> +SRC_URI_append = ""

remove

> +do_stage() {
> +	oe_libinstall -s -a -C ${S}   libdwlx170   ${STAGING_LIBDIR}
> +	oe_libinstall -s -a -C ${S}   libdecx170h  ${STAGING_LIBDIR}
> +	oe_libinstall -s -a -C ${S}   libx170j     ${STAGING_LIBDIR}
> +	oe_libinstall -s -a -C ${S}   libdecx170m2 ${STAGING_LIBDIR}
> +	oe_libinstall -s -a -C ${S}   libdecx170m  ${STAGING_LIBDIR}
> +	oe_libinstall -s -a -C ${S}   libdecx170p  ${STAGING_LIBDIR}
> +	oe_libinstall -s -a -C ${S}   libdecx170v  ${STAGING_LIBDIR}
> +	
> +	install -m 0644 ${S}/*.h ${STAGING_INCDIR}/
> +}

No legacy staging allowed in new recipes

> diff --git a/recipes/images/x11-at91sam9m10-image.bb b/recipes/images/x11-at91sam9m10-image.bb

> +at91sam9m10_rootfs_postprocess() {
> +   curdir=$PWD
> +   cd ${IMAGE_ROOTFS}
> +
> +   # add init script to cratee hantro modules /dev files
> +   echo 'MAJOR=`cat /proc/devices |grep hx170|cut -f1 -d\ `' >> ${IMAGE_ROOTFS}//etc/init.d/hantro
> +   echo 'mknod /dev/hx170 c $MAJOR 0' >> ${IMAGE_ROOTFS}/etc/init.d/hantro
> +   echo 'MAJOR=`cat /proc/devices |grep memalloc|cut -f1 -d\ `' >> ${IMAGE_ROOTFS}//etc/init.d/hantro
> +   echo 'mknod /dev/memalloc c $MAJOR 0' >> ${IMAGE_ROOTFS}/etc/init.d/hantro
> +   chmod a+x  ${IMAGE_ROOTFS}/etc/init.d/hantro
> +   cd ${IMAGE_ROOTFS}/etc/rc5.d
> +   ln -s ../init.d/hantro S51hantro
> +
> +   # back on track
> +   cd $curdir
> +}

Add that to the recipe and use the updated-rc.d class
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNR6G0MkyGM64RGpERAmWdAJ45V+ZF5fMXZAwO5g7vvaJSy4Sg3gCfe6nr
U7flNLkyur1hOoAiX2teRSs=
=9ww2
-----END PGP SIGNATURE-----



