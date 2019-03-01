Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by mail.openembedded.org (Postfix) with ESMTP id C84FF7CDB8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 19:42:21 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id a17so21418001ljd.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 11:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=7NgCV2a4vrLZkMhjQvgXSYpBCuxzMwE8FA0zzql5B3k=;
	b=Kegk4AGolmzndoqbuqeBIdM9GGWfR6BvYZMId1EsgQG8lqCuxJ30yRCyQsmqAxWsBp
	R8Fz4FFYKiCh3F2egkkbbJDvP+pe0bpPuAWC+3tyG8vm5UrxCDJ72fzK/EErs8MYoyth
	wODMJ4+ub8/P3Gy0LKceyAzlegIMFdDhMMW7gRRQyrc6/eZlMEX1SQLu1RxyDNFrJ8wn
	NIZAOXKVAz9ftRcmORjjBUYuKIw+l3wZnJJP5MzK+N7YE+ZirXR1bAnFvTABnwarR3t4
	REKYLx2AyaAaHfGA8qs+gURAFOVVugiz0nB2+OOqeS0JEGjiuQpMbCt5hQlWrqMCYNjG
	GBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=7NgCV2a4vrLZkMhjQvgXSYpBCuxzMwE8FA0zzql5B3k=;
	b=i9N4oZSEg3hJnwS+DpNRzHVPAygihaKLnLX6P56BNJlQQnFSaW414XsEasM9AM9zOn
	VwtcOi02la6mZPovn3BX2qTZdwlNzODDRKxpIZykVLCrdWlXvJvkYAicAm+/Q537U3qh
	UBbWnd1jrhuDolT+fixEGovzclr17eg07wVn4ttH1pswILlErqbnW4oGwDt5c9wG5/2a
	9cqNeMhwIGEJAQg5fBQwb6vSdAWjdBc3xRAXYfAzy4JrPizjP8sbsDqIDoaSkAUkJ0xM
	tC3oyYusl0CVJpnNe3/MY+lfI+OPTzOGshMY4AC7ZA1Qlz/Rrv0wjxIhg2QyIvO5De38
	7lgg==
X-Gm-Message-State: APjAAAXEyxMinqZXYdQL2s4U7T3eJazIl0HpQ0UXscRUwctEjJ0ND+C4
	SZOe8l41UTW71g0s+WFxOAOVM6rTSSkL5YkoGY8=
X-Google-Smtp-Source: APXvYqyD09pB0NMcN86Xcy1qJr9kB+piY2dbxh6ShrWKI9xhzA0R7uxuVUKK0XggEYehVxsFXfToAtMsZxn5zOolTz8=
X-Received: by 2002:a2e:2419:: with SMTP id k25mr3637120ljk.38.1551469342251; 
	Fri, 01 Mar 2019 11:42:22 -0800 (PST)
MIME-Version: 1.0
References: <20190301001504.4459-1-alistair.francis@wdc.com>
	<CAMKF1sqGWbQVoU+YTrgW3yWYwJ=sS1ujxv_YM-k9Fv_nEgPJLA@mail.gmail.com>
	<CAKmqyKM=6cBxpGpBxsYixDZpu--8bY7VgV7-9p+QRAtHBHkb1Q@mail.gmail.com>
	<CAMKF1sp0e0mwtOJZWT5RpsqEc_3+W++9JJ44nHDDU7UwEDkfrg@mail.gmail.com>
	<CAKmqyKOGaTjFD1RpNPgKVh0AtXHOVmEP=Jpyx4MPPzUmS7k2-A@mail.gmail.com>
	<CA+chaQdokthy-jjqUoa8GocK+KoQH34ihrQCkdMLhYy5wv49iw@mail.gmail.com>
In-Reply-To: <CA+chaQdokthy-jjqUoa8GocK+KoQH34ihrQCkdMLhYy5wv49iw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 1 Mar 2019 11:41:23 -0800
Message-ID: <CAKmqyKN+craDdApkhe3TQSfeGOD-xBOWB3Z-d8geebtojEC2kQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] mimic: Initial commit of version 1.2.0.2
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
X-List-Received-Date: Fri, 01 Mar 2019 19:42:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2019 at 11:37 AM Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> Do you expect other recipes to use these license texts?

I don't expect others to use them.

>
> Otherwise they belong to meta-multimedia/licenses and add:
> LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> to meta-multimedia/conf/layer.con

Will do!

Alistair

>
> On Fri, Mar 1, 2019 at 8:34 PM Alistair Francis <alistair23@gmail.com> wr=
ote:
>>
>> On Fri, Mar 1, 2019 at 11:06 AM Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > On Fri, Mar 1, 2019 at 9:47 AM Alistair Francis <alistair23@gmail.com>=
 wrote:
>> > >
>> > > On Thu, Feb 28, 2019 at 6:30 PM Khem Raj <raj.khem@gmail.com> wrote:
>> > > >
>> > > > On Thu, Feb 28, 2019 at 4:26 PM Alistair Francis
>> > > > <Alistair.Francis@wdc.com> wrote:
>> > > > >
>> > > > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> > > > > ---
>> > > > > I was not sure what the license should be, it's a little confusi=
ng:
>> > > > > https://github.com/MycroftAI/mimic/blob/development/COPYING
>> > > > >
>> > > >
>> > > > ideally list them all with &
>> > >
>> > > Ok, it looks like there is a Sun, BellBird and CMU license that Yoct=
o
>> > > doesn't understand. Should I add those licenses to the meta layer
>> > > first?
>> > >
>> >
>> > yes
>>
>> Thanks for the help. Patches sent to add the licenses.
>>
>> I'll respin a v2 of this as well.
>>
>> Alistair
>>
>> >
>> > > Alistair
>> > >
>> > > >
>> > > > >  .../recipes-multimedia/mimic/mimic_1.2.0.2.bb    | 16 +++++++++=
+++++++
>> > > > >  1 file changed, 16 insertions(+)
>> > > > >  create mode 100644 meta-multimedia/recipes-multimedia/mimic/mim=
ic_1.2.0.2.bb
>> > > > >
>> > > > > diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.=
0.2.bb b/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb
>> > > > > new file mode 100644
>> > > > > index 000000000..bd43fe389
>> > > > > --- /dev/null
>> > > > > +++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb
>> > > > > @@ -0,0 +1,16 @@
>> > > > > +SUMMARY =3D "A fast lightweight Text-to-speech engine"
>> > > > > +DESCRIPTION =3D "Mimic is a fast, lightweight Text-to-speech en=
gine developed by Mycroft A.I. and VocaliD, based on Carnegie Mellon Univer=
sity=E2=80=99s Flite (Festival-Lite) software. Mimic takes in text and read=
s it out loud to create a high quality voice."
>> > > > > +HOMEPAGE =3D "https://mimic.mycroft.ai/"
>> > > > > +SECTION =3D "multimedia"
>> > > > > +
>> > > > > +LICENSE =3D "BSD-like"
>> > > > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D416ef1ca5167707fe381=
d7be33664a33"
>> > > > > +
>> > > > > +DEPENDS =3D "curl-native icu"
>> > > > > +
>> > > > > +SRCREV =3D "67e43bf0fa56008276b878ec3790aa5f32eb2a16"
>> > > > > +SRC_URI =3D "git://github.com/MycroftAI/mimic.git"
>> > > > > +
>> > > > > +inherit autotools
>> > > > > +
>> > > > > +S =3D "${WORKDIR}/git"
>> > > > > --
>> > > > > 2.20.1
>> > > > >
>> > > > > --
>> > > > > _______________________________________________
>> > > > > Openembedded-devel mailing list
>> > > > > Openembedded-devel@lists.openembedded.org
>> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-deve=
l
>> > > > --
>> > > > _______________________________________________
>> > > > Openembedded-devel mailing list
>> > > > Openembedded-devel@lists.openembedded.org
>> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

