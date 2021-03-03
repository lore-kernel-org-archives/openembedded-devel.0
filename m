Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web08.6563.1614778651658433729
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 05:37:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=NWnHa9Zy;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 6D94117F0;
	Wed,  3 Mar 2021 08:37:30 -0500 (EST)
Received: from imap4 ([10.202.2.54])
  by compute3.internal (MEProxy); Wed, 03 Mar 2021 08:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm1; bh=favyjUayc0wJ1Eqy5Ar9IPh2Hy4p2gC
	Zs7APSr8N+RQ=; b=NWnHa9Zyf+YkSYMpqyzbeXhefxWdpCajMWdpTSw953lN2PN
	XO4IyIsLg+iRhKLAb49yWMzf1eTtpg4ji4bdoV7YiQWm52EeCA8OoULj1+JA3xGo
	AK9rbG5twkbVEBSYcLl2awJe7THP5fhCF8u3tQch1xLT0tNK7cgqwqzFvoG6macd
	aLqLYhw5ec2+BEfQpZLRlAfr3mFnG22Xj8pBlKNIEGH85jHM+AhJub5OWQieyjD1
	VQ7+W0VlRSX3g+6JG22VjnVZEeF2ai4JV0sMNBg3v861OnMUvUdqH6E5KjdFe/Kx
	6Z/L2RN9NGzyuxaFQTQxvTKquzRn6Snm+U3yPQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=favyjU
	ayc0wJ1Eqy5Ar9IPh2Hy4p2gCZs7APSr8N+RQ=; b=Tu1fyftSOYsGn0Wqq9pBec
	nbrGYUPv76HlX7jhhBLqu79rkwPRWwb0TVDG+1z0cv4N+h8biT+Pe+EFSLqB65fv
	JqyktdmsyByKNAyT0FjeOh2AAZEBXlqL5rebGi1Mzmy4hx27BowmK0VY3SF4D26x
	vHwUdeQlqwR2rd395D4KdTbJggj3XV/CL+ldJYC+N0jG8GRS3GCQ+Y87b0ax/3V+
	YNbE1uKLL9Bmlxzu63W9ZjwVTeg/OC0ZMvW+W9lb+xE4k5Rs8t8elxQcFsk3Lgom
	qCQRzxdMydusNgz9g7gmCqWc88cbHsaz7KZfeScJnFKon7g6D8ftOkzO7bdACr5w
	==
X-ME-Sender: <xms:GZE_YFy5POKiO4GGAoUFDC-lID8LngHdOHIG3WMbIzr0Q-fkNn8eyA>
    <xme:GZE_YFSwKdPk_LCn2N1tMZzQNbM6QuKb9e_fnXkZbQH1TxrWD-6qLHMGSEh6In1nG
    PtmVkfggCb1EZyeZsc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtvddgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeiffeitdfhheffjeejhffhfeejhfffkedtvedukedvieeiveet
    ffefkeeuheejfeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghi
    sehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:GZE_YPXj-7mY1YqfjRnJB1nZmFsbdPy9kyd4jwOzZLDIGAu2kqjUKw>
    <xmx:GZE_YHiZzV808Z2P4UeMg8qYlfCi3v5g1mQwMGSh0jHY-TSGB7_OPA>
    <xmx:GZE_YHDsT0n-jkvyQQ9k1W8qEaBvNmeqHhzXddi5K8f904gSvkWgNw>
    <xmx:GpE_YKqqw7GdQmDLAJky6IhkgJJtQjlDTvbcbghkVX7T7_JpkVBAvA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7E7171600A6; Wed,  3 Mar 2021 08:37:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <55af1e8e-8b1c-4d06-98c6-28cd018400b6@www.fastmail.com>
In-Reply-To: <ee5bbb54-298a-bd09-7215-0951a1b6ab37@gmail.com>
References: <20210302163742.2047086-1-andrei@gherzan.com>
 <ee5bbb54-298a-bd09-7215-0951a1b6ab37@gmail.com>
Date: Wed, 03 Mar 2021 13:37:09 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Khem Raj" <raj.khem@gmail.com>,
 openembedded <openembedded-devel@lists.openembedded.org>
Cc: "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-aiohue: Integrate the hue control python module
Content-Type: text/plain

On Tue, 2 Mar 2021, at 18:19, Khem Raj wrote:
> can you send a followup to add these new packages to 
> packagegroup-meta-python as well ?

Sure, it is now part of a v2 including all the 6 patches I've sent. https://lists.openembedded.org/g/openembedded-devel/message/89832

I have:
* fixed a typo in git log of https://lists.openembedded.org/g/openembedded-devel/message/89807
* added commit to include the new modules in packagegroup-meta-python
* consolidated all 6 patches as part of the same series (hopefully making things a bit easier)

Andrei
