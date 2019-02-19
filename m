Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by mail.openembedded.org (Postfix) with ESMTP id 59BA67C85C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 14:28:46 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id g12so5444249lfb.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 06:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=buvTyPk8rLE4Nb/eb26EiI5v9gmy5bupbx93ip4gylQ=;
	b=iNlqd5k65YM2xSVX+odc7OuhfSlhvARZc8ArCvKDFaFUWP678ei/vXtIiuhg5yeaRX
	8nTMzQ+0nFJDTXkuuJuySQ6MBS+zmA86EuOwskb3CUECsqIU4D3PNklDyqViaKaIxWgR
	wgD2xZKUcjcj99E4e3HGIGotCCj1nCI2Ti50dXFGGNkCvS8pmq6EHmvjQLwxL8Rvz42B
	1UohGB/2wT0klDUCnnkUZjIfdl7rNqYVkWZjkxLNQigvaB3s8JMjapMqe8f8NERJHuZ7
	bduw2U7Wqi2+OgCPRG0BAaJCOa5AVLOLu6+0v+podrcCYZM31bY2s0wbnWD8UoawNkkt
	8LmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=buvTyPk8rLE4Nb/eb26EiI5v9gmy5bupbx93ip4gylQ=;
	b=rKYFVu5ZbLvfwnu3ZL0ATytG3zDlyr1dB7XGjDnDmTboQ41g9OuPKe07qI+ZDnqASI
	31RVGSXZJniFsSZZsuf+G8pHIQHtecffyKyLTY0oDQHN+UzRHpjefJ3Wtn75QFRvbJyk
	vbJvIW5jJa/DxUM8c7YtEfiDqVO5fE6zX3gbgIvtkWhKTJ0/sI5GwzCHBpbs1zAM5c02
	SQz3DIsWk7WWkbzXmy2r+70CKEYU0X0oNT88FkbBuw/IbHaBchrv3bHg1hjchcEyhBai
	0Tfyqi6fok5XKfqt3zlnWtqh5gkBcai0yYodhnBe6pR5MkFKf9XE+IcTPBz6rNtrJN/Y
	qe6Q==
X-Gm-Message-State: AHQUAuapbQ+5pFuEmppLfK9vK8noJM2UnXOVe2aKNTDhz6BH5pPrl58g
	DkcPzNPhX2wqj3Tht+F122glK25R2dil0qrtBLOIcw==
X-Google-Smtp-Source: AHgI3IYIedPic1WS0rWRfVsmEGa2LmNlLdYBJH0eXU527DiixWq/ZjtguTQOW/zNH6qd7r4uMvj3aOWOkxDb5Ddp/qA=
X-Received: by 2002:a19:9c81:: with SMTP id f123mr16915518lfe.96.1550586526686;
	Tue, 19 Feb 2019 06:28:46 -0800 (PST)
MIME-Version: 1.0
References: <20190219135006.20859-1-nicolas.dechesne@linaro.org>
In-Reply-To: <20190219135006.20859-1-nicolas.dechesne@linaro.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 19 Feb 2019 15:28:35 +0100
Message-ID: <CAP71WjwybzzDJ=wbZN-RitHmDC5DNEv4b7L_WYp_t8FHnWULfg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][thud][PATCH] packagegroup-meta-oe: drop ptest packages that do not exist
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
X-List-Received-Date: Tue, 19 Feb 2019 14:28:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 19, 2019 at 2:50 PM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> From: Alexander Kanavin <alex.kanavin@gmail.com>
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit bbde0a3d3012da1d6be824959b0ad0a930573650)
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ----
>  1 file changed, 4 deletions(-)

please ignore for now. I need to backport more than this one,
actually. i will send a series instead.

>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 08b4bbfc4..2a23a6170 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -234,19 +234,15 @@ RDEPENDS_packagegroup-meta-oe-test ="\
>
>  RDEPENDS_packagegroup-meta-oe-ptest = "\
>      zeromq-ptest \
> -    libxml-ptest \
> -    soci-ptest \
>      leveldb-ptest \
>      psqlodbc-ptest \
>      lua-ptest \
>      protobuf-ptest \
> -    libdbi-ptest \
>      rsyslog-ptest \
>      oprofile-ptest \
>      libteam-ptest \
>      uthash-ptest \
>      mcelog-ptest \
> -    openldap-ptest \
>      libee-ptest \
>      numactl-ptest \
>      poco-ptest \
> --
> 2.20.1
>

