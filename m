Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web10.3379.1614116402888661497
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 13:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=UssdRjeM;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 693475C00C3;
	Tue, 23 Feb 2021 16:39:59 -0500 (EST)
Received: from imap4 ([10.202.2.54])
  by compute3.internal (MEProxy); Tue, 23 Feb 2021 16:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm1; bh=8rsiKtLT9ffR3KE1WT1P8oQFE6/kyVh
	pSKEP3RjZvAk=; b=UssdRjeMxzmMoItOiLT6D7bXDpWdRsvFKsCON1o0pfBTjGo
	sxm3Mr6SFnDFTQYHLX0j1klwYkdkPJELHohalRyYg27T24Nv84hn/Rwd827U6dO7
	neIv30fo4H2dFsQt0lFWS31PJRCk4VNN+lCdqZi6mtbMc1a5tE0FHJQSS4LT8MGq
	YgfQRrAKoPQ/V9Dy8VVkD7bxZx3LEs2Yr9y7O3NDIt0nAfyvxGmOwdrYBnjw2zWK
	t3BhV2ZN9kT197SyZQh7ho7pEwiMI4/eePLa5mnC08pHUgs4Ko1UoOAhJzLWpg2f
	CBLmcxDrmwlUzYAPhidZK22tTwF7wGpNNX8lHKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=8rsiKt
	LT9ffR3KE1WT1P8oQFE6/kyVhpSKEP3RjZvAk=; b=Y/jEX8G2cUKfhHKnsL1fHg
	4rBC3MuhSLLE0qcwIgri5m8v6F3rIpS1SQgqXbyDqUpgA4BxlyimRw+0wN4orsrO
	zXyC2k6EO8IRxbPGyRSsy6tAmihTdSxzLTHIkpRqRYywzwzBQpH6C9XRYjJF+NPL
	kqbWyakDzOXAaNGdBsClfT0js48PwZyILmA44DYPT2Hlg6e0cErpssF9cTc0Mi2c
	hSIBTF7vCRIX4SsO99oXoV1UPGIEQSTIMJ0Q6y3ULqWkW05EDXuBamASM4BoJAB3
	XEQjAG/vt88O0AAfabVn3FknK0qEWukQnWyOMTHJR5M42P2k6zctQzr3s2YamspA
	==
X-ME-Sender: <xms:L3Y1YDgTUxThZis15wabABgXU99nOToIuXmDaUDtx_qyLsA1XfWWJQ>
    <xme:L3Y1YACbOdpzj64L5E3TR9YjKfCv0LoWajEiPLCM-cHIs7z9RsSc_iOIFVot7gm9t
    k84dgc7CHcIq7rpxrU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeehgdduheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesrgdtreerreerjeenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeufffhtdehudekffelhfdugffhleetudfghfejfeekvdfhgeet
    keeuheevvefhueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:L3Y1YDFXKYfqTVvOd-iMSQ5XOe_Xn688NmQ_4UVJ6GJPRt-Wq2i9zA>
    <xmx:L3Y1YASS_9R1BpiKTT8WoCud2zzSTM9SuREEb5VRVe7nfPVB168hgg>
    <xmx:L3Y1YAyI9J32NvKoKDDrsZ3dZJyjfy639Y4gPS-eMKJKJTV6KLvVtQ>
    <xmx:L3Y1YGbJ3UrQi6cIHBgdNJn23shx93Aujb3pSryzj8mWsm2PBEVulQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0D2D4160792; Tue, 23 Feb 2021 16:39:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <7d202618-598a-4518-8b49-38cc054f0d8b@www.fastmail.com>
In-Reply-To: 
 <CA+chaQch78dk=nF1Rj0znxRJ81a=cXbZpp-X_1RjZPwB1UEjOw@mail.gmail.com>
References: <20210223162705.2595483-1-andrei@gherzan.com>
 <20210223171242.csn2hwn6imsn4ega@jama>
 <CAMKF1spNM_nxwEMFN3DXCG5O4rxK22VMMe6yZKm7zjmUWg4LSQ@mail.gmail.com>
 <7536ac24-0016-45e2-9cfe-209b50633c8a@www.fastmail.com>
 <20210223173002.aydz4xm65ylvgy4k@jama>
 <7a1bf385-91e5-4076-bbee-b5d14b7c1e54@www.fastmail.com>
 <4deb9ec4-605e-431f-95f7-1b6f9e948635@www.fastmail.com>
 <CA+chaQch78dk=nF1Rj0znxRJ81a=cXbZpp-X_1RjZPwB1UEjOw@mail.gmail.com>
Date: Tue, 23 Feb 2021 21:39:40 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Martin Jansa" <martin.jansa@gmail.com>
Cc: "Khem Raj" <raj.khem@gmail.com>,
 openembedded <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] nss: Disable Werror across all recipe types
Content-Type: multipart/alternative;
 boundary=7021a27c026b492b9a51f61f35e98e14

--7021a27c026b492b9a51f61f35e98e14
Content-Type: text/plain

On Tue, 23 Feb 2021, at 21:37, Martin Jansa wrote:
> OK, thanks for looking into that, I was assuming that native nsinstall is provided by nss-native dependency we have and wasn't aware that it's built for host as part of target build as well.

I should have known this before sending the patch. As a self-inflicted punishment, I'll push a proper fix as well but please go with this for now.

Cheers,
Andrei

--7021a27c026b492b9a51f61f35e98e14
Content-Type: text/html

<!DOCTYPE html><html><head><title></title><style type="text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style></head><body><div>On Tue, 23 Feb 2021, at 21:37, Martin Jansa wrote:<br></div><blockquote type="cite" id="qt" style=""><div dir="ltr"><div>OK, thanks for looking into that, I was assuming that native nsinstall is provided by nss-native dependency we have and wasn't aware that it's built for host as part of target build as well.<br></div></div></blockquote><div><br></div><div>I should have known this before sending the patch. As a self-inflicted punishment, I'll push a proper fix as well but please go with this for now.<br></div><div><br></div><div>Cheers,<br></div><div>Andrei<br></div></body></html>

--7021a27c026b492b9a51f61f35e98e14--
