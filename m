Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 40251772D6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 14:46:46 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t79so102924859wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=eRV5LtUe05JXw1ZTXMDjleJRy4nqfx3V2YGTJW8NG2s=;
	b=Vj0kIaNqMmtUY09vnLpN4Qn84hMdFMytuO7oVCagLfBPnSd5X8vTXASw76dankNQet
	m0JjjyJ1TXVpWRcnorRKBsdttAr5mFsLJwK7hxH2nES1vIhf7fqPY5ZskaBpXsYKiBHE
	oGbhUBRvmTNfzhrY+qI3h002688ve8RAOUIG5uW6NODep6Cv9dD9BjZ0vDIfSPczFcz6
	+MnUSqK/0edgSpSFI3SG8mU4M2Cpg2III7fajurSb4bE+vT83xwoHkMsFCm1ADFUDRkB
	aNLZOcb9uoZEwEAVYEoyLMzcgXoz0s2HKJlTvEXmED8lI7WjZss1zYZq6JN/hn4bBouv
	/Yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=eRV5LtUe05JXw1ZTXMDjleJRy4nqfx3V2YGTJW8NG2s=;
	b=CiCTOqDfi4EsWPE8SkryB5rJB1IAVkKS3hjzFrcy/2nxeqaB4NmnK5M5booabJpBBd
	yZwRJTVJzX5z/JiYhsJfHAWcAS3/qVMkp0d2VCFi36YsMW12TNYxBdhDOsiV3ICDz+3c
	Yq5kelybEtAgJIE2pdY7JE4mDzNv1gF4HUkodXSzYowkazcAIc8XGalBVUOqqKVvDvDZ
	Zimz+4sPPMaz/B5Wrw6lzqieLloNABlSwNYWsFcq1cDmWRgOHOUbsijineSeZw74ZRz9
	BOJlG60NC3iZWYJ5xPfkTOHPiiffNw7aNvNN6AOwqcgN6OQmt9mPNPq8+shB8r+0wV8N
	yOiw==
X-Gm-Message-State: AIkVDXKGn7BpsdRHthLbiW2uxM1noxmKVnJC16wtQNlyuoTHy9njhlyTii+k1ynTAJiIdGTog0UQZ8MXpP458w==
X-Received: by 10.28.170.134 with SMTP id t128mr13263016wme.29.1482158807778; 
	Mon, 19 Dec 2016 06:46:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.162.33 with HTTP; Mon, 19 Dec 2016 06:46:47 -0800 (PST)
In-Reply-To: <20161219142620.4hpmfdo3w3kk2zlu@ad.chargestorm.se>
References: <1482148888-3127-1-git-send-email-armccurdy@gmail.com>
	<CA+chaQeBUTnQQnVEGDhae8opjobSAPF=BU2R-772ECPf8KA4Pg@mail.gmail.com>
	<CAJ86T=UB6T+LpTNRy6_pZ5f0P7FzyJ+qMdgS=8FvDE5HcaG41w@mail.gmail.com>
	<CAJ86T=XDvJk93+Jc4-v5H+3nTSFJ1KcQbyeUt8yvhJwfTA=pnA@mail.gmail.com>
	<20161219142620.4hpmfdo3w3kk2zlu@ad.chargestorm.se>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 19 Dec 2016 06:46:47 -0800
Message-ID: <CAJ86T=WzTb-z-WzdHc6Ke4uck_M9zOWWq35bo3qGyc59hQuUmg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] rapidjson: add initial recipe
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
X-List-Received-Date: Mon, 19 Dec 2016 14:46:47 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 19, 2016 at 6:26 AM, Anders Darander <anders@chargestorm.se> wrote:
> * Andre McCurdy <armccurdy@gmail.com> [161219 15:12]:
>
>> On Mon, Dec 19, 2016 at 6:08 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> > On Mon, Dec 19, 2016 at 5:11 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> >> Please don't use github archives.
>
>> What's the recommended way to fetch from a git tag which doesn't sit
>> on a branch?
>
> Use nobranch=1, see eg
> meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb.

That seems to query the server on every do_fetch, so doesn't work so
well with BB_NO_NETWORK.

> Cheers,
> Anders
>
> --
> Anders Darander, Senior System Architect
> ChargeStorm AB / eStorm AB
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

