Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35F5D172AB
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 23:59:53 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41889.1769990386633205610
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 15:59:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EcaGG0ZQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79478ec4cf1so36561237b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 15:59:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769990386; cv=none;
        d=google.com; s=arc-20240605;
        b=FfOWg++i+LuUNhHZr02tKJWJN4X7Sq8E+nj7NQwiDQi/BU2iOd1XwJ4pxrxsjIaYFP
         TT+nUtud+JUzNDxb8YF7dBcV8vY9ZUT8w2kp14QtOS6Yd/kEcEdA7D1yG7tQUF2eDiDa
         gQh7/UmXNXo+DRKzeAOfzyRZIzbF6F4KBExsPQV/LmP6bmk27vhWte5S6pC4qSwSQgjx
         PvnEyzZbDNM5BXeuVbmJV4mAicbtgyxQr/4iQV4gi17GpP5sT68PlNz6owMiywwHbnEA
         7mRsyo+kbQfmaCv1sxKVTPypsrC2Gm+y6fPGpb0BDSsxnivHXHXujjAGU2k21bFbsfDk
         ZRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nzYW6TWNZCeHYAtzm6li4AP6MdWOl5caCgHzE1HEr0Y=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=EXhrR8t25iVWY2TwWjMGZ6azeGFhUzUpLKrxRdlzivl5mtwapTdDdD1L54onl7oDup
         SH/jesnV4UZNumQjbiFnxl7obpA3xbyFs8Xoon2uLizxxl0ovoLCgoDAU1BkkAie4wLf
         2paD24BzrG2yYHwTN3Y4VDz6pmfuGrSL+Avt+SCkZIRdsNt9yr4QfIq6nHOB3aqjgjLB
         5wJsYXdUP6K5N6Oxqw+hv0qSOzncDrKXs1Dy7jJDgyj+bYTUCUKlnamfROE5vjMXyQQb
         l1CXescOYxAc9rUDNfYTUULcPdrd9hVnNgmp2ThsrKpBNrEmdz4+ws+uMoM/ZHsWSoMW
         xg/A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769990386; x=1770595186; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nzYW6TWNZCeHYAtzm6li4AP6MdWOl5caCgHzE1HEr0Y=;
        b=EcaGG0ZQlHP7hx/IPIAaNdMxt3pUJBdriFSCKrx7qTT+abwOJZLqO3OmugqiAv3gfz
         QvwWB+czDOy0mjkfSq4qRQuaVgYoLwzF4pEMsvWlduHIi/pcZSGsPoSpSWxlSz2+EIPY
         Erx8795Z3zr6QVJ99OGjqY6GE88VKAlgZyCgWW0WTXbvy8kATIcY1rrFmj3Nlwhx8Wvb
         XYKYwvZeYoRVTy9jSaMJVuorbGFzD1GwvvaMjha3TnSUkCZyXDI9z911ADaA0O1tztFh
         wDIj+aMurIw6wjYmuPTN30KCFqnTo3czvS0gu721JL3dVMepojMXo7IS/6AS4rZYMyWY
         fEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769990386; x=1770595186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzYW6TWNZCeHYAtzm6li4AP6MdWOl5caCgHzE1HEr0Y=;
        b=TCMdD1YOBPpBgWuuFhEWkKzYjrhc9LTmt0CPjc9pc7WQp04Y4eZC2lq+WxFIFVyDuV
         O/ev+KV1CBLvlELtF2J0pMZiC920GSeEI8jT9aKcOLZxmrht3z2V993n9W3UE7n88hiG
         X7AbgAcVkRCJmyB7vIq/rVRgdPtUZI9quj+rmSfAS4mb5UDD5P9FLvQZvo6cdr/H14I6
         eHnNMNhOyI42ACqitBXNOrEJooD4wahknu48rV/RIwV1dRMrvd70pT4Pc/GQk3KCNNn1
         VKlu+EdUuiHTlXtXJWHOcLpHgE5sZz3xdt49xI30fOx4J72VINBrqGCLzFnv07SdznEa
         MOrw==
X-Gm-Message-State: AOJu0Yzl56iwBxZCw9r/NYVf8eA3jdUHIyxn47ZQJaR6ju7iM9CJTtpR
	/GFa8eBaBhCQVGLefHca9Fgg2trH/wT9Pr+OPD8XlvFyoR53gbutqQUzq6D1XMV2djTZIx+FZBc
	dZtl38FMJ0mPJ0qMD1wUGqeXSVMOPRgEAKeTb4w0=
X-Gm-Gg: AZuq6aK0YE04QOjyLb6ehZdcZ248WGNJu9VGxMgnDYIT1vbWd1xHy0nSd+F29dUc3Dl
	yDqI62T+MgA9YjGdzSjjPt0Tx96LtcdDAQmLYOfc4fGm4PKsKJ3lrU2jtgllGDC1cuku4jm+4lh
	tCIh/jdlAz5n55KQKW+wXNjunoMW2wXLjXstOcGSmNUUAhV+5d4Y1b4eLfkFUCWpyOJWpN/Xd4L
	2Aad1JZLb8b9KjGm3/LMN0ds1ujnrZQvthDvoCvmq4f/KhtXFEhpvwJr/c/3JNpL1DzcsorSOXA
	ISWCbfefJJ+YLTncx+GMuKfZIuX5SKO5pbzpFG3Cewk7yLoxCtaIOjH+ddXWE8wzRkiijv5pRvq
	qb/1R2TdEphgnRjM/oROXdeOI4SOmgCgAGPFEhZuwB2xJK9CzDmgs+6Is
X-Received: by 2002:a05:690c:60c7:b0:788:c21:b05c with SMTP id
 00721157ae682-7949e0610d2mr86474467b3.63.1769990385509; Sun, 01 Feb 2026
 15:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20260131215636.2633863-1-skandigraun@gmail.com>
In-Reply-To: <20260131215636.2633863-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Feb 2026 15:59:19 -0800
X-Gm-Features: AZwV_QgvFTtePN2_IJYw5tBQDdxYFi6rgOqciHCwQqDSW1N-wi1Gw3MmkMqgnBI
Message-ID: <CAMKF1sqKVzcq67nyqST2QLmaxfiswhmFc5DmdimrMs=J3C9fRg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 0/3] Update and split mime-support
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002f28b20649cc00a3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 23:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124042

--0000000000002f28b20649cc00a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Seeing this error

Loading cache: 100% |##########################################| Time:
0:00:00
Loaded 0 entries from dependency cache.
Parsing recipes: 100% |########################################| Time:
0:00:21
Parsing of 3443 .bb files complete (0 cached, 3443 parsed). 5840 targets,
178 skipped, 0 masked, 0 errors.
NOTE: The "universe" target is only intended for testing and may produce
errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Multiple providers are available for runtime libva-dev-native
(libva-initial-native, libva-native)
Consider defining a PREFERRED_RPROVIDER entry to match libva-dev-native
WARNING: Nothing RPROVIDES 'mime-support' (but
/srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups=
/
packagegroup-meta-oe.bb RDEPENDS on or otherwise requir
NOTE: Runtime target 'mime-support' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['mime-support']
NOTE: Runtime target 'packagegroup-meta-oe' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe',
'mime-support']
NOTE: Runtime target 'meta-oe-image-all' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['meta-oe-image-all',
'packagegroup-meta-oe', 'mime-support']
NOTE: Runtime target 'packagegroup-meta-oe-crypto' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-crypto', 'mime-support']
NOTE: Runtime target 'packagegroup-meta-oe-security' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-security', 'mime-support']
NOTE: Runtime target 'packagegroup-meta-oe-printing' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-printing', 'mime-support']
NOTE: Runtime target 'packagegroup-meta-oe-test' is unbuildable, removing..=
.
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-test',
'mime-support']
NOTE: Runtime target 'packagegroup-meta-oe-devtools' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-devtools', 'mime-support']
NOTE: Runtime target 'packagegroup-meta-oe-support' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-support', 'mime-support']
NOTE: Runtime target 'packagegroup-meta-oe-extended' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-extended', 'mime-support']
NOTE: Runtime target 'packagegroup-meta-oe-kernel' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-kernel', 'mime-support']
NOTE: Runtime target 'packagegroup-meta-oe-graphics' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-graphics', 'mime-support']
NOTE: Runtime target 'packagegroup-meta-oe-core' is unbuildable, removing..=
.
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-core',
'mime-support']
WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-shells' (but
/srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups=
/
packagegroup-meta-oe.bb RDEPENDS on or o
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-shells'
NOTE: Runtime target 'packagegroup-meta-oe-shells' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-shells'=
]
WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-connectivity' (but
/srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups=
/
packagegroup-meta-oe.bb RDEPENDS o
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-connectivity'
NOTE: Runtime target 'packagegroup-meta-oe-connectivity' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-connectivity']
WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-benchmarks' (but
/srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups=
/
packagegroup-meta-oe.bb RDEPENDS on
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-benchmarks'
NOTE: Runtime target 'packagegroup-meta-oe-benchmarks' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-benchmarks']
WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-navigation' (but
/srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups=
/
packagegroup-meta-oe.bb RDEPENDS on
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-navigation'
NOTE: Runtime target 'packagegroup-meta-oe-navigation' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-navigation']
WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-dbs' (but
/srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups=
/
packagegroup-meta-oe.bb RDEPENDS on or othe
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-dbs'
NOTE: Runtime target 'packagegroup-meta-oe-dbs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-dbs']
WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-bsp' (but
/srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups=
/
packagegroup-meta-oe.bb RDEPENDS on or othe
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-bsp'
NOTE: Runtime target 'packagegroup-meta-oe-bsp' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-bsp']
WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-ptest-packages' (but
/srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups=
/
packagegroup-meta-oe.bb RDEPENDS
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-ptest-packages'
NOTE: Runtime target 'packagegroup-meta-oe-ptest-packages' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-ptest-packages']
WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-gnome' (but
/srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups=
/
packagegroup-meta-oe.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-gnome'
NOTE: Runtime target 'packagegroup-meta-oe-gnome' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['packagegroup-meta-oe-gnome']
WARNING: Nothing RPROVIDES 'packagegroup-meta-oe-multimedia' (but
/srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups=
/
packagegroup-meta-oe.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'packagegroup-meta-oe-multimedia'
NOTE: Runtime target 'packagegroup-meta-oe-multimedia' is unbuildable,
removing...
Missing or unbuildable dependency chain was:
['packagegroup-meta-oe-multimedia']

On Sat, Jan 31, 2026 at 1:56=E2=80=AFPM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> The mime-support recipe is fairly outdated: it ships a 7 years old
> version of the package - Debian even stopped storing it on their server,
> and the SRC_URI was inaccesisble.
>
> With version 3.65 (in Oct/2020)[1] Debian has split mime-support package
> into
> two subpackages: mailcap and media-types. With that they also stopped
> maintaining the mime-support package (baically it is now a package
> that just depends on the two new packages).
>
> This small series removes the old mime-support recipe, and adds recipes
> for the two new packages. Made the media-types recipe to provide
> mime-support
> still, with the intention to avoid breaking recipes depending on it.
>
> [1]:
> https://salsa.debian.org/debian/mime-support/-/blob/master/debian/changel=
og?ref_type=3Dheads
>
> ---
>
> Gyorgy Sarvari (3):
>   mime-support: drop recipe
>   mailcap: add recipe
>   media-types: add recipe
>
>  .../{mime-support_3.62.bb =3D> mailcap_3.75.bb} | 33 ++++++----------
>  .../mime-support/media-types_14.0.0.bb        | 39 +++++++++++++++++++
>  2 files changed, 50 insertions(+), 22 deletions(-)
>  rename meta-oe/recipes-support/mime-support/{mime-support_3.62.bb =3D>
> mailcap_3.75.bb} (58%)
>  create mode 100644 meta-oe/recipes-support/mime-support/
> media-types_14.0.0.bb
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124020):
> https://lists.openembedded.org/g/openembedded-devel/message/124020
> Mute This Topic: https://lists.openembedded.org/mt/117568653/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002f28b20649cc00a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Seeing this error<div><br></div><div>Loading cache: 100% |=
##########################################| Time: 0:00:00<br>Loaded 0 entri=
es from dependency cache.<br>Parsing recipes: 100% |#######################=
#################| Time: 0:00:21<br>Parsing of 3443 .bb files complete (0 c=
ached, 3443 parsed). 5840 targets, 178 skipped, 0 masked, 0 errors.<br>NOTE=
: The &quot;universe&quot; target is only intended for testing and may prod=
uce errors.<br>NOTE: Resolving any missing task queue dependencies<br>NOTE:=
 Multiple providers are available for runtime libva-dev-native (libva-initi=
al-native, libva-native)<br>Consider defining a PREFERRED_RPROVIDER entry t=
o match libva-dev-native<br>WARNING: Nothing RPROVIDES &#39;mime-support&#3=
9; (but /srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packa=
gegroups/<a href=3D"http://packagegroup-meta-oe.bb">packagegroup-meta-oe.bb=
</a> RDEPENDS on or otherwise requir<br>NOTE: Runtime target &#39;mime-supp=
ort&#39; is unbuildable, removing...<br>Missing or unbuildable dependency c=
hain was: [&#39;mime-support&#39;]<br>NOTE: Runtime target &#39;packagegrou=
p-meta-oe&#39; is unbuildable, removing...<br>Missing or unbuildable depend=
ency chain was: [&#39;packagegroup-meta-oe&#39;, &#39;mime-support&#39;]<br=
>NOTE: Runtime target &#39;meta-oe-image-all&#39; is unbuildable, removing.=
..<br>Missing or unbuildable dependency chain was: [&#39;meta-oe-image-all&=
#39;, &#39;packagegroup-meta-oe&#39;, &#39;mime-support&#39;]<br>NOTE: Runt=
ime target &#39;packagegroup-meta-oe-crypto&#39; is unbuildable, removing..=
.<br>Missing or unbuildable dependency chain was: [&#39;packagegroup-meta-o=
e-crypto&#39;, &#39;mime-support&#39;]<br>NOTE: Runtime target &#39;package=
group-meta-oe-security&#39; is unbuildable, removing...<br>Missing or unbui=
ldable dependency chain was: [&#39;packagegroup-meta-oe-security&#39;, &#39=
;mime-support&#39;]<br>NOTE: Runtime target &#39;packagegroup-meta-oe-print=
ing&#39; is unbuildable, removing...<br>Missing or unbuildable dependency c=
hain was: [&#39;packagegroup-meta-oe-printing&#39;, &#39;mime-support&#39;]=
<br>NOTE: Runtime target &#39;packagegroup-meta-oe-test&#39; is unbuildable=
, removing...<br>Missing or unbuildable dependency chain was: [&#39;package=
group-meta-oe-test&#39;, &#39;mime-support&#39;]<br>NOTE: Runtime target &#=
39;packagegroup-meta-oe-devtools&#39; is unbuildable, removing...<br>Missin=
g or unbuildable dependency chain was: [&#39;packagegroup-meta-oe-devtools&=
#39;, &#39;mime-support&#39;]<br>NOTE: Runtime target &#39;packagegroup-met=
a-oe-support&#39; is unbuildable, removing...<br>Missing or unbuildable dep=
endency chain was: [&#39;packagegroup-meta-oe-support&#39;, &#39;mime-suppo=
rt&#39;]<br>NOTE: Runtime target &#39;packagegroup-meta-oe-extended&#39; is=
 unbuildable, removing...<br>Missing or unbuildable dependency chain was: [=
&#39;packagegroup-meta-oe-extended&#39;, &#39;mime-support&#39;]<br>NOTE: R=
untime target &#39;packagegroup-meta-oe-kernel&#39; is unbuildable, removin=
g...<br>Missing or unbuildable dependency chain was: [&#39;packagegroup-met=
a-oe-kernel&#39;, &#39;mime-support&#39;]<br>NOTE: Runtime target &#39;pack=
agegroup-meta-oe-graphics&#39; is unbuildable, removing...<br>Missing or un=
buildable dependency chain was: [&#39;packagegroup-meta-oe-graphics&#39;, &=
#39;mime-support&#39;]<br>NOTE: Runtime target &#39;packagegroup-meta-oe-co=
re&#39; is unbuildable, removing...<br>Missing or unbuildable dependency ch=
ain was: [&#39;packagegroup-meta-oe-core&#39;, &#39;mime-support&#39;]<br>W=
ARNING: Nothing RPROVIDES &#39;packagegroup-meta-oe-shells&#39; (but /srv/b=
uild/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/<a hr=
ef=3D"http://packagegroup-meta-oe.bb">packagegroup-meta-oe.bb</a> RDEPENDS =
on or o<br>No eligible RPROVIDERs exist for &#39;packagegroup-meta-oe-shell=
s&#39;<br>NOTE: Runtime target &#39;packagegroup-meta-oe-shells&#39; is unb=
uildable, removing...<br>Missing or unbuildable dependency chain was: [&#39=
;packagegroup-meta-oe-shells&#39;]<br>WARNING: Nothing RPROVIDES &#39;packa=
gegroup-meta-oe-connectivity&#39; (but /srv/build/yoe/sources/meta-openembe=
dded/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-meta=
-oe.bb">packagegroup-meta-oe.bb</a> RDEPENDS o<br>No eligible RPROVIDERs ex=
ist for &#39;packagegroup-meta-oe-connectivity&#39;<br>NOTE: Runtime target=
 &#39;packagegroup-meta-oe-connectivity&#39; is unbuildable, removing...<br=
>Missing or unbuildable dependency chain was: [&#39;packagegroup-meta-oe-co=
nnectivity&#39;]<br>WARNING: Nothing RPROVIDES &#39;packagegroup-meta-oe-be=
nchmarks&#39; (but /srv/build/yoe/sources/meta-openembedded/meta-oe/recipes=
-core/packagegroups/<a href=3D"http://packagegroup-meta-oe.bb">packagegroup=
-meta-oe.bb</a> RDEPENDS on<br>No eligible RPROVIDERs exist for &#39;packag=
egroup-meta-oe-benchmarks&#39;<br>NOTE: Runtime target &#39;packagegroup-me=
ta-oe-benchmarks&#39; is unbuildable, removing...<br>Missing or unbuildable=
 dependency chain was: [&#39;packagegroup-meta-oe-benchmarks&#39;]<br>WARNI=
NG: Nothing RPROVIDES &#39;packagegroup-meta-oe-navigation&#39; (but /srv/b=
uild/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/<a hr=
ef=3D"http://packagegroup-meta-oe.bb">packagegroup-meta-oe.bb</a> RDEPENDS =
on<br>No eligible RPROVIDERs exist for &#39;packagegroup-meta-oe-navigation=
&#39;<br>NOTE: Runtime target &#39;packagegroup-meta-oe-navigation&#39; is =
unbuildable, removing...<br>Missing or unbuildable dependency chain was: [&=
#39;packagegroup-meta-oe-navigation&#39;]<br>WARNING: Nothing RPROVIDES &#3=
9;packagegroup-meta-oe-dbs&#39; (but /srv/build/yoe/sources/meta-openembedd=
ed/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-meta-o=
e.bb">packagegroup-meta-oe.bb</a> RDEPENDS on or othe<br>No eligible RPROVI=
DERs exist for &#39;packagegroup-meta-oe-dbs&#39;<br>NOTE: Runtime target &=
#39;packagegroup-meta-oe-dbs&#39; is unbuildable, removing...<br>Missing or=
 unbuildable dependency chain was: [&#39;packagegroup-meta-oe-dbs&#39;]<br>=
WARNING: Nothing RPROVIDES &#39;packagegroup-meta-oe-bsp&#39; (but /srv/bui=
ld/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/<a href=
=3D"http://packagegroup-meta-oe.bb">packagegroup-meta-oe.bb</a> RDEPENDS on=
 or othe<br>No eligible RPROVIDERs exist for &#39;packagegroup-meta-oe-bsp&=
#39;<br>NOTE: Runtime target &#39;packagegroup-meta-oe-bsp&#39; is unbuilda=
ble, removing...<br>Missing or unbuildable dependency chain was: [&#39;pack=
agegroup-meta-oe-bsp&#39;]<br>WARNING: Nothing RPROVIDES &#39;packagegroup-=
meta-oe-ptest-packages&#39; (but /srv/build/yoe/sources/meta-openembedded/m=
eta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-meta-oe.bb=
">packagegroup-meta-oe.bb</a> RDEPENDS<br>No eligible RPROVIDERs exist for =
&#39;packagegroup-meta-oe-ptest-packages&#39;<br>NOTE: Runtime target &#39;=
packagegroup-meta-oe-ptest-packages&#39; is unbuildable, removing...<br>Mis=
sing or unbuildable dependency chain was: [&#39;packagegroup-meta-oe-ptest-=
packages&#39;]<br>WARNING: Nothing RPROVIDES &#39;packagegroup-meta-oe-gnom=
e&#39; (but /srv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/p=
ackagegroups/<a href=3D"http://packagegroup-meta-oe.bb">packagegroup-meta-o=
e.bb</a> RDEPENDS on or otherwise requires it)<br>No eligible RPROVIDERs ex=
ist for &#39;packagegroup-meta-oe-gnome&#39;<br>NOTE: Runtime target &#39;p=
ackagegroup-meta-oe-gnome&#39; is unbuildable, removing...<br>Missing or un=
buildable dependency chain was: [&#39;packagegroup-meta-oe-gnome&#39;]<br>W=
ARNING: Nothing RPROVIDES &#39;packagegroup-meta-oe-multimedia&#39; (but /s=
rv/build/yoe/sources/meta-openembedded/meta-oe/recipes-core/packagegroups/<=
a href=3D"http://packagegroup-meta-oe.bb">packagegroup-meta-oe.bb</a> RDEPE=
NDS on or otherwise requires it)<br>No eligible RPROVIDERs exist for &#39;p=
ackagegroup-meta-oe-multimedia&#39;<br>NOTE: Runtime target &#39;packagegro=
up-meta-oe-multimedia&#39; is unbuildable, removing...<br>Missing or unbuil=
dable dependency chain was: [&#39;packagegroup-meta-oe-multimedia&#39;]</di=
v></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Jan 31, 2026 at 1:56=E2=80=AFPM Gyorgy Sarv=
ari via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gma=
il.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">The mime-support recipe is fairly outdated: it=
 ships a 7 years old<br>
version of the package - Debian even stopped storing it on their server,<br=
>
and the SRC_URI was inaccesisble.<br>
<br>
With version 3.65 (in Oct/2020)[1] Debian has split mime-support package in=
to<br>
two subpackages: mailcap and media-types. With that they also stopped<br>
maintaining the mime-support package (baically it is now a package<br>
that just depends on the two new packages).<br>
<br>
This small series removes the old mime-support recipe, and adds recipes<br>
for the two new packages. Made the media-types recipe to provide mime-suppo=
rt<br>
still, with the intention to avoid breaking recipes depending on it.<br>
<br>
[1]: <a href=3D"https://salsa.debian.org/debian/mime-support/-/blob/master/=
debian/changelog?ref_type=3Dheads" rel=3D"noreferrer" target=3D"_blank">htt=
ps://salsa.debian.org/debian/mime-support/-/blob/master/debian/changelog?re=
f_type=3Dheads</a><br>
<br>
---<br>
<br>
Gyorgy Sarvari (3):<br>
=C2=A0 mime-support: drop recipe<br>
=C2=A0 mailcap: add recipe<br>
=C2=A0 media-types: add recipe<br>
<br>
=C2=A0.../{<a href=3D"http://mime-support_3.62.bb" rel=3D"noreferrer" targe=
t=3D"_blank">mime-support_3.62.bb</a> =3D&gt; <a href=3D"http://mailcap_3.7=
5.bb" rel=3D"noreferrer" target=3D"_blank">mailcap_3.75.bb</a>} | 33 ++++++=
----------<br>
=C2=A0.../mime-support/<a href=3D"http://media-types_14.0.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">media-types_14.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 39 +++++++++++++++++++<br>
=C2=A02 files changed, 50 insertions(+), 22 deletions(-)<br>
=C2=A0rename meta-oe/recipes-support/mime-support/{<a href=3D"http://mime-s=
upport_3.62.bb" rel=3D"noreferrer" target=3D"_blank">mime-support_3.62.bb</=
a> =3D&gt; <a href=3D"http://mailcap_3.75.bb" rel=3D"noreferrer" target=3D"=
_blank">mailcap_3.75.bb</a>} (58%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/mime-support/<a href=3D"ht=
tp://media-types_14.0.0.bb" rel=3D"noreferrer" target=3D"_blank">media-type=
s_14.0.0.bb</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124020): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124020" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124020</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117568653/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117568653/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000002f28b20649cc00a3--

