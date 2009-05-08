Received: from [209.85.221.136] (helo=mail-qy0-f136.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1M2MpH-0006kc-PM
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 May 2009 11:57:07 +0200
Received: by qyk42 with SMTP id 42so2250882qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 02:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=erQSHkTLDpvtDbZlSJuHXk/gw47SS42J7x9ldPwmb/g=;
	b=fnbe/tukpea5ltpf3oxTm+7a2BEvRRNohR0ni+ie2J9SVfbfgosfn+ot+7OSUbSKTh
	wXgJBM4yVTB7cA+FUOnar37ZB1vj99EFXDJefjRgMiPG8HJEhhq6gfNJoqE1dtJtMThg
	XPr+bfEk3dbX7lE/d/8P54w1684lyT0+iQZmY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:message-id;
	b=JNfKXJ8pqhoMQz50N24N1JhrcAAe/YUIg7rMyksYjcgt/DZwHNsOUJCBchvT/a4EYI
	4KnWzJ9PJVJrFVKvPAmoRfspQzZTW6F2cFvBb/TvxspS17Bt3+FXE8KOFAVuG4lJXh3F
	HTuqhhICl3afUkWb2u4k5mrPwcJpx5S2ACRPQ=
Received: by 10.220.97.213 with SMTP id m21mr7629048vcn.27.1241776253830;
	Fri, 08 May 2009 02:50:53 -0700 (PDT)
Received: from is.home (93-81-71-33.broadband.corbina.ru [93.81.71.33])
	by mx.google.com with ESMTPS id 5sm1604313ywd.55.2009.05.08.02.50.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 02:50:53 -0700 (PDT)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 8 May 2009 13:50:46 +0400
User-Agent: KMail/1.9.10
References: <87eiv05wna.wl%peter@chubb.wattle.id.au>
	<200905081150.56405.jay4mail@gmail.com>
	<87k54sj964.wl%peter@chubb.wattle.id.au>
In-Reply-To: <87k54sj964.wl%peter@chubb.wattle.id.au>
MIME-Version: 1.0
Message-Id: <200905081350.46595.jay4mail@gmail.com>
Subject: Re: How to boot Cacko from KexecBoot on Collie?
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
X-List-Received-Date: Fri, 08 May 2009 09:57:08 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!

> Yuri> Kexecboot have no separate initrd. It is kernel+initramfs
> Yuri> 'all-in-one'.  Kexecboot is 'flashed' as ordinary (e.g. Cacko)
> Yuri> kernel.
>
> Hmmm.  When a do
>        bitbake linux-kexecboot
> I see in tmp/deploy a zImage and an initramfs --- are you saying I
> need to flash just the zImage?  I'll try it on Monday.

Yes, exactly.

-- 
Yuri Bushmelev


