Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web12.44813.1606176259923978176
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 16:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=ocyHRdxE;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from [192.168.0.113] (75-58-59-55.lightspeed.rlghnc.sbcglobal.net [75.58.59.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8119B20731;
	Tue, 24 Nov 2020 00:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606176258;
	bh=y+kBE0FL9UIx8IL+jFpigVHKum0wMfgpLkYIUnLX7OQ=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=ocyHRdxEAfKhaGslbjtHzKKvn22OJBwfer5mUMmBNpGwOst5kDvVaIoIBoGANDkba
	 tmpQmBo+vmlysM/SuepRg7mZoAriMvUXgs6k/HHWbuxPgyH0rrj+9cit+SxPU+4ySY
	 QQ7bBTiMrvn7jjnNJMv6S/Q8W6rbqtZDtx7UbBMs=
Subject: Re: [meta-oe][PATCH] heaptrack: Mark RISCV host incompatible
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201123235417.2012834-1-raj.khem@gmail.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <a9ac4751-3b7c-18c6-8c76-44112829d710@kernel.org>
Date: Mon, 23 Nov 2020 19:04:17 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201123235417.2012834-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/23/2020 6:54 PM, Khem Raj wrote:
> +# libiunwind is not yet ported to RISCV


Small typo here libiunwind vs. libunwind.

Reviewed-by: Sinan Kaya <okaya@kernel.org>

otherwise.
