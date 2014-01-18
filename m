Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 810526DA91
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2014 11:29:49 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1W4U60-0001bx-6n for openembedded-devel@lists.openembedded.org;
	Sat, 18 Jan 2014 12:29:48 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2014 12:29:48 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2014 12:29:48 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 18 Jan 2014 12:29:40 +0100
Message-ID: <lbdoim$e43$1@ger.gmane.org>
References: <cover.1389979930.git.paul.eggleton@linux.intel.com>
	<d81dfc5a3416ffd765d53e5ea4089b7f2018d94f.1389979930.git.paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <d81dfc5a3416ffd765d53e5ea4089b7f2018d94f.1389979930.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-filesystems][PATCH 1/1] aufs-util: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Jan 2014 11:29:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Eggleton schreef op 17-01-14 18:36:
/recipes-utils/aufs-util/aufs-util_git.bb
b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
> new file mode 100644 index 0000000..cea3636 --- /dev/null +++
> b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb @@ -0,0 +1,48
> @@ +SUMMARY = "Tools for managing AUFS mounts" +SECTION = "base" 
> +HOMEPAGE = "http://http://aufs.sourceforge.net/" +LICENSE = "GPLv2" 
> +LIC_FILES_CHKSUM =
> "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a" + +DEPENDS =
> "aufs-util-native" +DEPENDS_class-native = "" + +SRCREV =
> "f29056fe396d56fc2a06a96312feabaebbe14c59" +SRC_URI =
> "git://git.code.sf.net/p/aufs/aufs-util;protocol=git;branch=aufs3.x-rcN
> \ +           file://aufs-util-don-t-strip-executables.patch \ +
> file://include/linux/aufs_type.h \ +
> file://aufs-util-add-tool-concept-to-Makefile-for-cross-com.patch \ +" + 
> +PV = "3.x-rcN+git${SRCPV}"

This is a new low for upstream versioning :/ I've looked at the git repo for
aufs-util and it seems 3.x-rcN is identical to 3.9, could we use that for
the aufs-utils recipe to avoid using that horrid, horrid PV above?


> + +S = "${WORKDIR}/git/" + +do_configure_append () { +	if [ "${PN}" !=
> "aufs-util-native" ]; then +		for i in ver c2sh c2tmac; do +			cp
> ${STAGING_BINDIR_NATIVE}/aufs-util-${PV}/$i ./ +		done +	fi +}


Change to do_configure_append_class-target ?

> + +do_compile () { +	oe_runmake CPPFLAGS="-I${WORKDIR}/include
> -I${S}/libau" +} + +do_compile_class-native () { +	oe_runmake tools
> CPPFLAGS="-I${WORKDIR}/include -I${S}/libau" +} + +do_install () { +
> oe_runmake 'DESTDIR=${D}' install_sbin install_ubin install_etc +} + 
> +do_install_class-native () { +	install -d ${D}${bindir}/aufs-util-${PV} 
> +	for i in ver c2sh c2tmac; do +		install -m 755 $i
> ${D}${bindir}/aufs-util-${PV}/$i +	done +}

And you'll probably want a

RRECOMMENDS_${PN} = "kernel-module-aufs"

here to drag in the aufs modules.

> +BBCLASSEXTEND = "native"

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFS2mWkMkyGM64RGpERAshzAJ9nGpCEOIKCbecMf8Bv8AMAhjl9+ACfRX9U
ti6UhcFJhgfQuos3XrxSCJQ=
=6cZo
-----END PGP SIGNATURE-----


