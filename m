Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 328B77C6EE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 10:05:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44djZp6ll8zJQ;
	Tue,  9 Apr 2019 12:05:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1554804307;
	bh=nrQBdHWbUI8LvGDusFJlD7Z0fBBM02LTNR3rcUJ97+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j6x8GePkNZ9oH729TB+cQYSKNfKo+NVJlRJOGh6FwdVimNzj7tfG27VULpd8aiu7O
	EehAzGUtnykQ5JxMwQyh+zGQTczyAiHQ8EO4Ot/bGXYtofBFmeWsoCkEJL4RY/Er9H
	kLlwHuWFaOHSoppEk7XSvPnMJmHMCM6yDKwx+WfPIIIPtQrsPKVrb6/b8VyL9n8qZN
	RrIdWjApxuuaJieaYleRNaRcorGOuYw5hKcTHyGTRGtY45yLCnY9h4BD5oUO58KAsD
	5KaorrJa6Hx2e+dG/lKb1GOJ5sUUIPvHvVUA5/Ky5mbd2lBPThuuYMJ6N9uRRKtEf1
	dMjOji30SzMPVprIJohRyM2cC41NXtjgWvx54lw47mCLzWyUUgx9vtz5aViZo3dt2u
	d43hOR4eVZ/cjZF2QtYobwM7F/4Mzzqs/zkPcjJWXICNM29rJUrIR1WqQP5RQ4yNV0
	PfEC6KbPIar1FJAHHCwpicGipXNY5/94lw5S1lKFmKbk8AglizqB2ugCxxxKOIN9Rp
	9E7+a/ynOg58vZXt3PTE4XMHsGq8ghCjlif0g57iSvrx89oHsr5v5xLuQ8M0j51lWG
	kNy2i1kVCLayEFiwglk0QheB8xcJdm6gG8sxiNcrzfAS7MhrW1q5/8AB1dRZTod3hm
	Zga0CHAsImahsnbsItO0bRB0=
Date: Tue, 9 Apr 2019 13:05:04 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andrej Valek <andrej.valek@siemens.com>
Message-ID: <20190409100504.GA12869@localhost>
References: <20190409084621.27294-1-andrej.valek@siemens.com>
MIME-Version: 1.0
In-Reply-To: <20190409084621.27294-1-andrej.valek@siemens.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] squid: upgrade squid 3.5.28 -> 4.6
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
X-List-Received-Date: Tue, 09 Apr 2019 10:05:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 09, 2019 at 10:46:21AM +0200, Andrej Valek wrote:
>...
>  - add openssl and esi as package options
>...
> -DEPENDS = "libtool krb5 openldap db cyrus-sasl openssl expat libxml2"
>...
> +DEPENDS = "libtool krb5 openldap db cyrus-sasl"
>  
>  inherit autotools pkgconfig useradd ptest perlnative
>  
> @@ -51,6 +50,8 @@ PACKAGECONFIG[libnetfilter-conntrack] = "--with-netfilter-conntrack=${includedir
>  PACKAGECONFIG[noatomics] = "squid_cv_gnu_atomics=no,squid_cv_gnu_atomics=yes,,"
>  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
>  PACKAGECONFIG[werror] = "--enable-strict-error-checking,--disable-strict-error-checking,"
> +PACKAGECONFIG[esi] = "--enable-esi,--disable-esi,expat libxml2"
> +PACKAGECONFIG[ssl] = "--with-openssl=yes,--with-openssl=no,openssl"
>...

It would be good to have such changes unrelated to the upgrade in a 
separate commit.

Unless there's a reason to do otherwise, it would be better to have 
these new options in the default PACKAGECONFIG so that a opt-out is 
possible but the default doesn't change.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


