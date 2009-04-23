Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1Lwvxe-0001FI-FS
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 12:15:18 +0200
Received: by rv-out-0708.google.com with SMTP id f25so356283rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2009 03:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=NZfIgbmL+tmmN9Z4yf1tRHpfi7r4E4lcgrr+DmXumnc=;
	b=diFQ8fCVmDplvBzYu9+/M/+csAh14UtbD/Wf2CWRHcnY7kcdJDjW5pEByL4ykzo8K4
	qvO8kBN2+1WgzZnD6C5gV2a9D7bpNfEZWySekC1k8dZroNUBGxq6aXJySeTvuiPwJi6N
	8/GdfvfDz5JfXDl/J30syL092nT6IF+M2/Zio=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:message-id;
	b=Qw5G9UfDZSBlUPiIXt399AiJXkNTwraYPaIxZO/xX00LdqPgfWBa0+OJ8kp9AENsUH
	FG8L85l4FC/3lR9MbURUm9OuYiv9f65swCOVb0qmsO8cvQr9yQxIndEsX52dsY61PVlx
	qPfrhEAgRGrGIwNe2iFh7f9vxeynCM24hDQfM=
Received: by 10.142.44.11 with SMTP id r11mr287047wfr.186.1240481441265;
	Thu, 23 Apr 2009 03:10:41 -0700 (PDT)
Received: from is.home (93-81-142-7.broadband.corbina.ru [93.81.142.7])
	by mx.google.com with ESMTPS id 24sm1340645wfc.37.2009.04.23.03.10.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 23 Apr 2009 03:10:40 -0700 (PDT)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2009 14:10:32 +0400
User-Agent: KMail/1.9.10
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF76D@hiob.intern.dresearch.de>
	<gspddj$ctn$1@ger.gmane.org>
In-Reply-To: <gspddj$ctn$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200904231410.32258.jay4mail@gmail.com>
Subject: Re: deploy multiple kernel image types
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
X-List-Received-Date: Thu, 23 Apr 2009 10:15:18 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!

> On 23-04-09 09:31, Sledz, Steffen wrote:
> > Is it possible to deploy multiple kernel image types (e.g. zImage and
> > uImage) at the same time? As i understand it right KERNEL_IMAGETYPE
> > allows just one argument.
>
> At the moment: no, but I would be interested in such functionality for
> boards using kexecboot initramfs inside a uImage that will load a zImage
> from disk.

I hope one time I'll find some time and improve kexec tool to allow uImage 
loading :)

-- 
Yuri Bushmelev


