Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PJRWO-0004Tu-W7
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 15:01:01 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PJRVI-0002Zz-Af from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 05:59:52 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 19 Nov 2010 05:59:51 -0800
Received: from [172.30.6.141] ([172.30.6.141]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 19 Nov 2010 06:59:51 -0700
Message-ID: <4CE682D4.1040304@mentor.com>
Date: Fri, 19 Nov 2010 06:59:48 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=REDDr=0wv9oQDEyUPAYh1KUyDq_p=q0s-0WAy@mail.gmail.com>
	<1290108449-14749-3-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1290108449-14749-3-git-send-email-rep.dot.nop@gmail.com>
X-OriginalArrivalTime: 19 Nov 2010 13:59:51.0157 (UTC)
	FILETIME=[08E9DA50:01CB87F2]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] bitbake.conf: add ext4 image support
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
X-List-Received-Date: Fri, 19 Nov 2010 14:01:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/2010 12:27 PM, Bernhard Reutner-Fischer wrote:

> diff --git a/recipes/e2fsprogs/e2fsprogs.inc b/recipes/e2fsprogs/e2fsprogs.inc
> index 7697440..3d3e874 100644
> --- a/recipes/e2fsprogs/e2fsprogs.inc
> +++ b/recipes/e2fsprogs/e2fsprogs.inc
> @@ -9,7 +9,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-${PV}.tar.gz"
>
>   S = "${WORKDIR}/e2fsprogs-${PV}"
>
> -INC_PR = "r24"
> +INC_PR = "r25"
>
>   inherit autotools
>
> @@ -31,29 +31,22 @@ do_install_append () {
>
>       	oe_runmake install-libs DESTDIR=${D}
>
> -	mv ${D}${base_sbindir}/e2fsck ${D}${base_sbindir}/e2fsck.${PN}
> -	rm ${D}${base_sbindir}/fsck.ext2
> -	rm ${D}${base_sbindir}/fsck.ext3
> -	rm ${D}${base_sbindir}/fsck.ext4*
> -	mv ${D}${base_sbindir}/mke2fs ${D}${base_sbindir}/mke2fs.${PN}
> -	rm ${D}${base_sbindir}/mkfs.ext2
> -	rm ${D}${base_sbindir}/mkfs.ext3
> -	rm ${D}${base_sbindir}/mkfs.ext4*
> -
> -	cd ${D}/${base_sbindir}
> -	ln -sf ./e2fsck.${PN} fsck.ext2.${PN}
> -	ln -sf ./e2fsck.${PN} fsck.ext3.${PN}
> -	ln -sf ./e2fsck.${PN} fsck.ext4.${PN}
> -	ln -sf ./e2fsck.${PN} fsck.ext4dev.${PN}
> -	ln -sf ./mke2fs.${PN} mkfs.ext2.${PN}
> -	ln -sf ./mke2fs.${PN} mkfs.ext3.${PN}
> -	ln -sf ./mke2fs.${PN} mkfs.ext4.${PN}
> -	ln -sf ./mke2fs.${PN} mkfs.ext4dev.${PN}
> -
> -	ln -sf ./tune2fs findfs
> -	ln -sf ./tune2fs e2label
> -
> -	mv ${D}${bindir}/chattr ${D}${bindir}/chattr.${PN}
> +	if ${@['true','false'][(bb.data.inherits_class('packaged-staging', d))]}; then
> +	for f in e2fsck mke2fs; do
> +		mv ${D}${base_sbindir}/$f ${D}${base_sbindir}/$f.${PN}
> +	done
> +	for f in chattr; do
> +		mv ${D}${bindir}/$f ${D}${bindir}/$f.${PN}
> +	done
> +	fsck=$(cd ${D}${base_sbindir}/&&  ls -1 fsck.ext* | sed s/[^\.]*//)
> +	for e in $fsck;do
> +		rm ${D}${base_sbindir}/{fsck,mkfs}$e;
> +		ln -s ${D}${base_sbindir}/e2fsck$e.${PN}$e fsck$e.${PN}
> +		ln -s ${D}${base_sbindir}/mke2fs$e.${PN}$e mkfs$e.${PN}
> +	done
> +	fi
> +	ln -sf ${D}/${base_sbindir}/tune2fs findfs
> +	ln -sf ${D}/${base_sbindir}/tune2fs e2label
>   }
>
>   pkg_postinst_e2fsprogs () {

This part should be separate.  And I like making it a loop, the way (I) 
have been doing this for other conflicts is with:
do_install_append_pn-e2fsprogs () {
...
}

-- 
Tom Rini
Mentor Graphics Corporation


