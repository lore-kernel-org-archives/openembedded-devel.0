Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web09.12981.1615312228850946376
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Mar 2021 09:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=eElvl796;
 spf=pass (domain: gherzan.com, ip: 64.147.123.24, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id C46EB10F7;
	Tue,  9 Mar 2021 12:50:27 -0500 (EST)
Received: from imap4 ([10.202.2.54])
  by compute3.internal (MEProxy); Tue, 09 Mar 2021 12:50:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm1; bh=qVPGDT6wbxzyftyjE9HIvxQHlkh7/wf
	otl++15uOpvE=; b=eElvl796oUKQC3Ol38HgCaSXPtwbXe+n3SKxRO8mVJJA4tf
	LZbXRSZGZg9KvasOrHUKGHG20DacpQHcLPlq6i9zvZfcaw2htreVliFvS6sQLci+
	+di8wso1WJ2ETlQEBMjIehOuJEzfIoxPFX5EWjy/DBDtUt7kCJwOWi5h3MiGrf+p
	6muQCumIccx1nw8Z6L3Dy6dp44i0wIselEA60VuaQr0Ru3QeMoJ+zdVbPeoEQZkx
	Wpr3P7yfCckhNY+HfWYvJfFUrSI5IXrJGWEOWXIBg6Jfk7PwtqigvneM7AqwX7i8
	8DAIpxgzzZHy546jnJeLUba6ZprzrY/CK5eB9cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qVPGDT
	6wbxzyftyjE9HIvxQHlkh7/wfotl++15uOpvE=; b=oJk9VNgmdPsqVHbNXe6kr9
	u+nQwNfAVTUSHCBEAxn+ecZ2LnqqYa5wHjIXAEeh4R1pvbpIICBW0pEnz+6uy2Nj
	Jb3bQuXfP05+2dP8JTIAOFHZP5IV30EUr5KDMOBWhvWyBXfLGYh0SJ61Sp+F8v9j
	O5HyW/GSngZsFZYN5fvNz4NRRq7W8XRUWGG3U11MiyC7BV+e6znaZFwDsmHEiBT3
	wfrIoJOnGGxqg3NdW/Vf0bBudtdj3cHKisUuEAmSx3VIQEt1Y9GgvruQoKCA7HcJ
	Zq628jjAun+DQV01jNcMi0nWe4jYJpblYF9kbSLhX9dct/gJDJJk26ErrymDmrmw
	==
X-ME-Sender: <xms:YrVHYPYC7VqQ0f8VTRo9xcF1rMHJ2bRh_tRWhwYz_WYpQp4Hi-qXGQ>
    <xme:YrVHYOZiUf6-EyrKBNKh_yhDgZtY7gC11Fvy--sJKDFyzVdHv77jX8FH4HjvSSaYi
    dITO9HR-lE4voTwTNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnhepkeffvdfhgfegvedugfffleelgeelhfdtjeeuhfevteeiheei
    lefgffevkeefgedvnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
    ihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:YrVHYB8Y6v7BAE5Q-gdY4nXVqL_r-rjhGJXos-BLb1gQtaDJvBMhjw>
    <xmx:YrVHYFqLzz6ZVo1oKcKvb2PDpsxninmAvHhvCL3-OJ_a2i5P1eY0NQ>
    <xmx:YrVHYKr1zPSTmpJRPa-k3yPEzKeKT0nnVOt9NWUJ7-zRzchxH7t-hA>
    <xmx:Y7VHYBR68CbJWXyaYbYWF79yVW_3ZZ910k4loY9NDQNdrRaop-SnJg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DC186160082; Tue,  9 Mar 2021 12:50:26 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <a51e0676-0874-44f6-821b-6342ff9dc430@www.fastmail.com>
In-Reply-To: 
 <CAMKF1srsrFhBwXVAwtrR=MUajm2zeHbS77f8ZyG8n5dNAtS5bw@mail.gmail.com>
References: <20210305160256.3333334-1-andrei@gherzan.com>
 <CAMKF1srsrFhBwXVAwtrR=MUajm2zeHbS77f8ZyG8n5dNAtS5bw@mail.gmail.com>
Date: Tue, 09 Mar 2021 17:50:04 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded <openembedded-devel@lists.openembedded.org>,
 "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [oe] [meta-python][PATCH v3 1/6] python3-ifaddr: Integrate a dependency of pysonos
Content-Type: text/plain

On Fri, 5 Mar 2021, at 20:29, Khem Raj wrote:
> I am seeing fetch checksum mismatched on AB see
> https://errors.yoctoproject.org/Errors/Details/573554/
> 
> then I manually downloaded the file and checksummed it,
> 
> % sha256sum ifaddr-0.1.7.tar.gz
> 1f9e8a6ca6f16db5a37d3356f07b6e52344f6f9f7e806d618537731669eb1a94
> ifaddr-0.1.7.tar.gz
> 
> so builder on AB seems to be right, perhaps we need a v4

Sent v4. It picked another recipe in my testing so I didn't catch this.

---
Andrei
