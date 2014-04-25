Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 4BFD665DAF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 07:46:13 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Wdapo-0003Oa-MS for openembedded-devel@lists.openembedded.org;
	Fri, 25 Apr 2014 09:46:12 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 09:46:12 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 09:46:12 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 25 Apr 2014 09:46:03 +0200
Message-ID: <ljd3rq$nu3$1@ger.gmane.org>
References: <5359FFDC.1000206@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
In-Reply-To: <5359FFDC.1000206@windriver.com>
X-Enigmail-Version: 1.6
Subject: Re: How to deal with complex patch including creating new patches?
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
X-List-Received-Date: Fri, 25 Apr 2014 07:46:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

zhangxiao schreef op 25-04-14 08:25:
> Hi Experts,
> 
> As we know, usually we have to add patches on source tree and in most
> cases what we need to do is just add the source of the patch into SRC_URI
> list and bitbake will install it automatically in "patch" task.
> 
> While for some complex cases, for example the netcat as below:
> 
> http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb?h=master
>
> 
> 
> ... 8        SRC_URI = 
> "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=netcat
>
> 
\
> 9 
> ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}-7.debian.tar.gz;name=netcat-patch"
>
>  ...
> 
> It has two sources: one source tree as
> "netcat-openbsd_${PV}.orig.tar.gz"and the other is a patch called
> "netcat-openbsd_${PV}-7.debian.tar.gz".
> 
> While the patch is not simple as usual that beside common modifications
> on source tree, it also creates several patches that also need to be
> installed. To deal with it, this bb file make it in do_compile in line 22
> as below: ... 20        do_compile() { 21            cd ${S} 22
> while read line; do patch -p1 < ${WORKDIR}/debian/patches/$line; done <
> ${WORKDIR}/debian/patches/series 23            pkgrel=4 24
> oe_runmake CFLAGS="$CFLAGS -DDEBIAN_VERSION=\"\\\"${pkgrel}\\\"\"" 25
> } ...
> 
> Of course it is not good and will cause error when we force re-compile
> it since those patches had already been installed in the previous compile
> task.
> 
> The how to fix it?
> 
> Currently I can find two methods as below:
> 
> First, for line 21, 22 of do_compile that install new created patches,
> remove them. Then:
> 
> A) Add a do_patch_append and install those new created patches to this
> function;
> 
> B) Convert the netcat-openbsd_${PV}-7.debian.tar.gz to a pure patch. Let
> it contains all modifications and no need to create more patches any
> more. Then place this new created patch locally and modify the SRC_URI to
> point to it.

c) add all the patches from there to SRC_URI.

squashing patches is not a good idea, especially when updating the recipe
later on.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTWhK7MkyGM64RGpERAndgAJ9Lc8id//55Uk4OfsKD/zvH4W4s/ACcD0RQ
DvoFZmyIodLqi+AhxAWHkdM=
=71Zw
-----END PGP SIGNATURE-----


