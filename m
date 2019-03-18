Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF136B50B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2019 01:01:37 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id g7so10452741lfh.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Mar 2019 18:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=nYxNuOXFDYeuP0CyXhKFx7SLKMEq+3CZ07kIB0s2AfU=;
	b=vIpWWHbOA4CkSQR6CfNpBVq8eFikwpZgV+hDQH9EW4y9WcU6Qcp9xwha7uSExTCCU/
	GtK4Sa/RofuIvqio9qapTORyuUdORealhGSTpywkkGebsBxnQVKzL7HJpvkmZ2RZuaxF
	j0TrgvPXBiI/nSrY/8BlumlOp1hDHj0nfKS6e2zYtI307+1cit7E6M6Opu/s/5vA2+9m
	Mh3h3XZECmT0wWMBlFMrlfurchEVzbA1pXXXrC233niDzOzzErPYzSuzuGp0MAWeF2cl
	viD4Q5ilHH9se0uyJ67MOJ31mQsDeApzLLwCT9/w/blUkXpLr582RwNrPj5ZzAABsVIq
	3vRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=nYxNuOXFDYeuP0CyXhKFx7SLKMEq+3CZ07kIB0s2AfU=;
	b=M5lGEyzSfe9jESsqwoMzSxh/lGCIsp5+deqEDDruQWCYu9zRvW20j96Hz/MIckntqA
	EaOU0g0tifjqZsRHWKoIwlR+dKC19oWXuokb6onaakC1R242/gPs26NK1Anc9TajmeRw
	/MYSbHQt0AqlbI7F2kf+WTw5WSIgUoA+Dho70NRxa2P/Tsq510G2/TjU9o+z8RHsF9JL
	fsQ5JLAE9q/7gSrI0goF6VC0UVLnBK3+UfW24HkbYF+QZfQhBLfSlKLxKsY6mbbpoD8i
	zj8q7FOWgpKdDxJOwV4DWtSz6br/eceiFGpcm2abINMdUR+IVyYQaGrdgQS/ZX3NXlDd
	vUfg==
X-Gm-Message-State: APjAAAXuCgQAAmZ0S8D+1he5MPIJbH7gVh+RqRueOlg6IbG5ni4VdvR9
	FV7cfjEug3KJiV5+FWFCxxz+kOf28u0=
X-Google-Smtp-Source: APXvYqxCUpx5BQol71aoDnF0LY/PBLLS4exV1U7BkqLEGVuqP+qQ+l5I7MDzkCrkoUfi90chK0vPwg==
X-Received: by 2002:a19:a00b:: with SMTP id j11mr8124435lfe.50.1552870898474; 
	Sun, 17 Mar 2019 18:01:38 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	w14sm1828977ljd.65.2019.03.17.18.01.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Mar 2019 18:01:37 -0700 (PDT)
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <20190316202940.11888-1-open.source@oleksandr-kravchuk.com>
	<e93f9bb820751c5e7670a907681232642f873c43.camel@intel.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <0a58f19d-a16e-2b06-d6b1-3f285048aaa9@oleksandr-kravchuk.com>
Date: Mon, 18 Mar 2019 02:01:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <e93f9bb820751c5e7670a907681232642f873c43.camel@intel.com>
Subject: Re: [meta-oe][PATCH] libuv: update to 1.27.0
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
X-List-Received-Date: Mon, 18 Mar 2019 01:01:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

AFAIK, it has happened once due to the following change in git:
https://github.com/git/git/commit/22f0dcd9634a818a0c83f23ea1a48f2d620c0546

Or am I missing something else?

On 18/03/2019 01:58, Mittal, Anuj wrote:
> On Sat, 2019-03-16 at 21:29 +0100, Oleksandr Kravchuk wrote:
>> -SRC_URI =
>> "git://github.com/libuv/libuv.git;protocol=https;branch=${BRANCH};"
>> +SRC_URI = "https://github.com/libuv/libuv/archive/v${PV}.tar.gz"
> Checksums for github archive tarballs might change and it's not
> recommended that they be used.
>
> Thanks,
> Anuj

