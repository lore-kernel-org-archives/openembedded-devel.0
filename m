Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oq9Fo-0008SU-0U
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 20:38:49 +0200
Received: by iwn2 with SMTP id 2so4959356iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 11:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=AvGW7HK0EX0pXo8why5vdKzvm4bZ6sv3Hs0k17QqSA8=;
	b=MS8Ml+52GNpuHogpoTwTDg0/WM0B7wfwagK6F9GPTMWA3Z55mEVYkabFXZCzwb9k53
	zTtWmbwYhzdH0wpK7ohDWsoWe09f4w+uKXhmRb52TTlu0Ue/jqiz+9oxs+l2YMPFIT6O
	yiHg56XC5ldU3SMgLfPd9XH2zV4yGJcqqYH5o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=grQDtaZ8E+Bt9knxxUiqxqPLM9kNVzfP4SCgsFfIKoiGXkqfR3EIeIHlW4WTsCCygt
	+Dij9UvkEoE3KJtunX5B3n7Cgh0M3BE9nkiLMvUoXn2Mddgdxo0SfpSHgXnUi/x30ydL
	V2wbss7JXUhmuOIBvG10YTNRqo5AbCA5btSzI=
MIME-Version: 1.0
Received: by 10.231.33.140 with SMTP id h12mr5597399ibd.59.1283193496788; Mon,
	30 Aug 2010 11:38:16 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Mon, 30 Aug 2010 11:38:16 -0700 (PDT)
In-Reply-To: <AANLkTin+3XSMcnYqk4HNC4C2Mur4zsQw5Oc9nV2hbGOS@mail.gmail.com>
References: <AANLkTik0bbo2=KrKw2+_Y4D-5Kc6O0OPynt8qd7cs6JH@mail.gmail.com>
	<AANLkTimBkaij-xQ2w+HEHgnZgss7dR4gJMXMtWU7qWX0@mail.gmail.com>
	<AANLkTikqFLr7yc-Q9ucNTaifi-Oup0hyhgSo7AmT1sJA@mail.gmail.com>
	<AANLkTinafU3d3yABuoieUrwLbhrw1qzkuLwdc2FNzFZj@mail.gmail.com>
	<AANLkTi=qX7ksv67Hj=7ocbfiSkM4mDU1w-fAUFWP9EJt@mail.gmail.com>
	<AANLkTimtj4nLzXBR5j=MJ6htymbtVQh93YK=F-Sa8bA0@mail.gmail.com>
	<AANLkTinr5r8Jtd+ZWznHaBBSK1cB=+XjzDRAPuet1+tr@mail.gmail.com>
	<AANLkTin+3XSMcnYqk4HNC4C2Mur4zsQw5Oc9nV2hbGOS@mail.gmail.com>
Date: Mon, 30 Aug 2010 20:38:16 +0200
Message-ID: <AANLkTikZDtaCN_VMKLTS=SD=JNGr2omwxTdg4LTmqh=t@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: how to add file to SRC_URI for target only
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Aug 2010 18:38:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/30 Chris Larson <clarson@kergoth.com>:
>
>
> The logic already exists. =A0SPECIAL_PKGSUFFIX has to have current inform=
ation
> about the suffixes in order for BPN to be correct. =A0It seems pretty sil=
ly to
> duplicate it, but whatever works.

I thought there was no suffix for target. It would be nice to have
that. For _native, _sdk etc it exists, but I cannot say
DEPENDS_target =3D ...
which could be handy in recipes using BBCLASSEXTEND =3D "native"

Frans.


