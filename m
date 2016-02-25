Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 22F58773B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 02:19:53 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id z8so4376632ige.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 18:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HlII4BsXHqDhQtj4fDcrLpkFQgkEeTLxKUeJfm+7IVc=;
	b=Fc5GdcjmBcK4TZA2Hq0C24/qsGiqgq97BW80TCXfdMptmkzIQpP7zqZ/dZUPph605l
	KcLmKyHD3O18mPjR5FDiYnlosX5LQnvdvkSQZhURzV2Z3jVTtNjvFdF40XxurADch8rB
	LCvX55Kt0ZSn62de4fBk6Nq2k6nKPrShW+RvrOQY+QVlyxRlRQi9zrnYyibYUogKHHZR
	vcMSE33z4VVZhhESqZdfaRy71dXy9DEMxTH7WTkzIG7mIv1JZC1XU+yZqyNu9j+73auJ
	usXUUG0JUQqj8r2rQBAMAk/PVU5z1zj14rGyhWCkP0nL3/z8tCzTzpHgRIrbf037B54Z
	VATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HlII4BsXHqDhQtj4fDcrLpkFQgkEeTLxKUeJfm+7IVc=;
	b=j7NLCHnFWKQ3tcK06qrViTb9FEQreXoi3+3JpLZQ1IJNlvqiF8L3KRJXY8BgoVJiaO
	EOFI37PwkCfLCltCakTNVp7B6eUPS6W/5uXY12N/sJE6QIQUyG8c3eHXugjFDbU7M0yn
	F4cCgBQP5jUOLffOkkNQ2WgZ9IAbJPX83mrpg55zEjptRZSFZ5qr7w8LtYng9ynYI+oa
	ns4nlRZ8RZIZhw5ILBmqaKHUW5yaIzG/Vz6YoziTd/I0UAw21vvPurj7UmesD93FPV1r
	F3H79/7J2nsAF06k1fMOCbHXgn/eg88d9n5DL363aDnlvGdXYTRsnIU8pdZPxvqQSCn1
	Zm+g==
X-Gm-Message-State: AG10YOSVnlNYhSlUC/nHyvzBF0eCyQmfyChStQxigg6DAQMBgi4YuEUBZPwROHhW7/TglLNwsj+ohJMx7gVsDhTc
X-Received: by 10.50.97.71 with SMTP id dy7mr748299igb.78.1456366794605; Wed,
	24 Feb 2016 18:19:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 24 Feb 2016 18:19:35 -0800 (PST)
In-Reply-To: <20160224162044.GF2560@jama>
References: <1456148105-9644-1-git-send-email-derek@asterius.io>
	<1456148105-9644-8-git-send-email-derek@asterius.io>
	<20160224130413.GD7560@jama> <20160224162044.GF2560@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Feb 2016 02:19:35 +0000
Message-ID: <CAJTo0LbATKddvyLZNh2d+AHOnyPn2q8dmBQJebowa5CejxuXdQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Derek Straka <derek@asterius.io>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] python-setuptools fetch issues Was: [meta-python][PATCH 08/11] python-mock: update to 1.3.0
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
X-List-Received-Date: Thu, 25 Feb 2016 02:19:55 -0000
Content-Type: text/plain; charset=UTF-8

On 24 February 2016 at 16:20, Martin Jansa <martin.jansa@gmail.com> wrote:

> distutils.errors.DistutilsError: Could not find suitable distribution for
> Requirement.parse('pbr>=1.3')
>

Missing DEPENDS?

Ross

