Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id E524C71D9C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Oct 2017 16:31:56 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id z84so8185647pfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Oct 2017 09:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=Vb9KKmeXh7RBPV8CyRC/heSIv5qE8eaAhVAQkqv7HbM=;
	b=WuruKRbJnfsqLPmIpyIuDDUlPDUcHRem1hmq92iCAJYn7BQNhJWSEZHZZ+QCf3rVG+
	yT9KiePPrpTHCUPxXRcU/lA7iliOcnAd+bWCc2yX3SuxVB172MvyMt0opgwV/ve3q8Zh
	P70Itq5Pv7TfhTSYhD1y2ZgRiJ3H2fCMToiMmO9TDY8Ama/hU2zHo6FAk7k9mmSrNZ1j
	EbRq/s5q7RNzTklMrUPp5WYcszLZHg/8KfGf9LNOeZ2/ZjuuuJHZE2SDbaZ30LNCMEr7
	L4B+ubkzdNHT03OwAmUrbnEl6ETnb+C9/7EZTKKqh3FfI99zh5HT6HmTtcFWYFJc63Fb
	eD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=Vb9KKmeXh7RBPV8CyRC/heSIv5qE8eaAhVAQkqv7HbM=;
	b=GA6NhYd8moLoaOY6aLvjI7L7ooLiZ5Xut9O1dQzeG25p3IT18vcZEvTcGkxiKtE+SZ
	Tt2P5WylUKyIFn3GkDvH6IzKggZuSO8kVR9eG8XKwt85oGiBTZ/0UihmsjxJltHP2nlC
	viLSqGKZ7kSpgX/WFbjpNxYtQdWd95LzR3TOpeabxBAXL+FES27qTIhJSzHHMtaV8tiK
	+H6XWvUOrywdrmOoXDEPPK173+eOKdosWvzVu+w++Ygalxi4+NgnHv1+fYnr6Bf8dSgz
	GEFwCItl/+1PDxzIqIPMGt396usIqX4/NU6aQxrI2T1WRpgXR9e+3wj3Q5rM7sr4ORKl
	k9gw==
X-Gm-Message-State: AHPjjUhdHYUnr2ijrgzgCv1ypHg9WvNAC62Hqn/k6JArx76QQQFP+Mks
	m1o2pbDmpImcANMuNaXn2AFtGw==
X-Google-Smtp-Source: AOwi7QD8+25elTFBAhmFhBOpXgl8sbZW4t7KuYi+29HnGHJcITT3I67EEgxu2TiYuWkkTElHuVYpkQ==
X-Received: by 10.99.160.2 with SMTP id r2mr21434968pge.158.1507221117836;
	Thu, 05 Oct 2017 09:31:57 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:d49e:b0ae:9202:32ab?
	([2601:202:4001:9ea0:d49e:b0ae:9202:32ab])
	by smtp.gmail.com with ESMTPSA id
	l5sm17605455pfk.114.2017.10.05.09.31.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 09:31:57 -0700 (PDT)
To: Satya Bodduluri <skbodduluri@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <CAGNWprvL2=xrH-ve8qF6z_AAAHjJ3WLWA5761V-fUwwhZzUrZA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <a8648b87-8236-5353-7db2-7a20fa519212@gmail.com>
Date: Thu, 5 Oct 2017 09:31:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAGNWprvL2=xrH-ve8qF6z_AAAHjJ3WLWA5761V-fUwwhZzUrZA@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: asn1crypto dependency missing for python-cryptography
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
X-List-Received-Date: Thu, 05 Oct 2017 16:31:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 10/04/2017 03:01 PM, Satya Bodduluri wrote:
> In versions of python-cryptography >=3D1.8.x, it includes a dependency =
for
> asn1crypto and removes a dependency on pyasn1 as can be seen with this
> commit:
> https://github.com/pyca/cryptography/commit/0e6a129724b707ebf7914937625=
1e85fad550414.
> As
> far as I can tell, asn1crypto isn't included in
> meta-openembedded/meta-python.
I have a recipe already created for **python-asn1crypto**recipe this but
is residing in another layer. I will submit a patch in the next day or
two for meta-python.

- armin
> I've managed to work around this by using an older version of
> python-cryptography, but I just wanted to make note of this as it makes=

> portions of the newer versions of the cryptography library (the master
> branch of meta-openembedded is using version 2.0.3 of python-cryptograp=
hy)
> unusable when it can't import asn1crypto. I'm not sure when I'll have t=
ime
> to create a patch, but I can take a stab at it if no one else beats me.=

>
> Thanks,
> Satya Bodduluri


