Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 846AC7E601
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2019 20:31:07 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id w12so16249941iol.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2019 13:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=PCsWfePwuF1sAIggIaA9q/ydjseIOM458lEGSZtWbsQ=;
	b=YSWYYZ2NAj2cM8KfJn8vtq2MfhhAuD2fIuJCVBYMCrtIDbllZvmhW5+GZsHahEBktD
	Z16zCYdf64JGdQkQ9DBgNIz4KFygw0r6UrPVNIRwwoRTiSOHI/IzSAFW72LirCt6QmV3
	4nJiSGEUUiy1OXd5MugM2U/Uc1NVApLsf550xB1Awxeu4n8jZhj4MZeUeiTS4PyIGo23
	yZJlrZq4AuUSKwQvQ5sOCWpWMrX9MYNld6G2uGjj3petHmOJqSyXMCbyRMC7nv3HNG8I
	JtQMG5z2pJgOwEdqWacWD72sMarN1h6veRhvxKTniWCAG4TDccYORr/FYwi7x+/VUYsa
	Hr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=PCsWfePwuF1sAIggIaA9q/ydjseIOM458lEGSZtWbsQ=;
	b=UHrFHK3cC8iyCBm9+rdvnpKo2VvVIw4xT9ly2139hoOyc7iO8onU9sT8Ze/AxrdEUU
	HYAT9xm3tW/j+ik7Pfd0/SVI9Apash9diDiTwHX4nDXAKDOFclgM6+dkn34ucR6ot4vk
	alyV9b+a5O+JvSK+ILBKilHQlGBLQHID7YTaIop0wU+jDkzCspDBfgbwJ+I+O2z6+KjD
	zMlT4XeGMUdOSDRl5NTTPylgUSTaHFZXpBY8ad2VcmAsVZrdCIz5sjgCiFi6fLIKr8T3
	nkMVNEQY0C+JmTvGNmuXUkYalQn4I/erTlHyNpnK5j2TzOX9N+zEiI2oXXQzul/y4By/
	TP7A==
X-Gm-Message-State: APjAAAXUNVc22T1xVaEU2fg9hF43S3BEqem5sM21sZhVyJ2lgNLJZwZN
	M3kgQmA7j1mKa7hStacliyoX3w2Y+A8dzQl1dqlgXA==
X-Google-Smtp-Source: APXvYqz0iyBmXK+nVfwMjXWoIDcBaUgIegPRcyRujfDqeGSqZwE5RbOESSwpVIj9kZ1QkygdyGr8RdXPvcG4j4+f3QQ=
X-Received: by 2002:a92:8e4f:: with SMTP id k15mr19069626ilh.108.1570221067965;
	Fri, 04 Oct 2019 13:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190926223206.26850-1-schnitzeltony@gmail.com>
In-Reply-To: <20190926223206.26850-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 4 Oct 2019 22:30:56 +0200
Message-ID: <CALbNGRQ4g0rvAwedd8v+YH+GwGEwa_t=QioOERhx3qyNbrs_EA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Kang Kai <kai.kang@windriver.com>
Subject: Re: [meta-xfce][PATCH v2 1/2] catfish: upgrade 1.4.9 -> 1.4.10
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
X-List-Received-Date: Fri, 04 Oct 2019 20:31:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 12:32 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
If xfce-patches require review these days: Kai can you take a look?
If not: Ping

Andreas

