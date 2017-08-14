Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2F2AD719A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 10:22:33 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id 76so18930879ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 03:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u3hEopt+WuogsGtRyHVDL7xNhc3Gw9ix0/+tK7JIGjg=;
	b=1mwIW3RuJVxRAHEfEjSnjDJhkcCWsRRosEnVlEbO4v+hDUIVk/fD4PF9V4SGw7PEm0
	YE06BOkCvgeIp0vrBECOwfpg0obaNt4njPfftxhtsLqN8PUwVQbIhFPz+/U1zDc2vjdF
	x1v9EjCZlAbCaXJnCeyYl9w5fxJygcMXEiVs54o7Odn0UxPrFJconWRvA1DR4vu7CBfC
	n279cF62aV1IzcdLwbjiKgo+DSYaw5yb8ky9vLDE/EKLrce/C0LK1LrMxTFpKhsDKyuY
	4qvWQVXC+Hk3Px+rbsAxy6x2o1fmN6GAeaETvvzulQimSYOhNHIKG1kuMbfr2BZC/k1m
	CH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u3hEopt+WuogsGtRyHVDL7xNhc3Gw9ix0/+tK7JIGjg=;
	b=oPMxDQtD95zLfOeBP4f9MtPojWNMblan3PI3KSkcd0HOmSfxD0Q0WX2CJnG6CmyNCx
	PA3eSxQsOMg17tnfeCCJ0lZiBvRKQqOWYN/rJy6yBRxn1emSZMuDY4jznzZ+rvMU65s1
	jayu8/ulD3F72OmVzifiYyk0YqYZ1gV5qquyQ55cStc3TBLW8jMq43G7vuXh8ntUftZw
	D9uqs8kM7DnVj9QNOZWrVQVpkRfxKUsw+b8cpDSKwwUhBNnoOyhSAuhmFDOe7q14e0Qs
	wIG2/zW3cBdDF15JcpnlxUgqNV2zAlekgSUm51m8dEv+whDvSrNqst56ds8Xcnx21egL
	aOcQ==
X-Gm-Message-State: AHYfb5iJkqF1IdxTJ/pqI6hyiXDwU6K88NlFMnh9iUVvjip3n+og+zzi
	0OyVX7rgH1gOCgRL7ot8mD9sEDKYe4/H
X-Received: by 10.36.82.67 with SMTP id d64mr5604262itb.119.1502706155322;
	Mon, 14 Aug 2017 03:22:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.141.19 with HTTP; Mon, 14 Aug 2017 03:22:04 -0700 (PDT)
In-Reply-To: <CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
	<CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 14 Aug 2017 13:22:04 +0300
Message-ID: <CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>, 
	Raphael Kubo Da Costa <raphael.kubo.da.costa@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: denis@eukrea.com, Otavio Salvador <otavio@ossystems.com.br>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, eric@eukrea.com
Subject: Re: chromium detected as stripped
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
X-List-Received-Date: Mon, 14 Aug 2017 10:22:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 14 August 2017 at 10:04, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote=
:

> On 13 August 2017 at 02:10, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
> wrote:
>
>> Hi,
>>
>> in current OE environment 'file' says:
>>
>> <...>image/usr/bin/chromium/chrome: ELF 32-bit LSB shared object, ARM,
>> EABI5 version 1 (SYSV), dynamically linked, interpreter
>> /lib/ld-linux-armhf.so.3, stripped
>>
>> This file is 4.3G of size and this does not fir into most of my sdcards!
>>
>> One note: I have an elder environment: meta-browser
>> c79cf6c7811afd2cd167e8967e3c29b1e797371e. There chrome binary is
>> detected as not stripped and properly stripped on do_package.
>>
>> Any idea why it is detected as stripped?
>>
>
> I have a vague recollection that 'file' and other tools can get very
> confused when given 32 bit executables that are larger than 4 GB. It may
> make sense to build a non-debug version to begin with to get around this.
>

I chatted with rakuco who's done nice work with up to date chromium in
meta-crosswalk, he's got some relevant commits related to this:

https://github.com/rakuco/meta-crosswalk/commit/5aae1539c3d62b295dba40f4943=
97c0797140b0f

https://github.com/rakuco/meta-crosswalk/commit/c56aa2bf047d3a01e14f4f9bfe5=
f88664b333f36

On a related note, this good work is currently a bit hidden in
meta-crosswalk -- is there a chance we could get this combined with
meta-browser (or whatever place makes sense)? I know next to nothing about
chromium packaging so CCing Raphael and the meta-browser maintainers for
comments.

Jussi=E2=80=8B

