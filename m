Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.2728.1589911252842735865
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 11:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=KlS8+Khy;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=ypzx=7b=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49RNwF0yRxz3l;
	Tue, 19 May 2020 20:00:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589911250;
	bh=t1v6l3p6IkXaogkIc7a1F3nVjsT7unalJmFRfldJsS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlS8+KhyjvfG0Hq9fCbSaIc5IAIJR3B4Hwh2d4Lz4NCGTB4PhstjbTmNlqUOc66YE
	 hoVC3Iyv3LdgHJHlsf+1z3EVeQJAK1l2UDa3jlJ79s2App1rQ5WF3MQzgNrg5wHd7/
	 +ywknQqnEVj0edggaAV3a2E0feSNIvd1qdJlui12VeQ14rj65yTNjXSq81nyTrJqAI
	 y9GJQBw3LHxSD40E+rtDxJ4Tw54brEvAPsS/12ayso21OlQmk5kwYlq1Xzfb5/2//f
	 egvX2lbOljusP9f0+eFs4494uff0fJM57EiKsB6+99B91hXLoYB8urAlRnSwNpxZSH
	 vqzcxAZ+zueWzG+7CQHewBwdNgqcdaEuMs4/r1NL3HXu6eE7FqzEVxd+OkHk9U+uTy
	 sUoic7U231k5SikKL96/roLAHdP1ZgHzJxIN4mvNd7JUKctEKN5W/Q6UcgAO+FhU6l
	 2E+UDap1PVT66Igvgs0iSODyWwQyJgK7YSyxE/uqz1oBhpgqsd7Fj5Qra2xTuwl9D+
	 t+N/w6QXAFYIaknZdQ4/w5xoGyEz0Zt+cyCcfkOOt0QGAOr03eYLzwDfoiD644mrzn
	 +LIkmzYmskFSlIQ42KyTxx+Sm+rWREYuOLac8qnEP7IDp6cT9d1Ut8KKJxW01AVbQa
	 RlZaLoImYWH8UL6Vdl6BoprE=
Date: Tue, 19 May 2020 21:00:43 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Mingli Yu <mingli.yu@windriver.com>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [oe] [dunfell][PATCH 11/18] gnome-themes-extra: correct the recipe name
Message-ID: <20200519180043.GA17566@localhost>
References: <20200519144332.12822-1-akuster808@gmail.com>
 <20200519144332.12822-11-akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200519144332.12822-11-akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 19, 2020 at 07:43:25AM -0700, akuster wrote:
>...
> So rename the recipe name to reflect the
> current status to avoid confusion.
>...
>  ...nome-themes-standard_3.28.bb => gnome-themes-extra_3.28.bb} | 3 ---
>...

Change looks fine for master, but not appropriate for stable series:
This would break existing distributions using gnome-themes-standard.

cu
Adrian
