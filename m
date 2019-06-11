Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF837E637
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 20:31:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45NhVV2qn2z4x;
	Tue, 11 Jun 2019 22:31:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560285090;
	bh=AcHhg/oL2th+sp7/bgJDnirUkE+OttvWPBO2XATLI6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EMkXRvAktovLUJKEDFHlsikSpk48irWtWsnmIlKh1mq7aBaSJKYC8L0YMX9Dd55Mb
	/luE70dTDZlHxy35BcQCGFXOljsPMdCbISVQll+7ERqHSCDz8aMEACNFmedrMRB+Z3
	n+QDRSRC3FN379Pq0QMLQhcR2ETyG5Z171CPvBlTcZmy7TkKnwsrs/20nJ/pOsuvV0
	Wofs7N61QAFMUnHkjhd/Fx+L7/uesrRw7/NDiIJwiogm/ixZnqwpUldylmn03FGMtf
	b4j8yXsuNrPnGjo0DZkIU8vdd9VSvKYbMCE83rVgEA5bUNeLov8B9jHFcvdnU7ooOh
	IHH6tGGVwMLwrC/Wf8qP8J3/1pKlK3vvkqTQwr5szMlPDiggGmKVBdOrqqJ9WW00Sq
	8Tzk1qOe6gA+uiPVsFnTYAT3sNFiw2PEERoofjIYfg1Q08nNMWcwfmWldNv3BPiMix
	gG2+ACrHBPuk8uWfZUUcqYvVzQUxtVi8lZu74Si64/eGLwWamJaqlXSngnUGn/56Qo
	ImgAprSgcFjDBO5hy0y+DwjlfKNGyDbrlhvV57kSNndQREHPNDMxEsAtdxwt+GlUm4
	ndY8UcB38ffXQerlXIGINwtC2cmaWpLWXjm8Vd8aXYAorPhPLLAep5UKnhphUbtj3b
	gYVhT6AuWzQHvavcBQGz+tU4=
Date: Tue, 11 Jun 2019 23:31:28 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190611203128.GA32661@localhost>
References: <20190611165504.23049-1-Martin.Jansa@gmail.com>
	<20190611165504.23049-3-Martin.Jansa@gmail.com>
	<20190611193339.GA18027@localhost>
	<CA+chaQe8r6WkwAmMTXk6bd9SPGxymV_AhUOzMvNFai37FYiDQQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQe8r6WkwAmMTXk6bd9SPGxymV_AhUOzMvNFai37FYiDQQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][warrior][PATCH 03/11] oprofile: make MACHINE_ARCH
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
X-List-Received-Date: Tue, 11 Jun 2019 20:31:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jun 11, 2019 at 10:04:03PM +0200, Martin Jansa wrote:
> fair point, I'll try to remove the dependency and see what breaks, it was
> added couple years ago in:
> https://git.openembedded.org/openembedded-core/commit/?id=16bc366877a2e02d96adb91b90e30710777e6f09
> are you sure that the explanation from back then is no longer valid?
>...

As far as I am aware this is the /usr/include/linux/perf_event.h
userspace kernel header.

Loking at configure.ac it seems more likely that any problems would come 
from there than a fundamental dependency on a specific kernel.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


