Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.1473.1589926709347769873
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 15:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=HFmtr85/;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=ypzx=7b=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49RVdb1qQKz3r;
	Wed, 20 May 2020 00:18:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589926707;
	bh=oxYQXLWkJOsJCZ+o+LotXnSQYbYj0132ASDsv6mSZEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HFmtr85/GUHtzt1VtSHA6e/jsibePTGcU05aTK0XV3vDEshfdHDZfQyl7480Ittd2
	 dF9lnoCW7Fot2EMGM4QOThsoUpLI2KiVgjg7Yv7vAnWall0YwWkUc4LQid1Bb4iYq9
	 5Qv2P7xVmtO7cDtRqV+udw8rxRKU2/e7gNTWl+lxYyaaP42xldPTKuBB2B3DKFaw60
	 mvxyUltao4GqrcUSJrfDxYkcmBXXKpZ7ARxtsyDqaCKeFe7YG3avDnrupq1CqTYfuD
	 gka8wsG7NcIXSyvtJQRBCrPumFzOmdMgNqkgJuhgApItNboYgczuRtOc2E181Lf7Pk
	 3J4ZBdPkDM28NXCBQ65UpqMcCgFYKaOZcWY/8wtT+b7FW9sg+4R762IZ4jcViXZlpd
	 LgI6pheLqOJt5sL4V7VPBd8iQMjWsvakCNU8tPccB0/MAMJLcDJAwqniv2My85t+bz
	 388y+p9qRBQ9etuX5mjkPp1Bx6RRn4hd8rLMKEHOuZRiqQYnDQ5qMTf8Bii41WurlE
	 B7RVuiogUIFdWtIeRsZxdk+ygzjgsNtek3GR/u4A6vNKNfUQg1yC+bU7ZikKMjD73/
	 LtOf0DYoa0pfhaXdSxGKeRNJXtmUBZ7nl80e54JUvP0pDcnBEguykkrKYaH7L6i9lC
	 l1thqtXAfuWTE/Chxlr9ZPnA=
Date: Wed, 20 May 2020 01:18:25 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] unicode-ucd: Stop broken license downloading
Message-ID: <20200519221825.GA32221@localhost>
References: <16107FFC59C1A7DD.18971@lists.openembedded.org>
 <20200519220009.GA31915@localhost>
 <CAMKF1sqRNyoJzpPFicbTjjW8Vo4qsj16i2NaiF1LN51LeM54QQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqRNyoJzpPFicbTjjW8Vo4qsj16i2NaiF1LN51LeM54QQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 19, 2020 at 03:05:24PM -0700, Khem Raj wrote:
> On Tue, May 19, 2020 at 3:00 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > Hi Khem,
> >
> > it seems some kind of dos2unix was run when you applied my patch,
> > which changed the license hash.
> 
> Thanks for noting, it is patchwork and git am, so I wonder what it
> could be, I will take a look

git am seems to do that, I'll send a v2 with converted license.html
and updated checksum.

cu
Adrian
