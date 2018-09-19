Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 65E46793B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 14:58:57 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id c126-v6so3158231qkd.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 07:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9uD23jUmZWd2qp0Hud7mU6xF5GxgqalSw5uOLfnB7Zo=;
	b=nvyI+342AkesHAGZYMaGtmw5WUK1KhD/l7xMmsQZdgr5pLYvlJPr5bAJGWdhJKpjb6
	OmBx4Ngh5DIyTzZwQEIN/7UIbOrk/5SNMkouZ+L4oGU6vF++rem2U+fcRVJq+SfgNPtT
	52mjMzlLy/tebmQJgke+IUC4zm3sgXaW0+dZlx7YKKFoKsfclqeijyfpiybRha3OHk4i
	YdGie1+WHIWpqRthqX6Ps8xWz55Rl4+++rfdjt0bxzZaV99k4tnjmRI1KcqjbMVF09kq
	2girGzbkLMGoYasosDfsTRNMrMxVsyWVrTaCdD0iDaOs/s5DRYOeXFBaKeHU0qxPlG+S
	V2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9uD23jUmZWd2qp0Hud7mU6xF5GxgqalSw5uOLfnB7Zo=;
	b=AgIgEbhFraCrTCvC+03YzmxxsGPCg0DsmnPMbURqbLJG7/oqiBeokZIFvOQrldNsHJ
	CijuUviUKdxjKTmO4VbdDN2rxBer9I/Eof1DQiBjrvBKr3ag6OF7sgu/ywY86Y5/ngY+
	dA34ezWdj4UDwFvUwCEc4hByOH+1HUctW6VdxSg1mRPqxpLrWz0uwk3cIdV2vmQ8uu07
	RNJ/692z+gteSaK1o81OZTyo9k6oQus5vvOIKq8m6uQMgdVtKPXr0uqnjugqTo/Ph8rL
	L7+jeAOjWTA0t1KpFL7S8wXYpqudMNMF9My0FtduPaF83ttT3TjougSDFArNjoKQkGcF
	hMag==
X-Gm-Message-State: APzg51DkGR4Q1xJHL93iAQ21U6mVh2iDM3KNHqumnlkAQ8feEr7KWVaI
	eTQsjJKQ0Z99f7wbsayhMkGyXaLUkY1h6W/sfqg=
X-Google-Smtp-Source: ANB0VdYIlIqR2MAT7dUl0fybHQ1nt8Y7IYZeyhsMkuRxkKx9Ryh4+2xyySCOMlYfPR1Uidw72/2D4TR2GnrFZN6BXkQ=
X-Received: by 2002:a37:9904:: with SMTP id
	b4-v6mr24597536qke.102.1537369137971; 
	Wed, 19 Sep 2018 07:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <20180918093521.1113-1-hongl.fnst@cn.fujitsu.com>
	<20180918093521.1113-2-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20180918093521.1113-2-hongl.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Sep 2018 07:58:31 -0700
Message-ID: <CAMKF1soScJH3oM9gPf7-n3quWcdvLP8iEVAgKK9L3gfVJG5ziw@mail.gmail.com>
To: hongl.fnst@cn.fujitsu.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-python][PATCH2/2] python-cryptography-vectors: 2.3->2.3.1
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
X-List-Received-Date: Wed, 19 Sep 2018 14:58:57 -0000
Content-Type: text/plain; charset="UTF-8"

ERROR: python3-cryptography-vectors-2.3.1-r0 do_fetch: Fetcher failure
for URL: 'https://files.pythonhosted.org/packages/source/c/cryptograph
File: '/mnt/a/oe/downloads/cryptography_vectors-2.3.1.tar.gz' has md5
checksum 9c8259889ab84b456459fc3fc3d185f4 when
294d44f32885a6b97d5f9cdd
File: '/mnt/a/oe/downloads/cryptography_vectors-2.3.1.tar.gz' has
sha256 checksum
bf4d9b61dce69c49e830950aa36fad194706463b0b6dfe81425b9e0bc66
If this change is expected (e.g. you have upgraded to a new version
without updating the checksums) then you can use these lines within
the r
SRC_URI[md5sum] = "9c8259889ab84b456459fc3fc3d185f4"
SRC_URI[sha256sum] =
"bf4d9b61dce69c49e830950aa36fad194706463b0b6dfe81425b9e0bc6644d46"
Otherwise you should retry the download and/or check with upstream to
determine if the file has become corrupted or otherwise
On Tue, Sep 18, 2018 at 2:35 AM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> 1.Upgrade python-cryptography-vectors from 2.3 to 2.3.1
>
> 2.Upgrade python3-cryptography-vectors from 2.3 to 2.3.1
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  ...n-cryptography-vectors_2.3.bb => python-cryptography-vectors_2.3.1.bb} | 0
>  ...-cryptography-vectors_2.3.bb => python3-cryptography-vectors_2.3.1.bb} | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-cryptography-vectors_2.3.bb => python-cryptography-vectors_2.3.1.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.3.bb => python3-cryptography-vectors_2.3.1.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_2.3.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_2.3.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-cryptography-vectors_2.3.bb
> rename to meta-python/recipes-devtools/python/python-cryptography-vectors_2.3.1.bb
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.3.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.3.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.3.bb
> rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.3.1.bb
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

