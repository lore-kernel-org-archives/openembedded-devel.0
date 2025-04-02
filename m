Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F20C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:37:48 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.2451.1743579465617893178
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vv6xrhHD;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5499614d3d2so7219715e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 00:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743579463; x=1744184263; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKAy++eQLXQww71UjNlp2SJDw0kAcL1Bedpp29L3GA8=;
        b=Vv6xrhHDKsVt/Ds+i/NvHo+jUMaryOXsZ4wFIn6h8dELxE3odkgFwvuGwn2/EOK7Ey
         cL6Tho7+0YEtWqt0eH1WGY5Vq8B5YPXwPn3HO18/tsvx8oAd15RAxhmwuYpqhYoFjJKB
         zLUBQStOiIbtcqWvPBJT6emEpqkssQhA8pJ+3C6tpzVYjxbjPoYRJgfK/cbkhXymovyr
         +n53LpArS8l0nsVgXOmVGEU5lo5NFUThxf6XohOwbD/KsrGOMitkB6x5dTkVDw8+HNiH
         Ap9kOkmubIs7+EVgiyd+5BTAimAvfM1scjGRJMKd7vdtq6O+KomxtQiLp3xB8KaiHc2S
         LOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743579463; x=1744184263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKAy++eQLXQww71UjNlp2SJDw0kAcL1Bedpp29L3GA8=;
        b=RGZF9NmyMbKJZEurXN7nEqTbVts8sw0Bl1qfmDUfQP4lAj1+lJ3XJ7IGdhjb6/gH0T
         AHbWVwRNgOGDSM2NZU+LRkAiho3BYlrn89hloNGG2Cs1+zE+IB66SLeLNEPTlh+JilKC
         o4Rf05sjQ6MOFmJ7VuILuh/0FZWX01oK2rcp1V3abMUWBlofHIJcqktnThOkf7np6QMI
         +QpDPrW6M0LpBDTVVx9vOiQV2z3F+cPbN6ct3HgHVXkzcJSL5r8LmCKmdKa4C2k49VMk
         Ps+6jFU0E+Iuf16+ZjRaRtQBXFJUrQeHBi0xI0zPPFfEFPES662mL6j0Ww/lyH9Ms2Ap
         t+QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQH0LNJoiYHkCA2NWGoVzGfz/01VbSJjeBHrNsBvAPoYnqZWdXHU/LePmc50VOAklF2raaq/w8oNIeJrnTIqlPDkA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyqqFhl+/iZ4nC2h5QgHptgbGpaPiep/Bkn2xvVweEnqCWVWkrB
	MdgAwUIgVN+Utc7N7eVyMFCC7aMFxcp9VnvmveGtEBB00fnKJZBv261/KZHQYABtfchq9AxaH/6
	XiMDrWurgWeJsy6qCFhW94YUF8Xw=
X-Gm-Gg: ASbGnctKIOYSg88gt7UoIGga7uvZMO4sdLCmYmmEpFVoHZAei2wfjeslTLn9/YcQXqd
	5LGlbt4Vy4fN2NsqV3VAVrqP0nbyAcnQNcjI/Zi9osBwqiDTINxPVC3iH7GUR7+1IzC3IoPRfFF
	oicjIKlni3dpVT3TVHK85vRz1k248O
X-Google-Smtp-Source: AGHT+IHWWNrKcbmEaD5+46aJX9Fqd5lRuKsQCaz1IwU238c70VHW+BE0mrLV7+bGp+oVkB/LNFegNltCggXMTejDt9w=
X-Received: by 2002:a05:6512:334f:b0:54b:117c:1189 with SMTP id
 2adb3069b0e04-54b117c11ddmr3261071e87.54.1743579463298; Wed, 02 Apr 2025
 00:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250307093255.1110778-1-awais.belal@gmail.com>
 <20250307093255.1110778-2-awais.belal@gmail.com> <CAMKF1spsyTBdgD_we=X2Q9vpGFhBi-0E59ArdGyKr3KB-8g3Gg@mail.gmail.com>
 <CAM=5Amb6u5-8pmud11do97X4UAwLToizR9SiGjPD=4+Zqet6Rw@mail.gmail.com>
 <CAMKF1sroz=jLxp9PfMkZoQwtRjyvDZhK15kGLS32q5vu7dxcHA@mail.gmail.com>
 <CAM=5AmYtt81oiNVQqYMbu--Z0vTfGpQ5eHUpdJeV2KqoUdT4Ww@mail.gmail.com> <CAMKF1srDnbOc3LGOJ0YBVNGbxJ8-7bzSZMowWZ=WuONeFbvuiQ@mail.gmail.com>
In-Reply-To: <CAMKF1srDnbOc3LGOJ0YBVNGbxJ8-7bzSZMowWZ=WuONeFbvuiQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 2 Apr 2025 09:37:30 +0200
X-Gm-Features: AQ5f1Jok8wOHMPUKf9kTyo4v2Dwl7B1gF5p09eca9naEPbVkVTPOa9FSaWpsuCg
Message-ID: <CA+chaQdj4iXwG1bP_ZYJVXJXU1Oq4buzc5hx=YU7DBkXk9uQ0A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 2/2] mongodb: update to 4.4.29
To: raj.khem@gmail.com
Cc: Awais Belal <awais.belal@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 07:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116508

Awais: any update on this? the 1/2 is already applied in scarthgap,
but in walnascar and master it's still skipped with:
SKIP_RECIPE[mongodb] ?=3D "Needs porting to python 3.12"

and there is also:

ERROR: mongodb-4.4.24-r0 do_package_qa: QA Issue: File /usr/bin/mongod
in package mongodb contains reference to TMPDIR
File /usr/bin/mongos in package mongodb contains reference to TMPDIR
[buildpaths]
ERROR: mongodb-4.4.24-r0 do_package_qa: Fatal QA errors were found,
failing task.

even in scarthgap (where it usually isn't fatal error, but will need
to be fixed for walnascar - I haven't checked the new version from
this review yet).

Regards,

On Thu, Mar 13, 2025 at 4:48=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> there still are errors see
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/452/st=
eps/15/logs/stdio
>
> On Wed, Mar 12, 2025 at 11:51=E2=80=AFAM Awais Belal <awais.belal@gmail.c=
om> wrote:
> >>>>
> >>>>
> >>>
> >>>  The changeset was intended for scarthgap and I haven't made sure if =
master builds. Is that a requirement? The cgi module was dropped in python =
3.13 which is what master is following at this point. I might send a separa=
te series for master once I move on to that.
> >>
> >>
> >> Patches are routed by master to release branches if they are needed in=
 master. They are done for master and then backported
> >
> >
> > Hi Khem,
> > I've just sent https://patchwork.yoctoproject.org/project/oe/list/?seri=
es=3D32428 which coupled with the changes here fixes mongodb build for mast=
er as well. Kindly note that the other series (https://patchwork.yoctoproje=
ct.org/project/oe/list/?series=3D32428) is not needed for scarthgap.
> >
> > --
> > Regards,
> > Awais Belal
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115976): https://lists.openembedded.org/g/openembedde=
d-devel/message/115976
> Mute This Topic: https://lists.openembedded.org/mt/111564957/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

