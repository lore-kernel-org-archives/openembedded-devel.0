Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
	[209.85.210.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0A63D7C8E3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 18:38:20 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id n8so8736625otl.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 10:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=uWA4juYjTl1QHAjAG3L5YvfRuO5GKzwsK+zTbfGwoLM=;
	b=ElO3ma7cn5z2YRU/X4GkjSkS39CMY0aoZtylRS3QrSPYJB0/oyC66wx+GJiP+Hsz8s
	WIFAccc6TJGCb1ahEtdywY4E8B2YyuKn9V9SF7J7KFp1zBMCzcHN4vGe4flatS61FvQK
	ZeuVQw7tg/NUgWuQrJdoL8l1Zj228Whk1jtTFVqztvcodUHjSbgnGHJBO8FQycbXqgiR
	XaB3aISxx/d5jouIPnk+iArWG3UZAYU+WKuWJDp0O/OFYPKzdrDzhnAIYHos0x3FvKLN
	Wei+wARosZzoU/Knhj1I6OKY/pRVDT3nimG/JHjc+GSTbrZrXc5UH4aNGGVjw/e9q4A3
	6leg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=uWA4juYjTl1QHAjAG3L5YvfRuO5GKzwsK+zTbfGwoLM=;
	b=BDf0wyjuIiEtGE226tzejMndj21Kvvu47MTurUiI9KulKW5gQ4LO6NoyevvIMhAWDI
	INKWAe+5kLUeJBRWIGha/SPO8VVPFj16MGCtzU08OBw/JwT+E84qRescK8135FWLVSeO
	SUrqOUUwM4lkUt8im29xcIAp1cnq4CkTJKmF3Z3FwWXp2yL//wEQbo1Tk1b46sAKXcKd
	Qep0XsSraXWoHsaYEBPuR0pMTS28mepaJiKWDRGXjpNuA1VpC3Dcz16wy8ZMUxNE7uT8
	vCVoP1v6AjSH8/sZ80yQhuWIcKh6JCpB9jekb+Prcilw1F6YTN9ucoLrW2nW3gRNDPRy
	VJDg==
X-Gm-Message-State: AHQUAuZKuSxWF1UmiosXWm3smS/FCdY3S3poNkreRuYf/hQoBvB2ytIn
	KaZOq55tLSseIHk5TbHVm1ChrKpFpXBD6g==
X-Google-Smtp-Source: AHgI3Ia99eZE0ETtmyDCW37jtNlKncu8i7vatQRtsOBTU6kg+1+o3GZid5mOCZOzaK7cH0RwCG+3lA==
X-Received: by 2002:a9d:6acc:: with SMTP id m12mr11962773otq.243.1551119901634;
	Mon, 25 Feb 2019 10:38:21 -0800 (PST)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com.
	[209.85.210.54]) by smtp.gmail.com with ESMTPSA id
	p188sm4691396oia.58.2019.02.25.10.38.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 10:38:20 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f54.google.com with SMTP id 32so8705098ota.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 10:38:20 -0800 (PST)
X-Received: by 2002:a9d:4799:: with SMTP id b25mr12833176otf.294.1551119900140;
	Mon, 25 Feb 2019 10:38:20 -0800 (PST)
MIME-Version: 1.0
References: <20190225140010.19025-1-otavio@ossystems.com.br>
	<CAMKF1sr88He+DDgyaRWdabY8d0xuV5jM8faQgBSeYOCY0zpaYg@mail.gmail.com>
	<CAJTo0LZFz3mLSROPrV3y09L4ZTSZ5T+uO=8MRKmrReDoLLDf7w@mail.gmail.com>
In-Reply-To: <CAJTo0LZFz3mLSROPrV3y09L4ZTSZ5T+uO=8MRKmrReDoLLDf7w@mail.gmail.com>
Date: Mon, 25 Feb 2019 15:38:08 -0300
X-Gmail-Original-Message-ID: <CAP9ODKroyRVLaK640+UZv2idv3FnZ2NC8hgMqQDQU63f9-QQiA@mail.gmail.com>
Message-ID: <CAP9ODKroyRVLaK640+UZv2idv3FnZ2NC8hgMqQDQU63f9-QQiA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 25 Feb 2019 18:38:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 25, 2019 at 2:03 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> The original patch doesn't explain what it's doing and is clearly
> going to remove executable bits from directories, which clearly isn't
> right.
>
> I'd say remove it, and *then* if it breaks again fix properly.

I am with Ross here. It is a really ugly patch and if need, we need a
comment on the code and a proper reason to add it back.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

