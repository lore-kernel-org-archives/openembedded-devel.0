Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 884247FAB9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 09:46:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4733WZ5vNXz5h;
	Wed, 30 Oct 2019 10:46:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572428811;
	bh=Jlo0v8QOFAo4dluGUYWxczKcmHrZ6NlKRABTaFOQaSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YTRTMorenfObkndvw1qrebO/GHg9o6oNKdEf3sbo58cHmqd1t16LxgT1jimE8Ixbf
	dvPwygCgQlGA9nojOBMZPH8D+oh1MlZzKxcvznxqjvz1X2piB8vZur3DCqVBe7g4p7
	am0m4XXrwA7l8Kn2M2I2HXJ16tfkRI0DGhFVcpcnENswUUkTYr5l/O4nDVeZEvOZre
	ytNZYrVpudOkgwHvOO3Ej7dGRDAwZRdZ/6Ep5sY6U3zqJy3z3i851Iv1jvV5PRsx5I
	RuwWmH8K63ZIalMyEl04gc0SBKsg1iu3PyirlmgZ0cusBQYETeODLW9DYhVfc6/qzc
	TgWXTCI1Ucr2Y3WqLkUvausTcJIHIEJpIvEyCTqdzDkNMXMBJqxajT8PIW3nXaqWCK
	OtUPz4YfDnsJqA8onk0IwuiJrkm4zp7mKy6btxzC731BLYyuzcaFc1FIOZXEvBZO9d
	xWVyG83+rfR0laZQe9Hz725ThBGTgvCIBng4SuVyW9D7ks2wTUHzDQdb3JAOLMcRiA
	ZPDpuKWPmubXPON73Qx0o1UbR4Y70biHBHltnqkw0z8dkMDNtw6pj88SRUXXYikjCQ
	rntScCauWoCrPDKWMd20eEtsDZJi/YQ6pM8gAk0VcbwUo0FO2ano0UFMYaojaFYiOu
	r8xpUP5Jat1a9K2+jOdTT468=
Date: Wed, 30 Oct 2019 11:46:48 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Message-ID: <20191030094648.GB27883@localhost>
References: <1572455024-33549-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1572455024-33549-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] mtr: upgrade 0.92 -> 0.93
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
X-List-Received-Date: Wed, 30 Oct 2019 09:46:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Oct 31, 2019 at 01:03:44AM +0800, Zheng Ruoqin wrote:
>...
>  PV .= "+git${SRCPV}"

Please remove this PV line, the SRCREV is exactly the release.

> -SRCREV = "6cddfc6e8f0e20af4af218b545f83d43b3f9a387"
> +SRCREV = "304349bad86229aedbc62c07d5e98a8292967991"
>...

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


