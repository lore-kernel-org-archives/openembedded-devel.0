Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web08.3980.1614119340536451753
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 14:29:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=c/Js4ZwH;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 9BFC35C0032;
	Tue, 23 Feb 2021 17:28:59 -0500 (EST)
Received: from imap4 ([10.202.2.54])
  by compute3.internal (MEProxy); Tue, 23 Feb 2021 17:28:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm1; bh=uS4gRUIakBwx90OzHM3hdL08X3yJx7Y
	Zvgkx9rB1K9Q=; b=c/Js4ZwHWsm4T720Kqb34figGAKKnnMPXsmsSnjA86bfoUM
	o/R+8cPoRQ3bTwn85o8obQIC+Zt7JHsARljyGRyWToHjP71yLz7cZY5j3w9UvZDE
	Pq+AydAApo8JachLqAdczLiMmPo3Kpk1eWnscs8Hgb29cMrza7QOklUea7TWdDr7
	rOY68m4YJ7J5mCeFga88a2A+jFFF+Ja4/ssvW6p7d9/HPLV/evWaPUNEJhsUd5rm
	inqZWAWc2VOEZPjLYTFEQvqShyBXlcdSnKrZyhh7qS1D6/GHf9dQb+vZVf3Rhv1c
	Ve1RpCW+auUrbNHgQa04V5XCskjeCmoE0mQrBQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uS4gRU
	IakBwx90OzHM3hdL08X3yJx7YZvgkx9rB1K9Q=; b=b97drpABsoFs0FIqb7ryg6
	pUzXqJ3XTb2/13WZtYpkex05K41/6qIPd7Oc9wtebfFndu2s/zsch1r9krFEghDI
	Q9NzWEqf28PNM7/9HuVJCFRMwcrijdNRbjKJRmpLEazCjf57t/vV365xp7O5MB8v
	Kj6MefnSODmYqrzrAB4wGui0oL072ghaHCAdI4BhUMRD29iF7zKlWJ8UBETIt1oY
	n3wrXPR6pQmrVtXR7iJurAhqOudruJwF97zktFHZCzacu45+qFmitpRtfQBLAqPG
	R1DPgz6r9jwUEy62alw0jeoibED1E5dRlszqz4a7Hye+f6ZN9JdSClNxneyTtQyg
	==
X-ME-Sender: <xms:q4E1YCz50RchFua_7q86EYHKboA8wbBVbfZ-rRHU_Oh3_7UcZdtEBg>
    <xme:q4E1YOS7yu46v3jWOdC2w_R5nhKnwgetUqTZlTZYz72GJ9IJpd7Jlb76ueHSCcHzI
    vWR8olJ7j9cOiANbes>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeehgdduiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesrgdtreerreerjeenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvkeeigefggfejieeffefhfeeihfefleelueevueetudehgfdu
    tddukeetteejvdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghi
    sehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:q4E1YEUwsbbr_iv_iZRGOAyKYzHxzlOXKpb1TMoxmOLeSWujlLvbCA>
    <xmx:q4E1YIj3TpWIELu9B1sJjLAcyrKsnQCsH6NoKpqPdow7dQfYUQN3kA>
    <xmx:q4E1YEBZp-Im0VA7GawhVK5nuXOkc0ywLbAbKYHSvpfUOiK983Qa4Q>
    <xmx:q4E1YPowGJc6HVitDh8zZ6sZ2wGXYQCbysDAuWVGnY5UKb-REQuijg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 44B8A160792; Tue, 23 Feb 2021 17:28:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <d4d70993-600d-4d0b-ac57-07b74384ac27@www.fastmail.com>
In-Reply-To: <7d202618-598a-4518-8b49-38cc054f0d8b@www.fastmail.com>
References: <20210223162705.2595483-1-andrei@gherzan.com>
 <20210223171242.csn2hwn6imsn4ega@jama>
 <CAMKF1spNM_nxwEMFN3DXCG5O4rxK22VMMe6yZKm7zjmUWg4LSQ@mail.gmail.com>
 <7536ac24-0016-45e2-9cfe-209b50633c8a@www.fastmail.com>
 <20210223173002.aydz4xm65ylvgy4k@jama>
 <7a1bf385-91e5-4076-bbee-b5d14b7c1e54@www.fastmail.com>
 <4deb9ec4-605e-431f-95f7-1b6f9e948635@www.fastmail.com>
 <CA+chaQch78dk=nF1Rj0znxRJ81a=cXbZpp-X_1RjZPwB1UEjOw@mail.gmail.com>
 <7d202618-598a-4518-8b49-38cc054f0d8b@www.fastmail.com>
Date: Tue, 23 Feb 2021 22:28:39 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Martin Jansa" <martin.jansa@gmail.com>
Cc: "Khem Raj" <raj.khem@gmail.com>,
 openembedded <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] nss: Disable Werror across all recipe types
Content-Type: multipart/alternative;
 boundary=00f815fc5b184b4da2224f5e0672ce79

--00f815fc5b184b4da2224f5e0672ce79
Content-Type: text/plain

On Tue, 23 Feb 2021, at 21:39, Andrei Gherzan wrote:
> On Tue, 23 Feb 2021, at 21:37, Martin Jansa wrote:
>> OK, thanks for looking into that, I was assuming that native nsinstall is provided by nss-native dependency we have and wasn't aware that it's built for host as part of target build as well.
> 
> I should have known this before sending the patch. As a self-inflicted punishment, I'll push a proper fix as well but please go with this for now.

I've pushed the fix for both master and dunfell. master has a v2 because that was initially the dunfell one but without the subject tag (missed it initially).

master - https://lists.openembedded.org/g/openembedded-devel/message/89697

dunfell - https://lists.openembedded.org/g/openembedded-devel/message/89698

--
Andrei


--00f815fc5b184b4da2224f5e0672ce79
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">
p.MsoNormal,p.MsoNoSpacing{margin:0}</style></head><body><div>On Tue, 23=
 Feb 2021, at 21:39, Andrei Gherzan wrote:<br></div><blockquote type=3D"=
cite" id=3D"qt" style=3D""><div>On Tue, 23 Feb 2021, at 21:37, Martin Ja=
nsa wrote:<br></div><blockquote type=3D"cite" id=3D"qt-qt" style=3D""><d=
iv dir=3D"ltr"><div>OK, thanks for looking into that, I was assuming tha=
t native nsinstall is provided by nss-native dependency we have and wasn=
't aware that it's built for host as part of target build as well.<br></=
div></div></blockquote><div><br></div><div>I should have known this befo=
re sending the patch. As a self-inflicted punishment, I'll push a proper=
 fix as well but please go with this for now.<br></div></blockquote><div=
><br></div><div>I've pushed the fix for both master and dunfell. master =
has a v2 because that was initially the dunfell one but without the subj=
ect tag (missed it initially).<br></div><div><br></div><div><div class=3D=
"attachment__body attachment__body--no_thumb"><div class=3D"post-message=
 post-message--collapsed"><div style=3D"max-height:200px;" class=3D"post=
-message__text-container"><p>master - <a class=3D"theme markdown__link" =
href=3D"https://lists.openembedded.org/g/openembedded-devel/message/8969=
7" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g=
/openembedded-devel/message/89697</a><br></p><div>dunfell - <a class=3D"=
theme markdown__link" href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/message/89698" rel=3D"noreferrer" target=3D"_blank">https://li=
sts.openembedded.org/g/openembedded-devel/message/89698</a><br></div><di=
v><br></div><div>--<br></div><div>Andrei<br></div></div></div></div><div=
 style=3D"clear:both;"><br></div></div><div><br></div></body></html>

--00f815fc5b184b4da2224f5e0672ce79--
