Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id CAF6F79327
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 03:51:08 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id h4-v6so16536848qtj.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Aug 2018 20:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Pea/n4pC9dS9Jh1tIyQAdWYlo+5mEL9Gy9EG27qvCdA=;
	b=Mgg7lla8maTUeosN3t7gSrepa0aEcb8TovhaAdoQO3BiYZf9CoV7CXJ0PwN2YLhJO0
	5l+L6J3De8NEVo0WXPcwA2wglizDrh7kFWhQkLflzqe2a8goyN0+Kt6T1Uq6NNUtZFeV
	eWgClgx5vyswEeZ4uYhcj/oEQ52tCuua64V7WCJuTHjeS8RaR5mW5cQxwD/nNOfOe4My
	lWdShmr5KR/vCO+gvjJnzn3UEMAyUmfYS1i2Sb7LP3hZ93XmdbQhz7DRmP7biRt1Pa1U
	S7ODuYT7HXeRDyhAOEt73Vpu+yeuiEXEDIMAI9uAJL/vN/gaOnOW+dpbHBfOHiFpLr84
	U81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Pea/n4pC9dS9Jh1tIyQAdWYlo+5mEL9Gy9EG27qvCdA=;
	b=mxLxkFh+UqZm3/oMeuxT2pQ7DctZHUYW4x00cI7IGIe/p9/x9D7HhudAeQgkAy6Cyr
	zpviA/5/RgDWyDIBgoCORdukSYw/qtt2HYXtgNANWMWzDRevyceVfoLixgZb+ezWrA+T
	//h/ZV2j+DC/AcZLtpyQmOatYxUAfvRJHUcig5f1862FEtfTe6wYcrDElToEaoxVYecu
	cGzlwxdBTkvFBmxi+66l9AV5NEMGZ7rJvJjVe8BxsWL3myZ0yT1/LMG2qSDA+6nI4CTw
	mZmvsoHCTvv+hq187A6UUTgTfp2E/ciDgHM5aOrhENqeMpNku93E4jsP7e7+BSTtkk9K
	c36A==
X-Gm-Message-State: APzg51D4EBz/nz5em3gifxzMFGJmVf+KMp+m9EvyLSmfA6443850D1UT
	BnZsP1N29VbL/L0f84AOywFI3iN+tcYIE8NWZYM=
X-Google-Smtp-Source: ANB0VdbeOl4H6sWncBvVoPfyfMYhmLIo82kylXNyRymj83I+HyHwpdFVa3lCv/++936WKVBrmP77E31hAZgo/oggK+c=
X-Received: by 2002:aed:3848:: with SMTP id
	j66-v6mr12098602qte.218.1535341869510; 
	Sun, 26 Aug 2018 20:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20180817175227.16888-1-joe_macdonald@mentor.com>
	<CAMKF1soe5FGEq6Y0J8D5qW2=8A+dZ0NV4AgtXG3D1=+=16DZ2Q@mail.gmail.com>
	<CAPr_pvtzgvm0_9mQ2NXuXOzuPAWCumMMJwMOHjXnoPhV9HxfNg@mail.gmail.com>
	<20180817210802.GB1452@mentor.com>
	<CAPr_pvt+JrTFUYuXLYtt8XeUffuv7aXME=gDXcrZKyasZ5BU=Q@mail.gmail.com>
	<CAPr_pvtxQfbka39fCQ8MezvwGMoRCf=+Cz8gsKULTRk+vWre=w@mail.gmail.com>
In-Reply-To: <CAPr_pvtxQfbka39fCQ8MezvwGMoRCf=+Cz8gsKULTRk+vWre=w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Aug 2018 20:50:43 -0700
Message-ID: <CAMKF1sp_SV6q6xiPyZ0wXQZeS=TtSg0qfFywUCbYkiz2zPMHWQ@mail.gmail.com>
To: Stefan BOSAK <stefan.bosak@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v3] bird: initial import
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
X-List-Received-Date: Mon, 27 Aug 2018 03:51:08 -0000
Content-Type: text/plain; charset="UTF-8"

Noted with thanks.
On Sun, Aug 26, 2018 at 3:08 PM Stefan BOSAK <stefan.bosak@gmail.com> wrote:
>
> Hi Joe and Khem,
>
> meanwhile I have investigated necessary details in the term of Bird recipe PATCHv3 scope within Yocto.
> I am working on preparation of well maintainable solution/approach, I will send related information when this will be ready.
> I would prefer to collect related information in one message to be more efficient, time frame assumption: within two weeks.
>
> Thank you for your understanding and support.
>
> Have a nice day.
>
> Stefan
>
> On Fri, Aug 17, 2018 at 11:49 PM Stefan BOSAK <stefan.bosak@gmail.com> wrote:
>>
>> I have tested PATCH v3:
>> application will not work as expected, i have already investigated necessary details
>> some adjustments are still needed
>> -> bird.init has to be completely rewrited to follow Yocto stuff
>> -> few kernel options are required, not enabled in default configuration
>>
>> I already have necessary knowledge/experiences in this scope (what should be done and so on).
>> I would try to prepare and test related changes over the weekend and let you know afterwards (when ready).
>
>
>

