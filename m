Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.18033.1597160938695025465
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 08:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=GaNIXwZN;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=omdt=bv=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4BQy1N5jC9z2C;
	Tue, 11 Aug 2020 17:48:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1597160937;
	bh=HfOxgvCAPLYwsM87tImLng+PkE1KB4A2LrcxcG+BrFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GaNIXwZNalKmYCfspTppD2UCIWGFb2X1+igA+QVtHJJmEEQfNjiWRXBmDZpVn9wvA
	 brHgk8SKwTedt3Z81hRD+m7cKiuvpNpSeCN/zCvSUUNbYlOiBQAuobCPjXFpbWbArH
	 f/7H3go8H9uQhvNWsXpmquckYSiCYvncOAAVZ5a1B1LaO+3OAn2hJEq0DlkphVw/9b
	 4CfschQMlOpfx0RvnQofX6RZaBoS3q0CHYNtb0tSUpPZ+/UYeEFdo2Q24hIodfldYN
	 vvQxuXLvT68CKhKvuS6j2GBKOtm2fW9rdeUc2gDvD5IiMcu1PfKdaevqPCNQhzF7Qd
	 97P7YyuLLfMtNTTMLFXeZOQoiBb2ShhNsDR+kKNROx3hXt824HChBWmqA5xdB3McGz
	 oUp4TwjSaBVBX6mvmkKvAafWFqk2MvDrPVrFE7EDqVmAGo65gKwLoeYFVRbPgzIKuI
	 BfJDXAWEqgBRvox2HFqNyA2XsErAGAHXJsgEhdwjikPZTKAhBydIerI4nPTi3nFRTo
	 0Zem7FGAk41xOQAhRitZnV8d71SxK/eDyEolwNFcatBA25qcYvE5mW87Ryn7nb/D3Q
	 nNkRomThA7JQYEFchyvXO6nq3DuLAzLxBPFheZjoMQXwVM2HzWul7A0P8rt5rmWErp
	 UntZT5BUuRAWh7+nlWhMaMQc=
Date: Tue, 11 Aug 2020 18:48:55 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] libpeas: gobject-introspection is mandatory and cannot be configured
Message-ID: <20200811154855.GG7488@localhost>
References: <20200808125351.17467-1-bunk@stusta.de>
 <CAMKF1sq+=xDPy6mfM2cSb1eVruGe3bQjV8dATa3Eb8=bUVymfA@mail.gmail.com>
 <CANNYZj-uxf=uyDw9-gV_jTKJLN6TA51-B=oREDfxtwMnLH4C2w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-uxf=uyDw9-gV_jTKJLN6TA51-B=oREDfxtwMnLH4C2w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Aug 10, 2020 at 09:15:53PM +0200, Alexander Kanavin wrote:
> I had a look at this, the failure is in unit tests which do not honour the
> meson option to switch introspection off - can be easily patched out I
> think.

Andreas has just fixed that upstream.  :-)

> Alex

cu
Adrian
