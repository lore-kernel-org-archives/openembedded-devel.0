Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Pxz6j-0004gJ-7l
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 10:58:05 +0100
Received: by iyb26 with SMTP id 26so2590687iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 01:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=JgBdNBfz6ILX4RANJb99Ftmnz0j5T5DzTGkppgc1hww=;
	b=l2Tg/XXLFnTRwzUQv8QNDRVHAESa/PkuZAfAaXCMDLHZxpvGqC/DrrMBjb+6B9fXQB
	NdHC6b0Uw6OxT7cKnXRQEOiZiZqVhdYCIYKsVIdY2M7nsNqQSaR9ih5JweZ8+Zz8lBWG
	08EdQKQa7xHCY0ghjrzWrSr92YQQ3cRmOIPRk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dB/s8d5SQLUUp2K2cfZINFcz3FnhNKroVCAtRs0v3Kir94YYI2s2s/zq39iqNxzfHF
	oA0/j4Xd6JsUyaFqpur20CmB6fnYnN5fQ+0h/KG6OpmlozVaWrZz2AZv68ukcGZAvia+
	dhVPfX0r9dwXGoxdJt8Ao4SHACAA/wzxAwC1Y=
MIME-Version: 1.0
Received: by 10.42.153.3 with SMTP id k3mr11280232icw.457.1299836998772; Fri,
	11 Mar 2011 01:49:58 -0800 (PST)
Received: by 10.42.117.138 with HTTP; Fri, 11 Mar 2011 01:49:58 -0800 (PST)
In-Reply-To: <20110311080427.GB2478@sakrah.homelinux.org>
References: <AANLkTik1GhO_ZX_oP3_TB6JR_73QPmM7t3jzxd4vbOkW@mail.gmail.com>
	<20110311080427.GB2478@sakrah.homelinux.org>
Date: Fri, 11 Mar 2011 10:49:58 +0100
Message-ID: <AANLkTimLqGc2snJHw4Oymfz9q+t+GDWF+ErL46eTzJB5@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 11 Mar 2011 09:58:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

> I think this is something we can encapsulate in machine.conf files
> so unless the general value in bitbake.conf does not fail for almost
> all cases I would suggest to keep it and instead introduce a new
> variable to control the level
> -Khem

Ok, but then we need a weak assignment in bitbake.conf to allow the
setting  in machine conf.

So, in bitbake.conf

-IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} &&
(find . | cpio -o -H newc | lzma -c -9
>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma)
${EXTRA_IMAGECMD}"

+ LZMA_COMPRESSION_LEVEL ?= "-9"
+IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} &&
(find . | cpio -o -H newc | lzma -c ${LZMA_COMPRESSION_LEVEL}
>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma)
${EXTRA_IMAGECMD}"

And in machine.conf e.g.
+ LZMA_COMPRESSION_LEVEL ?= "-7"

Acceptable?

Regards

Andrea


