Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF26CAC5B5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 21:15:46 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.2541.1758834942472242852
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 14:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M0klelzT;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-63f03676bdcso3177eaf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 14:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758834942; x=1759439742; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZz0NQlsxLo8GC00HHhKHAOsh3NAHsZOEFmlvHNcOyI=;
        b=M0klelzTebrj23mrDoCGxt47wSdc+gFzOfW+oDr6wC+mZ4Rd5d8uMPeM5pGsIJSwkU
         d8UjWGWKKvAMM2w1gRC/ooW2KvveEdei0qpp87FuTeNE/FC6oO2xQ8ZwSZkqSJ6an71a
         JR1d0Yg+4hzVlmrjjV004CvjPoUbe5bWbXmZfp/sdeeO9t2Tf1d+pgUoieV0xPM3zVqP
         IwUe0rqKgOH+9O1XvPO72D1X6VwvVLl9g/AQZ+Rhg/lRpDNbIsw7YIBwH/E0/1cLjjSN
         A4CZRdVeSubJ4Tumnlqnk5AjmPLZ7+dMuXsm+tZXV5Y3cLHmrQkQYctphxQMLxuHtuxp
         l2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758834942; x=1759439742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZz0NQlsxLo8GC00HHhKHAOsh3NAHsZOEFmlvHNcOyI=;
        b=oQKBeBvM6iYDJzOCzuwZXQasL+3LtQ8pQsW8Cs9JY030Oly+r/CdV2E3QGhTonWRoV
         yFttXyDJVbQUg4GYDTPlJZLHQtvLQJYNr3q+Pwoxg2MRxGyMoXO1gxPx3hXQkPvb96vI
         YSl6a8u0HZgyJV1zlP377uDCkSwKk3fZSlO1YrmFlPlimJkkCro/4ooDYDfV9kR9DtqS
         bdgSdmSBAqWoDxJv4sLX8hO/rYMel9KE0HQj+201FgOTC6Sx7a43/GMRl1yLTr/trj6r
         BWjf88VKfgA5u7OwO7ETzSKchfAEGMudbXguCr0I5HqSIHJd++mRgdENF5seG+6v+WYw
         I1fQ==
X-Gm-Message-State: AOJu0YyKkQaYfWldqEc9kuZ2spn3smgQE5veyvI5zTmEiUDBz61l5QTY
	4tItGPkl+SWzLD+XcuR7H8mLVEOxOmUkCGg6ISDGAb1KenT3+8vpEsHD36w2GEOYj99W4okpx4Q
	bRiBnXR5ks8Wqg4GzQbZ+ljB8abFoEf4=
X-Gm-Gg: ASbGncs/2E7TUcB5WRafioDIO0XQB6aXCPVquCdKvBgiBv3udmak1YBIXF4q/E5SZNn
	kep+LZQOVxQNWSCHFDyEBtslRP8TeHZaACW94of/3wcMNihjkFycMLc990plugaJDu0LMJruJq9
	5GaBPncRPNmAfBkp2y90f+CxEkw7TGjwV1SbBjPN3AYxlNRHO95ngusadUqPqJWbDt7Ewd0bVEn
	Ok8Tce1Rw==
X-Google-Smtp-Source: AGHT+IGZ2QmZGPRdh2XU9Gc1V0AepcNzHlIHFuczE/EPQ5X0ZUtExEYBYzVIvnH28C6LMrachcgozcUkLrJ0rmZGa3U=
X-Received: by 2002:a05:6820:2218:b0:621:d7c1:cbc1 with SMTP id
 006d021491bc7-63a392dcbafmr2435640eaf.2.1758834941650; Thu, 25 Sep 2025
 14:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250925062111.240262-1-ankur.tyagi85@gmail.com>
 <20250925062111.240262-4-ankur.tyagi85@gmail.com> <2971ce3b-81fb-465f-bf32-b38053e98eb3@gmail.com>
In-Reply-To: <2971ce3b-81fb-465f-bf32-b38053e98eb3@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 26 Sep 2025 09:15:30 +1200
X-Gm-Features: AS18NWBMEUjYHlRo7LfsKQveVs0pWspfV2XP3XQCESuiGlppDxtxF853tGIaPWE
Message-ID: <CADySD0E9HkrtC+KDJc3cJfYGx1RLOwOgvyaVjveH=Ddbqi5bdA@mail.gmail.com>
Subject: Re: [oe][meta-oe][walnascar][PATCH v2 3/3] lsscsi: upgrade to version 0.32
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Changqing Li <changqing.li@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 21:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119886

On Fri, Sep 26, 2025 at 1:33=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> I dunno. This recipe is a bit of a mess, at least regarding the
> application's versioning habits and the recipe's history due to this.
>
> The changelog definitely looks suitable enough. And interestingly
> Kirkstone has a newer version - which has been reverted later in master
> (which revert was later reverted once again, to have the latest
> version), and that old version got into Walnascar.
>
> But here is the real problem: this version goes backwards[1] (at least
> as far as Bitbake is concerned) - and I have seen people being unhappy
> about this. I wonder if maybe in master it would be better to give this
> recipe a PE...
>
> [1]:
> https://gist.github.com/OldManYellsAtCloud/f3e26c13bd68118f8e586803e9b3a8=
d4
> - this was copied from buildhistory.bbclass and from bb.utils module
>

very good catch, I was able to reproduce that by replicating upgrade
from lsscsi_030.bb -> lsscsi_0.32.bb

$ bitbake -c cleansstate lsscsi
...
$ bitbake -e lsscsi | grep "^PV=3D"
PV=3D"030"
$ bitbake lsscsi
...
meta-oe
meta-python
meta-networking
meta-gnome
meta-filesystems
meta-initramfs
meta-multimedia
meta-perl
meta-webserver
meta-xfce            =3D "walnascar:80ab58cc404959ae2f0e8b2e68935b3bfd8e8cf=
e"

Sstate summary: Wanted 83 Local 73 Mirrors 1 Missed 9 Current 191 (89%
match, 96% complete)#######################################################=
#############
               | ETA:  0:00:00
Initialising tasks: 100%
|##########################################################################=
###########################################################################=
|
Time: 0:00:03
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 834 tasks of which 816 didn't need to
be rerun and all succeeded.

<=3D checkout dev branch =3D>
$ bitbake -e lsscsi | grep "^PV=3D"
PV=3D"0.32"
$ bitbake lsscsi
...
meta-oe
meta-python
meta-networking
meta-gnome
meta-filesystems
meta-initramfs
meta-multimedia
meta-perl
meta-webserver
meta-xfce            =3D
"lsscsi-walnascar:2aaa71377618350d2af8fafc51dcd4fb403ed554"

Sstate summary: Wanted 83 Local 83 Mirrors 0 Missed 0 Current 191
(100% match, 100%
complete)##################################################################
               | ETA:  0:00:00
Initialising tasks: 100%
|##########################################################################=
###########################################################################=
|
Time: 0:00:01
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 834 tasks of which 833 didn't need to
be rerun and all succeeded.

<=3D bump PE =3D>
$ bitbake -e lsscsi | grep "^PE=3D"
PE=3D"1"
$ bitbake lsscsi
...
meta-oe
meta-python
meta-networking
meta-gnome
meta-filesystems
meta-initramfs
meta-multimedia
meta-perl
meta-webserver
meta-xfce            =3D
"lsscsi-walnascar:2aaa71377618350d2af8fafc51dcd4fb403ed554"

Sstate summary: Wanted 81 Local 74 Mirrors 0 Missed 7 Current 193 (91%
match, 97% complete)#######################################################=
#############
               | ETA:  0:00:00
Removing 5 stale sstate objects for arch core2-64: 100%
|##########################################################################=
############################################|
Time: 0:00:00
Removing 1 stale sstate objects for arch qemux86_64: 100%
|##########################################################################=
##########################################|
Time: 0:00:00
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 834 tasks of which 818 didn't need to
be rerun and all succeeded.


I will send patches for master and walnascar.

> On 9/25/25 08:21, Ankur Tyagi via lists.openembedded.org wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > Upstream changelogs:
> > https://sg.danny.cz/scsi/lsscsi.ChangeLog
> >
> > Changes in this commit are referenced from 51e410a84eaa9742ea8881435925=
a242fb5529cd.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > (cherry picked from commit 51e410a84eaa9742ea8881435925a242fb5529cd)
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../recipes-bsp/lsscsi/{lsscsi_030.bb =3D> lsscsi_0.32.bb}    | 6 ++++=
--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >  rename meta-oe/recipes-bsp/lsscsi/{lsscsi_030.bb =3D> lsscsi_0.32.bb} =
(63%)
> >
> > diff --git a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb b/meta-oe/recipes=
-bsp/lsscsi/lsscsi_0.32.bb
> > similarity index 63%
> > rename from meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
> > rename to meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
> > index 63b94e9d6e..127be8fbfa 100644
> > --- a/meta-oe/recipes-bsp/lsscsi/lsscsi_030.bb
> > +++ b/meta-oe/recipes-bsp/lsscsi/lsscsi_0.32.bb
> > @@ -6,8 +6,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff02=
15e8d672dc4c32c317bb3"
> >
> >  SRC_URI =3D "http://sg.danny.cz/scsi/${BP}.tgz"
> >
> > -SRC_URI[sha256sum] =3D "619a2187405f02c5f57682f3478bffc75326803cd08839=
e39d434250c5518b15"
> > +SRC_URI[sha256sum] =3D "0a800e9e94dca2ab702d65d72777ae8cae078e3d74d0bc=
bed64ba0849e8029a1"
> >
> >  inherit autotools
> >
> > -S =3D "${WORKDIR}/lsscsi-${PV}r154"
> > +S =3D "${WORKDIR}/lsscsi-${PV}"
> > +
> > +UPSTREAM_CHECK_REGEX =3D "lsscsi-(?P<pver>\d+(\.\d+)+)\.tgz"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#119852): https://lists.openembedded.org/g/openembed=
ded-devel/message/119852
> > Mute This Topic: https://lists.openembedded.org/mt/115426052/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

