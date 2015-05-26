Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 41F3D65D6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 10:16:27 +0000 (UTC)
Received: by wgme6 with SMTP id e6so24044174wgm.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 03:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=EIOZUdwVunlYCLBn+p7P00GB+bXdb9FggziseRdrDC4=;
	b=XylkVHrOG6k3X1MXqCRqXY+brVKmB2WvsS92s1bjVDnQy7aoRN8x5YQKMSDeLVQqZ7
	kEDagnXl00glyt3Sv0RC4DdxwhF4MJDVR9lAYcrxDKXOxMqrS/9hNRUmUMoFkIvoLofO
	EsPk66dRQhKhxTH+vPQEKPu0qFddKNQINkDi1LeiluY3hJm09bv4q0NmnMeBsL+hkLsm
	xmzlgrbFvpKKnh5iRp+gRAzuMikJbfQPx1SNxjy28p45KByAs+/teWR/CbgdyjSLZoU6
	niBATdzo1fZLH2PMz2SY69Y9MymagLcnt3jRFI+ZAItvBjhB1+V0KzeTBfUWO4aj0e5z
	ODSA==
MIME-Version: 1.0
X-Received: by 10.180.102.227 with SMTP id fr3mr7222066wib.19.1432635388589;
	Tue, 26 May 2015 03:16:28 -0700 (PDT)
Received: by 10.27.128.68 with HTTP; Tue, 26 May 2015 03:16:28 -0700 (PDT)
In-Reply-To: <CALbNGRS24NTjxiQrmj5MJ9cvJkNaVKizSFvBjgE13FVE2dGUQg@mail.gmail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
	<1432588449-31413-4-git-send-email-schnitzeltony@googlemail.com>
	<CAHvQdo2+r3yjapSU2f=dCaOipuaLViCZ5EXNmDt=xVrLfGdZcw@mail.gmail.com>
	<CALbNGRRwf5wWYR9fwNQ0emgawgGMbOohVMWvZsSGwJ9hicoQpg@mail.gmail.com>
	<CALbNGRR5rxuRkWoDduChQGfgpVPB34xxq9zQXXJgSHpw-9s+bQ@mail.gmail.com>
	<CALbNGRS24NTjxiQrmj5MJ9cvJkNaVKizSFvBjgE13FVE2dGUQg@mail.gmail.com>
Date: Tue, 26 May 2015 12:16:28 +0200
Message-ID: <CAHvQdo3M4rWaoQUKEko7=rT+dVFNcs-LZe-kM4mW_zf_0Z+D0w@mail.gmail.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 03/12] poppler: update 0.33.0 to and enhance packageconfigs
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
X-List-Received-Date: Tue, 26 May 2015 10:16:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thank you for your fast replies/solution.

2015-05-26 11:37 GMT+02:00 Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m>:
> On Tue, May 26, 2015 at 11:30 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Tue, May 26, 2015 at 11:16 AM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>>> On Tue, May 26, 2015 at 11:02 AM, Johannes Pointner
>>> <h4nn35.work@gmail.com> wrote:
>>>> Hello,
>>>>
>>>> I tried your patch but wasn't able to build poppler-qt5.
>>>> The do_configure gives me following log(only part of the log):
>>>> ...
>>>> checking for CAIRO... yes
>>>> checking for PDFTOCAIRO... yes
>>>> checking for fcntl.h... (cached) yes
>>>> checking for sys/mman.h... (cached) yes
>>>> checking for sys/stat.h... (cached) yes
>>>> checking for POPPLER_GLIB... yes
>>>> checking for gobject-introspection... no
>>>> checking for glib-mkenums...
>>>> /mnt/workspace/yocto_env/poky_fido/poky_ppt30/build/tmp/sysroots/x86_6=
4-linux/usr/bin/glib-mkenums
>>>> checking for gtkdoc-check... no
>>>> checking for gtkdoc-rebase... no
>>>> checking for gtkdoc-mkpdf... no
>>>> checking whether to build gtk-doc documentation... no
>>>> checking for POPPLER_QT4... no
>>>> checking for POPPLER_QT5... yes
>>>> checking for POPPLER_QT5_TEST... yes
>>>> checking for arm-poky-linux-gnueabi-moc... no
>>>> checking for moc... moc
>>>> checking for Qt5 moc... no
>>>> checking for arm-poky-linux-gnueabi-moc-qt5... no
>>>> checking for moc-qt5... no
>>>> checking for Qt5 moc-qt5... checking for arm-poky-linux-gnueabi-qtchoo=
ser... no
>>>> checking for qtchooser... qtchooser
>>>> checking for qtchooser... qtchooser: could not find a Qt installation =
of 'qt5'
>>>> not found
>>>> ...
>>>>
>>>> Have I missed something?
>>>> Other qt5 applications build without a problem.
>>>>
>>>> Thx,
>>>> Hannes
>>>>
>>> Will check what my configure says - maybe there are some missing
>>> dependencies caught by my environment
>>>
>> Guess we have some host pollution. Let me guess: you have qtchooser
>> installed on your host - as I haven't and my configure does not ask
>> for qtchooser.
>>
> Think I found it: poppler's configure has some customized way to find
> moc. This finds host's moc - there is no moc-qt5 in qtbase native.
> Hope to send out V2 soon.
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

