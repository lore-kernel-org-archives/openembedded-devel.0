Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LwEEY-0004FM-Lf
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 13:33:53 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LwEAG-0001cU-8z
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 11:29:24 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 11:29:24 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 11:29:24 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Apr 2009 13:29:09 +0200
Message-ID: <gskam5$bg$1@ger.gmane.org>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240241104-21935-7-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1240241104-21935-7-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 1/1] util-linux-ng: Fixed dangling symlinks.
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
X-List-Received-Date: Tue, 21 Apr 2009 11:33:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Koen Kooi <koen@openembedded.org>

On 20-04-09 17:24, Marcin Juszkiewicz wrote:
> From: Leon Woestenberg<leon@sidebranch.com>
>
> ---
>   recipes/util-linux-ng/util-linux-ng.inc       |   19 ++++++++-----------
>   recipes/util-linux-ng/util-linux-ng_2.13.1.bb |    2 +-
>   recipes/util-linux-ng/util-linux-ng_2.14.bb   |    2 +-
>   3 files changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
> index 443adf2..dda9792 100644
> --- a/recipes/util-linux-ng/util-linux-ng.inc
> +++ b/recipes/util-linux-ng/util-linux-ng.inc
> @@ -5,14 +5,11 @@ DEPENDS = "udev zlib ncurses e2fsprogs-libs"
>
>   inherit autotools
>
> -# I'm finishing this recipe during the 2.13.1 candidate release cycle
> -# @todo Remove $RC later. See if patches are needed. Move files from /usr/*.
> -# --  Leon 'likewise' Woestenberg
> -
> -#RC="-rc2"
> -RC=""
>   DEFAULT_PREFERENCE = "-1"
>
> +# allows for a release candidate
> +RC ?= ""
> +
>   SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v${PV}/util-linux-ng-${PV}${RC}.tar.bz2"
>
>   PACKAGES =+ "util-linux-ng-fdisk util-linux-ng-cfdisk util-linux-ng-sfdisk util-linux-ng-swaponoff util-linux-ng-losetup util-linux-ng-umount util-linux-ng-mount util-linux-ng-readprofile "
> @@ -114,11 +111,11 @@ do_install () {
>   	install -d ${D}${sysconfdir}/default/
>   	echo 'MOUNTALL="-t nonfs,nosmbfs,noncpfs"'>  ${D}${sysconfdir}/default/mountall
>
> -	ln -sf ${base_sbindir}/swapon ${D}${base_sbindir}/swapoff.${PN}
> -	ln -sf ${base_sbindir}/shutdown ${D}${base_sbindir}/reboot.${PN}
> -	ln -sf ${base_sbindir}/shutdown ${D}${base_sbindir}/halt.${PN}
> -	ln -sf ${base_sbindir}/shutdown ${D}${base_sbindir}/fastboot
> -	ln -sf ${base_sbindir}/shutdown ${D}${base_sbindir}/fasthalt
> +	ln -sf ${sbindir}/swapon ${D}${sbindir}/swapoff.${PN}
> +	ln -sf ${sbindir}/shutdown ${D}${sbindir}/reboot.${PN}
> +	ln -sf ${sbindir}/shutdown ${D}${sbindir}/halt.${PN}
> +	ln -sf ${sbindir}/shutdown ${D}${sbindir}/fastboot
> +	ln -sf ${sbindir}/shutdown ${D}${sbindir}/fasthalt
>   }
>
>   pkg_postinst_${PN} () {
> diff --git a/recipes/util-linux-ng/util-linux-ng_2.13.1.bb b/recipes/util-linux-ng/util-linux-ng_2.13.1.bb
> index c10792e..946147d 100644
> --- a/recipes/util-linux-ng/util-linux-ng_2.13.1.bb
> +++ b/recipes/util-linux-ng/util-linux-ng_2.13.1.bb
> @@ -4,4 +4,4 @@ require util-linux-ng.inc
>   #SRC_URI += "file://glibc-fix.patch;patch=1"
>   #SRC_URI += "file://glibc-umount2.patch;patch=1"
>
> -PR = "r0"
> +PR = "r1"
> diff --git a/recipes/util-linux-ng/util-linux-ng_2.14.bb b/recipes/util-linux-ng/util-linux-ng_2.14.bb
> index 587eb97..fdd911a 100644
> --- a/recipes/util-linux-ng/util-linux-ng_2.14.bb
> +++ b/recipes/util-linux-ng/util-linux-ng_2.14.bb
> @@ -1,6 +1,6 @@
>   require util-linux-ng.inc
>
> -PR = "r4"
> +PR = "r5"
>   FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/util-linux-ng-2.14', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
>
>   SRC_URI += "file://util-linux-ng-uclibc-versionsort.patch;patch=1 \




