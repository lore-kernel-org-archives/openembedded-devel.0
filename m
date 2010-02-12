Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nfx6u-0002OX-OW for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 16:07:18 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nfx4Q-0000Ud-Ko for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 16:04:38 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 16:04:38 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 16:04:38 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 12 Feb 2010 16:04:16 +0100
Message-ID: <hl3qlf$blr$1@ger.gmane.org>
References: <1265986283-28972-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1265986283-28972-2-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100204 Shredder/3.0.2pre
In-Reply-To: <1265986283-28972-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] e2fsprogs: stop providing libblkid/libuuid/fsck - they are in util-linux-ng
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
X-List-Received-Date: Fri, 12 Feb 2010 15:07:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-02-10 15:51, Marcin Juszkiewicz wrote:
> There is a long story about moving components from e2fsprogs to
> util-linux-ng and I will not write it here. But it happened and we
> should follow.
> 
> The story in short is: kill libblkid, libuuid in this package, drop fsck
> binary and use those which are in util-linux-ng. There are more and more
> applications/libraries which require libblkid 2.xx - for example recent
> HAL.
> 


Acked-by: Koen Kooi <koen@openembedded.org>




> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> ---
>  recipes/e2fsprogs/e2fsprogs_1.41.9.bb |   13 +++++--------
>  1 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.9.bb b/recipes/e2fsprogs/e2fsprogs_1.41.9.bb
> index ada93bd..dd9aadb 100644
> --- a/recipes/e2fsprogs/e2fsprogs_1.41.9.bb
> +++ b/recipes/e2fsprogs/e2fsprogs_1.41.9.bb
> @@ -1,6 +1,8 @@
>  require e2fsprogs.inc
>  
> -DEPENDS += "gettext-native"
> +DEPENDS += "gettext-native util-linux-ng"
> +
> +EXTRA_OECONF += " --disable-libuuid --disable-libblkid --disable-fsck"
>  
>  do_configure() {
>          oe_runconf
> @@ -33,22 +35,17 @@ do_stage () {
>  # blkid used to be part of e2fsprogs but is useful outside, add it
>  # as an RDEPENDS so that anything relying on it being in e2fsprogs
>  # still works
> -RDEPENDS_e2fsprogs = "e2fsprogs-blkid e2fsprogs-uuidgen e2fsprogs-badblocks"
> +RDEPENDS_e2fsprogs = "util-linux-ng e2fsprogs-badblocks"
>  
>  FILES_${PN} += "${libdir}/e2initrd_helper"
>  
> -PACKAGES =+ "e2fsprogs-blkid e2fsprogs-uuidgen e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-fsck e2fsprogs-tune2fs e2fsprogs-badblocks"
> -FILES_e2fsprogs-blkid = "${base_sbindir}/blkid.${PN}"
> -FILES_e2fsprogs-uuidgen = "${bindir}/uuidgen"
> -FILES_e2fsprogs-fsck = "${base_sbindir}/fsck.${PN}"
> +PACKAGES =+ "e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-tune2fs e2fsprogs-badblocks"
>  FILES_e2fsprogs-e2fsck = "${base_sbindir}/e2fsck.${PN} ${base_sbindir}/fsck.ext*.${PN}"
>  FILES_e2fsprogs-mke2fs = "${base_sbindir}/mke2fs.${PN} ${base_sbindir}/mkfs.ext*.${PN}"
>  FILES_e2fsprogs-tune2fs = "${base_sbindir}/tune2fs ${base_sbindir}/e2label ${base_sbindir}/findfs"
>  FILES_e2fsprogs-badblocks = "${base_sbindir}/badblocks"
>  
>  do_install_append () {
> -	mv ${D}${base_sbindir}/fsck ${D}${base_sbindir}/fsck.${PN}
> -	mv ${D}${base_sbindir}/blkid ${D}${base_sbindir}/blkid.${PN}
>  	mv ${D}${base_sbindir}/e2fsck ${D}${base_sbindir}/e2fsck.${PN}
>  	rm ${D}${base_sbindir}/fsck.ext2
>  	rm ${D}${base_sbindir}/fsck.ext3

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLdW3wMkyGM64RGpERAj+uAJ9A2IRy6jUQk6yIndC/BcwScpUV0ACggzMw
AUAMFuiWO8FK9aHpLz5Z/TI=
=d+dj
-----END PGP SIGNATURE-----



