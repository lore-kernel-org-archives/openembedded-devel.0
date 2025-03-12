Return-Path: <awais.belal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D4CC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 18:52:06 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.3182.1741805518488173742
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 11:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=far8wL56;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: awais.belal@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2c2ada8264aso92762fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 11:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741805518; x=1742410318; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+iqPzX9liNXlwvKZiDTimMZ3PrGxHatp99VScXech4c=;
        b=far8wL564AHl8F28G/oGOHmyxxgf8gx5A+YA83dq/DvUx01A/vEiXLf3f+MJpKVJTQ
         nqZXrZmQ1iWB9Epthg/fBWmMs2raOAWrAYNWn84DXJrqGZaQPKoGfrvPAZh/bD91i5gb
         3NSkoxZz3ssWeFdLfuP0K+91n6awnAHbFN1OIZ8Euw+qTqS7zgCp6siETBr/i32ZnkUV
         0pk5QowkPVhus+INVxvQh30aOzFE8xmm5Ef+VFQF0KZb70/OLG224i4AvG2bpxVjNwoi
         skOCRWLM7D1opiX/2rL47h5kD5OnQZSDt3+vttQoEfu5wHhBsa5nt9IX+kxfbqoft7n1
         rUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741805518; x=1742410318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iqPzX9liNXlwvKZiDTimMZ3PrGxHatp99VScXech4c=;
        b=LmtdeUhJ5AJ01wAEhcCHv46H4eCNYtapcRy0d28TH1C9f/AzYma2FuikBYVm+SkYHE
         EQxdBBIfWHopYgug4AKMejtpZRW2OvFmt0Tnjif4Y8uj0yoxdHIZNnmBHtc3P+pZnkRL
         vVd2rGcw+pOVZsz//P4cC7WjwEwR9vZKNtkEMKepKYn60XZxQdwbDMokU7vOFDWYsl2v
         v/B9WOgRKuFbZH8QEEHjKG57t3VbWmKsUIxEVk4FLPwi/HCkX6QV4GQuXQ01plbmINK7
         FGCO1L8YFXOFQ8/oXDiMPK2K46/S+iVM8kRoaihU15MscQCb0uanVZT9YsmFnezhOmsJ
         BXRg==
X-Gm-Message-State: AOJu0Yx0zQEa4yBBHziMRHi1UEOj8O6RrVwJb/EzbBZBxdLJ1X2A/nhI
	AseAK9tonGEjFeaKlmpeoGkW16xXWlcNajCBEcB1UG9VD2u7jGMPNhJU252/h6FxW5lOUoHf15Z
	ocUAChbEw04Z7AkrZpXQPL6u+50Y=
X-Gm-Gg: ASbGncvLGKah2rFzx5sZi6RmU2sgnVHt7VJ+kK5EmIxCyUUHprh61z4xkcpBLyKtREv
	BNq4Sxht0YdQ8o5yxZIs/8Hr13Rl8udTnI5k7ySISRs3DHJIJrr7vqOeFFxlfILXekp5dceo4u0
	2IAPH8DsNX/h1fyovIRotLnGvXP0s=
X-Google-Smtp-Source: AGHT+IFES9w9+teh8HsmIktBarpNzVYAif/JWZTccm+k0ddT3mMnPkWSlGnfM6uwZ3zeMXkiaO2KewJUQJkFP9A4hh8=
X-Received: by 2002:a05:6870:ef03:b0:29e:62e5:9b55 with SMTP id
 586e51a60fabf-2c2610da07amr11729103fac.20.1741805517622; Wed, 12 Mar 2025
 11:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250307093255.1110778-1-awais.belal@gmail.com>
 <20250307093255.1110778-2-awais.belal@gmail.com> <CAMKF1spsyTBdgD_we=X2Q9vpGFhBi-0E59ArdGyKr3KB-8g3Gg@mail.gmail.com>
 <CAM=5Amb6u5-8pmud11do97X4UAwLToizR9SiGjPD=4+Zqet6Rw@mail.gmail.com> <CAMKF1sroz=jLxp9PfMkZoQwtRjyvDZhK15kGLS32q5vu7dxcHA@mail.gmail.com>
In-Reply-To: <CAMKF1sroz=jLxp9PfMkZoQwtRjyvDZhK15kGLS32q5vu7dxcHA@mail.gmail.com>
From: Awais Belal <awais.belal@gmail.com>
Date: Wed, 12 Mar 2025 23:51:45 +0500
X-Gm-Features: AQ5f1JougYiXWV4Zg-SzmY5hN1C3hQVDhilo6WmLK36GohAHj_CgkgBCaKFFeyA
Message-ID: <CAM=5AmYtt81oiNVQqYMbu--Z0vTfGpQ5eHUpdJeV2KqoUdT4Ww@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 2/2] mongodb: update to 4.4.29
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000255796063029b326"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 18:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115940

--000000000000255796063029b326
Content-Type: text/plain; charset="UTF-8"

>
>
>>>
>>  The changeset was intended for scarthgap and I haven't made sure if
>> master builds. Is that a requirement? The cgi module was dropped in python
>> 3.13 which is what master is following at this point. I might send a
>> separate series for master once I move on to that.
>>
>
> Patches are routed by master to release branches if they are needed in
> master. They are done for master and then backported
>
>>
Hi Khem,
I've just sent
https://patchwork.yoctoproject.org/project/oe/list/?series=32428 which
coupled with the changes here fixes mongodb build for master as well.
Kindly note that the other series (
https://patchwork.yoctoproject.org/project/oe/list/?series=32428) is not
needed for scarthgap.

-- 
Regards,
Awais Belal

--000000000000255796063029b326
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br></bl=
ockquote><div><br>=C2=A0The changeset was intended for scarthgap and I have=
n&#39;t made sure if master builds. Is that a requirement? The cgi module w=
as dropped in python 3.13 which is what master is following at this point. =
I might send a separate series for master once I move on to that.</div></di=
v></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Patches =
are routed by master to release branches if they are needed in master. They=
 are done for master and then backported=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div=
 dir=3D"auto"></div></div></div>
</blockquote></div></div>
</blockquote></div><div><br clear=3D"all"></div><div>Hi Khem,</div><div>I&#=
39;ve just sent=C2=A0<a href=3D"https://patchwork.yoctoproject.org/project/=
oe/list/?series=3D32428">https://patchwork.yoctoproject.org/project/oe/list=
/?series=3D32428</a> which coupled with the changes here fixes mongodb buil=
d for master as well. Kindly note that the other series (<a href=3D"https:/=
/patchwork.yoctoproject.org/project/oe/list/?series=3D32428">https://patchw=
ork.yoctoproject.org/project/oe/list/?series=3D32428</a>) is not needed for=
 scarthgap.</div><div><br></div><span class=3D"gmail_signature_prefix">-- <=
/span><br><div dir=3D"ltr" class=3D"gmail_signature">Regards,<br>Awais Bela=
l</div></div>

--000000000000255796063029b326--

