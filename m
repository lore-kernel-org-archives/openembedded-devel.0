Return-Path: <matt.hoosier@gmail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id AD9D0719E7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 13:27:23 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id l132so12959196vke.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 06:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=hZj6ps6tsYcymhL6vzlw7GYyex752pOfjNL9iPLcnoE=;
	b=hkUgBvcwsrjbXq4hsdeaT+1F1cjSoy8g489e8VFZRUmK2lsYtCngk+LbRiDn/QF182
	57IegWqy0db9PDD1WOo2AMt3/y9JGLeM+wvDVgbqxTvC1WXKD9wV91MFezfaIwiQjLSc
	XP7WALs4f/LhBEnNPFJmlzgScEjQvZ/A0+zdAaTCOiolVBjU460r5J5X2W5GweZssbZT
	8cZqmL2dyy27/QnH0ODYsFnfJ/tFF0ej1y6wH7jU7krZxilQyKij6S3XL6pHzprhWlNr
	JTUQlkavzcPAzzXhZUrGqCsSHB18W6kTR5G/4r6X2h5Yg5ohZgToN5A3SP1iZ32fW+8R
	CqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=hZj6ps6tsYcymhL6vzlw7GYyex752pOfjNL9iPLcnoE=;
	b=LvHLvUqzJx3yBRjFOBKXx7QzMpfxuEH4o8QJJDsWd+wftvUICxhmabCEsWSGtLKSVt
	Xt7Fx9Erxrl4WWB58cKWAHLFB5HD+NUwcPiBmnJ4Rzv0p2iwLrTd0r4VxDF1tCZhqgjU
	9Lv2NIYrUuS+Zy72Q3IhY+X+05KayJvTcuDvBMhiou+Qf74EDe1LCTmWYbXwy1hSi8g/
	mVsn/m6OubPtjFmYSSHDMnUJpxtpxmjx5iNtm02GSg1eaXysnVuz5DMkG0juqJQ84bLH
	Q4phWDL3/ZK3rH8HksRsJoagPkOwcbtEYUlgqsHf49OJEKDI37+adhHIZzKNIvno/K56
	VQJw==
X-Gm-Message-State: AHYfb5j9mewXjzn3N7iuP5RZgxLvY07MOwAIjHTv+CDAiuypAp6ZBi78
	van34RU98Hf55he5DcOHwgG/SBK+yg==
X-Received: by 10.31.108.206 with SMTP id j75mr406077vki.75.1503408444571;
	Tue, 22 Aug 2017 06:27:24 -0700 (PDT)
MIME-Version: 1.0
Sender: matt.hoosier@gmail.com
Received: by 10.176.1.169 with HTTP; Tue, 22 Aug 2017 06:26:44 -0700 (PDT)
In-Reply-To: <CAMKF1sqZaqKK8SD9SqENfDNozCQtmqae4h3YMVOoYcMrfLKDeg@mail.gmail.com>
References: <20170817122733.5027-1-matt.hoosier@gmail.com>
	<CAJgxT3_Qy3DmcGznf3SdRXfis3qBxXSHPYMrLqdW6r+Tjy0ftQ@mail.gmail.com>
	<CA+chaQcraxF5yR0VxAF073p9AxZsNM9285iNg+Gmpy+rrPcbXw@mail.gmail.com>
	<CA+chaQdGg=KHt+YfpodkUmKKhe4kVdouETmaFoGrYiK13+uutA@mail.gmail.com>
	<CAMKF1sqZaqKK8SD9SqENfDNozCQtmqae4h3YMVOoYcMrfLKDeg@mail.gmail.com>
From: Matt Hoosier <matt.hoosier@garmin.com>
Date: Tue, 22 Aug 2017 08:26:44 -0500
X-Google-Sender-Auth: iARvHGKI03Slr_9DUgX6RPfsAao
Message-ID: <CAJgxT39U_FNY7tg96JSC8EqEVF=Ez2nYjw7pqs2xnk8gCOQMRg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase: fix Krogoth build regression from efa8aaf
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
X-List-Received-Date: Tue, 22 Aug 2017 13:27:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 21, 2017 at 1:31 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Aug 21, 2017 at 2:51 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> I know it's not caused by this change, but it still creates "foodummy" file
>> in ${TOPDIR} can we please get rid of it or at least move it somewhere else
>> like ${WORKDIR}?
>
> ah thats where it comes from, I was wondering if its some of my workspace
> tooling doing this. But thanks now I will less annoyed to see it.

What branch of meta-qt5 is it that's getting built when you still see
these build/foodummy files? There are no remaining occurences of the
string 'foodummy' anywhere that I can see on jansa/master where my
patch got applied:

  $ git remote -v
  github git://github.com/meta-qt5/meta-qt5 (fetch
  github git://github.com/meta-qt5/meta-qt5 (push)

  $ git checkout github/jansa/master
  $ git grep foodummy

-Matt

