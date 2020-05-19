Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.2805.1589911396070819480
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 11:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@stusta.de header.s=default header.b=rAU5ezut;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=ypzx=7b=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49RNz61j4Qz3l;
	Tue, 19 May 2020 20:03:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589911394;
	bh=YqzhDiGkUDWmi0PABI4s0YYwWcvxf3uqqB+B+nv8KPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rAU5ezut6FT3CbZUdhe0q67/ziMxotRKLhmB/lk2p3jaYAY9YD4KzLcp4nH4np0MS
	 mJdcVQVrn0Z6dEf9tOEJJvCes/SzXCNLgGWruv/xn/MFxzDfKOElYlJrKpRwH6buwl
	 PLUp9rgMSHdzvDv/SVTXeo79VTjT2FFLEXVr7GOqLWEwHVjxwGZm7PMpHDINcyXHEt
	 jooRqqha7E914kb4K4ItLw4PKlQ4bO8rSY1OTp0pt2BRqd0vOSuok9LLDoa162OKir
	 jFYgiF5D9hF+YCpoTy7UzM0QhlH9csojE+VFnHX6c/iyq+vYaltA7BhyW+/ECzzsBr
	 edPocgUIxu02DavnSME4GvuTmX+8GxnAO91k4IW3k23DnmyyHJ8c6tSdTrlxG9337U
	 gtWL//Aqwq1FwYMHQnvooctlBA3S0h8r3h5nvunOKEf4AL5NwOmh/k3HsVG5Ef26S6
	 oQAVudTeIvt4KGGqnaicDDSq9ww3yOePahIaj0qLi9PNNQzb7Pxg9a8UB56KcKX2pe
	 weanZmFjAR7xL0JA9fNRH8sc8t5QilXBSTfq/wm2qkgzbYRKlP5hV1mnAotwgSROQy
	 prwjeUIz0xGQ+p9yYF7ltRYJCLWFzG6NFA+VxgCL8YRRTYjXZo6O9UZ4wCLJt5IxuI
	 eeuDqBuprnjDYAPeQCBGQk8I=
Date: Tue, 19 May 2020 21:03:12 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] unicode-ucd: Remove pointless license check
Message-ID: <20200519180312.GB17566@localhost>
References: <20200518121021.11057-1-bunk@stusta.de>
 <CAMKF1spFsuS3PTwzT8-m071-Y_DsGVcCdiwAr-Q1Q8qejsfHFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spFsuS3PTwzT8-m071-Y_DsGVcCdiwAr-Q1Q8qejsfHFg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2020 at 08:10:21AM -0700, Khem Raj wrote:
>=20
> Isn=E2=80=99t there any other file in archive to checksum ?
> If not perhaps add one or compare against the MIT template from license=
s
> from OE-core having no entry can trip post processing tools

I've sent a new version that adds a local copy of the license.

cu
Adrian
