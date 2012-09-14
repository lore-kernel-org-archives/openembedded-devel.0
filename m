Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TCWyb-0001yu-Cs
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 16:34:37 +0200
Received: by eaad12 with SMTP id d12so1458915eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2012 07:22:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=i2GsDqTJwSRC2ldfzwHRTP2DR0YJbzqRVVqpmIlesFI=;
	b=B1dgGUhXrIk/Yz2Ui1Z0yMJ/L6FwE/qYlqtxAkwJaZz75mt+i+mpGoBTp6P+zlyffF
	WMHZ2RV0duFMpv48x6TGD1s/pi+s56gEYmq9wZ0vmwWFQ1l0pu9oIzk7ijxaIS2if1U7
	H8XNnOxQ3KKw5b4Bt50Ks4T+AKluEx8+aEQSYaiAGQzujkGkj9yR0N7lHZroEpdEDlF8
	x9jdCJH70SyXqc8DYkSZcEa3FilW6z4iN26NANd8ImtAZ0+xc9dENHggwsi6fNoz+uga
	dfGt8s4Vddw6oW2fpDMOIvZKshZilGpnYwh4Q+/y06JBb24zezalQKKgEgm+pPYIMNpm
	KYfw==
Received: by 10.14.203.70 with SMTP id e46mr3908277eeo.2.1347632522520;
	Fri, 14 Sep 2012 07:22:02 -0700 (PDT)
Received: from [192.168.103.31] (manaslu.utelisys.net. [217.117.239.6])
	by mx.google.com with ESMTPS id i8sm4817210eeo.16.2012.09.14.07.21.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Sep 2012 07:21:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKpDf8Thhmw4yuphXn2XzNaxNydiRVZ-izDfTWB-yoSmtQ@mail.gmail.com>
Date: Fri, 14 Sep 2012 16:21:04 +0200
Message-Id: <2F570B3E-A40B-4554-AE8F-460FF2DB20F5@dominion.thruhere.net>
References: <1347455128-14588-1-git-send-email-otavio@ossystems.com.br>
	<20120914145457.2a3c9a76@eb-e6520>
	<CAP9ODKpDf8Thhmw4yuphXn2XzNaxNydiRVZ-izDfTWB-yoSmtQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQnK8j275Fe6JGyFZFihYlgrzsz1MCm3Gn+U8klLplbOZpUw6RyKSSeULuld2YL9hXNIJg25
Cc: openembedded-devel@lists.openembedded.org,
	=?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-oe][for-denzil][PATCH] libxaw: Fix libxaw-dev to not depends on non-existent libxaw package
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
X-List-Received-Date: Fri, 14 Sep 2012 14:34:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 14 sep. 2012, om 15:04 heeft Otavio Salvador =
<otavio@ossystems.com.br> het volgende geschreven:

> On Fri, Sep 14, 2012 at 9:54 AM, Eric B=E9nard <eric@eukrea.com> =
wrote:
>> Hi Otavio,
>>=20
>> Le Wed, 12 Sep 2012 10:05:28 -0300,
>> Otavio Salvador <otavio@ossystems.com.br> a =E9crit :
>>=20
>>> The libxaw recipe generate a binary package for each soname of =
libxaw
>>> (currently libxaw6-6 and libxaw-7-7) but no libxaw so libxaw-dev
>>> cannot depends on it.
>>>=20
>>> Reported-by: Daiane Angolini <daiane.angolini@freescale.com>
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>=20
>> applied to denzil-next & denzil, please put me in cc of patches for
>> meta-oe/denzil else I don't always see them.
>=20
> Thanks a lot; will do next time.

That reminds me, we need to update the READMEs in the denzil branch. =
I'll see if I can come up with a patch over the weekend, stuck at a =
conference now.=


