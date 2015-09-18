Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7E87673D13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 17:23:04 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so40590892igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=vjBpFdq4G+SXZXdpHSrjW+/kG+tmGeDHB/I+/nRKZl8=;
	b=F1DPSHgtw1OOkK3dBbCpmWp7FE78Qwr1gzY0LHbMdmvxXT8BQT4B79ckP8ic5AGfXF
	ZU1d+IIOv6m5eUmsuPWdJuOrmOokydyQG8AUM/6QO0oB5apfpSuM8mPeuuiwUehY2WQC
	f6lqu6XzhjMx/cwwZLh2o+ErR0kDIGiKbZMdnKKBw6enRUlaI+/PeqTvRGU5ESnV3AAf
	yxbatboo+bzggfrIppyV2lOMYttxnWWbzwHDN+GrXgyPszor/l9MlK3p2zKkV2qMm9Yw
	R1P/sufIGF/EE1rOlzink1Rf6a6cOmobTc1gdS4rZk7Kq9FEMg0AAaQy7608iwCywkO6
	KFFA==
X-Gm-Message-State: ALoCoQlsiKrlEFMYsx+fBihZH9L1DtGUzvYHCVMwowRfQykGjbBLHSqYrXD2DVkf6jThbKE1RylN
X-Received: by 10.50.88.33 with SMTP id bd1mr15155421igb.68.1442596984781;
	Fri, 18 Sep 2015 10:23:04 -0700 (PDT)
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com.
	[209.85.223.174])
	by smtp.gmail.com with ESMTPSA id 95sm4088059iop.31.2015.09.18.10.23.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 10:23:03 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioiz6 with SMTP id z6so63313588ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:23:02 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.131.134 with SMTP id n6mr14894523ioi.192.1442596982854; 
	Fri, 18 Sep 2015 10:23:02 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 18 Sep 2015 10:23:02 -0700 (PDT)
In-Reply-To: <55FC4300.80503@gmail.com>
References: <CAP9ODKpdOtyML72GCOjR5LmNn6KZCOwrGchwYSreqCEOzd15Yg@mail.gmail.com>
	<20150918120900.GB11095@jama> <55FC4300.80503@gmail.com>
Date: Fri, 18 Sep 2015 14:23:02 -0300
Message-ID: <CAP9ODKr-7nQqHXc8m121jxOWWTF3MXTnTDfqrfurxRn2DJEX-A@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Fido backports
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Sep 2015 17:23:06 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 18, 2015 at 1:59 PM, akuster808 <akuster808@gmail.com> wrote:
>>> If noone has objections I would like to propose the backport of:
>>>
>>> # Upgrade
>>> 2c57f950a
>
> Is going from 0.9.2 -> 1.2.1 bug or security fixes ? Give me a real good
> reason to allow this.

Neither that I am aware of. That is why I split those two as I knew
this need discussion.

We need this for one project and we can keep using a local backport;
this was just for reduce delta for something which seems safe.

>>> # New recipe
>>> 2315f412f6
>
> I thought adding new recipes to a maintenance branch was not allowed ?

I think it depends on situation. I think we ought to avoid adding new
features when possible, specially for old branches as this motivates
people to upgrade.

Have said that, I am biased here so I prefer to not argument in favor
of inclusion or not. As the upgrade, we can keep a local backport for
it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

