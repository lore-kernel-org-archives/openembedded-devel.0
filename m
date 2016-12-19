Return-Path: <armccurdy@gmail.com>
Received: from mail-wj0-f170.google.com (mail-wj0-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id BFC10772DB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 16:51:20 +0000 (UTC)
Received: by mail-wj0-f170.google.com with SMTP id tk12so155574450wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 08:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=fTu3aF/GrS+yR8ZuT0WKRYLGLMRdMGA9iA9lt1qgrXU=;
	b=hMlXByJTIJ13pYfJFJxV0lWwGhxheCmTyqhZhQUdKIypk9PlAUBvIAx6hbU2Gp9OTC
	mTLPdAPyN+svzNwoV60V36Z7JD3mGUGkT10oBXaZqUxCFDWx0jFrA5Yggo0U/AyXK2Y9
	kTkpwrQeNS9oU0H+ZOU1uFjd3qlW63e3aJkIURQza77i3jcb7NVnK9hvP2e4DlwlPFCj
	ZQ5fPB7BZ744d7StgCYVOVVi4ImqSMEXqr/faC5c+xN7bC14JFAACfkuxr1depzayc5v
	xzZNoHprNAgxxLHjORHIZsHQzyomj1ku2ZlOpxsu7NaJW7B1Kmxlu+B5VMBIN1rseDCf
	6z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=fTu3aF/GrS+yR8ZuT0WKRYLGLMRdMGA9iA9lt1qgrXU=;
	b=WMW1GrruKkhWhLyjwOVLLkbkgEdEnRvKu8MVcefRICiaRf1ryLYzAqdYjlChizwSM7
	3Kfvb/EdhZxCPvD2fWif6p3zahknfUINjg+NhpUXFBRqkj8ztsCbzb7zZTqayIOd372Q
	HLQxSRAgk0j6POlLmhxCVyAZYt/Jgu8jlX6uFehriw6pQjxw5soaGVDNtfkAYAFE1FYD
	mCPJ8LyeEkDWPYjx30nOFBCuI4GNh1+vSqD/a7d7oJUwgkjF9Wd1Sm5niNBNfppc6I81
	1uc4oSL/n7wAGDLUZ202iqaCXgKsbkDeojy/AFNkwDDKqKzVQunmR9IJRc2LrbvGcRnt
	U1Sg==
X-Gm-Message-State: AKaTC017wmsVaWiYIHjzFyIS6c6pIDPpmQI0BtOb62irs81efqkF6EcDVuy7Wq1BWHWcnIrSQlpk0cQHlGEHvA==
X-Received: by 10.194.112.170 with SMTP id ir10mr14012068wjb.190.1482166281589;
	Mon, 19 Dec 2016 08:51:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.162.33 with HTTP; Mon, 19 Dec 2016 08:51:21 -0800 (PST)
In-Reply-To: <CAJ86T=WJRG7XTeo-MQ-3t+F0O1YNQHGzyQR-o-6N6sEdzqHJcg@mail.gmail.com>
References: <1482148888-3127-1-git-send-email-armccurdy@gmail.com>
	<CA+chaQeBUTnQQnVEGDhae8opjobSAPF=BU2R-772ECPf8KA4Pg@mail.gmail.com>
	<CAJ86T=UB6T+LpTNRy6_pZ5f0P7FzyJ+qMdgS=8FvDE5HcaG41w@mail.gmail.com>
	<CAJ86T=XDvJk93+Jc4-v5H+3nTSFJ1KcQbyeUt8yvhJwfTA=pnA@mail.gmail.com>
	<20161219142620.4hpmfdo3w3kk2zlu@ad.chargestorm.se>
	<CAJ86T=WzTb-z-WzdHc6Ke4uck_M9zOWWq35bo3qGyc59hQuUmg@mail.gmail.com>
	<20161219145857.hg35ivv5vidlzdmf@ad.chargestorm.se>
	<CAJ86T=WJRG7XTeo-MQ-3t+F0O1YNQHGzyQR-o-6N6sEdzqHJcg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 19 Dec 2016 08:51:21 -0800
Message-ID: <CAJ86T=Xo3AYHMzJ=QEk_9QG9S4F83VJ_dyeMeUrZ6iz9Zg3v-Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 19 Dec 2016 16:51:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 19, 2016 at 8:42 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Dec 19, 2016 at 6:58 AM, Anders Darander <anders@chargestorm.se> wrote:
>> * Andre McCurdy <armccurdy@gmail.com> [161219 15:46]:
>>
>>> On Mon, Dec 19, 2016 at 6:26 AM, Anders Darander <anders@chargestorm.se> wrote:
>>> > * Andre McCurdy <armccurdy@gmail.com> [161219 15:12]:
>>
>>> >> On Mon, Dec 19, 2016 at 6:08 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> >> > On Mon, Dec 19, 2016 at 5:11 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> >> >> Please don't use github archives.
>>
>>> >> What's the recommended way to fetch from a git tag which doesn't sit
>>> >> on a branch?
>>
>>> > Use nobranch=1, see eg
>>> > meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb.
>>
>>> That seems to query the server on every do_fetch, so doesn't work so
>>> well with BB_NO_NETWORK.
>>
>> It shouldn't do that. The problem with android-tools_5.1.1.r37.bb is
>> that they're not checking out a SHA1, but a tag...
>>
>> ANDROID_TAG = "android-5.1.1_r37"
>>
>> That's not working without querying the server, due to how bitbake's git
>> fetcher is implemented.
>
> Right. So is there a combination of tag, nobranch and SRCREV which can
> fetch from a tag which doesn't sit on a branch without querying the
> server on every do_fetch? I didn't find one yet.

Never mind. SRCREV with nobranch does seem to be working now.

>> Cheers,
>> Anders
>>
>> --
>> Anders Darander, Senior System Architect
>> ChargeStorm AB / eStorm AB
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

