Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003DAC433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 02:34:35 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.2155.1643337274666188937
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 18:34:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ELDNQ/Ij;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id t7so4668866qvj.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 18:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IQ7ron7UyuffqtDnsGOIAplRI5JAQajk8FgC/JPM340=;
        b=ELDNQ/IjYWaqDKZoy3zeiB1t1QkZqIDVGuklaG/FaySeh4ERBzyHAoccJxbdvEvtpy
         wS5d/E6fU2x3QVEpMqSNKUzHjzpWGfyy6D792dDkupyQkded+0hxW+/zInaS6zasICx0
         Q6lgJY/tXvVpeZ29vzEyA2+tYc4B7laVYdQd5/9I1llSqb/MnzDR1J840GmXDkAdAbGi
         CQt7qV9O+Wuuf3YtfERSO6H7PXxS6Kqr4CiCrvshLzvThy7kI8CY+J7SZ6R75PM521ez
         TMQuG0KOVzkISDE4RrRq1K2l3kV/Ho2SF3DF/bnHrg8mp8YV5ubCvKMH/V4Mnqg4d1Dz
         c7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IQ7ron7UyuffqtDnsGOIAplRI5JAQajk8FgC/JPM340=;
        b=zGb0pPOJp4Zx8+22YFalGZnKMe0UdBK6N8cPyBcPNSuazqkYRL0HZjnndr7ixDVJS8
         dc17XRsDVUwQUatHafSzWuCrTbk8MV+lz/c1Y3WVYEc3f8sJUIFjgCN7DLIUr12k8OAw
         JlfRxTxmkTkOA9eqXJfruPwKhEBw61vDBzA+XgLQi8t+tLo9Ub3M0WHn4VLfCYiKzA+M
         7uItSJr1FFbS7sBRzP5iQ9Mbnoi5uV5qEGKXo70ay9T3DBCxCY8xqHzTskJXWpAPN8jl
         YPKFHUxKqXkdGqnJqGgUwM7fFhrikBYWhnjmmapaNMHWtMRrCGsFyt3k814A+9golnBK
         6wlw==
X-Gm-Message-State: AOAM530Tg/myG6YiXayymzhkcYuyVdi2ZPzrLPnOIlfFGKzQmhy5U6x3
	kJiZ3ysGf/R/QWN9s6MLvHd7Sum1zwKJJVI0DGI=
X-Google-Smtp-Source: 
 ABdhPJyztCTH0u7FSe2XBd5hgBdzub8blBtw3dWkBQToNc0toy1ItexZ90QnIX51YT69smPJ/ciP0nTWSYohsL3Su3g=
X-Received: by 2002:a05:6214:19ec:: with SMTP id
 q12mr5835296qvc.36.1643337273737;
 Thu, 27 Jan 2022 18:34:33 -0800 (PST)
MIME-Version: 1.0
References: <20220128013536.2809159-1-limon.anibal@gmail.com>
 <CAMKF1sog0kc5MYaZzJ161L+g4JgFBUKjg0D4UNKNJQZKznU2Wg@mail.gmail.com>
 <CAPS-YPAzCpUkB3SP-CQ+-c9HLgxvrr7Juv3Y1ZDOL6kWkHTvRQ@mail.gmail.com>
In-Reply-To: 
 <CAPS-YPAzCpUkB3SP-CQ+-c9HLgxvrr7Juv3Y1ZDOL6kWkHTvRQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jan 2022 18:34:07 -0800
Message-ID: 
 <CAMKF1soQc2Ape=LZy5i+dKCnfFCvC8YUxN3TfCnSTtueM9h5TQ@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 1/2] meta-oe/recipes-devtools: Add
 python3-apt bindings
To: =?UTF-8?Q?Anibal_Lim=C3=B3n?= <limon.anibal@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal@rzerosystems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 02:34:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95139

On Thu, Jan 27, 2022 at 6:29 PM Anibal Lim=C3=B3n <limon.anibal@gmail.com> =
wrote:
>
>
>
> On Thu, Jan 27, 2022 at 8:27 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Thu, Jan 27, 2022 at 5:35 PM An?bal Lim?n <limon.anibal@gmail.com> wr=
ote:
>> >
>> > Signed-off-by: An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com>
>> > Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal@rzerosystems.com>
>> > ---
>> >  .../python/python3-apt_2.3.0.bb                 | 17 ++++++++++++++++=
+
>> >  1 file changed, 17 insertions(+)
>> >  create mode 100644 meta-oe/recipes-devtools/python/python3-apt_2.3.0.=
bb
>> >
>> > diff --git a/meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb b/me=
ta-oe/recipes-devtools/python/python3-apt_2.3.0.bb
>> > new file mode 100644
>> > index 000000000..4e7138b33
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb
>> > @@ -0,0 +1,17 @@
>> > +SUMMARY =3D "Python-apt is a wrapper to use features of apt from pyth=
on."
>> > +LICENSE =3D "GPLv2 & Permissive"
>>
>> Permissive is not a standard SPDX license. So please explain it better.
>
>
> Yep, this is a topic, comes from debian/copyright file in the repo, next,
>
> https://salsa.debian.org/apt-team/python-apt/-/blob/main/debian/copyright=
#L10
>
> Any idea how to handle this?.

I think this is
https://spdx.org/licenses/FSFAP.html

>
> Regards,
> Anibal
>
>>
>>
>> > +LIC_FILES_CHKSUM =3D "file://COPYING.GPL;md5=3D0636e73ff0215e8d672dc4=
c32c317bb3 \
>> > +                    file://debian/copyright;md5=3D4ed7b6862ca422678b1=
7e7d4ed592285"
>> > +
>> > +SRC_URI =3D "git://salsa.debian.org/apt-team/python-apt.git;protocol=
=3Dhttps;branch=3Dmain"
>> > +
>> > +SRCREV =3D "6145b6484d220685edfd922d364afbf065127efe"
>> > +
>> > +S =3D "${WORKDIR}/git"
>> > +
>> > +inherit setuptools3
>> > +
>> > +DEPENDS +=3D "apt"
>> > +RDEPENDS:${PN} +=3D "apt python3-core"
>> > +
>> > +FILES:${PN} =3D "/usr/lib /usr/share/python-apt"
>> > --
>> > 2.34.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#95133): https://lists.openembedded.org/g/openembed=
ded-devel/message/95133
>> > Mute This Topic: https://lists.openembedded.org/mt/88736517/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

