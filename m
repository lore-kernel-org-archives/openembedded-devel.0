Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web09.104.1614963603814705957
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 09:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=NbRN69mx;
 spf=pass (domain: gherzan.com, ip: 64.147.123.19, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id BA39C2AC0;
	Fri,  5 Mar 2021 12:00:02 -0500 (EST)
Received: from imap4 ([10.202.2.54])
  by compute3.internal (MEProxy); Fri, 05 Mar 2021 12:00:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm1; bh=aGjgjsYxl1d/+2tZAQAymEOBkWv847f
	IUDXn6e2yOZ4=; b=NbRN69mxEYfjon39TI9sKNxcwfrc/i8Zr49iBaoC9OzNz8y
	9THhrbtB4Z5ftkRWNFpksIm3U0bVjP58hFIM95aiK/7zkMJabZ87ag2ODXUKoZFi
	r2nCQjOWPbqZkRdWlSjCV5JYpiwG0x0QfTVq9BZCTOfSd2VOsJAau4ajHYtZnM50
	5/nKjtqywJNmFgkyK6fADvaNdO6C5ANBsz/3gE+bNVwh4NzTxZ7LOoqkwZ22n1YG
	1xjTDsusuP08ET4j7partiwFj3fQTHeIshbsJtB+ankCWS9iAmJZRMm+iZciXE/K
	tHkJN19pDqIEi8x7CbHZQrbIpjRV+n2pCEmZtNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=aGjgjs
	Yxl1d/+2tZAQAymEOBkWv847fIUDXn6e2yOZ4=; b=AcRT4Vn3LWX76TBmgneilh
	gIum2PRus/vz2VsgTPU1jaKS9ldwW+PWrwe/2Q/cSV/5zIWM6e3Q7fe877DqF5Fl
	QwjgbqiAI2HxbWMWZvvnkg+CifuPa1gyN6sScqATi0ZdpJaIGYJ/RykLLcaZIg+y
	a5y2KzM//AKm2eC7RK54gI3z6rQNxmtkqI2b+BtWSykGEIE6lPkZumANeuZ4SU9/
	lv4ZNvyUIzfcYBfKNzgNkosRq6kuaoPOBX4ty4HhtwwcguUROWDVNV+u3dlBj55z
	kgQ1o7Cf/AkPeBq0JfGeCKS+uOwmI2rvaVl8gW16cjQpTHQAPshJGy4l8pRFMIoA
	==
X-ME-Sender: <xms:kGNCYDf6hYXj9fUe5Nk2TiWHH1SYhwDwY5HO8V5WxaI2PITXZiSVYg>
    <xme:kGNCYJMPg90Kciujoccc1H5DPnlrteupjT9nPKsve1bdDycHUyoBvRYb1bM05I9qy
    YNfr8ynRaz3jhjhcp4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeelgfffvddtjeeivdehleefleejfffgleeffeeguefhvdevkeef
    ueeuleefveeutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:kGNCYMgLsN2D-QcZs_zxymp8FP0thoJwCfz0iM6sgTEZdMMcSLYicQ>
    <xmx:kGNCYE8gzh8QGogs2r0uX41OM_Jr4Mb1cO_1XsxdXrq83wJxu4nCMg>
    <xmx:kGNCYPt_4kLJbcv6O4a7_clTNDsdpcvAITui0uafvT7411hKLbqWWQ>
    <xmx:kmNCYIVGZff0jbIxECkNO2WWXyqxVcO5L-4o_wNt6w3ne3BM-nmu3g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E770D1601DA; Fri,  5 Mar 2021 12:00:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <2f912603-581b-43a2-8adb-064e3fa16202@www.fastmail.com>
In-Reply-To: <6550b85f-4da4-d245-0ce0-3fb13866b143@gmail.com>
References: <20210303133241.29781-1-andrei@gherzan.com>
 <20210303133241.29781-3-andrei@gherzan.com>
 <074a21a4-17bf-6024-d3a7-d9d44c43cc95@windriver.com>
 <b6a0e026-da05-4c5b-b768-a3aaf96a36d1@www.fastmail.com>
 <6550b85f-4da4-d245-0ce0-3fb13866b143@gmail.com>
Date: Fri, 05 Mar 2021 16:59:42 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Khem Raj" <raj.khem@gmail.com>,
 "Trevor Gamblin" <trevor.gamblin@windriver.com>,
 openembedded <openembedded-devel@lists.openembedded.org>
Cc: "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [oe] [meta-python][PATCH v2 3/6] python3-aiohue: Integrate the hue control python module
Content-Type: text/plain

On Fri, 5 Mar 2021, at 16:46, Khem Raj wrote:
> 
> 
> On 3/5/21 8:04 AM, Andrei Gherzan wrote:
> > On Fri, 5 Mar 2021, at 14:21, Trevor Gamblin wrote:
> >>
> >>
> >> On 2021-03-03 8:32 a.m., Andrei Gherzan wrote:
> >>> [Please note: This e-mail is from an EXTERNAL e-mail address]
> >>>
> >>> From: Andrei Gherzan<andrei.gherzan@huawei.com>  <mailto:andrei.gherzan@huawei.com>
> >>>
> >>> Signed-off-by: Andrei Gherzan<andrei.gherzan@huawei.com>  <mailto:andrei.gherzan@huawei.com>
> >>
> >> The path here looks off. The recipe is at 
> >> recipes-devtools/python/python3-aiohue_2.2.0.bb when it should be at 
> >> meta-python/recipes-devtools/python/python3-aiohue_2.2.0.bb. Can you 
> >> submit a v3 with the path fixed? Please check any other recipes you 
> >> have added.
> >>
> > For a second I was just confused of how could this have happened. But 
> > the explanation was simple (git am from another layer that doesn't have 
> > multiple layers at its root). Send v3.
> 
> yeah its a problem with monolithic trees where layers are fudged. 
> something like git submodules can give you best of both worlds where you 
> have monolithic view but preserves layers as well.

If the layers stay in the same scope (like meta-oe) I don't mind the monolithic approach as you don't have to deal with the aggregation in that case. 
