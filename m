Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B42E17FB60
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 21:42:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472lRH21GXz65;
	Tue, 29 Oct 2019 22:42:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572385323;
	bh=3RxsJ66sABL4dDVaTNnIhp6L20vqvW3Qb1oHSAc0aF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ib4rg8k8z8Pd34mmpBYv8zJvq9P+ObnHkfVkkvlyvOg+HuJMrjYUu5sAP0dTbjQHW
	3YcPE36AZIxaXf13ONbxzyvKV8QVdBzmVGIbHuX7uXW1tBMoOpG6je4dxB9DIsagFX
	rGagkhP8TJsTRu6L/OYiDnAqkMD5wCXmKtxm0r7IWh8NiRFJZCP5t/TvRABzLnxeFk
	LLou6yDfFjN00HqoYubFKzAfDWwDG3mDBA4f7etb01lmYmrA3/yMix2S+zUKqa2FLj
	DGguZkeiyLL749J/wDpc3rbeu3bO1mvn1iX57EphC6ETCWn8M8bBrwT8sXb0DidxLh
	R+5p0HjHR8ghhNSmksAHN6Hagbwj4UKm5pqfJ8wkqKj7ixgtRWXkMbRZHlVt+i1r6N
	QDm2quECo3cCIv/4BQLbO/zkc9mge3iI8UZS/keafjGzN+gcYyiFWrwP6ilHja/6jD
	DeaxXFx82nggC8koqZuXrtkKqkdrnKDCsaUGO42v1C5bbejgwR8eVRsXzharkVuCT6
	MSAmOQ+4NREpHqVzz9yucS9ys1KrBJXB+Cl20/LMeOHEA/C8fUaruqtubmCXP167nh
	tGtJ3MqEnldMnP6f4j+URmpYMUlirYmJLLSSGc18l7rJi90s4yRdWcFxsx4EJVfX02
	uxJ6FK8HRTdGkk9QxxEaZkzE=
Date: Tue, 29 Oct 2019 23:42:01 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191029214201.GA5048@localhost>
References: <20191029090657.30771-3-bunk@stusta.de>
	<CAMKF1sqRRmqEaLMcYDrO-Ae8XcuDNqVJKVnutG4K4rfUp57GuA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqRRmqEaLMcYDrO-Ae8XcuDNqVJKVnutG4K4rfUp57GuA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] mdns: Mark as incompatible with musl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Oct 2019 21:42:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Oct 29, 2019 at 10:23:46PM +0100, Khem Raj wrote:
> 
> this is fine but please adjust
> meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
> accordingly as well.

I already considered this, but when I tried building this packagegroup 
for musl it failed on some netkit recipes even without my change.

> secondly, ntp also has a packageconfig for mdns its disabled by
> default so not a big problem, but it will be good to error out if user
> enabled it when using musl.

ERROR: Nothing PROVIDES 'mdns' (but /home/bunk/yoctomaster/yocto-test/sources/meta-openembedded/meta-networking/recipes-support/ntp/ntp_4.2.8p13.bb DEPENDS on or otherwise requires it)
mdns was skipped: incompatible with host aarch64-test-linux-musl (not in COMPATIBLE_HOST)
ERROR: Required build target 'ntp' has no buildable providers.
Missing or unbuildable dependency chain was: ['ntp', 'mdns']

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


