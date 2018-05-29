Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 33F2F60102
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 17:05:28 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id i18-v6so8885929qtp.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 10:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M1EBDq5OQRhn7NVPI0M6Nav4eGEpp+WJV7ut5buZi70=;
	b=VTSuDAfCjCkbTNgdwWItbBkCpvkRnTwhM1jfxglQmnRSrqkIURdd58HCdlB9OyAD3+
	L6vzoxp41Niee1XVGHWNlVLS7+goC6JdZTd5dNgr/aDsr3q5eToEJdK+XKPGB55DU8DW
	PAhK523Huh7GBD9FL/b+a0ZpxZ0xaWzy0kRA4iLeIp0qTGIInLAWLS09ctoEQWhvvNNF
	3W+/W3hqp/SU8YPKM3B+zMrySwpckYgygno4OXug4zi9Gx880x0Cm5aiOPIRmG+ZCPL3
	DeYhO9m7ol58H0p+BxexIectBcM0wHFg5Nynfe4BeW5wBjS/wtmEQlnSMdNYHQFrGjb5
	hG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M1EBDq5OQRhn7NVPI0M6Nav4eGEpp+WJV7ut5buZi70=;
	b=d8jqpHSbtPUHAbPkvAYI22CYf+qi4ShWR1fhptYAPk3vVGnJKuiSi65qdYjHC4rMsS
	b5p4O0kGu/jWiFh83zACHHMbSLvQvL27GcirjP2jnQv9eX79UGnFjPrt2cdDWUtyReX+
	PWJ0aYVzqsU2P2uqkrxmzp3z+nx86KfcjGv/gI8hInI2ZMdd/srX1FSWqx/6xXpYULAp
	YRWY4DRyGVNxs2qiTnfPVuchu6D7THys4QOVwNrz8LWfyPdNVgmuLRe5GJLXYjlK/o0z
	DREOaQr7rbKdjy4WKFrPtwOQtyxGHPuWayQQ1zOZcMEeAH1Meu+vcpt+f8frONHkTwlJ
	4XFw==
X-Gm-Message-State: ALKqPwcjDjM1LtrQmsiXuaEu4R2Ojs0ZL0M8POXk/6jVWg16JnIKywKo
	wZQZuV9GM4NKbaBEJ07RJsnICtSM93kCkii4lSviFQ==
X-Google-Smtp-Source: ADUXVKKzYesiZxKhE8vGektWyZ8pT3g0Xf7Ut/d13keAhOJLl2GC7Zt9X+cS3ddNyAlOl4/Z0qftz5wLN7ulPAT8UmU=
X-Received: by 2002:aed:23d0:: with SMTP id
	k16-v6mr17876073qtc.20.1527613529656; 
	Tue, 29 May 2018 10:05:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9a0f:0:0:0:0:0 with HTTP; Tue, 29 May 2018 10:04:59
	-0700 (PDT)
In-Reply-To: <1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
References: <20180510063718.16913-1-andrew@aj.id.au>
	<1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 10:04:59 -0700
Message-ID: <CAMKF1sp+qOKAhA3K1OqLuPBwY3w2xNFkzSnoUsEY9okKxT45ow@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2 1/3] meta-python: Add python-pyflame recipe
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
X-List-Received-Date: Tue, 29 May 2018 17:05:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 29, 2018 at 4:48 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 10 May 2018, at 16:07, Andrew Jeffery wrote:
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> Ping - is there anything I need to revise for this patch or the following two?
>

There was a review comment for you to adress, see

https://patchwork.openembedded.org/patch/150467/

if you have addressed that please send a v3 for whole series.

> Cheers,
>
> Andrew
>
>> ---
>>  meta-python/recipes-devtools/python/python-pyflame.inc      | 12 ++++++++++++
>>  meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb |  1 +
>>  2 files changed, 13 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/python-pyflame.inc
>>  create mode 100644 meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/
>> meta-python/recipes-devtools/python/python-pyflame.inc
>> new file mode 100644
>> index 000000000000..3b84a7e8f8e3
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-pyflame.inc
>> @@ -0,0 +1,12 @@
>> +SUMMARY = "Pyflame: A Ptracing Profiler For Python"
>> +HOMEPAGE = "https://github.com/uber/pyflame"
>> +SECTION = "devel/python"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://${S}/
>> LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
>> +DEPENDS = "python"
>> +
>> +SRC_URI = "git://github.com/uber/pyflame.git;protocol=https;tag=v${PV}"
>> +S = "${WORKDIR}/git"
>> +
>> +inherit pkgconfig autotools
>> +
>> diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
>> b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
>> new file mode 100644
>> index 000000000000..96f03305f883
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
>> @@ -0,0 +1 @@
>> +require python-pyflame.inc
>> --
>> 2.14.1
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

