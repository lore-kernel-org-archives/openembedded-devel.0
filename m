Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
	[209.85.167.173])
	by mail.openembedded.org (Postfix) with ESMTP id 841417CD8F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 16:55:09 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id b4so20026791oif.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 08:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=s2zMPUiw4yGWb6SoTK7hw/7XlOHxaG/EiI9mTse+03I=;
	b=EemAvERMVavQUIBf0M8EljjBXRszaPm3O4rWgSK/vwDMphmqA3WADYocv8/xrQxWUB
	lFWHMBcnnMQSTZfCat3J/QA1IsEUHeg6iMOA/iEOZaL+MrUtSsJSkUwBANGDsjdbgZXF
	sPN6VB1FXzNOWNVHGImFLPQ/iIsb6eJFpXb+khVJzqFnpKy4KP/NEhnqU3cfFdoqlAiP
	s4r+8b1NqaFflftsoOJJxPaJVEm74xcKwr/yFlIM1AyDeZn/NjP9E3PD6AqFTkjsFGvf
	UDuQQFwJyH4qYbapm/UNUOF1bNeG3rJ6b9BweGipHi3UyI8V6N/xQ2wbPyfCFJucDEAw
	qydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=s2zMPUiw4yGWb6SoTK7hw/7XlOHxaG/EiI9mTse+03I=;
	b=FomcS0mokurZotuW98wQNRA6p5G4slm68gSaw/Urvmz0oT1uX3mEundzbM7HddHrmC
	jDCp2qzZxV37mF+ldi3K+WYNixuza5D/b27WlwbzOBNEUOAIc79CibeolN7HJ9LaET4C
	vaJMuicWY1HH35VT/ivWoytqjQ5/AnydR8PyzqjnzSvtR1pXCik+a9ikhPwNt1P3+BpG
	K+vkoS7rJ0r8j6Yc0Olmih9R/8c7fthPIxlv88lHYP94VCYGo/3WugAbWHYvRI1e4mCF
	lWBqrbud5NP/eV7kCLk5er4GzWYxynPH5bvJg9FW0QdogJdBAly0fLmWwiO8c5tMp/47
	t6rw==
X-Gm-Message-State: AHQUAuayFJ6t/IM3f7GMQmZPp0a39J3RmalqwT4TUWGotT71Q2cAQ1tX
	JVyQ+XLGD5yj7ahFBuE/KuNyRRk11ZU+nA==
X-Google-Smtp-Source: APXvYqw/R8TxIso9j0e+/cjGPy6qEX0JYRfYGKlChmknAnNqQXuK5CatY8cNA1gR83SZLaTFVoFK4w==
X-Received: by 2002:aca:5648:: with SMTP id k69mr3921469oib.107.1551459309766; 
	Fri, 01 Mar 2019 08:55:09 -0800 (PST)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com.
	[209.85.167.172]) by smtp.gmail.com with ESMTPSA id
	g3sm10185725otb.66.2019.03.01.08.55.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Mar 2019 08:55:08 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f172.google.com with SMTP id i8so20001620oib.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 08:55:08 -0800 (PST)
X-Received: by 2002:aca:54c5:: with SMTP id i188mr3957823oib.16.1551459308297; 
	Fri, 01 Mar 2019 08:55:08 -0800 (PST)
MIME-Version: 1.0
References: <20190225140010.19025-1-otavio@ossystems.com.br>
	<CAMKF1sr88He+DDgyaRWdabY8d0xuV5jM8faQgBSeYOCY0zpaYg@mail.gmail.com>
	<CAJTo0LZFz3mLSROPrV3y09L4ZTSZ5T+uO=8MRKmrReDoLLDf7w@mail.gmail.com>
	<CAP9ODKroyRVLaK640+UZv2idv3FnZ2NC8hgMqQDQU63f9-QQiA@mail.gmail.com>
	<CAMKF1sqbAFbXdeJTL=gtJU4QzdPwdwEW5R01gpnUx4OhB_YtjQ@mail.gmail.com>
	<CAMKF1sp61cfBXHTuPzMeQGfuK3SXv2h8kdDq5z1nAhC9_hUTLw@mail.gmail.com>
In-Reply-To: <CAMKF1sp61cfBXHTuPzMeQGfuK3SXv2h8kdDq5z1nAhC9_hUTLw@mail.gmail.com>
Date: Fri, 1 Mar 2019 13:54:55 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoj1oH2CaE8jzd5kKz7mv_6sdD-R2YZC_uAK_ezyfHs4w@mail.gmail.com>
Message-ID: <CAP9ODKoj1oH2CaE8jzd5kKz7mv_6sdD-R2YZC_uAK_ezyfHs4w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>,
	Maxime Borges <maxime.borges@strataggem.com>
Subject: Re: [meta-oe PATCH 1/2] python-idna: Avoid removing '+x' from `.egg-info/` directory
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
X-List-Received-Date: Fri, 01 Mar 2019 16:55:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 1, 2019 at 12:56 PM Khem Raj <raj.khem@gmail.com> wrote:
> Can you resend this patch series, its missing in patchwork, so
> hopefully, it will catch it this time.

Resent.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

