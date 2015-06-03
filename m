Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 792FD75803
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2015 08:46:11 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Z04JO-000572-D4 for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2015 10:46:10 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 10:46:10 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 10:46:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 03 Jun 2015 10:45:35 +0200
Message-ID: <mkmerf$klu$1@ger.gmane.org>
References: <1433315969-8449-1-git-send-email-naresh.bhat@linaro.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
In-Reply-To: <1433315969-8449-1-git-send-email-naresh.bhat@linaro.org>
Subject: Re: [meta-filesystems][PATCH] xorriso: Add xorriso v1.4.0
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
X-List-Received-Date: Wed, 03 Jun 2015 08:46:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Naresh Bhat schreef op 03-06-15 om 09:19:
> Add xorriso v1.4.0 based on the discussions 
> http://patchwork.openembedded.org/patch/91143/ 
> http://lists.openembedded.org/pipermail/openembedded-devel/2015-April/100981
.html
>
> 
We have tested this package with
> Montavista CGE product - http://www.mvista.com/ and luvOS distribution -
> https://01.org/linux-uefi-validation build. Inherit the pkgconfig to
> avoid the below error, .. ... | disabled use of O_DIRECT with input of
> -as cdrskin |
> luv-yocto/build/tmp/work/aarch64-oe-linux/xorriso/1.4.0-r0/xorriso-1.4.0/
>
> 
configure: line 14352: syntax error near unexpected token `LIBCDIO,'
> |
> luv-yocto/build/tmp/work/aarch64-oe-linux/xorriso/1.4.0-r0/xorriso-1.4.0/
>
> 
configure: line 14352: `    PKG_CHECK_MODULES(LIBCDIO, libcdio >=
$LIBCDIO_REQUIRED)'
> ... ....
> 
> Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org> Signed-off-by:
> Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com> Signed-off-by:
> Gaurang Shastri <gshastri@juniper.net> --- 
> .../recipes-utils/xorriso/xorriso_1.4.0.bb         |   29
> ++++++++++++++++++++ 1 file changed, 29 insertions(+) create mode 100644
> meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
> 
> diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
> b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb new file mode
> 100644 index 0000000..73ba9b3 --- /dev/null +++
> b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb @@ -0,0 +1,29
> @@ +DESCRIPTION = "xorriso copies file objects from POSIX compliant
> filesystems \ +into Rock Ridge enhanced ISO 9660 filesystems and allows
> session-wise \ +manipulation of such filesystems" + +LICENSE = "GPLv3" 
> +LIC_FILES_CHKSUM =
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" + +SRC_URI =
> "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz" + 
> +SRC_URI[md5sum] = "ec79fd2736b8da76e7a870e27cadf6fa" +SRC_URI[sha256sum]
> = "0bd1e085015b28c24f57697d6def2fe84517967dc417554c0c3ccf1685ed0e56" + 
> +PACKAGECONFIG ??= "acl attr zlib bzip2 readline" +PACKAGECONFIG[acl] =
> "--enable-libacl,--disable-libacl,acl," +PACKAGECONFIG[attr] =
> "--enable-xattr,--disable-xattr,attr," +PACKAGECONFIG[zlib] =
> "--enable-zlib,--disable-zlib,zlib," +PACKAGECONFIG[bzip2] =
> "--enable-libbz2,--disable-libbz2,bzip2," +PACKAGECONFIG[readline] =
> "--enable-libreadline,--disable-libreadline,readline," + +RDEPENDS_${PN}
> = "tk"

R* variables go below do_install

> +REQUIRED_DISTRO_FEATURES = "x11" + +inherit autotools-brokensep
> pkgconfig + +do_configure_prepend () { +    touch NEWS +} + 
> +BBCLASSEXTEND = "native"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFVbr6vMkyGM64RGpERAscEAKCR+Asg4/BFyI6INuiE2UzDqUGdeQCcDD/s
mAPWo9S+lfhM0ZRDzkEWhQI=
=3kZB
-----END PGP SIGNATURE-----


