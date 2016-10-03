Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 053137199D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Oct 2016 19:58:40 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id z126so170927844vkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2016 12:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=T07SjmrUqwQxgrrFTymMrmYaik67llZrKVt3kMlfGLg=;
	b=DBVJzDV/N6elaIFSOOolNmP6X3iHATBVPw/PbDo0DQ0poqHMIJIg8FnFbLT5QJn7wF
	XSCwMeO6bN26ba9Cqi6J3DKTnJAQnNVNhrCUYUZhUI6buuVN4cXd3n+H7Su6xCePjC3V
	B6N3uDmDN8dZTQGeT53qru+YZoYcX8ueyuKLvAX5xe/EaQoDM0kRs6Vltn3sV9GBaGTv
	kXKSwcCrHyE92X4uc5PeUnn0v5qIlXasauX10veWOIhmxfGCaAEqQ2945jHmEuYLltKi
	jtshdlLJMP0Ufx6ngitO+TkhGDpPnvEe0yIn9WoDO6+i/8ppR8DRUbtmTsQJGprS3pHO
	tesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=T07SjmrUqwQxgrrFTymMrmYaik67llZrKVt3kMlfGLg=;
	b=VlW8AgRuNILt7f1WS7ajv6QtohHQO+nklQUpYim4dpCDBRW6dqNMzQdKDys8yfGwEG
	0CNebLxFmExG+/iRnuBwD6L1fBY3LyYDn+GdpP3YKEC7aBOsxx/Z73H2rIPRilcI6aML
	JFJISwEJCvUh6jbeXZWOBuVyy3SZG8+RrTPkPb2PEYWQ8sxKXcxtzXK9ZGayCejryBLk
	+z2QbB+ulXtR5wWFJ8wVsQPBlmu7RxdNZr2a42wXYXoAaL/wgMIz26WEsO9eAim+o/fX
	L7d7BgK8VQXOoX1JsPIe8JWm6U4OoYk589GitN7TXpGbI8GIoHTqGFhpda2xl1Ef2NBK
	cmyA==
X-Gm-Message-State: AA6/9Rnos5foDZOYA60jbYU03ldNDjW4WAw5nlsGc39sqVRbFe7GQrMiFWaJZWWhacVHcg==
X-Received: by 10.31.65.213 with SMTP id o204mr12934785vka.3.1475524721115;
	Mon, 03 Oct 2016 12:58:41 -0700 (PDT)
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com.
	[209.85.213.52]) by smtp.gmail.com with ESMTPSA id
	x195sm8229530vkd.5.2016.10.03.12.58.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Oct 2016 12:58:40 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f52.google.com with SMTP id 192so170828938vkl.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2016 12:58:39 -0700 (PDT)
X-Received: by 10.31.210.130 with SMTP id j124mr15486693vkg.17.1475524719690; 
	Mon, 03 Oct 2016 12:58:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.110.143 with HTTP; Mon, 3 Oct 2016 12:58:39 -0700 (PDT)
In-Reply-To: <CAAPZna1EHTEKernEX88FO5gv=1m5VrEhf-S3LB6EDF91j8vd2w@mail.gmail.com>
References: <20160929133054.20096-1-ruben.de.smet@rubdos.be>
	<CAAPZna1EHTEKernEX88FO5gv=1m5VrEhf-S3LB6EDF91j8vd2w@mail.gmail.com>
Date: Mon, 3 Oct 2016 16:58:39 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrB3rdsRuoxqYrO3vPsMDuYC7g=ZHNeAjqFW18JJ5Cvww@mail.gmail.com>
Message-ID: <CAP9ODKrB3rdsRuoxqYrO3vPsMDuYC7g=ZHNeAjqFW18JJ5Cvww@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-python][PATCH] python-scales: add recipe for version 1.0.9
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
X-List-Received-Date: Mon, 03 Oct 2016 19:58:43 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 29, 2016 at 10:54 AM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> On Thu, Sep 29, 2016 at 10:30 AM, Ruben De Smet <ruben.de.smet@rubdos.be>
> wrote:
> +"
>> +
>> +DEPENDS_${PN} += "\
>> +    python3-setuptools \
>> +"
>>
>
>
> Is this not provided by setuptools3
> class?

The DEPENDS being PN specific is pointless also Fabio raised a point
which seems ignored.

Martin, please drop this from master-next until it is fixed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

