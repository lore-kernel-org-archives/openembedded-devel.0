Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1EE0E60745
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Dec 2016 19:40:54 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id p9so20377853vkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Dec 2016 11:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=Axau7sudVoDoFcj54+r386/hn/qBBSxa0kHo6+2vS84=;
	b=dxOKxvn85cpfKPG4/lQPj4OC2lSIKKRUTF+ibmNrFiCtD1ZV8y5As5NAqfk2IkShkH
	quodRT7Vg4/QIe16kcXAPaw4guUuZAxdlxT15YvI/XBA/aGC28SoxEMnOAXk4VVO7MBn
	Wp+LXW3aBp3Bdsb87ZOciWmtIcpuOXr1aKXo0QNlrdAnIHhVXTq5Yj4mh9fxSuSDoVeD
	ud2nuPmNMtakRVmQP9lwaKAKq0KyrnrB8Yot2wXT1MoWeR4E3GWAzNfywNFYI+7srAOS
	X7UwG+PIgPQK4hHUz+9seKZNM+AgynuI9mMC0HEZ0cpgYrNjkx1s6vQ9bxRx4m8SUW7Z
	AhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=Axau7sudVoDoFcj54+r386/hn/qBBSxa0kHo6+2vS84=;
	b=GLc9K13/AyHIcqXG633NyoWeYpIi+Y2QmQsU9LEYWj2HZwJbc9jPWnhHdKnlgWRRaZ
	WWUeuaJzduaovzNW9SKlUhPcyAbT8MO1SH0xts2FraB2G/aSSbgX2wjMe5H+H5ohy46J
	hraFoyJFjUQcE7yRMAljiddK6JI050dvpA7wRbBUe5jTZaCkCCf81Ep2Ctm71aFS8hd5
	43J00O8GokSYv1QjPX7jVCTI7EO6rDXEJdbyG1R24iFaQyNXtLROjl85JdWscewrVOmp
	+lp3F8Cf/SCwGXaqgwZJO2S6VFPd8W4ETZwIaQiHvBYQ7Fl0R/prt8Wu5Uo3LnIVxxWH
	tL7Q==
X-Gm-Message-State: AKaTC00T4f4AeeaSaODHOt/tZcLQ6S7x4WFFGgkitjcmlVOwuVR27d9SFuiRvu805X+BhJ0+fRWEBaJLDC+0zg==
X-Received: by 10.31.8.8 with SMTP id 8mr25975543vki.173.1481139655179; Wed,
	07 Dec 2016 11:40:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Wed, 7 Dec 2016 11:40:24 -0800 (PST)
In-Reply-To: <CALbNGRQ2CH59VL51BeaXs3PP9up=C=aAfVWOccYQqRH8QLrRig@mail.gmail.com>
References: <20161206023625.12901-1-raj.khem@gmail.com>
	<20161206023625.12901-4-raj.khem@gmail.com>
	<CALbNGRQ2CH59VL51BeaXs3PP9up=C=aAfVWOccYQqRH8QLrRig@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Dec 2016 11:40:24 -0800
Message-ID: <CAMKF1sqLfgn9SKGWevkZDq88Bg8x-p6gqVbW9EfxrOdsDRzgag@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 6/7] gthumb: Add missing dependency on gnome-common-native
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
X-List-Received-Date: Wed, 07 Dec 2016 19:40:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 6, 2016 at 12:56 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, Dec 6, 2016 at 3:36 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> | ../gthumb-2.12.4/configure: line 17557: GNOME_MAINTAINER_MODE_DEFINES:=
 command not found
>> | ../gthumb-2.12.4/configure: line 17558: syntax error near unexpected t=
oken `maximum'
>> | ../gthumb-2.12.4/configure: line 17558: `GNOME_COMPILE_WARNINGS(maximu=
m)'
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta-gno=
me/recipes-gnome/gthumb/gthumb_2.12.4.bb
>> index 5eee7f0..13c027c 100644
>> --- a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
>> +++ b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
>> @@ -2,7 +2,7 @@ SUMMARY =3D "gThumb is an image viewer and browser for t=
he GNOME Desktop"
>>  SECTION =3D "x11/gnome"
>>  LICENSE =3D "GPLv2"
>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f=
6552"
>> -DEPENDS =3D "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libp=
ng gstreamer jpeg tiff gst-plugins-base intltool-native"
>> +DEPENDS =3D "gnome-common-native glib-2.0 gtk+ libxml2 gnome-doc-utils =
libunique gconf libpng gstreamer jpeg tiff gst-plugins-base intltool-native=
"
>>
>>  PR =3D "r4"
>>
>> --
>> 2.10.2
>>
> * Are there patches missing in this series (1/2 2/2)?

No, it was missed out from prior series.

> * What about gnome-menus3?

havent seen that fail. but probably needs similar fix.

>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

