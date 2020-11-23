Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.44750.1606175540953461741
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 15:52:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=xu+3gI4G;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from [192.168.0.113] (75-58-59-55.lightspeed.rlghnc.sbcglobal.net [75.58.59.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 18B6C20721;
	Mon, 23 Nov 2020 23:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606175540;
	bh=xE9pGDomiN/PSNi3WSwrz+9jcqwHVvrLARfm7/kuh8g=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=xu+3gI4GKIRii0XpY9xKXoIVRK2X3vOHhAY/Ww6BVtgP65ABNAhm3I5H6/GhTxntM
	 kkyJMn4lgfozMpbk0/gT44WYoYP0a7l+sPsdQVtDUDo2AykeGmIu58b2b1WZBpmUNw
	 2gm8TAAsdLvocrxkE5poGOXuwHGzG26/MeAp/RUQ=
Subject: Re: [meta-oe][PATCH] heaptrack: Fix build on musl
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201123234247.2010609-1-raj.khem@gmail.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <b0272300-d13b-2c30-279e-3594b624b9b5@kernel.org>
Date: Mon, 23 Nov 2020 18:52:18 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201123234247.2010609-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/23/2020 6:42 PM, Khem Raj wrote:
> ++#ifdef __GLIBC__
> ++#define NOEXECPT noexcept
> ++#else
> ++#define NOEXECPT
> ++#endif

Small typo here NOEXECPT vs. NOEXCEPT.

Reviewed-by: Sinan Kaya <okaya@kernel.org>

otherwise.
