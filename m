Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id AC5EF7FFAD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 02:38:31 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id l4so576626ilj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 18:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0YNZ8Z3z4FaIkG5j1coBcjFozkhRNnZDVo+fMTlf3Wc=;
	b=GJVBQgAC9f1jt3NN6G4OaRmU5477RInrNkSRNR/N1ce8WWLzLNxOBpzosRkcfu28D7
	DDPgm9bxq0LBSxmagoLC+ubQWDOQC1UFYh30ATNmm8Nkl2oMrFgzSNb05FDiDSsrYBVb
	RgKdrGCLqN/EvGIXJVgwH28kdE4YBDoDGVxEfzoB38EjqqqTDqP1X3S7DmySWj8WaS27
	xUhpDAbM8rch8vB/nVQQZZujeZbqpk4gHtZwPGUv4qNHp3xapT5JMAl9dc6tRTNZWKVx
	/s/97NdgyuCaCqrwZm85ziYH4lIbmmgVQz4+Cy3zUo9RbWToj7iM0kyu9Ux5YXpBr+qQ
	tBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0YNZ8Z3z4FaIkG5j1coBcjFozkhRNnZDVo+fMTlf3Wc=;
	b=f5w6YWQa0/LX2chDf3iPmIa3l8YHGzBhkF9yRoKZwfyLcfGgo0ky8f9WuaR8ymej1d
	0xgN5qTkB0I0qfDHTsBiLB9ccL5UvlTKIkAXrrZXed2FLiQniK1cEPnMvRG8dA2heIUO
	+dYwywwySOJiCM4bJn9WMrKlK/H1DcJmfKjVbdpeAl9cZpcmsloveiMUCQTwAw4hRKI7
	FoUTmoLPljvvjdHIkCLcVYNy1ykPVH3gjWjsyJljMGwBEuejq5UJLVdvF+m04MlQNgKG
	1AziAU394AyZFYIHHh1xycIOBoQqSOpUvoAA5KFW0LiF3W8RUgBIOuV1cFrdORmp9O3M
	n1sQ==
X-Gm-Message-State: APjAAAWisFRJDbTONBfeK0DjXKdzy+ZikwG9tUv0eDxnSwz/zi0KQlDr
	zHy+j63m1DI3KdEEbcDx6VdxFAzcbhPY3eybeSg=
X-Google-Smtp-Source: APXvYqwc1OeBh4MkWoiLpWaKPhZHh67cVGZZfie4655hI3cz7Fti1QVBEP/xWXx35Qy69fZ3qI8AEkXUvs3jTC3cDis=
X-Received: by 2002:a92:de46:: with SMTP id e6mr10314850ilr.122.1579747112776; 
	Wed, 22 Jan 2020 18:38:32 -0800 (PST)
MIME-Version: 1.0
References: <20200122185355.3258860-1-raj.khem@gmail.com>
In-Reply-To: <20200122185355.3258860-1-raj.khem@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 22 Jan 2020 18:38:21 -0800
Message-ID: <CANx9H-A-rJjCOawq09wCp97DcX0N5nJRQq=rgvVUTGK9KmFnYQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python2][PATCH] python-pyconnman: Fix conman -> connman typo in rdeps
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
X-List-Received-Date: Thu, 23 Jan 2020 02:38:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 22, 2020 at 10:54 AM Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-connectivity/python-pyconnman/
> python-pyconnman_0.1.0.bb b/recipes-connectivity/python-pyconnman/
> python-pyconnman_0.1.0.bb
> index 761ce08..264d2dd 100644
> --- a/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
> +++ b/recipes-connectivity/python-pyconnman/python-pyconnman_0.1.0.bb
> @@ -10,4 +10,4 @@ SRC_URI[sha256sum] =
> "46c64c0692063fd0c9fb0216d49f7884bec9fa9760d8473db4b1e2f816
>
>  inherit pypi setuptools
>
> -RDEPENDS_${PN} += "conman python-dbus python-pprint"
> +RDEPENDS_${PN} += "connman python-dbus python-pprint"
>

Hmmm. Not sure how that happened as it was proper once:
commit 646505a63b6903d1328f5e24784bb7bd854eed9d

Thank you. This will merge tonight.

-- 
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

