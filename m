Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id BE310731A1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Dec 2016 10:35:51 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c85so14368141wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Dec 2016 02:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XRpRKVy1HSJWIKACqaAaaOU3obj0J79g+xLDbboHAHI=;
	b=D6aGgnRFFO5I6oPaTQ6AgIsFdz++in/+AIAdFLUxtVgC1vfm/axc0D+BI1+IWR97Qf
	09hs3cibmrpJfDKMwlFy9GOMG2XxBal8Ts6orj0cJvPfnhjpNOeilJrehNAFR9xjCPkJ
	klwN1lIztPU+bDeS62aY7LMD2uAoNeo/qQTdpUMrwCqfnSq/BBgSp5UI967k/pbh6AEH
	YDWUyHXyVAlpP+DL2QZ25USZkGXieQordwYVPBs+4BALh0bRdOS0wWebH155j4ejMuf/
	RbTxTAFqIWoQtn99KjiKG1cWvU3Fn2kYzKLzCKapOe0WaWBaxjHk36UV/bVtUamgY7hH
	sy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XRpRKVy1HSJWIKACqaAaaOU3obj0J79g+xLDbboHAHI=;
	b=JRS57ykQFc4FNMvLLAEzZb4ceLxPoGQAZsRJvUTyTYJLTIcSU4wObRMpIv9lswbJfu
	52dM8ZdfLB3FdlZqhCWNmWR8mrX+KEDLjyuuzQMQEled/iIatDDUisIHpuWBiUgkRZvj
	x2uaVHPFwAXHNwYZln/mtSEfUfa2ad3WKqTt5IpXgDZTpdlCYcUvRwDPogOa0MXO5yIR
	IUt/OTiaD+Xr98oNb0Xw2WASnRu062Qu9ioJkbAfjbaHF2mWQuGvvc2kqSAEI23LN4VW
	9F1WN40Q85QRLVvwjF8RYB9XEdtjMOOc7RKPxWT2LO7B6Kw8ILijItEZZCg8g8f49lCc
	TPFA==
X-Gm-Message-State: AIkVDXIuTkbxHwEJpDHHyjwEKRWfPXnaHPVLS9iaC7b0q0O52ZWpa0XEFbl1bBYMrdlCCLFLCvVU+E+gOsVD2g==
X-Received: by 10.28.97.139 with SMTP id v133mr24293543wmb.117.1482748552320; 
	Mon, 26 Dec 2016 02:35:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.248.129 with HTTP; Mon, 26 Dec 2016 02:35:51 -0800 (PST)
In-Reply-To: <CA+chaQd3YPtvxY7CN82m86v5V=fyaYk3pWs4fF9TqFknWzE7HA@mail.gmail.com>
References: <20161222200250.23273-1-haris.okanovic@ni.com>
	<CA+chaQd3YPtvxY7CN82m86v5V=fyaYk3pWs4fF9TqFknWzE7HA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 26 Dec 2016 02:35:51 -0800
Message-ID: <CAJ86T=VT1midOLopXwankwWo3HY5DSfCpbRZSF-vPLvinNf0CA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Haris Okanovic <haris.okanovic@ni.com>
Subject: Re: [PATCH] hwloc: Add
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
X-List-Received-Date: Mon, 26 Dec 2016 10:35:52 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 22, 2016 at 1:34 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> SUMMARY is for short summary, put long one into DESCRIPTION and create
> short one for SUMMARY.
>
> Also missing sha265sum, so I doubt it was tested properly.

A single hash doesn't generate a warning since:

  http://git.openembedded.org/bitbake/commit/?id=43358a9b595b2928458a5f463cf1949394160c3a

