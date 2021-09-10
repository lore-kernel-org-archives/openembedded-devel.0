Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by mx.groups.io with SMTP id smtpd.web08.11511.1631290765168185269
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Sep 2021 09:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=kK6cazUo;
 spf=pass (domain: gmx.de, ip: 212.227.17.21, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1631290762;
	bh=yKM9WotIixEOGvdUNyyEL3q+u3INoRfSYUI2ATcRa9U=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kK6cazUoAHUm3Jp2JPOZIGo5ekwnsOOt8Cw6C+kaLweddT317c6Pltp6yu9puu7zW
	 dJ3wcpKh/J6bw33czkzbq9LMHrVf50dpHPWnq49rIRNji8LnevYvxXR2mHdQGvcjF3
	 tebaaSPdKAxZtot2PA7SZBuo5F/zOIRhaEDG/c/Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [95.88.57.223] ([95.88.57.223]) by web-mail.gmx.net
 (3c-app-gmx-bs62.server.lan [172.19.170.146]) (via HTTP); Fri, 10 Sep 2021
 18:19:22 +0200
MIME-Version: 1.0
Message-ID: <trinity-06b447aa-1d6e-44f3-8d83-48a5695b64ac-1631290762033@3c-app-gmx-bs62>
From: =?UTF-8?B?SmFuLVNpbW9uIE3DtmxsZXI=?= <dl9pf@gmx.de>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][dunfell][PATCH] backport: xmlsec1: Fix configure QA error caused by host lookup path
Date: Fri, 10 Sep 2021 18:19:22 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <1748135f-e547-ac98-8caf-1b98e46e0845@gmail.com>
References: <20210811123943.32085-1-dl9pf@gmx.de>
 <27614.1629203089074878790@lists.openembedded.org>
 <1748135f-e547-ac98-8caf-1b98e46e0845@gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Vuayi2xiIYj0iMHPHg4wRsp7FxNkinH2CSm/bZQCTluHSxylEAw/FBxz0kbhJStPiXZpI
 mWO3qpWMWCl1YZG1BLvvgjpe+wTzJFK1Rw+dHspPFcv7B8Offbyb0+Hu8+fHLZI3pqZL0dPa0hsq
 8m0MRyT9BNhMekvTIBPUWaHsDFqvnA8PlNlD/74BVD2Jc1yGAE9X3HcGEl0eQVbWKhBMb4iXT4kW
 OcBzOk6QgYCrlOMopMbTQYlob3CYdWrE6+PIyjc4x9RW77Cv3aLnXtjCNUtS4eEYAQVBybbomTZH
 oM=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QsW5wvfdZaU=:887V2lOUjjkhPt14/ToOHb
 cxjEcie81W0F7pvaCkXTDzrOxUu27Xj3khQ4wWV9hws66kc9QRNjYO2u+er0DoeiOuvkoFQvj
 PGLJ/NafpZftzLXn0c00vK24ez4JeEyT/Qbex4LcdajOSUNAt2cflq59jeQk/sTtfmPbWDMAH
 EwfQuOUeLkgabCJ2Eyc63cQZDanet7oe+nWvq1gkHaSCMmNQJTaDjMdaLJWJfqkyJcnypM27u
 bnAbI1t2HA1xGiMud/v9QgD8lrnCx+kbKw9gqEUcHAOBJawg104O6ntwubtB0y+FUzr0yL0xO
 zfkjKICvydyWlGghq2ViI6avMv5AHANL2+NW+ftDLIb2uo1kGSNu0UCjdeYR6oc1/36YCols5
 T6GSX6mdDCbBsC5hfcxDh2Sys3kLZhBeyQ+8LRWaM4Np2LVPMDjiqU9fMkzzMNfWRv/2D8bOH
 g4gZtthU0IrFp5ZylVe3/Xsk1LdsGdwZtt/zA+tMfWO9+TzRvZmTKrEGIjJIxdTmuMahBysbx
 OB4MGe8QUp4BQsvIl7idJ3vIEKb+UyYIeV+G7snncFWsaFCh1QVQ46aI+E2O/oqhWJ3IQVhPh
 sOLpelRe4oA+PhXc1iLX7NL7yfxoD+qRWh/rR0n5LtTlTmDGJOp2ZpvRlIrDywLlUd4Sbvhuz
 wxHu3MQo9BnQ8YEsA6u3Dh7ACXz0BJT/BE4nn+fNCi69r2elDWofb83/GV1vdYWQMeGR9Nnc7
 FAYZ7sdzmmlLOulyg6RX19JrIld/9W2x2ZYYOnZ+4p3x0wr8Ou4/OZ6c+/U=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks!

> Gesendet: Dienstag, 17. August 2021 um 16:21 Uhr
> Von: "akuster808" <akuster808@gmail.com>
> An: "Jan-Simon M=C3=B6ller" <dl9pf@gmx.de>, openembedded-devel@lists.open=
embedded.org
> Betreff: Re: [oe] [meta-oe][dunfell][PATCH] backport: xmlsec1: Fix config=
ure QA error caused by host lookup path
>
>=20
>=20
> On 8/17/21 5:24 AM, Jan-Simon M=C3=B6ller wrote:
> > Ping.
> its in my test branch
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dstable=
/dunfell-nut&id=3Db472160c77dcfdf46e4d4eca69428b971238f4a9
>=20
> takes a long time to build dunfell on my system.
>=20
> -armin
>=20
>=20
> >=20
> >
>=20
>
