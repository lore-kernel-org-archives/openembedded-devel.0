Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286AEC3ABC9
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 02:01:00 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.42047.1747620050119646113
 for <Openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 19:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UT81ZLGW;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2dfb991cb45so1151295fac.0
        for <Openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 19:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747620049; x=1748224849; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+ab0JRP+H2E8JF10q1eTCNl1WGrhfyJU4N1OLTfjMc=;
        b=UT81ZLGWNtYHv943XswOKNO0jRjFOwdcBMTgY/81JEe1SDeLvqJGRFkD9/uRlNDr6R
         3jiWcidYY/lan86xStgR0qnOdZehKpG2l81trKu8YbYceNTD02gBjqTn4KMlbtPR5fMh
         7wLtebm9+C6dXc1ZPjWdJoIF4+JepEZsV4XCmfVAuFwWcZgrWjtj+vSLqRY7j84jwOf3
         /obeWcczyLGiRkiSovt8Gz1zWKkz3Rkfvhwdtz3UpVSfUQmgQ6/18G910vqhdU/uAteq
         hbrv22xA2ZJJcUy4ymtk9EyEWYWTbZLd82Th/XSWFof+v0l92U7PaN7OvZ8AICu0vuHH
         C5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747620049; x=1748224849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+ab0JRP+H2E8JF10q1eTCNl1WGrhfyJU4N1OLTfjMc=;
        b=aMOQPSiuzMkHof7rHNbEVGwvVRoV6+DNvZWWm3OhPGIT/m9xuprBVHjlZsGbUrLKPW
         j/Za2rJjYwofjgXaDYC9ek3kcv6OnwTS8rl2zyJbSGy+HWqyX+tUnbNlKZrrTJ5xcwOc
         +NrXxAT5zJdT/8+C40dYOW86h73kdiVrs9Or19kxAsfoQ1rmXSkXZckP9Utw4uUUxSjU
         hEFPxQQ3ykUUPLkca8MljWAlbK8JWVFi/EH/R5RxOt4xCxkW299hSBRjVKHUzu+ImEfX
         e+db9J9npdIDNaO0LAqBbHI1KgxN0RlV5l3oNwCTI74vhnrCg6d2i6fdgOc4WKS1uHxL
         OCeA==
X-Forwarded-Encrypted: i=1; AJvYcCVgaX3nWk3MOZZrzD5k07W7+sC0XpC+WC/GovlhlYwLMPRVzY6krTQoOYzEMZtuW0VsuZiPl6iyQJ+V4xzaa9QBsTU=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy5fEPSTXrpAWtv1+vXbzupXBECw+G8ki2s6ujho1trRcgZ8d5F
	dk3AlfSTvjotbTVrHZ6khU6qvq3M0j1M9TCVMQY9V4OKs4U7XBes0eFsFvsm+VZK5FxcffBRYDc
	Md4vM5LuPIpjWe1HD2uloFlSi1xekvqiqXOp2
X-Gm-Gg: ASbGncsMdTT13m5qo10oi84Lak0yP0wnhOWQPZTpdTAPoOsuHhhdgFzl/WMs67c/08o
	KxnJdkQl0jlouhY7kZaD6SIWLHFguBZyc094YaS6yA/3+XgHlawWdhD6wvIN1qSvyBXY+EXJKhJ
	794HbfH7vsiC+ekn+QpYqMsrQlqKcSZZo=
X-Google-Smtp-Source: AGHT+IFB1HaboINPD1AJh3j5BCUWRgFBJv7zL7hJJZr/X8PnkQ87FSTn6ZGBRwAHaDidoky7n2M304x7sGWB1SULZiE=
X-Received: by 2002:a05:6870:9e0d:b0:2c2:5b08:8e42 with SMTP id
 586e51a60fabf-2e3c1ed9f7emr6920072fac.27.1747620049246; Sun, 18 May 2025
 19:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250518192835.229015-1-dimitris@siganos.org> <20250518192835.229015-2-dimitris@siganos.org>
 <CAMSfU+5gCDDrw0ksTueG6DrQDqhWMMhwYZda1rRjev+J=tbqog@mail.gmail.com>
In-Reply-To: <CAMSfU+5gCDDrw0ksTueG6DrQDqhWMMhwYZda1rRjev+J=tbqog@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 19:00:23 -0700
X-Gm-Features: AX0GCFsjzY1abIhLZtXdTVgcMpxaJgpFOOs0FlM0xCBo8oMoFYgyNDV3wwMK4BM
Message-ID: <CAMKF1spGOCiwtNDz8oCyu=qrEXa8vhTH7LquxUK0dmPNx=avJw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] bvi: add new package
To: yoann.congal@smile.fr
Cc: dimitris@siganos.org, Openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 02:01:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117470

On Sun, May 18, 2025 at 1:36=E2=80=AFPM Yoann Congal via
lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org>
wrote:
>
> Hello,
>
> Le dim. 18 mai 2025 =C3=A0 21:29, Dimitrios Siganos via lists.openembedde=
d.org <dimitris=3Dsiganos.org@lists.openembedded.org> a =C3=A9crit :
>>
>> bvi is a visual editor for binary files
>>
>> Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>
>> ---
>>  meta-oe/recipes-support/bvi/bvi_1.4.2.bb | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/bvi/bvi_1.4.2.bb
>>
>> diff --git a/meta-oe/recipes-support/bvi/bvi_1.4.2.bb b/meta-oe/recipes-=
support/bvi/bvi_1.4.2.bb
>> new file mode 100644
>> index 0000000000..e6da1efd41
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
>> @@ -0,0 +1,21 @@
>> +SUMMARY =3D "Binary VI editor"
>> +DESCRIPTION =3D "bvi is a visual editor for binary files."
>> +HOMEPAGE =3D "https://sourceforge.net/projects/bvi"
>> +SECTION =3D "console/utils"
>> +LICENSE =3D "GPL-3.0-only"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da36207309d382da27cd66fdaae92=
2e3c"
>> +
>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/bvi/bvi-${PV}.src.tar.gz"
>> +SRC_URI[sha256sum] =3D "4bba16c2b496963a9b939336c0abcc8d488664492080ae4=
3a86da18cf4ce94f2"
>> +
>> +DEPENDS +=3D "ncurses"
>> +
>> +inherit pkgconfig autotools
>> +
>> +# build inside the source tree, bvi does not support out of tree buildi=
ng
>> +B =3D "${S}"
>
>
> FYI, there is the autotools-brokensep class just for that.
>
> Also, that does not build on my system on master. Looks related to the gc=
c-15 incompatibilities mentioned here: https://sourceforge.net/p/bvi/bugs/1=
6/
> My logs: https://pastebin.com/SH6uNHDi
>
> Finally, the last activity of the author was 2 years ago : https://source=
forge.net/p/bvi/activity/?page=3D0&limit=3D100#67ba1727be8108c555c9b214
> It does not look maintained anymore :( (gcc15 ticket was 3 months ago, no=
 activity)

This is quite important that packages are active, it does seem there
is some activity but not a whole lot. while other distros are
packaging
it as well, so some other communities will also carry the burden of
maintaining it downstream.

>
> Regards,
>
>>
>> +
>> +EXTRA_OECONF +=3D "\
>> +    --build=3D${BUILD_SYS} \
>> +    --host=3D${TARGET_SYS} \
>> +"
>> --
>> 2.34.1
>>
>>
>>
>>
>
>
> --
> Yoann Congal
> Smile ECS
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117463): https://lists.openembedded.org/g/openembedde=
d-devel/message/117463
> Mute This Topic: https://lists.openembedded.org/mt/113180865/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

