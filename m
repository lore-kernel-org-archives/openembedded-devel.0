Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id F3DE970031
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 18:24:54 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id y69so49941833pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 11:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=BtOofBdh+4OZR0UNwJhsU1C0j3m6Mv6VipDnRcc/x1s=;
	b=MgGaeWiLPJwMx+LL+qTi8OLIVyX/rToGL8LKbYVoa25Ny7ed/5odS8aVELIB5ILQQT
	n1KmuTEstnMwJsPIvpaoEIO6H6Yl8kNGebE2+zNaNTZzicN7YozgQC6i7r4+gVgC4Idp
	4qjeo2jUK/5KJBMfQnKcdGd+UAiWpDDyrpN8IjT8Kg3S0d7chxQom/HD4a3eDF9MhVRU
	g2p78VFfMiSG+3tcV21iEN0E0/sLNsYXEOW4G45X3BqHwARWikU+bBm+Mz8kTQPU2BDb
	AK2/fXVm5FNwKjQ2ZRNNbnb0tVYQ0LTP+/+WcToi6aU48iybyih8ziKrPby2GXIctdO8
	xlHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=BtOofBdh+4OZR0UNwJhsU1C0j3m6Mv6VipDnRcc/x1s=;
	b=gSbSEOTthQPcPbZk/GcDnSSBAO2h6AIW6KyD5ObY4mRo2d9wqi5WR4RY7vb0TN+uan
	sKpvLmqOSG6qe1BVnhBhcAJourYgW9DBsd3HLpnqsadAWEM88B5gijr9jVEVQAd2tX95
	bh6eAy4ZAHW3ZZ2pAdbHy0BDMKBYJJdFC2isUMqgsLJ4yQh0KhLghwXCDtQzHAOiM5mR
	7mXo6L3R9W2CN0r5OyXdCQ+LY8ZZWdJImjdpKuZ0tZRWTvVflLxjejcqeYYeMkQS6unT
	1XEwzzz85Oc9Osl7x5MnTLIdsmS60sROx5Mu5KE6b0PcymjrbhZOIrit+iwIzYBBnEJC
	VaCA==
X-Gm-Message-State: AOPr4FXvEhDe1x9Xpk/NKm1jHouLS/ImNTmwimrBT32AfjrtAEo6oh3xkKFwmbE2yQpHKg==
X-Received: by 10.98.22.193 with SMTP id 184mr44881088pfw.116.1461608695496;
	Mon, 25 Apr 2016 11:24:55 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:606d:9ea8:d7b2:ab08?
	([2601:202:4000:1239:606d:9ea8:d7b2:ab08])
	by smtp.googlemail.com with ESMTPSA id
	u63sm6662181pfu.18.2016.04.25.11.24.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2016 11:24:54 -0700 (PDT)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Martin Jansa <martin.jansa@gmail.com>
References: <CAAPZna3rXuTpEx1F=jzqUMRyCkD+xh6S_d+QR++XALMh6bBLZA@mail.gmail.com>
	<CAP9ODKrfCC+Nyr9EHd931gnoVsyngZ1hvBfBwT4izx4TiOf-Zg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <571E60F1.2020804@gmail.com>
Date: Mon, 25 Apr 2016 11:24:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrfCC+Nyr9EHd931gnoVsyngZ1hvBfBwT4izx4TiOf-Zg@mail.gmail.com>
Subject: Re: [meta-python][krogoth] Backport python recipes
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
X-List-Received-Date: Mon, 25 Apr 2016 18:24:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 04/25/2016 11:06 AM, Otavio Salvador wrote:
> Armin,
> 
> On Mon, Apr 25, 2016 at 10:45 AM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
>> Hi all,
>>
>> Recently I sent some python recipes for review and last week were merged to
>> master. Could these recipes be backported for krogoth? I tested all them in
>> krogoth branch.
>>
>> Recipes are listed bellow:
>>
>> python-bcrypt:              cb95c5edaa977c8361628dab04b95192c423fc1a
>> python-blinker:             5a7f267941689eff28b4b0721752708bad4747b6
>> python-flask-bcrypt:        00d5837fd39af7ffae262282f56a0cb42a1c3b89
>> python-flask-bootstrap:     962e2ab371844f5119df2b8ab4a4231f6f7f9f3d
>> python-flask-navigation:    381d498441bd66bdae2d8da1ddcaadee1ff6de73
>> python-flask-sqlalchemy:    3e4ecdd6fe6709f394d92e86ccbc228ae5a43663
>> python-flask-wtf:           4be70064670c34d1b67224672b7caed7b4ed7b04
>> python-pam:                 49b35175d5018dc626a17a9a0662d97e812aab7c
>> python-wtforms:             9676ebb7d14090126f667671d525ce3f3ee89279
>> python-dominate:            5a20e8799eb1c1dd38ec9fee15fd90b88b38bba4
>> python-netaddr:             d3767d923d5044604633be3a3ba8bb4564f51b04
>> python-visitor:             834392bfada652260f6d5924278dd5839d095941
> 
> Please check above. To be honest, I think all in meta-oe master could
> go to krogoth but you are the one to decide on this.
> 
its on my list to check.

regards,
- armin

