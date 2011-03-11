Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyCAl-0002yh-Vx
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 00:55:08 +0100
Received: by gwb11 with SMTP id 11so1178144gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 15:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=QpA2KWPFY1ay/ZPkXlqqtowr45Zlw1SPdaqLCfjpjOI=;
	b=SIQ60jDna/KoNd0ttNZsnPAFa27QnNrcS12Av0/Vu8BSF2BeOuwLb5zcSPRNBoougX
	VHdxkS0aNsb1eQD8niqxn7QTiY9ugfs0TcsjRUqvJ4blpc8fqDS1h//YMtjcJ0XnOnAF
	zZ/gMM4tBpFK02wbFVS9wJcA3LpH9lTpNSHPY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	b=sN8NQDaNndOEbEtGaUYwkzWVOMBEJBHq42BuKQxS9nNmyI11Sl4BcBHsxssFtD4VA+
	mdjozWOYXf2bl5CYq5488CWnfUj66auR69jgALepwYSdFsaD2JHmPe126UDb1HsVGfNo
	B7UmCAH0DmKQJCKnlTvRLpewp/6xmIsHVBf/k=
Received: by 10.236.76.35 with SMTP id a23mr3197232yhe.49.1299887609100;
	Fri, 11 Mar 2011 15:53:29 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id l65sm3281768yhn.39.2011.03.11.15.53.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2011 15:53:27 -0800 (PST)
Date: Fri, 11 Mar 2011 15:53:46 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110311235346.GB5603@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <AANLkTik1GhO_ZX_oP3_TB6JR_73QPmM7t3jzxd4vbOkW@mail.gmail.com>
	<20110311080427.GB2478@sakrah.homelinux.org>
	<AANLkTimLqGc2snJHw4Oymfz9q+t+GDWF+ErL46eTzJB5@mail.gmail.com>
	<AANLkTinGAS+x7q=RVynv8QVV9gCD9RC_Yd+msyzYm=_m@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinGAS+x7q=RVynv8QVV9gCD9RC_Yd+msyzYm=_m@mail.gmail.com>
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
X-List-Received-Date: Fri, 11 Mar 2011 23:55:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (11/03/11 10:51), Andrea Adami wrote:
> On Fri, Mar 11, 2011 at 10:49 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> >> I think this is something we can encapsulate in machine.conf files
> >> so unless the general value in bitbake.conf does not fail for almost
> >> all cases I would suggest to keep it and instead introduce a new
> >> variable to control the level
> >> -Khem
> >
> > Ok, but then we need a weak assignment in bitbake.conf to allow the
> > setting  in machine conf.
> >
> > So, in bitbake.conf
> >
> > -IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} &&
> > (find . | cpio -o -H newc | lzma -c -9
> >>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma)
> > ${EXTRA_IMAGECMD}"
> >
> > + LZMA_COMPRESSION_LEVEL ?= "-9"
> > +IMAGE_CMD_cpio.lzma = "type cpio >/dev/null; cd ${IMAGE_ROOTFS} &&
> > (find . | cpio -o -H newc | lzma -c ${LZMA_COMPRESSION_LEVEL}
> >>${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.lzma)
> > ${EXTRA_IMAGECMD}"
> >
> > And in machine.conf e.g.
> > + LZMA_COMPRESSION_LEVEL ?= "-7"
> 
> Copy and paste is for the lazy..obviously I meant
> + LZMA_COMPRESSION_LEVEL = "-7"
> 
> 
> >
> > Acceptable?

Yes I would think so.

> >
> > Regards
> >
> > Andrea
> >
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


