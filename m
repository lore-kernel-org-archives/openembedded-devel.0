Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2DC96785A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:16:39 +0000 (UTC)
Received: by mail-yb0-f196.google.com with SMTP id z5-v6so6390049ybo.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=b9zMaHIxtEKsgVlcGSZNASXmBuQKJ/RzmGGI9SocHXg=;
	b=YEnGiwK0X8Q3Oo915tgOf1di78NwSwFqOLnHu/1QcyxT7H2OfrArj8QH+uJDPEEoWT
	PvOwxTLjgE923//GMClDLiADRSI2afXtowpc72MiakcMglvz0A6dxKDVrD+rox+jaDLp
	CwqxS1i+SNTOZLqzE2fCIxdvy2dwr24R6rVnfwnfSEy59QJPdXU704A9TONS9bRfg9ow
	Zz666rjqKX/Q7bFt12hZqHX211ee/94M6gm4BgnFRhop+iBd/URpRxT+zhuTl2glWdVZ
	ejZ27cP0PlBbA/KMvvyY6LhfLHaunYi8/SJ+FkUHhrwfXQibayokb5LP0puIZtdmPWUI
	Vhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=b9zMaHIxtEKsgVlcGSZNASXmBuQKJ/RzmGGI9SocHXg=;
	b=HRkGjDnu7ppW+vOj/H4knkcR3iXXUNzONo2GGkIfbweuh/5HaKtYIbQ3YVyk9Vbqyn
	EMBtSCasFCWzxLTIJt+x9GmGUdNQnJ2R9AcEgbXA191yqHrbm1v/S0ot7CAdtzAYXPYQ
	ULzsCfrtOIEiDlAKcWu1QDgoLABJmswiaYVEf4ur5VU4+oMgeqf5AHtCcwQx9xBYNyel
	Pzqa6lG2xCW6jqXBBMTYRXx1hh7WBLL5F5LGJYHBnbsXKDygv2BsARNzX1aMJ6R24iwz
	/rveJTyQ2VNjS0oSaJ3MBTfUM+RfihbTiF49gHy6Wbn3zPfXX2+aZ0L2GDrxZtn5/Kp1
	k2yQ==
X-Gm-Message-State: AElRT7Gdr7Wi0C8KFwU5ZfjhjprR2a18U8/Eg0zxvjnS1eQXE5x+evdu
	xxRQBjcH2zsAVGDpdy+unNQTfbQ9R3KyAZIuJ66okA==
X-Google-Smtp-Source: AG47ELv0oKqYozKdlEBjLIEMcpI/8EzMJolzXB9Xxp+En7L7zF2IGc9ugSqSFyb3oGLYp7TyZYK0ENl5dJ2CKAoR1V4=
X-Received: by 2002:a25:d24a:: with SMTP id
	j71-v6mr23171410ybg.108.1522073800788; 
	Mon, 26 Mar 2018 07:16:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Mon, 26 Mar 2018 07:16:40
	-0700 (PDT)
In-Reply-To: <CAMKF1sofXkmq=i_F1uH6vO1choZQcMrZ+2kQhPyyN9T0Ba0g0Q@mail.gmail.com>
References: <20180325230452.40908-1-raj.khem@gmail.com>
	<CALbNGRTRsNOgr9AZD+cWeoUmfHKetXgQuGGd0r-yb_h_FU9RJA@mail.gmail.com>
	<CAMKF1sofXkmq=i_F1uH6vO1choZQcMrZ+2kQhPyyN9T0Ba0g0Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 26 Mar 2018 16:16:40 +0200
Message-ID: <CALbNGRS+KzUQgNUNErXboWeyJPu4a16e=dQNbDUuicpmVz3O2w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 1/2] qtwebkit: Fix build on armv7ve (rpi)
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
X-List-Received-Date: Mon, 26 Mar 2018 14:16:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 26, 2018 at 4:08 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sun, Mar 25, 2018 at 11:50 PM Andreas M=C3=BCller <schnitzeltony@gmail=
.com>
> wrote:
>>
>> On Mon, Mar 26, 2018 at 1:04 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > ---
>> >  recipes-qt/qt5/qtwebkit_git.bb | 13 +++++++++++++
>> >  1 file changed, 13 insertions(+)
>> >
>> > diff --git a/recipes-qt/qt5/qtwebkit_git.bb
>> > b/recipes-qt/qt5/qtwebkit_git.bb
>> > index b23d4d6..0f5cbbc 100644
>> > --- a/recipes-qt/qt5/qtwebkit_git.bb
>> > +++ b/recipes-qt/qt5/qtwebkit_git.bb
>> > @@ -18,6 +18,19 @@ DEPENDS +=3D "qtbase qtdeclarative icu ruby-native
>> > sqlite3 glib-2.0 libxslt gperf-
>> >  ARM_INSTRUCTION_SET_armv4 =3D "arm"
>> >  ARM_INSTRUCTION_SET_armv5 =3D "arm"
>> >
>> > +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9474
>> > +# https://bugs.webkit.org/show_bug.cgi?id=3D159880
>> > +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
>> > +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2
>> > (-mthumb).
>> > +ARM_INSTRUCTION_SET_armv7a =3D "thumb"
>> > +ARM_INSTRUCTION_SET_armv7r =3D "thumb"
>> > +ARM_INSTRUCTION_SET_armv7ve =3D "thumb"
>> > +
>> > +# qemu: uncaught target signal 11 (Segmentation fault) - core dumped
>> > +# Segmentation fault
>> > +GI_DATA_ENABLED_armv7a =3D "False"
>> > +GI_DATA_ENABLED_armv7ve =3D "False"
>> > +
>> >  # Patches from https://github.com/meta-qt5/qtwebkit/commits/b5.10
>> >  # 5.10.meta-qt5.1
>> >  SRC_URI +=3D "\
>> > --
>> > 2.16.2
>> >
>> Hmm strange - my builds for Rpi are fine. Are you sure that this is
>> not caused by musl in particular gi part?
>
>
> I transplanted it from oe core the thumb instruction set it what I was
> needing I have to test a build without it and you might be right about mu=
sl
> I should check that too
>>
I have checked this further for the GI_DATA_ENABLED part:
qemu/gobject-introspection at qtwebkit?? I found it at webkitgtk.
Seems your copying was a bit over enthuisastic :)

Andreas

