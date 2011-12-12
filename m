Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RaDnW-00046b-HS
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 22:52:35 +0100
Received: by lami14 with SMTP id i14so126001lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 13:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=saNqHirpbbJmQklvI911KXVV1frAk/Gcfows2agLQh0=;
	b=hloZ4IZIGfV++PseNNGcR8cPGo6UpnCGaGrvKPksRxj0APjSVwHWE0lkliuvsT9x5i
	RZx7bP380E75Ibs+tmNZU48rHu41TZCKV085Q1zmGOZPadQk5FSfkCAXlB3MKvU27gFd
	3c/D3hvLqIGXTt3U2lvEs2CxAWGsu8rnSJ/5A=
Received: by 10.152.134.179 with SMTP id pl19mr13266346lab.13.1323726335584;
	Mon, 12 Dec 2011 13:45:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Mon, 12 Dec 2011 13:45:04 -0800 (PST)
In-Reply-To: <4EE6492F.9030402@balister.org>
References: <1323707082-9185-1-git-send-email-philip@balister.org>
	<1323707082-9185-2-git-send-email-philip@balister.org>
	<CAMKF1soquX6jz+ZFpUEgWPkAUFxhcHXBQSug7tFJck8y+1QKng@mail.gmail.com>
	<4EE6492F.9030402@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Dec 2011 13:45:04 -0800
Message-ID: <CAMKF1sq-WGFk4LV6L8Zj4mn-NGymtUDYrZaoK_LBbDMF4_1vCQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] gvfs : Fix build failure due to introduction of host includes.
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
X-List-Received-Date: Mon, 12 Dec 2011 21:52:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2011 at 10:34 AM, Philip Balister <philip@balister.org> wro=
te:
>>>
>>> =C2=A0EXTRA_OECONF =3D "--disable-samba \
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-arch=
ive \
>>
>> You are disabling archive backend explicitly. It might be that someone i=
s using
>> it successfully. Why does it not work ?
>
> With it enabled, the build fails because it looks at host includes. Long
> term someone will likely fix this, be in the short term, I need this to
> work so I can move forward with oe-core based stuff.

OK. I see that we do not list libarchive in DEPENDS if we did then it
would build I suppose. Can you try that please ?

so I think at present what you get is that if libarchive is built and
staged before you build
gvfs then you get the support compiled in if not then you don't. So
your patch at least makes
it consistent by disabling it.

Problem only happens if you have libarchive-dev installed on your
build host which I think
you do have and hence you see the problem.

I have no strong feeling on enabling or disabling it but I would
prefer consistency

-Khem


