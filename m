Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 429E67D27F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 06:43:15 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id v8so1966170itf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 23:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XrpZDfZW6xbj23No0h3WjcKXZD2arZqoo+6OROM2I/I=;
	b=IJaVJ6RCyiij8PVQtElI19RVHZCe0YA0/f4KxQVpdqJmEAMvb4zN9M5vd7v9m241vr
	+F3btaxiO1IkSh8PyeEpCxBkMAKGiqO2GBAP8Y4Cxpzyga0uvswkfy3vBil7pETG96CV
	Ca37Hz+PHwbe+fP47wlIzKAp6CS2ySpQ6IQx0nC3uZBYSPTieZkbYtQycyn8gz26+Iv8
	8sKLpUu7/qBFchVJ6ZGZZ5k8xrhXs+U1UMTOWFKeSE+wakn94RzJ81LpHJc4a3C47mp5
	cEyZakSBwS07d3Hz4C/guwusJUCwgOex2PLygbC6bKjy+WzWCO4tBQxCRpBEOCrEsnog
	NS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XrpZDfZW6xbj23No0h3WjcKXZD2arZqoo+6OROM2I/I=;
	b=WKNtn0Wr5/klptdob5GMcZ4c+7T2HxEM53KASMpATwkR3JJguWNz+dnwvx0Prg3TQJ
	V9w7Ss0Bg23GFhvLYSVvDUnlsAsBZGr/fxJXmHRYJb0oqO7Ko9hzYT2aC2CviD1VYVwL
	HITf67qaERLq5k2D5HVRNCpmyWZm3ja6ySp9vRUJEaf9EBCsbaf8gIfAmz48svzmOm3b
	en1mlwCbgRIVLHrlGgzp1/0db2y64wYKDD0+UTuReAMcMcVfizF4vPCK9qd7Xy6tiMaG
	4XBFCUw2eUCnYA0Y6gVXtriuPN6ZKSwvlEWcSB+wJu9jgKZkKX4Tin+MmUOcpC+k2Y/g
	sduw==
X-Gm-Message-State: APjAAAU51Wq4QN0nw2tCK76E0OuXDOh4SzE3Ir9QHvER8ewiPyIVAxNR
	U+Qhvrs8CEN+ZR0DfIgTrj/VKZ2Qo0FUb+q8Heo=
X-Google-Smtp-Source: APXvYqwGUDwxPKE4AXFcKlzislgbYLbf5XOg3GDAHYBb0OfsoHSrfCvNvL3V9wtIftoZMs5DlVSXoKaGufSCm7/VIVY=
X-Received: by 2002:a24:43c8:: with SMTP id
	s191mr20400706itb.109.1554792196376; 
	Mon, 08 Apr 2019 23:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190408224258.1744-1-schnitzeltony@gmail.com>
	<20190408224258.1744-6-schnitzeltony@gmail.com>
	<CAMKF1soiU=idpjn_LUf8AEvinZqjDHQX8y8i6z4ALMg12kKZVw@mail.gmail.com>
In-Reply-To: <CAMKF1soiU=idpjn_LUf8AEvinZqjDHQX8y8i6z4ALMg12kKZVw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 9 Apr 2019 08:43:05 +0200
Message-ID: <CALbNGRTmCsa-w3744yOwcWXpCRUmJE=owy--JQAVCJndCqEBow@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 5/5] networkmanager: rework musl patches
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
X-List-Received-Date: Tue, 09 Apr 2019 06:43:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 9, 2019 at 4:23 AM Khem Raj <raj.khem@gmail.com> wrote:
> >  CFLAGS_libc-musl_append = " \
>
> this is wrong,  it should be CFLAGS_append_libc-musl
> but I see it builds without these but probably wont run. So while here can you
> address this ?

Let's get it right. Will send a V2 tonight.

Andreas

