Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PV2Ql-0008CB-P4
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 14:39:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 530D7314BCB5;
	Tue, 21 Dec 2010 14:39:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id XrM4AeNiSHJz; Tue, 21 Dec 2010 14:38:55 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 76DC9314BCAB;
	Tue, 21 Dec 2010 14:38:55 +0100 (CET)
Message-ID: <4D10ADEF.7070009@opendreambox.org>
Date: Tue, 21 Dec 2010 14:38:55 +0100
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
X-List-Received-Date: Tue, 21 Dec 2010 13:39:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Bernhard,

On 12/01/2010 08:15 PM, Bernhard Reutner-Fischer wrote:
> +do_install_append_pn-e2fsprogs () {
> +	for f in e2fsck mke2fs; do
> +		mv ${D}${base_sbindir}/$f ${D}${base_sbindir}/$f.${PN}
> +	done
> +	for f in chattr; do
> +		mv ${D}${bindir}/$f ${D}${bindir}/$f.${PN}
> +	done
> +	fsck=$(cd ${D}${base_sbindir}/ && ls -1 fsck.ext* | sed s/[^\.]*//)
> +	for e in $fsck;do
> +		rm ${D}${base_sbindir}/{fsck,mkfs}$e;

this doesn't work with dash. I had to split it into two seperate lines:

rm ${D}${base_sbindir}/fsck$e
rm ${D}${base_sbindir}/mkfs$e

> +		ln -s ${D}${base_sbindir}/e2fsck$e.${PN}$e fsck$e.${PN}
> +		ln -s ${D}${base_sbindir}/mke2fs$e.${PN}$e mkfs$e.${PN}

These two symlinks don't seem to make sense to me. I think this would be
right:

ln -sf e2fsck.${PN} ${D}${base_sbindir}/fsck$e.${PN}
ln -sf mke2fs.${PN} ${D}${base_sbindir}/mkfs$e.${PN}

Do you agree?

Regards,
Andreas


