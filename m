Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 62C746C1BE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 09:37:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45xHmS20Qsz4t;
	Sun, 28 Jul 2019 11:37:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564306664;
	bh=kOWnYWpSKYh1pswzbmK1pcgF26pZQE8NjxtZjdsDqK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hK4TrFK3abuVZQZCB2mFSdJqm8GCeOZ3usQ8tchvv3oTn2k8xrCHJNSBS0rmOvfTR
	Rk9AQmrzwm/9Y1isNvO4datdeGeUu6XfL3/nqOFl1lZ/gmnfe4w9JJ0WHy2DHtNc/I
	qNAXIcD8VQ+TYdR9XpQStEmsnvqAgzgqDSUuiWb62x6RVKaXXYUwi1rGanv8yB4i8i
	3d9tnG4QMTRZTHsVfUcJ2WJCnjOx4Sj88QmwUGJpnpuYLLlo7fmpwy2tKba40gq6/Z
	ou2ZnaLd8+Acdqd5fm4RBmwDYYwp0VkwgivRhGzPOm9bNh/3enSTBXh6eE0kGCEtec
	yn3C30PZP05X6p5BNKTzMNFnqtT+lDTewoMY/0sog3vhHqSBeINTjoUd1Z9j0YhVbU
	K4Qy6A769pqSSeQLfu/SlCpatOxn7XXY+llNgRxS+Br9L+fOcdW+cmwUkqLiCWwrh0
	BfNWzF7+SfC7a/DK+K9NEygN4khA6TPsgwl380xlU86PLj1JBHgm3gf5796gDpGVnr
	iBABqOhj++MlOIQafQVRoSD/jZs6o8ylGIDuSzzEmBVT5mYzmvJXd5+nlY22r0UWZQ
	6GGCWTLTOSuJRDSGYu5aCbzlDCcv1G++nPfivct801GfNVnxnpBJOCFm1FXVed/zVY
	6rGRfAdkNMXAyMBqA705Ovek=
Date: Sun, 28 Jul 2019 12:37:41 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190728093741.GB15666@localhost>
References: <20190727200614.5661-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190727200614.5661-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/2] collectd: Fix build with glibc 2.30
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
X-List-Received-Date: Sun, 28 Jul 2019 09:37:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Jul 27, 2019 at 01:06:13PM -0700, Khem Raj wrote:
>...
> +Glibc 2.30 has added deprecation notice and collectd detects it as
> +warning
> +
> +Fixes
> +sys/sysctl.h:21:2: error: "The <sys/sysctl.h> header is deprecated and will be removed." [-Werror,-W#warnings]
>...

This package accumulates patches in OE that could be avoided by 
configuring with --disable-werror instead.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


