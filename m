Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f177.google.com (mail-yb0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8AF74838
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2018 03:28:17 +0000 (UTC)
Received: by mail-yb0-f177.google.com with SMTP id d7-v6so7183390ybn.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Apr 2018 20:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=f2sCiqJxtgBpllgzyl3svl0o518JuhDQuR63BjMWoJ8=;
	b=cj8fK6Mq4OLEugKZp485+vgeQNs/PcvK1uutr4XdTJIrQg7EjGkpzgpaxHTENNOpYT
	o8/VMRLbiqngel/XRaXIArMuwxg1S5JRUwCVtnQtIrhqwXrWsQmAlQVn0Cyu6yRQim9Q
	eCiBgIIAWprFGkLEvtRVyOeGrzByo7+q6UPyhfd3BWxIMbAT3reWV8YWFp3acNfrVbQC
	1mYWM9hxM29EL4g8ng0ex/ESr9KZwMhfdKh7cSC0dQRJOcJo4Q7B7Gf+x8TdH1m649WW
	wlNHHgSQqt7rkcMbDLjWkvkY3HbLBRT/ylaerWOPFATznayjYL6NZ7xwPMu/x4644vhP
	Iszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=f2sCiqJxtgBpllgzyl3svl0o518JuhDQuR63BjMWoJ8=;
	b=T1BM5FgSKO0z/AYwFHMyH33txlRoC38db7Ck96qCze5NxKW3AhJryouSnggUaZkiu8
	c1EwR5BwURRzRCD2SuxJDyML+U9hSI7Nl2wEEZPIJQZdRviMeQ7LALlcEqMKX0ZDJ9MV
	w/w1klMOXvlCuuQPMDTX1d98QX4Gk3FD227LNkhLR2ffU1NImRSuUmHsZdHF02FmwgEy
	+v/yo10RVtERPeQMynldbFDFbMHKgiWfX53YVJQkjDlRneVHVK9M2X04fu257vEN87O/
	ByKRiR5N4A89L2BKgHL7oqZTYDhpukSTFbl0WeUv138bQ9pL3Ag6Xam3w81KnLHopdmD
	1Zdg==
X-Gm-Message-State: ALQs6tAEKYABoKMiSVI5sgYxZ/0AJGU5dm1KOv3GNV4Cfs6/fJsGNLV/
	Xgm1uDgVDhE7OXK2oinzJxSimBUFUbtvYEPdtNY=
X-Google-Smtp-Source: AIpwx4/71xDUgxqI76As9Exq7ik8BV5xHNKXzwK2tEvdP0aWaaeJ1Vc316y39UDhEapzyWcxs5v3pCjreNhZoubpjIw=
X-Received: by 10.13.223.80 with SMTP id i77mr1125054ywe.158.1522812498815;
	Tue, 03 Apr 2018 20:28:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP;
	Tue, 3 Apr 2018 20:28:18 -0700 (PDT)
In-Reply-To: <1a96ea45-d89b-a5f8-ff6c-23abcbb96303@gmail.com>
References: <20180403231601.5329-1-schnitzeltony@gmail.com>
	<1a96ea45-d89b-a5f8-ff6c-23abcbb96303@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 4 Apr 2018 05:28:18 +0200
Message-ID: <CALbNGRTMzpTUAYsjv-EuJAB7aGd=TiJ83-GFGreG09TsxyHZiQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/2] poppler nightmare
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
X-List-Received-Date: Wed, 04 Apr 2018 03:28:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 4, 2018 at 3:32 AM, akuster808 <akuster808@gmail.com> wrote:
> Andreas,
>
>
>
> On 04/03/2018 04:15 PM, Andreas M=C3=BCller wrote:
>> Not convinced that I'll get support at poppler project. Let's see what
>> autobuilder says. If it fails, please unroll back to 0.57.0 - I am sure
>> that disable glib causes trouble for evince.
>
> this didn't make it into the current world build. I built it @ home a
> getting the same errors:
>
> |
> /build/build_artifacts/master/tmp-glibc/work/core2-64-oe-linux/poppler/0.=
63.0-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-=
oe-linux/gcc/x86_64-oe-linux/7.3.0/ld:
> warning: libpoppler.so.74, needed by ./libpoppler-glib.so, not found
> (try using -rpath or -rpath-link)
>
> - armin
Thanks Armin for quick response. As written - I suggest to keep
poppler at 0.57.0 and forget the updates for a while.

Sigh - from the moment I saw the announcement that poppler changes
from autotools to cmake I thought there might be trouble is ahead. Now
I know.

Andreas

