Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 1E83F72130
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 10:21:39 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1YSNTl-0001Pf-72 for openembedded-devel@lists.openembedded.org;
	Mon, 02 Mar 2015 11:21:37 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2015 11:21:37 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2015 11:21:37 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 02 Mar 2015 11:21:17 +0100
Message-ID: <md1dit$n3m$1@ger.gmane.org>
References: <1424420477-30493-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
In-Reply-To: <1424420477-30493-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [meta-initramfs][PATCH] linux-yocto-tiny-kexecboot: remove 3.10, 3.17 and add 3.19
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
X-List-Received-Date: Mon, 02 Mar 2015 10:21:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Martin Jansa schreef op 20-02-15 om 09:21:
> * 3.10 and 3.17 were removed in oe-core and parsing fails because of the
> require line
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Tested-by: Koen Kooi <koen@dominion.thruhere.net

Any ETA when this will go in?

> --- .../linux/linux-yocto-tiny-kexecboot_3.17.bb       | 26
> ---------------------- ..._3.10.bb => linux-yocto-tiny-kexecboot_3.19.bb}
> |  2 +- 2 files changed, 1 insertion(+), 27 deletions(-) delete mode
> 100644
> meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bb 
> rename
> meta-initramfs/recipes-kernel/linux/{linux-yocto-tiny-kexecboot_3.10.bb
> => linux-yocto-tiny-kexecboot_3.19.bb} (93%)
> 
> diff --git
> a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bb
> b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bb 
> deleted file mode 100644 index f3296c7..0000000 ---
> a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bb 
> +++ /dev/null @@ -1,26 +0,0 @@ -require
> recipes-kernel/linux/linux-yocto-tiny_3.17.bb -SUMMARY = "Yocto tiny
> kernel embedding a minimalistic kexecboot initramfs" - -PACKAGES = "" 
> -PROVIDES = "" - -KERNEL_IMAGE_BASE_NAME =
> "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${PV}-${MACHINE}" 
> -KERNEL_IMAGE_SYMLINK_NAME =
> "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}" - -INITRAMFS_IMAGE
> = "initramfs-kexecboot-klibc-image" -INITRAMFS_TASK =
> "${INITRAMFS_IMAGE}:do_rootfs" - -# disable unneeded tasks 
> -do_install[noexec] = "1" -do_package[noexec] = "1" 
> -do_package_qa[noexec] = "1" -do_packagedata[noexec] = "1" 
> -do_package_deb[noexec] = "1" -do_package_ipk[noexec] = "1" 
> -do_package_rpm[noexec] = "1" -do_package_tar[noexec] = "1" 
> -do_package_write_deb[noexec] = "1" -do_package_write_ipk[noexec] = "1" 
> -do_package_write_rpm[noexec] = "1" -do_package_write_tar[noexec] = "1" 
> -do_populate_sysroot[noexec] = "1" diff --git
> a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
> b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.19.bb 
> similarity index 93% rename from
> meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb 
> rename to
> meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.19.bb 
> index a823e0f..f6d2fa0 100644 ---
> a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb 
> +++
> b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.19.bb 
> @@ -1,4 +1,4 @@ -require recipes-kernel/linux/linux-yocto-tiny_3.10.bb 
> +require recipes-kernel/linux/linux-yocto-tiny_${PV}.bb SUMMARY = "Yocto
> tiny kernel embedding a minimalistic kexecboot initramfs"
> 
> PACKAGES = ""
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFU9DmdMkyGM64RGpERAl6xAJ9l92nP7qWzX/ymjVYLkO4cT5UT6ACfUdHY
hZBp07nZNhyH1UykJFmKbzk=
=LyMJ
-----END PGP SIGNATURE-----


