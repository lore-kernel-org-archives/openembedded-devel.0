Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id E848A771AF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 22:23:39 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 109so2129395uat.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 15:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=tf9DL4FLg999Co95KKGO2sVZDNf1TEOt7ZN6hPJOA4c=;
	b=jftnNEfg9L4qZPiBuD7aX2+zCQ+ijkY8ILmBCNy1zsSIS/pMTbuZIHeN++BhB1+ukI
	LJeTAmGkyGnVR6BkZyUy5OTJH5GNB7y1lRLqCvgSr2rTLiTOTF7P4UaplLuxrzh53mmu
	OWFCj8zBpa9iZhPkBMcxERK09Sb7dnlXmVkLICiqyu0hH2kcvslFwzpaVDNpKd+6W5zk
	zkXIm2aQvQN5yNFMqjAPxxQdNYaMAJ3woakG6Nb0r82Vg6LE4KZfK7HtTcQ+Dlv0UHO3
	iBmqup7WlqwGeldpna26Xln2v5Dm2ad7dwVjnb7GECSHvUNfoJVZpITMPolMETlze+0f
	Updw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=tf9DL4FLg999Co95KKGO2sVZDNf1TEOt7ZN6hPJOA4c=;
	b=aMJpA4zHKIn6JZbec6YVtd3Ly/Akm3pSC9eCJZSKd9ebxUcka8DinoaWWeyoQDXCjs
	lZAyuUwc9BjCMWS6E43q8zQyXFuBe5A0/F8C/B4KetdjERuyBjWO+N0yG/hX5MU3lKPc
	zGg924gwTgdhz7Nu5vmPtvUAjHd7nANuZ+w38g1bWf6QOjzXNEzF0DmhQE1FfJLbQfQW
	5hGORZU9Utx8xMXkAC42i5d9M1gRUYjYTQGnbEzxPxrC90dqaN1POAmMEzaN4iEWR2vJ
	w5v0ElafKQRpQbTJZ+83RBYvWejsGu4D1Cq9AC6GQyLrx4lwd5yIPuPR1VznkHzm8XGj
	jp/A==
X-Gm-Message-State: AEkooutlKOC/RmaYhH1O5aq+QvHDJzW+NjkRRwlPQB4efwoosxGJtSpuSrkGxmeHlAYRCUFsRreXQRFEaZB54g==
X-Received: by 10.176.68.102 with SMTP id m93mr387856uam.111.1470781419991;
	Tue, 09 Aug 2016 15:23:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.66 with HTTP; Tue, 9 Aug 2016 15:23:39 -0700 (PDT)
In-Reply-To: <CADNbA1qOkceqffLgwE+xZEWafxg+wr8VsLuZGFr9fgr3EPFrQA@mail.gmail.com>
References: <1469931304-13906-1-git-send-email-schnitzeltony@googlemail.com>
	<1469931304-13906-3-git-send-email-schnitzeltony@googlemail.com>
	<CA+chaQeTP0PgC1bSucTyQkt0=tAC0KcEmYA1mRL0Uu+xmu4zRA@mail.gmail.com>
	<CALbNGRSU0OHifH7801P_k0ig+QokGA_9=Ck=UZ2JGeSAWrdKag@mail.gmail.com>
	<CADNbA1qOkceqffLgwE+xZEWafxg+wr8VsLuZGFr9fgr3EPFrQA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 10 Aug 2016 00:23:39 +0200
Message-ID: <CALbNGRTzhUkgK71C5E1Fw6t20R4G45vz69sc7g0pRCAuAq=bhA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/5] libmbim: update to 1.14.0
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
X-List-Received-Date: Tue, 09 Aug 2016 22:23:40 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 9, 2016 at 11:47 PM, Derek Straka <derek@asterius.io> wrote:
> All it takes to fix it is add an inherit for bash-completion.  I can submit
> a patch to fix it if you'd like.
>
Would appreciate if you could test / send patch - thanks

Andreas

