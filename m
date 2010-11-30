Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PNVJP-0003i5-1I
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 19:52:23 +0100
Received: by yxd5 with SMTP id 5so2994245yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 10:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=yC8Ly7wsmIcC12cEQhPBfml2HEnXM9KsqHnm6LJzdHw=;
	b=hdrAJItyYJA1IzPfriWVU3kxF7giPDTXEQmIB1093BoN/RhH3/qRQ3i2Qt9N/g8xBk
	tsnfqglRmBm2Sjv6mnKRoIhzNwpO9nAY9XOsTxGwN3U8vkqsKw22+fo68z8erNHYedpl
	Lo3KGaoxgcFpCn3oSzda3gqKofLaSfHGPk7bk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=M+7mz4AjgvAR6t6dWAVh4+bX6Xm+5LrJhJrzZZ1uPRDSvtvgO2Mpc3/8p1GuK7ZH4q
	xr0kuR7H9lfh+CZpKR05rA/ZKIltz6LUNvbJtk0giMoUBDCBqgHbVhE97/JRfGOmthTi
	fUvywm5ZGFdW6hu0ctltpjEydwqa1uFvla4yk=
Received: by 10.204.56.17 with SMTP id w17mr7258552bkg.90.1291143061095;
	Tue, 30 Nov 2010 10:51:01 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id p22sm2895379bkp.9.2010.11.30.10.50.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 30 Nov 2010 10:50:58 -0800 (PST)
Date: Tue, 30 Nov 2010 19:50:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101130185056.GB3266@jama>
References: <AANLkTinbu9JpEw5fdX8pHcxraf4uTdCf7JKm9v1UekeS@mail.gmail.com>
	<1290769171.20979.51.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1290769171.20979.51.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bluez-dtl1-workaround not provided?
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
X-List-Received-Date: Tue, 30 Nov 2010 18:52:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 26, 2010 at 10:59:31AM +0000, Phil Blundell wrote:
> On Thu, 2010-11-25 at 18:24 +0100, Andrea Adami wrote:
> > So, first doubt is: why make this mandatory for everyone having pcmcia?
> 
> It shouldn't be.  The dependency in kernel-module-dtl1-cs should be
> sufficient to pull it in for (only) those people who are installing the
> driver that needs those bits.

but many machine configs have
MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
which pulls kernel-module-dtl1-cs to every image

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


