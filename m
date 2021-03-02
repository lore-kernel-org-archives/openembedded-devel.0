Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web12.8061.1614689315971896531
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 04:48:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=BL7Q5i0w;
 spf=pass (domain: gherzan.com, ip: 64.147.123.24, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 8C4AD1485;
	Tue,  2 Mar 2021 07:48:34 -0500 (EST)
Received: from imap4 ([10.202.2.54])
  by compute3.internal (MEProxy); Tue, 02 Mar 2021 07:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm1; bh=59nuFrrR0qZFmswojx05VQ7KnziOh87
	rKi0JDtXNORE=; b=BL7Q5i0wQNoblHLU5NNyKwbDn19VrTzkFupBI7y5gUjL3Xi
	tC7OJIg5yGolZZ0PiZW2QNzdDyAcKx1qKmZAmlgAhZjp+cHB5p8SBf5ln3+VPaMJ
	Y6M+NCs/4V+ywxww4St42cHhY3Scjcd6jx9CUdj335CclaqkbIYUuos8aFztNSFP
	sn3CiAbCOqwvuG9EDiQlDuEgJIFsuBvAaY6uAyo2OcPaHMmwufTLePfj59wnmrsr
	8i9nS5zsePeLVVP4sv1dY3wsthx5lDpy4vl8bUvPq991R7tf6EpisPQPMS08TmfS
	zNBt8J6gKLWrgN8ioCiIB45Fj8aP7uz+Kl4/E8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=59nuFr
	rR0qZFmswojx05VQ7KnziOh87rKi0JDtXNORE=; b=Qw/ZeU76FBTsg43meowe9k
	UrNDZ8ZXGQJ8xPWSPsjHMwWJZmCwJ988Z9Jikp2hCseGnbAuARCxi4TvqdJ7sqcF
	1SAl1w0bZxSrOSmHIQHCyxP9daANo/5ICA5FUTR1zUWefUI0fnY0B71WyOr6E/tl
	aMGgeSlFSFToWGBCJGVhO3PsuDtpDNmidIMFEPrntl7wT2GdhjF8p+wlLrf2LZkE
	NA1SEO+ehU3y5cnTqVgH/i40owmf8Qug9PfKNr3Cr1P2TP3DKgpNs7LBbq0Y2oh1
	/dhCizDnr36ZtTxBUNtiEF+zcH59ri+BlmVlr5Vf9k9g48skxIZJ2MFr1C0WNpeA
	==
X-ME-Sender: <xms:ITQ-YCbxygHtBsxrn2yEF6cKUC_JcHcyPrvi44OQGjAdMtdvChYm9w>
    <xme:ITQ-YFbtDqMj6npUMjPePQo8pLZGzjroZi-mSzcZuvAw66dmm0WWDMz6mLCMd-teP
    scgEQMuMrd9TE3mTw8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddttddggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesrgdtreerreerjeenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvkeeigefggfejieeffefhfeeihfefleelueevueetudehgfdu
    tddukeetteejvdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghi
    sehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:ITQ-YM-pPi3EGZPZzZUPFE6M8Hvy0yDkbta5GFRhNbVPa8ptc2vIFg>
    <xmx:ITQ-YEqz9eHgnjRqmm6sT5VSl_TPyFqDWs_foxKmTZR9dIvU3zdQqA>
    <xmx:ITQ-YNqWLaVG9WtaG48rHmX87PNF8XtlzNNBjh-pMxxjy0XJlg1ZkA>
    <xmx:IjQ-YMSRwwQXTAYaM2ejHGnmiAmz3f24lna47CxYLVwH65aYpA7ijg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9D1A816005F; Tue,  2 Mar 2021 07:48:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <c59bf59f-485a-4a98-994c-481848a42e08@www.fastmail.com>
In-Reply-To: 
 <CA+chaQehnu+R80nbkGnaUgTt1_YiXuea4xnOBhMYoV_9cwoFMg@mail.gmail.com>
References: <20210302123934.1585766-1-andrei@gherzan.com>
 <CA+chaQehnu+R80nbkGnaUgTt1_YiXuea4xnOBhMYoV_9cwoFMg@mail.gmail.com>
Date: Tue, 02 Mar 2021 12:48:13 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Martin Jansa" <martin.jansa@gmail.com>
Cc: openembedded <openembedded-devel@lists.openembedded.org>,
 "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [oe] [meta-python][dunfell][PATCH] python-grpcio-tools: Fix DEPENDS append to grpcio module
Content-Type: multipart/alternative;
 boundary=28ab317adff4491594e63ffe04c94025

--28ab317adff4491594e63ffe04c94025
Content-Type: text/plain

On Tue, 2 Mar 2021, at 12:42, Martin Jansa wrote:
> This was already fixed in:
> https://git.openembedded.org/meta-openembedded/commit/?h=dunfell&id=7fbe300c6d3b7e116dd7a56e16f85ff78d8f522c

Cheers. Missed it.

Andrei

--28ab317adff4491594e63ffe04c94025
Content-Type: text/html

<!DOCTYPE html><html><head><title></title><style type="text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style></head><body><div>On Tue, 2 Mar 2021, at 12:42, Martin Jansa wrote:<br></div><blockquote type="cite" id="qt" style=""><div dir="ltr"><div>This was already fixed in:<br></div><div><a href="https://git.openembedded.org/meta-openembedded/commit/?h=dunfell&amp;id=7fbe300c6d3b7e116dd7a56e16f85ff78d8f522c">https://git.openembedded.org/meta-openembedded/commit/?h=dunfell&amp;id=7fbe300c6d3b7e116dd7a56e16f85ff78d8f522c</a><br></div></div></blockquote><div><br></div><div>Cheers. Missed it.<br></div><div><br></div><div>Andrei<br></div><div><br></div></body></html>

--28ab317adff4491594e63ffe04c94025--
