Received: from [209.85.218.15] (helo=mail-bw0-f15.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LOrcA-0002aR-Fa
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Jan 2009 11:44:18 +0100
Received: by bwz8 with SMTP id 8so6928761bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jan 2009 02:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=55CTOB6MbFBaA+jpjjZMmfFQr3S/oxOCgXjKFU7rZps=;
	b=sM1S86H6su8Utre8jYR1FY2acuYzmcdniV2mZRmTsowU1OcYtbj/Plhk3hYwYE/7EP
	fsrkV1XR54G2Bs94cZ3bNzj8B5TQgrC2SlJBL7ZP/P/tjB9yZdR3Nf3pE8RsHIC6HtG2
	U3ngP1DM5FAfFjXUdIJ7hmNhRJgel61GVPtZc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hbbSSPccCPp1Jj8g4bw9EnEToDoDp1f3mrd6cKcnUHcq/0nbb5j3IUplXluPcEflXR
	/Dhg6kQY5X0W94HFytEpCLDidHOaI4ppQrGQ46nF+0x3qj7y4W3AVpDaOQzWTmFLDaGL
	vMqPnRglGX/7jrABhHewE14aeiIMX+PhTVMIc=
MIME-Version: 1.0
Received: by 10.181.218.14 with SMTP id v14mr2027914bkq.48.1232361388132; Mon, 
	19 Jan 2009 02:36:28 -0800 (PST)
In-Reply-To: <20090117233309.192da673@zaurus.utx.cz>
References: <d1b08f940901150928h56ede408u2d070606fbe6b7bc@mail.gmail.com>
	<d1b08f940901160534n2d204a36r43494e1a6ed855c5@mail.gmail.com>
	<1232121627.4988.2795.camel@hammer.suse.cz>
	<200901162008.03815.jay4mail@gmail.com>
	<20090117233309.192da673@zaurus.utx.cz>
Date: Mon, 19 Jan 2009 11:36:28 +0100
Message-ID: <d1b08f940901190236y132993ffn6a7586b1e37b18b1@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: ARM bootloaders (Zaurus) and CMDLINE
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
X-List-Received-Date: Mon, 19 Jan 2009 10:44:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> If you look at Sharp system, you will find /sbin/writerominfo. I didn't
> I didn't find source code for it, but I guess that it reads NAND config data and

writerominfo.c and other sources:
http://ftp.surfnet.nl/pub/os/Linux/distr/pdaxrom/src/survive-1.1.0.tar.bz2

It seems it fixes /proc/deviceinfo/product

### Check model ###
/sbin/writerominfo
MODEL=`cat /proc/deviceinfo/product`

Regards

Andrea


