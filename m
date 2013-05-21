Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE7061221
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 07:51:22 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id cy12so205944veb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 00:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=LrzpO46jmRUPrRLtaM43U2zmaLPHcuZ9Z/rwDtbBlzw=;
	b=shTJ/kpD2nYQfgd3lsZ2sJ2WaGw+n3sMta59W+fH2dV7lBL4nSTFA4+1KnyBdSHvJ+
	gFdW2xxttS0ph/kN7MXH1CfzepLGagBqFgieGsh+5gjtptRFrKc2rt1bDZCSeAufn/rR
	eaWIWv9W1OpwGClioLLwpemw1bw1lmQ1nh0mSAinJJRXcnj0vntOaGZybRLznVA+gWTO
	LGQKDNYw8UE9l7ckr39LALgyhGOz+/nsAz6TgXmxRlcQ50CBT+A2hMuvayKIY9py7ebd
	7jG2DelbtM1/4p9cyeC20wxrzCYCBVpvPdy7ftSN0EUNcEbAUndaN5dUE3rWA98s/97Q
	RYqg==
MIME-Version: 1.0
X-Received: by 10.52.68.49 with SMTP id s17mr360427vdt.92.1369122682464; Tue,
	21 May 2013 00:51:22 -0700 (PDT)
Received: by 10.52.18.177 with HTTP; Tue, 21 May 2013 00:51:22 -0700 (PDT)
In-Reply-To: <CAMKF1soZP1zxrEtopAdi6dTPuRcb5CMnSapgfOE8KCD5t6a-Ow@mail.gmail.com>
References: <1368959233-28288-1-git-send-email-schnitzeltony@googlemail.com>
	<1368959233-28288-4-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1soZP1zxrEtopAdi6dTPuRcb5CMnSapgfOE8KCD5t6a-Ow@mail.gmail.com>
Date: Tue, 21 May 2013 09:51:22 +0200
Message-ID: <CALbNGRSri1rP7CXVEum_QYx2a7ArHuDUQDCwVVrtw2kwVAMDKA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe++/master 03/11] glibmm: merge glibmm.inc into recipe - and stylize a bit
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
X-List-Received-Date: Tue, 21 May 2013 07:51:22 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 19, 2013 at 9:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Why merge inc ? Generally its helpful in writing recipes in other layers we
> can share common code
>
Before doing this I have checked: Nothing except glibmm itself
includes glibmm.inc in the layers I use. So for me it looked like a
remnant from classic oe where we had more than one version for many
recipes. So if this code is not really shared I prefer clean recipes
without includes. Do you have a use case for this include - then I
should send V2.

Andreas

