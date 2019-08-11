Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id B0C636C44A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 07:39:58 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id d79so74767377qke.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 00:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WWjwmkpFcSwwiZh+aA90GxcnMk0skx3fzFB0DA7HPuI=;
	b=KXZ1yfketvh85oY/IP5/5DKvSQ+WQczcECdr3v43cA+qfqm+NclzVYllduJub7ZzMK
	6+phpAogde1R+wzopOvpE453IAI4MWMoQBnYHhXI4b0gBQUTy3gvZyGlNc9nlO/c974P
	vY7VCdcf0++l8epUYES0ctjYOwfDMELtvoC6m0gvBZx5i2lwlbJZN61aYETIPaP7Q/zI
	yPecgvUY66hjBKahKZLUB28J7gX7NjsvqNtleMhTearQ8rdLxi4CCs6aWum+5mnWA5Wh
	chmV2R671obuw/bue5Po7dC5d4RrF4WayXtdxsU1AwDuRH1ncq0jir/bJaZz/Bug0ZPp
	zwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WWjwmkpFcSwwiZh+aA90GxcnMk0skx3fzFB0DA7HPuI=;
	b=hJULJWAcNpAuKTIyyZETTKxnhmIM7hUomk8vhyQ+abcEcLkGR5fA97jhM1rNPSzZX5
	6gmYSGh92VrHHiA7RxOket2kJkJMzXXgsKAJB9BgTkq3i4yEmpiSYXGwz1EOEhudgPlU
	BUHUbyO3chjEyQZ1oykguQkxC4R5ilFG3OWxkrpy6TdVub9mFrUVvQ8QxMUDfjoh2YVJ
	ELJXY/u03eNDHQmP97gA3UmWEww3Nhf95QI6pQyTan9OQTi0/W26fPTF6YeEW7CiJuKW
	Z8JYbReP+MmjCy2knSUwbGjhLALB6AzEydLkke8iI5beaIGGdl3ImfAfylL3ccH0QaKf
	xscA==
X-Gm-Message-State: APjAAAVnZrnwPapzOk+ZOG4srgeyLZ30TVEaHPfX1chTJG7yzgXvd8UC
	R/D2SLLz8IaEFpPf61EBk9acapMEJf83zMd8LOfwWriNddA=
X-Google-Smtp-Source: APXvYqxH4MhacDFz3MO8fBLYgcEkGtJdlc9VABY46RyUGTzpqwxJ/ODPHyf7qcqlueKOIo7TmFuVd9jGEV6LF6oXW+I=
X-Received: by 2002:a37:4243:: with SMTP id p64mr13947239qka.9.1565509199212; 
	Sun, 11 Aug 2019 00:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190810212014.23197-1-maciej.pijanowski@3mdeb.com>
	<20190810212014.23197-3-maciej.pijanowski@3mdeb.com>
In-Reply-To: <20190810212014.23197-3-maciej.pijanowski@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Aug 2019 00:39:43 -0700
Message-ID: <CAMKF1spHtAufpqMCUwnxhZn1yp5yGQk5je_GhjNNYu3FGis5Gg@mail.gmail.com>
To: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	piotr.krol@3mdeb.com
Subject: Re: [meta-python][PATCH 3/7] python-engineio: upgrade to 3.9.3
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
X-List-Received-Date: Sun, 11 Aug 2019 07:40:00 -0000
Content-Type: text/plain; charset="UTF-8"

seeing fetch fails

https://errors.yoctoproject.org/Errors/Details/260608/

On Sat, Aug 10, 2019 at 2:39 PM Maciej Pijanowski
<maciej.pijanowski@3mdeb.com> wrote:
>
> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> ---
>  .../python/{python-engineio_3.5.0.bb => python-engineio_3.9.3.bb} | 0
>  .../{python3-engineio_3.5.0.bb => python3-engineio_3.9.3.bb}      | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-engineio_3.5.0.bb => python-engineio_3.9.3.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-engineio_3.5.0.bb => python3-engineio_3.9.3.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-engineio_3.5.0.bb b/meta-python/recipes-devtools/python/python-engineio_3.9.3.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-engineio_3.5.0.bb
> rename to meta-python/recipes-devtools/python/python-engineio_3.9.3.bb
> diff --git a/meta-python/recipes-devtools/python/python3-engineio_3.5.0.bb b/meta-python/recipes-devtools/python/python3-engineio_3.9.3.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-engineio_3.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-engineio_3.9.3.bb
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

