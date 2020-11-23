Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.29049.1606097494681410420
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2020 18:11:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=akSjDjox;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from [192.168.0.113] (75-58-59-55.lightspeed.rlghnc.sbcglobal.net [75.58.59.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B62F020936;
	Mon, 23 Nov 2020 02:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606097494;
	bh=3+HJyxdtrMMP2QNClz0FBgdHsM0vYtlnu9MrftBbIY4=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=akSjDjoxKIT41wjI7IUor+MDHBfoaXqexRj6iEU8lD35JPJR3iz4n3m+EiW1K6gEo
	 MvVW/Jv/QrlP8RgzWYuXElqEDqOjT0z7jUt18/kF19ofbZeosSPdPVLWQQNlAAuw2L
	 3irX0lcN96nV5I7ctOJ2DrZkOKEJ3/G89pTvDnGc=
Subject: Re: [oe] [meta-oe][PATCH] cpp-netlib: add bitbake recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20201121032832.21540-1-okaya@kernel.org>
 <CAMKF1sqydOH5teADQ8f3iDsR-2K96DT4dELN63kD_u7A8rfB9A@mail.gmail.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <be3645d4-58a7-f330-dbf1-d8ae04121f2c@kernel.org>
Date: Sun, 22 Nov 2020 21:11:31 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqydOH5teADQ8f3iDsR-2K96DT4dELN63kD_u7A8rfB9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/21/2020 2:20 AM, Khem Raj wrote:
> can we add it to testing packagegroup too please ?

hmm, why would this belong to testing group?

This is a support library for networking similar to boost.
