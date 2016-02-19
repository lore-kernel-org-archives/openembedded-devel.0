Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id D2FAB6FF5D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 13:32:41 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id fy10so50459607pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 05:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=eapiDp4RlTsIeSW7VF7QDQjRbEsh+o4IhX3DkymMuUI=;
	b=xbhmqTqEB0fSCOc5Se5zpUoDkFv0fciWjETm0yaaYgpgWpIXYl5XW1CpdnUAx7xfpp
	OivBEO+Tse3czA6co5CRVe20gsPJaRh+KHWOb8Av3jSc3z9Lzr5HS9R+xvLeD7C4G2nh
	PpT9v6GgMexTTN07ttdjW3xp2lB2pPIsQGupfWTwuYWvlHoreB9Z/Xre0ZWYUUztzTfr
	WoVT4FfRUCeLZSE0XqJiNGwYEbNbWBwAML3Ha7MCu6HzxHuDUnbqNKPF/DNW/H0o/HG6
	vZASVdnpCLGrT4kBl4C1aJNYjmXTfSZ4phtWZI/dDhuX+inhSQ9I4jG7VyO+CNx9DhQQ
	+q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=eapiDp4RlTsIeSW7VF7QDQjRbEsh+o4IhX3DkymMuUI=;
	b=iBtjiBYgiDIUiWF5Mextu5EHPw7SeZo0Y4dGeWwa5TerLAozOgKitOgq2tMrYrv895
	OL3VSPuIIe9cT4l5aODqRZ0TTewx7rbJo2p1NILGvJesBi3Eov3ml0NerD7W8TpaRz3P
	gamwwF3f67W40JSBEeoifBe75RylUVjuHzGB0EMJZniTb9SeeyzASn6XQj+0dYEJtCEL
	QJR/ErY7csCXAJzjXmvV2WaulPl0Y5HUGNkgC1OhzpE3UTpZO7ody8tJPRuT42wjWuJ2
	Scl2yyhRO08i8ad29SckB58f8shvD9ARuHrpODOVh2jl/UBs7voJsfUkXKD+FMTq/CBD
	LSww==
X-Gm-Message-State: AG10YOTDANCt56jE81lxBh85L6osonva/D3NFTADnlZHRgemJAmsCjrpFLEzclSGjRrmrg==
X-Received: by 10.66.221.10 with SMTP id qa10mr18053722pac.4.1455888762522;
	Fri, 19 Feb 2016 05:32:42 -0800 (PST)
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com.
	[209.85.192.180]) by smtp.gmail.com with ESMTPSA id
	q16sm17928046pfi.80.2016.02.19.05.32.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 05:32:40 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f180.google.com with SMTP id e127so51367703pfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 05:32:40 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.74.23 with SMTP id x23mr18080512pfa.141.1455888760435;
	Fri, 19 Feb 2016 05:32:40 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Fri, 19 Feb 2016 05:32:40 -0800 (PST)
In-Reply-To: <6E3439D2-FEE9-4286-88C5-0D7E3E2AF4B2@gmail.com>
References: <CAAPZna3WT_cz9YpCaE0iueYXCYxNd0ONRCu0=yuHLcrqUdoKaw@mail.gmail.com>
	<6E3439D2-FEE9-4286-88C5-0D7E3E2AF4B2@gmail.com>
Date: Fri, 19 Feb 2016 11:32:40 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpXkzdSki8exzpbge08Uns1M3rQcc2C1UTPGpuA-WUKOQ@mail.gmail.com>
Message-ID: <CAP9ODKpXkzdSki8exzpbge08Uns1M3rQcc2C1UTPGpuA-WUKOQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] Python Flask recipes
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
X-List-Received-Date: Fri, 19 Feb 2016 13:32:42 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 19, 2016 at 1:46 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Feb 18, 2016, at 10:33 AM, Fabio Berton <fabio.berton@ossystems.com.br> wrote:
>> I noticed that a few days ago were added some python-flask recipes.
>>
>> I've been maintaining a layer with python-flask recipes, hosted here
>> http://code.ossystems.com.br/gitweb?p=meta-python-flask.git;a=summary
>>
>> There are recipes in meta-python-flask that were added to meta-python
>> and I want to simplify maintenance and avoid duplicate recipes.
>>
>> So, do I send recipes from meta-python-flask to meta-python or we move all
>> python-flask recipes from meta-python to meta-python-flask, using a layer
>> only for Flask web framework?
>
> Here is a hierarchy one can envision
>
> 1. Core python runtime support - Oe-core
> 2. python extended modules and infrastructure - meta-python
>
> now if you think this framework is quite commonly used and is kind of core
> to python world, its fine to have it in meta-python, if you think its
> too specific then move the common packages to meta-python
> and maintain it as a separate layer

Agreed but this is a specific framework which is not 'core' to python.
Do you think we ought to merge those on meta-python or keep them split
out?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

