Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SVMsl-0001P3-Eo
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 15:06:11 +0200
Received: by wgbdr1 with SMTP id dr1so2472815wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 05:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=OlY1yVCRko3SF2lHdsmwSXzlsd0/JYtGz6/NFELT8rs=;
	b=kS5YgyWSDYheGADhrZV4UvutTMY6ClVcv9VfpPE168Oeqffz27vu3U1GpNzYERDP98
	vky/yovH2zY47dZUYsGI6mJKwwF/C2PUj9q0pVNZLnvw5y3Vawhpqc41S2iIGlN793Uw
	nOBOJzIcFT7dPPDtWhoV1BIrpHZbh5RkfPB1o8XUTaMlj3GHPewgPwEKzi1cVPNpGVl2
	T2vgoagug8wvJV3CiTxbI8lhQvW84MW4FA6K5Qyy7dyR56dZQOx6sZ50tb4uaeulvbn3
	E/bJA/v6Nv+hDNdTBsUNCggVHarIVo1d45kYcUfipctZELhg9XiiuE4Yu+nI7Htc1aRM
	66jA==
Received: by 10.180.102.9 with SMTP id fk9mr10581312wib.1.1337345767836;
	Fri, 18 May 2012 05:56:07 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fm1sm824802wib.10.2012.05.18.05.56.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 May 2012 05:56:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
Date: Fri, 18 May 2012 14:55:56 +0200
Message-Id: <C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
To: Thilo Fromm <fromm@dresearch-fe.de>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQnfPUkIqS3+xEBmKyHsksHoYDxVZV7HW8vSc1i/9CAIB8rIPlSPsC9fZdQCGZ/0HwxvrgRZ
Cc: meta-ti@yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-ti] ti81xx-psp-linux-2.6.37: broken kernel with gcc > 4.5
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
X-List-Received-Date: Fri, 18 May 2012 13:06:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 mei 2012, om 14:53 heeft Thilo Fromm het volgende geschreven:

> Hello Koen,
>=20
>>> sorry for the cross-post (openembedded-devel, meta-ti), I think this
>>> affects both projects one way or the other.
>>>=20
>>> Recently, meta-openembedded/toolchain-layer removed gcc-4.5. This =
means
>>> with oe-core + meta-oe you now can choose between gcc-4.6 and =
gcc-4.7.
>>> However, both compilers break the kernel we're using
>>> (ti81xx-psp-linux-2.6.37).
>>=20
>> What happens when you disable the mailbox? AIUI you shouldn't need =
that on
>> Ne/Ce.
>=20
> How do I disable the mailbox?

In the .config

> What do you mean by Ne/Ce?

Netra/Centaurus, dm81xx, c6a81xx, am38xx, am39xx or whatever TI is =
calling it nowadays.=


