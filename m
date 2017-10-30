Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id BA725605BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 23:15:58 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id g6so12978274pgn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 16:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7qfk8RKnJPTe995Sv+rsirNAIZwCeG2zo6/AasPgY4A=;
	b=GJPB5IL2xe14uOh7WaOIYWkMn1Q/KeX0qlylbiJ/IU168us+vxnIjdjEZQkZ28l/Gq
	eNR/h99RwbV8xN9S49gsoVEQ7jFm4DQ13XHWpe7VmSGghp2EUOi5nv6UIoXi35eh1pmn
	QAZQ4fuNp+O2W24BcBJ7K5RDHvAVeCA1Xz5vHhXDwkGFd4fAmzw4sDukf8uKK5dSKCxX
	byvPiyMmNDVRZ76ECuslNAg+YpFAT8ijVRRrEfsvXY9IZcMb5YCohXGYfzac3qiXyaVT
	UOx5YyAcBY0NHCwvElf6ul9G4Thkl4uohalqsfM3gG7MbX7x3EqQakN1KOU+Al/Qcviv
	PEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7qfk8RKnJPTe995Sv+rsirNAIZwCeG2zo6/AasPgY4A=;
	b=g3UP7OM7f3P4mWda4rNPrk4Xd+ZzOa0lCYxM+Ne1rKXJxu6azuuCLvv5ynxbCWNu2c
	ioyPYswVzktJGKZCU3NMNcXBMY08OGgcIOBKKnFtdQcEzLucOr1MBKvUpCxoEAaeVJfi
	DzKcBOsMojfvTmTSfHCdMc58TUeynrPupar1+K/4UlsO3iT7sAIKAH5mIeuCfNo5zaoI
	154hOMWiu9l4ctlDjTiSF13+4fm4qHK+efwY7XbSj+hsffzdQDH3RyGW8q7pou5hh6g8
	OV0AoDwxIYe1GT0T7h00qC7pcw7PDUnEvy2C+DhUbBoUfjFo5l/HpSYZ1VGCIhHUbrSk
	v1ZA==
X-Gm-Message-State: AMCzsaUEx+EVtYTGOljwOHJQV9NcAvaDpRfQMZsMDismbj6uJc5yKBo8
	gfojGpve8FwY8U3XzlApjAsRuwcYHzkFcwzgsYg=
X-Google-Smtp-Source: ABhQp+QG0iPY+xxMgqywJILUBH7wPDP5L6zkLvpx8/P+ma5wTv5uBUAX+iU+TDOR5cb42ZTWSwDAanEsi2Ss1K3lkas=
X-Received: by 10.99.51.72 with SMTP id z69mr9290032pgz.317.1509405359779;
	Mon, 30 Oct 2017 16:15:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Mon, 30 Oct 2017 16:15:29 -0700 (PDT)
In-Reply-To: <d2eb9f63-12b3-387a-c9a4-572c52231c3b@gmail.com>
References: <CAMKF1sohPCP07Hx-aHdoKDqtrTXWO+3atWDX-MMLP80RsdxRNg@mail.gmail.com>
	<1509338753-23099-1-git-send-email-fan.xin@jp.fujitsu.com>
	<d2eb9f63-12b3-387a-c9a4-572c52231c3b@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Oct 2017 16:15:29 -0700
Message-ID: <CAMKF1sr6DCgLwf8fj7vw8cQnL2B+ipizk5+jcGZJK2WbnzDxmg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v3] spi-tools: Add version info
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
X-List-Received-Date: Mon, 30 Oct 2017 23:15:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 30, 2017 at 1:06 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 10/29/2017 09:45 PM, Fan Xin wrote:
>> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
>> ---
>>  meta-oe/recipes-support/spitools/spitools_git.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_git.bb
>> index f808125..168f0f3 100644
>> --- a/meta-oe/recipes-support/spitools/spitools_git.bb
>> +++ b/meta-oe/recipes-support/spitools/spitools_git.bb
>> @@ -4,6 +4,8 @@ AUTHOR = "Christophe BLAESS"
>>  LICENSE="GPLv2"
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
>>
>> +PV = "0.8.1"
>> +
>>  S = "${WORKDIR}/git"
>
> Should we think of converting these kinds recipes to spitools_0.8.1.bb
> to avoid the need for PV ?  Maybe a best practices on the recipes naming??
>

I think yes. on the downside its convenient for git log to have same
file name but then we do have
git log --follow

> - armin
>>
>>  SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=git"
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

