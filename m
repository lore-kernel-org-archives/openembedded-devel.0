Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3121E60762
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 17:33:33 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id 192so37526199vkl.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 10:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=jIIBf/m795nYHkpFREArZqK/hckcuhUJm/9MIrsI8T4=;
	b=hbRBi1aNOc1Z3nNmFr2F6nREk7xPnHrL6M8rJaeKXq/RV0rVMPRPCagGSk3igFF/cq
	Co4ZmMEldQHCA3mvi1Lwiq0ahLWCKHRqVNGlh2jZpstYsilPfSi1VqNKc0V70wAHPj3n
	ynrTcG5fG4mOeNLthWPdVjhvgNetzDMtvgcRLmOGh/UpW1LhRCFjpLN3cBkZaknhkr65
	fJTzQP101lxiYtY7W6O0p59zhmWM9PfJfglAVjB5t8jqG15W0hOFR5EGEWJgltm5LxRL
	e+n/oWAFHEQ7LN/bYdaFgRHvdthnO5vftCjhwRGxVRNjqg464Ku13RJvtXZYABs+ShIK
	jolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=jIIBf/m795nYHkpFREArZqK/hckcuhUJm/9MIrsI8T4=;
	b=eF2IpCt9gSu3r3DSkJBr6hje2yOGOzB1N1AcJTq7980XuNoqlxWvPh5SiSnGGUR4lU
	1PG0s0aDoYLRe1x4oTp/7iAKvWz6rvoaeuITv1etj2/AkzmjYfdQjpiPxhNdMUwTKEZl
	J/Tik50YpPeItjxIt6+gcZFI3N7zF+xtSGG0hRo2AuJBFiFqWyUyx0ivemnf1DuG0P96
	beixDJXgjR4YW6VbFO1dAX1CeOKI416t+RMXkD6yyOS2qrTMHd4Cbqs/WIsguE9rMn4q
	gAcgYArEXOh797kRorpi9EPNKvkfvMiRX4sMrY2v6pOo2mRg48b3cJ/8yXLjx5I+h2Df
	JUTg==
X-Gm-Message-State: AE9vXwNDJY8g9Z2lZsVOOG4ixCd+tdJ0dHu7+xOHzA/7VmvGLbj/3FPVYTpKjGU6y/m4wQ==
X-Received: by 10.31.16.11 with SMTP id g11mr4638260vki.148.1474047213684;
	Fri, 16 Sep 2016 10:33:33 -0700 (PDT)
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com.
	[209.85.213.41]) by smtp.gmail.com with ESMTPSA id
	m94sm1838568uam.11.2016.09.16.10.33.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Sep 2016 10:33:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f41.google.com with SMTP id g9so37440885vkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2016 10:33:32 -0700 (PDT)
X-Received: by 10.31.223.132 with SMTP id w126mr4956567vkg.29.1474047211864;
	Fri, 16 Sep 2016 10:33:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Fri, 16 Sep 2016 10:33:31 -0700 (PDT)
In-Reply-To: <AM5PR0401MB2564D303C71FAC049601B1C986F30@AM5PR0401MB2564.eurprd04.prod.outlook.com>
References: <1c3592fa-fc90-a265-5344-d83e5efe9464@nxp.com>
	<AM5PR0401MB2564D303C71FAC049601B1C986F30@AM5PR0401MB2564.eurprd04.prod.outlook.com>
Date: Fri, 16 Sep 2016 14:33:31 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqhh4aiQ5LULu0TQnV95kxV=oADngS9cyr2DRF0DNKNhw@mail.gmail.com>
Message-ID: <CAP9ODKqhh4aiQ5LULu0TQnV95kxV=oADngS9cyr2DRF0DNKNhw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] packagegroup-qt5-demos.bb: Includes some interesting Qt5 demos.
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
X-List-Received-Date: Fri, 16 Sep 2016 17:33:34 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 16, 2016 at 11:45 AM, Ann Thornton <ann.thornton@nxp.com> wrote:
> This also seems to have gotten lost.  This is a packagegroup putting together some useful demos.

The patch seems corrupted; please rebase on top of master and after
test please resend.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

