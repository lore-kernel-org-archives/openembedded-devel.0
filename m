Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.web11.5927.1594366662682100741
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 00:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=CIwx2PZF;
 spf=pass (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=45341c8fb=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1594366662; x=1625902662;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Z2g9B8pi81MqseFBc1IjaUzbi4DDJke4kYvCY4loMl4=;
  b=CIwx2PZFx1k16/RKDGl5ysjPzCAz3QoJY0WV9R/3QDtX7HcLMqnZpNGN
   eGZfPrFPJd1d9ZiWRLjOhq/E0YAs5GmP8IiSUwBA9hak0i3TIhDRL9SAP
   gCnAL2censlqrbfbQB6bYxzDoB1znSrtQinVJLkep/lQspja71E73yY2D
   Q=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 10 Jul 2020 09:37:39 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw2.muc with ESMTP/TLS;
 10 Jul 2020 09:37:40 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp) ([160.48.96.48])
 by esabb3.muc with ESMTP/TLS; 10 Jul 2020 09:37:39 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10l.europe.bmw.corp
 (160.48.96.48) with Microsoft SMTP Server (TLS;
 Fri, 10 Jul 2020 09:37:39 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.006; Fri,
 10 Jul 2020 09:37:39 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <raj.khem@gmail.com>
CC: <Martin.Jansa@gmail.com>, <akuster808@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [dunfel 03/32] jsoncpp: upgrade 1.9.2 -> 1.9.3
Thread-Topic: [oe] [dunfel 03/32] jsoncpp: upgrade 1.9.2 -> 1.9.3
Thread-Index: AQHWTzuheh3t6q+gcEKvV7kMPYyzp6j/SUeAgAAMgICAAAurgIAAi9KAgABstQA=
Date: Fri, 10 Jul 2020 07:37:39 +0000
Message-ID: <20200710073738.GQ108868@korppu>
References: <cover.1593561840.git.akuster808@gmail.com>
 <fc1b28e574a01410f082034c1f8212139b6107e1.1593561840.git.akuster808@gmail.com>
 <CA+chaQc92KeJnoG+NPi6EvKMHNnLCbN8AFPS9Usdc1S1WNHu9A@mail.gmail.com>
 <24a9b660-a636-a614-4e5c-62bc9782ade3@gmail.com>
 <CA+chaQen7fpxTQ2eT933-5pZjsSpT0pJhciP2UY8V5rwe-6X1w@mail.gmail.com>
 <afc84fcc-e8bb-c8d2-52a4-372b72840857@gmail.com>
In-Reply-To: <afc84fcc-e8bb-c8d2-52a4-372b72840857@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <13C5AFF3AECFFA4488437F4F5FE7CC65@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

jsoncpp seems to have messy ABI history so I would not update even minor ve=
rsions
in stable branch:

https://abi-laboratory.pro/index.php?view=3Dtimeline&l=3Djsoncpp

Cheers,

-Mikko=
