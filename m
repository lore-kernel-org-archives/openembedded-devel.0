Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id E2C9D606BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2015 10:27:31 +0000 (UTC)
Received: by oigx81 with SMTP id x81so54156635oig.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2015 03:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=L9NjdEi3WmmCU402EelSNy3b427kcFg5SNBokpq+NkY=;
	b=FmGYFYBMOft8/jtt2l/tSFvtD4Yf/aNyBzc7DWqcWLpk9aqowfa+DYezkk1c+Ove0P
	YTvUPadheDJGQzZn0PDjg2drMrojPaMOU/xTvDKcraKZKpaUMyvqM1Y+vA4zO130ztQD
	KRwqYYdI0VfuktpRSyL+a1zk8jCznYE+CMKlXZTlHWjCQeQqhAbaGcJg1hgfBFaj5GJd
	ly4wvBFW4jg7+b14GNv2weB7J67o5FjGZr+UbDbwN+i5EI1iVyguCZtgIScAkReDOqB0
	6G/irWQvCWcUoYCSoKg/EM2K4eabqj400h0Nnj+pTTel+y6GrO6s+ssdUYzenWCTnIZz
	IufQ==
MIME-Version: 1.0
X-Received: by 10.60.50.168 with SMTP id d8mr8518740oeo.41.1434623252631; Thu,
	18 Jun 2015 03:27:32 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Thu, 18 Jun 2015 03:27:32 -0700 (PDT)
In-Reply-To: <CA+chaQdtM6a6HShP0B+VvKVAQtk1tX8QxN8rdk93NAzvGPu9Sg@mail.gmail.com>
References: <CAJ86T=VZuuxxBJtRHzMQHtFXGZz6yoUjoPaqU6Mp2NnH7EAdsA@mail.gmail.com>
	<CA+chaQdtM6a6HShP0B+VvKVAQtk1tX8QxN8rdk93NAzvGPu9Sg@mail.gmail.com>
Date: Thu, 18 Jun 2015 03:27:32 -0700
Message-ID: <CAJ86T=VpGyeXArBEonsAFnCAmaOxFZH-oK8eaqXWZSC-enUeDw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: qtwebkit doesn't use system leveldb
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Jun 2015 10:27:37 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 18, 2015 at 2:26 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I don't know what exactly memenv library is, but if it means that we just
> need to upgrade leveldb in meta-oe, then I would prefer this solution.

The leveldb Makefile has a target to build libmemenv.a, but it's not
part of "make all" and there's no Makefile target to create a
libmemenv.so.

  https://github.com/google/leveldb/blob/master/Makefile#L195

Looking at how others handle leveldb, Debian does build and package libmemenv.a:

  https://packages.debian.org/jessie/i386/libleveldb-dev/filelist

However, Debian installs memenv.h as .../leveldb/helpers/memenv.h, so
the qtwebkit configure test (which tries .../helpers/memenv/memenv.h)
wouldn't find system leveldb if building natively on Debian.

Buildroot doesn't seem to build or package a memenv library at all:

  http://git.buildroot.net/buildroot/tree/package/leveldb/leveldb.mk

I wonder if there's any known case where qtwebkit does successfully
use system leveldb?


>
> On Thu, Jun 18, 2015 at 7:18 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> Hi all,
>>
>> The qtwebkit configure test for leveldb tries to include
>> <helpers/memenv/memenv.h> and link with -lmemenv, however the current
>> meta-oe leveldb package doesn't provide them and so qtwebkit always
>> falls back to using it's internal copy of leveldb.
>>
>> I can work on a patch, but I'm not sure what the best approach is -
>> either rework leveldb so that it builds and installs a memenv library
>> + memenv.h or just remove the leveldb dependency from qtwebkit and let
>> qtwebkit continue to always rely on it's internal leveldb?
>>
>> Andre
>> --

