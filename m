Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 11C717E168
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 09:44:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 457W74584nz63;
	Tue, 21 May 2019 11:44:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558431840;
	bh=yaD4ZKPufR2FnFmlSdwuhGznuwrvz7EsnmuHmxt4Q4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ozwFJiBKSCThJiaM8vnOeb4Tdvb7UHCTqFA/7pxw9QCqrKb146dk5IUKfefhIAHKa
	yyhrxiNsFTccjnGbonQ4/WzAY4nmMhck1vN0FzdS6neox4/NW3Lr3QO8LsD+K1EzTM
	5yA/5GZTdoV4PPK+0iPtLH4p0YTrCWlnKT5Z79fwYpXDmWL6gyHvDPaoJCCNd5K6tO
	GJu8WecTwYiEFMlkEg3ShjVciWzeXZ4QvHS1XZ9IiTlkODxt8HXzgiEMNw9oWFOuR1
	iEkvwDhbY0Y3e9fci0ECJNId1n4fnjDH6EvD6ixxMA1+eicsUTcgQ/mVYsi3JdgE65
	4Q43gQMEbBxapbQNcWOFuNYn5FBhCl7gK05fNUhJ/Hmcun01c4z2HUqp19607blnMH
	uAIsh5f3D9q4co4fXv4wXYVWmg+lgpgizPY3QVSHxBNjiw7DlF2oe0QbI/BOXuMQ+i
	7jFnKvIzsG/DkogirYcqWev6wyk/RPF9JNZfWXq3c8k+UnxrOcV05VEEvDmOYEUV+T
	sgSCVS6zTBvWEhvgK+MTICHfznwpx6hjXejXZmL0+QMBF0zOUnk+Z7+PrSZJQxLV4R
	0ptLGHoZEBAU55AroMrMhMFotOxe6gkaSh0Y+VcMuNTmK8eI0N6hb78mhxa4NU2Nmm
	99FR2u/wb0sFd9FoRMmUnlns=
Date: Tue, 21 May 2019 12:43:59 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190521094359.GG15108@localhost>
References: <cover.1558410874.git.akuster808@gmail.com>
	<0b8aa0188fbc0886b5211bbfca897b8894b5fe15.1558410874.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0b8aa0188fbc0886b5211bbfca897b8894b5fe15.1558410874.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][patch 25/34] ebtables: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Tue, 21 May 2019 09:44:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 20, 2019 at 08:56:25PM -0700, Armin Kuster wrote:
>...
> --- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> +++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> @@ -12,6 +12,8 @@ RDEPENDS_${PN} += "bash"
>  RRECOMMENDS_${PN} += "kernel-module-ebtables \
>      "
>  
> +UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/ebtables/files/ebtables/"
> +
>...

Why is this being backported to a stable series?

It's harmless, but also seems pointless.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


