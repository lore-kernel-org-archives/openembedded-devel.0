Received: from [72.14.220.158] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1LT4MB-0004ik-B9
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jan 2009 02:09:11 +0100
Received: by fg-out-1718.google.com with SMTP id 13so154564fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2009 17:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:message-id;
	bh=PbXADPSnDGrguayWWRq1Vs5Aob94G7o4CWhw92ppGZ8=;
	b=mIQd6znqGxlA8ko3NYOYwSseRduuPHph/J3M9qWBl1BxixyPZ+7Q7OQOtvGP2vMM3a
	fA3X0qnsb7WHRBYN/J0Nw/jzFCf9l8S3vDYNkkmun9eFBcEu4t/1PpFgepd9nxS7wAlf
	aaMWhmM8QpibjTQWQJj4oG0JIBsqwHYgOs/KM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:message-id;
	b=XpHF9YpKth676hv7BPQm3YSPQ/3K1FpA53ndz9wqZQ0xT1rpn3LyWRwFSyw9nulXGu
	BosCmCVWdHpxnafkD2JYzwyE8A2cQVJbaRYqaoTmUdCmlSXHY41bd5eMNq/NF9/PSUoo
	TJsvupGewIX1IW2Y4+P0mysE02lA2qVwl6gSU=
Received: by 10.86.99.9 with SMTP id w9mr952904fgb.68.1233363683718;
	Fri, 30 Jan 2009 17:01:23 -0800 (PST)
Received: from is.home ([93.81.136.171])
	by mx.google.com with ESMTPS id l19sm540504fgb.47.2009.01.30.17.01.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 30 Jan 2009 17:01:22 -0800 (PST)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Jan 2009 04:01:11 +0300
User-Agent: KMail/1.9.10
References: <cover.1232244759.git.andrea.adami@gmail.com>
	<8c1396b3add963b97e1f9f144c1bdd966ebbce02.1232244759.git.andrea.adami@gmail.com>
	<4c945c9a1076160cee628241443c8a27d8b5e1ca.1232244759.git.andrea.adami@gmail.com>
In-Reply-To: <4c945c9a1076160cee628241443c8a27d8b5e1ca.1232244759.git.andrea.adami@gmail.com>
MIME-Version: 1.0
Message-Id: <200901310401.11885.jay4mail@gmail.com>
Subject: Re: [PATCH 08/14] zaurus-2.6.inc: switch to kexecboot and deploy kernel in /boot
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
X-List-Received-Date: Sat, 31 Jan 2009 01:09:11 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!
> ---
>  conf/machine/include/zaurus-2.6.inc |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/conf/machine/include/zaurus-2.6.inc
> b/conf/machine/include/zaurus-2.6.inc index eee7631..8adb3d5 100644
> --- a/conf/machine/include/zaurus-2.6.inc
> +++ b/conf/machine/include/zaurus-2.6.inc
> @@ -83,3 +83,7 @@ zaurus_make_installkit () {
>  RDEPENDS_kernel-base = ""
>
>  KERNEL_IMAGETYPE ?= "zImage"
> +
> +# uncomment this if you want to override the legacy layout
> +# and deploy kernel in /boot
> +require conf/machine/include/kexecboot.inc

IMHO, we are ready now to switch on kexecboot by default for all supported 
zauruses (at least) in .dev branch.
Kexecboot is stable enough (except some issues with SD/MMC-cards) and 
usable. Updating/Flashing procedure is still the same as before.
Why not? :)
Is there any other opinions? :)

BTW, I'll upload screenshots of kexecboot running in qemu in akita emulation 
to my picasaweb: http://picasaweb.google.ru/yuri.bushmelev/Kexecboot

-- 
Yuri Bushmelev


