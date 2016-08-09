Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9A198771C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Aug 2016 14:04:44 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id d97so1052782uad.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 07:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=eGevNY0+nelT86UcFy1Zw3+FXgkMifxeQoNY8hDfcDU=;
	b=RdXZgyzP7Fi9Rl8bWLuPmOHt3C5o34T3bBusnOlPaHPMdTKHbwC2kco/7uWyIrWpab
	tr9OdvFLxFWCxqGEyIsXlNRuH1RAjQQHI0xVG32sWG5ZXKM8ZA6W6kzyumFlznAavKEp
	kmFNC7biEfwBxyJgKXHTN4jX3Kg+vT/NsBLZRAJlvlENGCs4aoWotiKkmbavWUAYRnKO
	P8/iC5xkSdno6/uUFxbGEbI4UV1TgyLgAOMjxoUAx9P05NiOkRFarPe5cAcQ8EbKQYVV
	3LhkKwhlDhmVyKEkEG7Ctn/F1eLaoLJ+rT3xdkzzUQX6+dMIRQDYLudhw60J9yUqyycU
	6TIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=eGevNY0+nelT86UcFy1Zw3+FXgkMifxeQoNY8hDfcDU=;
	b=H2huPi9AowVDe+PCDt9tCcvEj95eupzs1VPXodHvFmIPeUQRG4ubm70fP0LWbf6qdg
	lnWAn5OlLjnVcVG8VAMbmqbJPTSWPN3wNp+4aROpZb3mJ46Ma6mnbXaxlnkOuaqjHw2Q
	s84bBSZhSq3FrXKOJXpvJY2WaWAcQS2+fFg63PQt4ZqcLyf/l8YYf/R2ab9gByRtE8x1
	YLQuW+399STbkrxggB4oNUiwEKZGroj9lQkW/m2zsbocxna+xqKSXKjZr+x3tFrsUgGr
	hZEdhfC0XC6WR6zrxecs1v2hI7StKMX+QnY5hzrVH3n97wmQc+CympTGpQDdN0BPoA69
	mMrg==
X-Gm-Message-State: AEkoousoDnV4anWEFmBPP3QzfBLdvfufoGetWV789+4CTntP0tUpnL1HJSsz+q1na06FRa3+wtL5D0+MVzDxgQ==
X-Received: by 10.31.95.137 with SMTP id t131mr15425550vkb.67.1470751484485;
	Tue, 09 Aug 2016 07:04:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.66 with HTTP; Tue, 9 Aug 2016 07:04:43 -0700 (PDT)
In-Reply-To: <CA+chaQeTP0PgC1bSucTyQkt0=tAC0KcEmYA1mRL0Uu+xmu4zRA@mail.gmail.com>
References: <1469931304-13906-1-git-send-email-schnitzeltony@googlemail.com>
	<1469931304-13906-3-git-send-email-schnitzeltony@googlemail.com>
	<CA+chaQeTP0PgC1bSucTyQkt0=tAC0KcEmYA1mRL0Uu+xmu4zRA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 9 Aug 2016 16:04:43 +0200
Message-ID: <CALbNGRSU0OHifH7801P_k0ig+QokGA_9=Ck=UZ2JGeSAWrdKag@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/5] libmbim: update to 1.14.0
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
X-List-Received-Date: Tue, 09 Aug 2016 14:04:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 6, 2016 at 9:23 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> ERROR: libmbim-1.14.0-r0 do_package: QA Issue: libmbim:
> Files/directories were installed but not shipped in any package:
>   /usr/share/bash-completion
>   /usr/share/bash-completion/completions
>   /usr/share/bash-completion/completions/mbimcli
>
>
> On Sun, Jul 31, 2016 at 4:15 AM, Andreas M=C3=BCller <
> schnitzeltony@googlemail.com> wrote:
>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  .../libmbim/{libmbim_1.12.2.bb =3D> libmbim_1.14.0.bb}                 =
 |
>> 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.12.2.bb =3D>
>> libmbim_1.14.0.bb} (80%)
>>
>> diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
>> b/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
>> similarity index 80%
>> rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
>> rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
>> index f1ecce5..f2b8df6 100644
>> --- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.12.2.bb
>> +++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb
>> @@ -12,5 +12,5 @@ DEPENDS =3D "glib-2.0 libgudev"
>>  inherit autotools pkgconfig
>>
>>  SRC_URI =3D "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.ta=
r.xz
>> "
>> -SRC_URI[md5sum] =3D "921fb5ab3f13f1e00833e009d8f3b4f6"
>> -SRC_URI[sha256sum] =3D "949351d3e3d69b81e40a49f1d18794
>> 4c26149e0647a415f0227ccdc112047b29"
>> +SRC_URI[md5sum] =3D "2ed809e65c85353d3ab59e372890e549"
>> +SRC_URI[sha256sum] =3D "ca8d52a95a18cbabae8f15f83f1572
>> 316e888b6504f946e6645d24405127ab5b"
>> --
>> 2.5.5
>>
Cannot take care currently - it is added to my TODO stack.

Andreas

