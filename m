Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3B16D71957
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jul 2017 05:01:14 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id m85so32491363wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 22:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mxNhFNmJJUuXxwzS1gKEB2Ir7ac+GgMtaqOd1ErsEyQ=;
	b=OGkagJioYFKi1Uc9VfaNCXKhqPqxqeE8rcBNkPWbJzWbk5DzZV293VTDaQ5xZrXdI7
	b/LZtzSBcYWROzrQYdD6KIXEhV6LsWKK5FzlHAoz9qHcDJurPJpv3AGSNlASPMvGswvI
	IqUTNDiX03r5ChS42Cmaik7c/Yqk2fSkaqKNMLsUtc8Dzoh4jaWJiKOn4J3YfRE9OSAO
	90D9/T3HNhr8eGG7Ybo1ws6WYH19A4hgUOxnxNhQS3PucDfXhhMCKAk9zEoiSfjymUda
	GW8P/DmNvWef9ZEMk1Brn13YSZhOWJK8PkwKYBWGIOby0AkoGLv8GuZkeIivIZU5Lpmg
	7OKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mxNhFNmJJUuXxwzS1gKEB2Ir7ac+GgMtaqOd1ErsEyQ=;
	b=Y6uMJIt5fkvk3SPR8yicQ+ahT9lmLGzjIE4bSV1S9FdmfKkFkImt7Qm41YznLY4te0
	7G5QjZpjUHxMZ7pEvS/7g5Q8IpzRLDTyUeOYaRGXxMcRZOnwruVJOdQaONkWsBdbchMS
	FsjnpVfqsB6sT1NjMUQE+LXvuBwmaWxWp/CCUeYniFqKACswxL8345jNG7CIYjBDAwwK
	qyduLlXfkFRfuttSheL4IMsdCl6mIA7plCRllYrAO67E6IGSUabCEBnA8ur3/dD6JuYb
	nnjbu9dRpLvgJcunweRZhGP0BgaAEuEoETV8WCIuOddjyC7p/5+xHGYwPmJ7zSEVcXhw
	bz+g==
X-Gm-Message-State: AIVw111kF3RS9oo5B5pMyRmg6iPzPOx77GRAHfQYX9xlUKi/aI8LKddI
	eMprM0nbbjDqR9dLxNJ+7bq7ujl6yg==
X-Received: by 10.80.164.18 with SMTP id u18mr3709892edb.250.1500958876006;
	Mon, 24 Jul 2017 22:01:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Mon, 24 Jul 2017 22:00:45 -0700 (PDT)
In-Reply-To: <CAMKF1sqSdye3sXLmi1MBwMbRnAzXRPnzm453HCLqgzo4t_1k7A@mail.gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
	<20170718031013.44536-10-raj.khem@gmail.com>
	<CA+chaQcPvJNaX1UseBsHY7K1Ggzkf2DYbSg3i45MGwAHu7f56w@mail.gmail.com>
	<CAMKF1sruKooyyNm=PSV_CZKo8agS2Zub655KZE4E6qfkHHNL+Q@mail.gmail.com>
	<CAMKF1sqSdye3sXLmi1MBwMbRnAzXRPnzm453HCLqgzo4t_1k7A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Jul 2017 22:00:45 -0700
Message-ID: <CAMKF1spL4DGy7tpjb+6z3CHsr1vEJcQ+nkbhZyLU7S894nGKsA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 10/17] efivar: Upgrade to 0.31
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
X-List-Received-Date: Tue, 25 Jul 2017 05:01:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 22, 2017 at 10:26 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Jul 22, 2017 at 8:04 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Sat, Jul 22, 2017 at 2:13 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>>> For target version it fails to apply gold linker patch:
>>>
>>> Applying patch 0004-fix-unknow-option-for-gold-linker.patch
>>> patching file gcc.specs
>>> Hunk #1 FAILED at 14.
>>> 1 out of 1 hunk FAILED -- rejects in file gcc.specs
>>> Patch 0004-fix-unknow-option-for-gold-linker.patch does not apply (enfo=
rce
>>> with -f)
>>>
>>> and native version fails in do_compile with:
>>> In file included from dp.c:27:0:
>>> util.h:109:10: error: expected expression before =E2=80=98int=E2=80=99
>>>           int *: int_add(a,b,c),   \
>>>           ^
>>>
>>
>> Interesting, I will take a look again
>
> I just rebased kraj/master
>
> https://github.com/kraj/meta-openembedded/commit/26ac6c0863936618321eadaa=
12c2fa9d562b6261
>
> it rebased fine and also built fine for intel-corei7-64

just sent a v2, again the issue was due to me not using/testing ld-is-gold

