Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3A60B7F96F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 21:20:55 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id d13so4450135qko.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 14:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4+7chqMiXQ1LxBMrVv5ILDcSqnbpqniYZCVwqSXWHBs=;
	b=tl1eNBAlMf7CPC+QtbkIz+8WVPwW8n3T6FucilOde4P02tp2NYzB8sjLNzrt6kn7xt
	rbQXL51DXEF/ugEiZ4zM5HkGc3vwDPTMCw34CjSmyFljFw1gQ+Lug6p8TZG/bj2EXX5b
	9VFYqe15Bcuoa6tJHnuEVS1UMbzYZP3FrqE+xdVi6244towgN3Kq2sl4ZSrXRHHWWQeT
	nM5xoZDH0Gj+sgEHjN0wEZ/e2kH/UHPeI2d2/1aaKS8MD4BFMsOYA24pTaYQQnI//aqd
	NFnTaTe8dBoO+ESrISU/Vto6m3EZ/dIrCgoc/ssz865VEZe1tDoEL4OQVSQbroeGCXEk
	g26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4+7chqMiXQ1LxBMrVv5ILDcSqnbpqniYZCVwqSXWHBs=;
	b=nEiv/viLeSnoHcFPhUKvD37WKypcZVK/+ORHt/iQyWMOm27dpBA1/n44oAMwhZJNae
	mcJIT3MUlEtLEa+fia4UHNUEEXBqCuDDN7K4PgY5du/XZB+GFknfNLkqgdTlASNbRjFt
	UTaZs0au/sJJnv62LX+Odypx7hQGevf3VbIqA1UDQCJu+BOKcVSK8l2RM3wH62UKkEiJ
	IwpyVIt/a3lrCKiqylzAso4IT7zOSTKafpV7lQN0j3CA7p2rbIwCMVGO/x5ZoWG9uNaD
	lDvLcDvZGwjxlWW6XS0/tckR/V+y84oV6RITd6YuRAIsBkwzcTEhua/FJrTsHuo7l6dy
	8hLA==
X-Gm-Message-State: APjAAAXGC9ANvI1pLYBJ0+xIElN2GU7ENuug0PgA7zNf2T+W/aKyEc9e
	EO3vGecnU0//zfHmbSmYbBkhye5RQ/9gIGJ69WY=
X-Google-Smtp-Source: APXvYqweMq7KRGxycqOvjW8fXE3+V4kNLLme6mG9VMwUS8eIKlGnhtyMbl2ZmgLD1+exCTEjAp3ieMnQ6W6Qbj0Qa7Q=
X-Received: by 2002:ae9:f010:: with SMTP id l16mr2100979qkg.212.1572470455909; 
	Wed, 30 Oct 2019 14:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <d245fa1d-b237-ec80-2834-abcedf303422@gmail.com>
In-Reply-To: <d245fa1d-b237-ec80-2834-abcedf303422@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Oct 2019 22:20:29 +0100
Message-ID: <CAMKF1sq-OsssCemdqqOr2L1k8iuZWZKJNcbw0kV1=kTUQ3bZZA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: LAYERSERIES_COMPAT
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
X-List-Received-Date: Wed, 30 Oct 2019 21:20:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 30, 2019 at 8:42 AM akuster808 <akuster808@gmail.com> wrote:
>
> Hello,
>
>  I noticed that the LAYERSERIES_COMPAT in meta-openembedded is set to
> cover these three branches "thud warrior zeus".   Is there any
> validation that the newer branches work against the older core branches ?
>

I think all except zeus should be removed from master branch.

> - Armin
> |
>
> |
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

