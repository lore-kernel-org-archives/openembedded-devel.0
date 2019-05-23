Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9846C44A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 12:02:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 458p641VCVz4q;
	Thu, 23 May 2019 14:02:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558612956;
	bh=by3UddLhg1DvCut6IbapduIt85hP0KksrNa73r6F4qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VYldlCyX/iBLWqWpnRaJgYUSmCZ2UDoon9TUdVUzCfNoxNwKU68fvQbEWFwfQFQtk
	TRqwauOdGmpiGiSYB/XZTtOYymS461fGuTYjbQhJMGtRmpHOkZGSrqyQy8ZBewAYDm
	LwEj/H1O28f5bAKuiPGdJ+3JMbAFPOFi4YHM4gg5In33ZC8xe8obe/47T6bDQ7y4L5
	brcMBol6Ufe9S4179iHml0FPtcSplVvk3KLe0DTQyOn2u4jTG1hf85JGUjgKMYrM09
	JuHnHCymxhyE1+O4sRCKm7vofyYhe/gooORcUBn9Ia0BQ41mMmqCukm8aj1Mtu5413
	jmxYfRx4+U5FDxtVJQYpFnPj3OyFliElbeA5HvOvQSrHdNht6IJqz22N6spdpVRjuP
	/XjeIveJp8UVt+vwdluHGscV9tZ8FSXdksLVdyRsA6GDaAPWLik54/dYY7ewsAiJq9
	M6iGtWsbVtuvl45jZON84GTTQbb1l2PuqcOv8Lv59OkWn6xbu9uCaKC0C78L8Jt1oK
	Al4YogZMSDU7t3RAd0JN7yjDMIp+BQI6VM1RVJW6z0HnOG78SWjOtgPDR/221EiiP7
	nXRCybtpjTXBrETeiGT2okl/YS8CI77wh0NqchIuty3D4baV6/eLi6SCxZI6ZZLRDC
	z+2SZs5FButJbixZsbJx5KN4=
Date: Thu, 23 May 2019 15:02:33 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190523120233.GB25084@localhost>
References: <20190523115505.18245-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190523115505.18245-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/8] uriparser: upgrade to 0.9.3
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
X-List-Received-Date: Thu, 23 May 2019 12:02:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 23, 2019 at 11:54:58AM +0000, Martin Jansa wrote:
>...
> -SRC_URI := "${SOURCEFORGE_MIRROR}/project/uriparser/Sources/${PV}/uriparser-${PV}.tar.bz2"
>...
> +SRC_URI = "git://github.com/uriparser/${BPN}.git"
>...

Why move from tarball to git?

>...
> +PV = "0.9.3+git${SRCPV}"
> +
> +SRCREV = "737e95f67bc2e5d8b90a1392797b353b52e5124a"
>...

This is the release, so shouldn't have +git in PV.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


