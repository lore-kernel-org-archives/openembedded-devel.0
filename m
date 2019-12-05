Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7FFB96C44A
	for <Openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2019 14:33:25 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id g12so3189329ild.2
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 06:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2TT2+ScZKR99EoNCuRqZy53HoTbK8tnfG9PhR51REmY=;
	b=X07v1YuXnawbTerCzsPXg/OEBUQidO9zmVjwPZQO0A1krt2jI8/gWINhj2fXystxct
	em8xpC078uZHZEMfU3ILnZdckdNR48qfrCXIzXC53+g+SF1SPneluyLlNzXxCmI9uAof
	dRbuC4lctB5kKr/3K8HkR5mElsLoVzD+TZOf+HIVppEpcNs0hhsuQ3Z6nJJjIcus9Mdm
	eu6cUBXL0xY/qxqtvKrZe71GJTQe6Yzarm1vsYG/W9pFZvyvaTovBU2Vo7ebJP5V/G3p
	QUJA7JO2dXpdCOQEx0a/omA3wW1rMeImyymNC2oObtbBUdKCrJW5Wi92+eeG2qXZduTa
	UYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2TT2+ScZKR99EoNCuRqZy53HoTbK8tnfG9PhR51REmY=;
	b=qUhOsA408Od3aBP8OIjfi2IyqbRrgx6EFBKoK65TIM3NkUnvOH/4V/qrtZZFeXapPy
	PCvGvdBUeMZY2Jvje8toWld0ztUIphtp52g7uRQmDD3Lt6MJ5ULpMJtn8Ql2JHTDTWub
	cR5jEK3rnOb7XN8yKRtUPAbXYogNPl3ZjtQzNF9IERhcBC3+L8Y4Lm4AKnPO3BbUQ5g+
	fXyBNR9MkA0cHTA15ILwumw88PHiPNaU7pld+fAvy1fqjazX+TfL8CcQeJNcBO6g80dt
	MlPTXn+DFdIBnGn9YFrAbZDW0yanPw4V0LIjwsydPn4USaFuz4eqMVrrQB+iXDo5AvnY
	lpAA==
X-Gm-Message-State: APjAAAXVAO8zt5C4tTWnb2jFSRSLKFHCi8t1F5STZJlT8zezUcXsypMo
	AHp4Iflv4v3lbnSf8+cKVVMSyngbrWXPtTaG5mjinePK
X-Google-Smtp-Source: APXvYqy0VxTA1t8YZd0sD+jc4jwO/fsrVe7TYMTm+yaECTdxK932yLkrdm2n2nu5z/Wp9ngyJKLbetEQay7uuL5A6jU=
X-Received: by 2002:a92:1b89:: with SMTP id f9mr8730527ill.122.1575556406202; 
	Thu, 05 Dec 2019 06:33:26 -0800 (PST)
MIME-Version: 1.0
References: <CANx9H-CNHDMVz4pNz=T1FpmsQ3hDcF=_nWM_a2PhM+KD3JWAPw@mail.gmail.com>
	<20191205123915.GA3151@localhost>
In-Reply-To: <20191205123915.GA3151@localhost>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 5 Dec 2019 06:33:15 -0800
Message-ID: <CANx9H-CLX8q67Xbz4ve24m_rQkLEuUOOE410JEOLo8h7dXnS0g@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Subject: Re: [thud, warrior, zeus][meta-python] Conundrum: python-pycrypto and python-pycryptodome
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
X-List-Received-Date: Thu, 05 Dec 2019 14:33:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 5, 2019 at 4:39 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Wed, Dec 04, 2019 at 09:00:20PM -0800, Tim Orling wrote:
> > python-pycrypto [1] is rather old and un-maintained [2].
> > python-pycryptodome [3] is more modern and is basically a drop in
> > replacement. However, the two cannot be installed at the same time.
> > Instead, one would install python-pycryptodomex which does not conflict
> > with the paths of python-pycrypto [4].
> >
> > In an effort to enable packagegroup-meta-python [5] and meta-python-image
> > [6], one runs into the existing python-pycrypto and python-pycryptodome
> > recipes attempting to install the same files to the same locations (no
> > surprise, they are providing the same libraries).
> >
> > For the stable branches, should we rename python-pycryptodome to
> > python-cryptodomex and PROVIDES python-pycryptodome?
> >...
>
> The minimal change for stable branches would be to add RCONFLICTS
> on python{,3}-pycryptodome to python{,3}-pycrypto.
>

this is only a python 2 issue.


> In a stable branch changing what users get installed is not really
> worth it for a tiny bit of improved testing coverage.
>

on the stable branches, packagegroup-meta-python and meta-python-image
would still be broken, now with a warning that x conflicts with y.

To be clear, the packagegroup and image have been broken for the stable
branches for some time now.


> Based on what you wrote, for master the best solution will likely
> include removing python{,3}-pycrypto.
>

python-pycrypto is python 2 only and will thus be dropped from master. The
conflict has already been fixed on meta-python2 by adding
python-cryptodomex and fixing packages that depended upon python-cryptodome

https://git.openembedded.org/meta-python2/commit/?id=18615f47dbbd109bc2350b86e078da93d066e5e5


> cu
> Adrian
>

