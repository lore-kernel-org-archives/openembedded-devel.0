Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PxxSh-00063W-Ou
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 09:12:40 +0100
Received: by pzk35 with SMTP id 35so201248pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 00:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=boy9BIAeqBuzVFRxG++qmbeKCKTfcYNxpYYbhtxrfv8=;
	b=lFeGpoKVeDE6JSjZvgBa8v/GD+rMWbZJES790m5CfaSmOswSrhxrnwyD/ilZ8gVPLl
	kG2CiMbDF7wFCae2ovZx6J+dXDQ/xuLNFI90HZGg1Msl6mwAk4ZEnBIvfEeT59+v9iFm
	p4dLaDG1SOoQFztL3Dx9l6wEMi0EAuRGr84Vs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=FGryAhD72dStFKxrVFaTkQoZqg8emZbsEq3GffD0dysEBNhrgY/sKEm0hfNJWJsz3R
	Tu3YHNC50R+rQ+nzCT9aduJr0gyYVKPNdtqY9Mu6dwqy0rVuLm3fZ7kWtJWVH2QCEMqt
	BsKvKvdDWtIC5Q/7FoirfbVPWqT++wTxssHxQ=
Received: by 10.143.169.7 with SMTP id w7mr7455899wfo.186.1299830644971;
	Fri, 11 Mar 2011 00:04:04 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 25sm5019898wfb.22.2011.03.11.00.04.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2011 00:04:03 -0800 (PST)
Date: Fri, 11 Mar 2011 00:04:27 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110311080427.GB2478@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <AANLkTik1GhO_ZX_oP3_TB6JR_73QPmM7t3jzxd4vbOkW@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTik1GhO_ZX_oP3_TB6JR_73QPmM7t3jzxd4vbOkW@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [RFC] cpio.lzma compression level in bitbake.conf
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
X-List-Received-Date: Fri, 11 Mar 2011 08:12:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (10/03/11 10:21), Andrea Adami wrote:
> Hello,
> 
> in bitbake.conf we use the maximum lzma compression level (-c -9) for
> the initramfs:
> 
> IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} &&
> (find . | cpio -o -H newc | lzma -c -9
> >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma)
> ${EXTRA_IMAGECMD}"
> 
> This makes decompressor fail on devices with 32Mb RAM (see
> http://paste.debian.net/110203/ ).
> Same kernel boots with compression set to -7.
> 
> Some figures can be obtained here:
> http://www.gsp.com/cgi-bin/man.cgi?section=1&topic=lzcat
> 
> It was suggested we should introduce something like
> LZMA_COMPRESSION_LEVEL or use internal tables to find better level
> from targets memory amount.
> In the meanwhile I think we should change the defaults in bitbake.conf.

I think this is something we can encapsulate in machine.conf files
so unless the general value in bitbake.conf does not fail for almost
all cases I would suggest to keep it and instead introduce a new
variable to control the level 
> 
> Opinions?
> 
> Andrea
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


