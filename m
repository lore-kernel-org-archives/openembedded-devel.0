Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web12.14127.1614960313857465722
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 08:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=A/WZy7xD;
 spf=pass (domain: gherzan.com, ip: 64.147.123.19, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id AA13C2A38;
	Fri,  5 Mar 2021 11:05:12 -0500 (EST)
Received: from imap4 ([10.202.2.54])
  by compute3.internal (MEProxy); Fri, 05 Mar 2021 11:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm1; bh=/DsXpcH1LKDmyL5+9IDOF1wLyDNm2Lw
	MQ+hZgfh5eXs=; b=A/WZy7xDbIYJdE6DIqUdi44G6hIqyTCQmXYapVo+t7JpYKW
	hTLiYr3RfeEVtWhiVEkeuJpLrvvuVxaQnl15NJvi15aPHS+MtmzVhzC6vOrAMpYn
	VbPQZ59an268QJvtkfFyiE2E38CvHwbfKrDiipVhZgKXHW5BpYhXlNbYe2uoo5s7
	fvkgzEM1UZO27J/rKRQrAamRScYm5Y/bjWJNtGnVOvHXOxYgHbdax/7s2hG4ggPK
	d2mI7S5CSWD2scNhcJfudYapCGRs8VdHEWBl8wx3kpR/eo1UsF6FGTZG0kc+YzSl
	sbXcxX+ZhzlVLxlLFI5MC7TLckSJMlXx8YkaW8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/DsXpc
	H1LKDmyL5+9IDOF1wLyDNm2LwMQ+hZgfh5eXs=; b=vx926YZzrJNIlIAr41nBqL
	TUPR7coL0x8ggfaJ4phhIqrwKaVoqHXgkibRUJ0qGXT8lv2wrQDlmoEM95R5b7Rl
	AjJEP2TetztNaT8mGPfuM3aCHhKXECCS+EEihCOj9aqLLCyc0RyIXsIBlUHnjRdU
	fntOx3GCrPco7GFTaaULWRlvJ5pDLcuf97A/Nyaui38wpu6xM8L3y69XjwcZUIFM
	3AtqlRxN44Rw+DserjbMrHnAXN6DkJJha7fsirApZNueVTi+bFZp4AzCiX8ibeUq
	a5d6w1FZAmgCzdwLEkQZVXtY+3Nii4J9DwJ6wtIuK5/4rmInqvsPG65uf5LsRvtA
	==
X-ME-Sender: <xms:t1ZCYHx7P8bSxZ7LJWXdkp0rYbSZfZkbidrOdajnWsD79cXlvYmZug>
    <xme:t1ZCYPQXPxgmHn0WrUGB8lQcVs_fDSi0felnUgt39jRxIsOVBNHRHZf92tXxRaKi-
    WSp83c0mtRj2vGhdxs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesrgdtreerreerjeenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeufffhtdehudekffelhfdugffhleetudfghfejfeekvdfhgeet
    keeuheevvefhueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:t1ZCYBXDsqaa404SdByIbUVn_p63Xvmq-dAWYt0DYaGab_Q9OgukRQ>
    <xmx:t1ZCYBhaoedDfW-XQvRJxwMtAIEwosBc7rEVXAejt9niT2AE_OzrJg>
    <xmx:t1ZCYJCwCLE1UPQHBnexOkI_3cPMYPo59UD1LQfUkg4To_AVtsTSoA>
    <xmx:uFZCYMpNi-lMOBSJfbpE2TAJ_6hHJuIibr9ktyKYR0iGvKQmQLyjXQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8EBC5160060; Fri,  5 Mar 2021 11:05:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <b6a0e026-da05-4c5b-b768-a3aaf96a36d1@www.fastmail.com>
In-Reply-To: <074a21a4-17bf-6024-d3a7-d9d44c43cc95@windriver.com>
References: <20210303133241.29781-1-andrei@gherzan.com>
 <20210303133241.29781-3-andrei@gherzan.com>
 <074a21a4-17bf-6024-d3a7-d9d44c43cc95@windriver.com>
Date: Fri, 05 Mar 2021 16:04:53 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Trevor Gamblin" <trevor.gamblin@windriver.com>,
 openembedded <openembedded-devel@lists.openembedded.org>
Cc: "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [oe] [meta-python][PATCH v2 3/6] python3-aiohue: Integrate the hue control python module
Content-Type: multipart/alternative;
 boundary=87c9a3e886514077b9dd0b0251d3986b

--87c9a3e886514077b9dd0b0251d3986b
Content-Type: text/plain

On Fri, 5 Mar 2021, at 14:21, Trevor Gamblin wrote:
> 

> On 2021-03-03 8:32 a.m., Andrei Gherzan wrote:
>> [Please note: This e-mail is from an EXTERNAL e-mail address]

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> The path here looks off. The recipe is at recipes-devtools/python/python3-aiohue_2.2.0.bb when it should be at meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb. Can you submit a v3 with the path fixed? Please check any other recipes you have added.

For a second I was just confused of how could this have happened. But the explanation was simple (git am from another layer that doesn't have multiple layers at its root). Send v3.

---
Andrei

--87c9a3e886514077b9dd0b0251d3986b
Content-Type: text/html

<!DOCTYPE html><html><head><title></title><style type="text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style></head><body><div>On Fri, 5 Mar 2021, at 14:21, Trevor Gamblin wrote:<br></div><blockquote type="cite" id="qt" style=""><p><br></p><div class="qt-moz-cite-prefix">On 2021-03-03 8:32 a.m., Andrei Gherzan
      wrote:<br></div><blockquote type="cite" cite="mid:20210303133241.29781-3-andrei@gherzan.com"><pre class="qt-moz-quote-pre">[Please note: This e-mail is from an EXTERNAL e-mail address]

From: Andrei Gherzan <a class="qt-moz-txt-link-rfc2396E" href="mailto:andrei.gherzan@huawei.com">&lt;andrei.gherzan@huawei.com&gt;</a>

Signed-off-by: Andrei Gherzan <a class="qt-moz-txt-link-rfc2396E" href="mailto:andrei.gherzan@huawei.com">&lt;andrei.gherzan@huawei.com&gt;</a><br></pre></blockquote><p>The path here looks off. The recipe is at
      recipes-devtools/python/python3-aiohue_2.2.0.bb when it should be
      at meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb.
      Can you submit a v3 with the path fixed? Please check any other
      recipes you have added.<br></p></blockquote><div>For a second I was just confused of how could this have happened. But the explanation was simple (git am from another layer that doesn't have multiple layers at its root). Send v3.<br></div><div><br></div><div>---<br></div><div>Andrei<br></div></body></html>

--87c9a3e886514077b9dd0b0251d3986b--
