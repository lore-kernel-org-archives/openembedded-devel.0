Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id B5AF860745
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 16:50:26 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id z75-v6so11996516qkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 09:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=l+9YoDrAsaz+WPIFZ+UFvV0w1v9TPgiS5J7Tvh59BUg=;
	b=N1DwH5VdMAw2pmyx2BHTLk3d233YPcy8lA6PeLzetzWPGrVNo8b07/qSJNQ5/kZzHD
	DGy3WXDuYfepLbpjZo4/yuc5wBA2Qphq6wkiSf+uSofbtcdw9y64TPeCp/c2d1QbTWaP
	gaB/uFR5GYNsrS59VviKP8BIIHDXfBE1hmGLoekAFVThwBygNdidnpq4rPdQxNzIQf3r
	VREfrPKFVMvn32P5WwTuz+v4IUeHk3XnDcBL3qAt8zFDLqvgV4jlIOzfjzVf7sdQyMA3
	0rfqtefgksoMEqt45DzzVofRAXpIH0iRGjKesmYR2Ci/l5VKLfnXHs04a1knM6Sh6h6F
	v6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=l+9YoDrAsaz+WPIFZ+UFvV0w1v9TPgiS5J7Tvh59BUg=;
	b=E+AsDMdClAweOyzFyvOCX/Aa6Ve7StpGyWTTL4TKzvTijaL5kxlxmPzaQ3EhJ2p7VB
	xD1c+LrihIybiH+q33qikCEGpiulg/VqJu+CVR4CE4K8f5z0P8rAhuetGXKLW6ZUlx/2
	SwSWbt6NLugjbceBLeqLD/eg4GCEHhGbCvIJw3/br/IttVSLjQiXt9QlEKrQ3G1RshkG
	wdpWL0jjWR2F91UV8LpV8cuyOeu1nxs1RSUtpVTe4+kTcO2ryHYW40fjfnVTwNdpAAjS
	AdTNLyEkp9yoQ4RYcDS8BHZ43nOxVVIFWdjmyqQXWsznDJSAy+TXm65+gG9uhHTv/+Ip
	shMg==
X-Gm-Message-State: ALKqPwellHk4btQ3F9LNN6C25bTbdpEWxzrkg6xJ/8uHhQCzEef/ZW4e
	hl0TlOQ1n24nXgQ58wbePHuCxg4BPdvKchlv/UA=
X-Google-Smtp-Source: ADUXVKJuzfSq6X8X74WI7dUO3CPOeirQHRmz/+u8BbumAuK8SpH7PNEWAjT5tridBURS0Wj1wGQgAKIbfXCthyvGmY8=
X-Received: by 2002:a37:95c6:: with SMTP id
	x189-v6mr15494658qkd.110.1527612627156; 
	Tue, 29 May 2018 09:50:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9a0f:0:0:0:0:0 with HTTP; Tue, 29 May 2018 09:49:56
	-0700 (PDT)
In-Reply-To: <2230562d-1e75-df96-b56d-108f55bdbe6e@windriver.com>
References: <1527234893-8733-1-git-send-email-yi.zhao@windriver.com>
	<1527234893-8733-3-git-send-email-yi.zhao@windriver.com>
	<2230562d-1e75-df96-b56d-108f55bdbe6e@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 09:49:56 -0700
Message-ID: <CAMKF1sp+8BRXdxEaQpfCaEJeyHqKKUv=8Fm1MJDx2TyEr1fO-A@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 02/12] geoip-perl: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Tue, 29 May 2018 16:50:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 29, 2018 at 12:09 AM, Yi Zhao <yi.zhao@windriver.com> wrote:
>
>
> =E5=9C=A8 2018=E5=B9=B405=E6=9C=8825=E6=97=A5 15:54, Yi Zhao =E5=86=99=E9=
=81=93:
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   meta-networking/recipes-support/geoip/geoip-perl_1.50.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
>> b/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
>> index a8c8bcf..0a89be5 100644
>> --- a/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
>> +++ b/meta-networking/recipes-support/geoip/geoip-perl_1.50.bb
>> @@ -18,6 +18,9 @@ SRC_URI =3D
>> "http://github.com/maxmind/geoip-api-perl/archive/v${PV}.tar.gz;downlo
>>   SRC_URI[md5sum] =3D "2d7f8b1b54e6ba6d9e3fefce52675815"
>>   SRC_URI[sha256sum] =3D
>> "86da0dd67f417a43dc70f15a49bd3619f668970c117b9e7f737b4ab246c240a6"
>>   +UPSTREAM_CHECK_URI =3D "https://github.com/maxmind/geoip-api-perl/tag=
s"
>> +UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
>
>
> The UPSTREAM_CHECK_GITTAGREGEX should be removed. I had sent V2 patch.

Please rebase it on top of current master and send a v3

