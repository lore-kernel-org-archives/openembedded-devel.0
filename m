Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PV2bo-0002LJ-GQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 14:50:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 43E4C314BD7E;
	Tue, 21 Dec 2010 14:50:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id GIFsR1fPk2fT; Tue, 21 Dec 2010 14:50:23 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 87BBF314B788;
	Tue, 21 Dec 2010 14:50:23 +0100 (CET)
Message-ID: <4D10B09F.2050505@opendreambox.org>
Date: Tue, 21 Dec 2010 14:50:23 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <1291230954-31990-1-git-send-email-rep.dot.nop@gmail.com>
	<1291230954-31990-3-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1291230954-31990-3-git-send-email-rep.dot.nop@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2 2/3] e2fsprogs: fix alternatives of non-packaged native sysroot
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
X-List-Received-Date: Tue, 21 Dec 2010 13:50:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/01/2010 08:15 PM, Bernhard Reutner-Fischer wrote:
> @@ -31,29 +31,23 @@ do_install_append () {
>  
>      	oe_runmake install-libs DESTDIR=${D}
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
> +	ln -sf ${D}/${base_sbindir}/tune2fs findfs
> +	ln -sf ${D}/${base_sbindir}/tune2fs e2label

These two symliks are broken, too.

ln -sf tune2fs ${D}/${base_sbindir}/findfs
ln -sf tune2fs ${D}/${base_sbindir}/e2label



