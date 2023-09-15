Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA3FEEE6454
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 10:15:12 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.17350.1694772904188365733
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Sep 2023 03:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20230601.gappssmtp.com header.s=20230601 header.b=HFvbQUdk;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.167.53, mailfrom: jester@theyoctojester.info)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50098cc8967so3163359e87.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 03:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20230601.gappssmtp.com; s=20230601; t=1694772902; x=1695377702; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4SRbiI8815qE7mYHeyTG3ykD22bj+R2B+nLmN6v1aX0=;
        b=HFvbQUdkGQpFDqqTRYMt4G28+FPVlrmgYOwVWl1r0MdB0YIOdque06DwYXA9EU6IVL
         GP6u9k8kitBEbMs+KOcUxIcF3wRm7C4fEzPTz7Z2Dfjkw5B4rZJDxUdxJpmWOw1fJSc/
         BlMmkYhASByQVgZcOixEZbdTz5c6w0xfOCMwBN6EbkY0J1N8Bh3eFBratiuCygmjiPpm
         wB4F8ehLxdg4PNQc2VUnZ5dK5qsOaWf97m5sa57JNv7n25CkOu0FlYrIeNVlJbmN+2vV
         JNaVEtM/YYJ+eUcoEbvHHq89dCfxQoIbuIoL3SPoyxzf590dbpJ8NZ3Duz/gI/X7Rp4B
         zr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694772902; x=1695377702;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4SRbiI8815qE7mYHeyTG3ykD22bj+R2B+nLmN6v1aX0=;
        b=GffQpzGT8P5PQR8kL1afg42YiOJrl63jDng1tG6ZmxZLuNw9WNAUCKr1177T669+qL
         B9cD8huEHpTH2WGuWwfmrOk0dI6OwuoAYfyhsNjKp1VL9Xhouoncet/97jfN5BxOX6vX
         lX6iI4VnRpv9X76IGgduCOw7GXrbisaX3n6aXxyERefjO3FTYg8o8zLQrstqZI4X3l9D
         shRv+vKJPufVOoFOZ/JOffQGfEWJUrx/Qcb9WfUGFYGoVrfimpJhuVqK1SdNv4I2paHm
         sIzTo/3SOI7Wk50QON+yA9jvgvfCpfTKAaP4YokCzq728mUxLTW2fVq44API71axbopi
         7lZg==
X-Gm-Message-State: AOJu0YwOQ9NQ1VdaY052Dinaz8FEUraedr8qIfX8uC0yVz5dulWWxl8u
	R5dz/SPCSgcK4os+BDOjjRyCFYgiCpk2DlYTXy6hhPkBAYzj4fN7SeoqkQ==
X-Google-Smtp-Source: AGHT+IE9T7FVi5WeWN5ILD6xb8ExDB1jb2d5J1cUBpR8pRReo+dlusHn54YUaGz2IR41PoQiaj1bprP+lNnDHn2vDzQ=
X-Received: by 2002:a19:7119:0:b0:500:cb2b:866f with SMTP id
 m25-20020a197119000000b00500cb2b866fmr910715lfc.30.1694772901703; Fri, 15 Sep
 2023 03:15:01 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Fri, 15 Sep 2023 12:14:35 +0200
Message-ID: <CAEt6NwrfbV1M9DJt+nXu4hu3xgiKGgnnNGexzht2q-9z4TBQ_A@mail.gmail.com>
Subject: OEDvM 2023.12
To: openembedded-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-members@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000c80993060563107c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 10:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104892

--000000000000c80993060563107c
Content-Type: text/plain; charset="UTF-8"

Howdy!

We are happy to announce this years OEDvM taking place on Friday December
1st, 2023.

Bring your topics and challenges for discussion, or just join for the
networking.

As usual, the main organization will happen through the OpenEmbedded Wiki,
with the event page being located at
https://www.openembedded.org/wiki/OEDvM_2023.12
<https://www.openembedded.org/wiki/OEDvM_2023.12>

The meeting is open to everybody, and explicitly inviting non-members to
join the conversation, and possibly the organization.

If you have any questions, feel free to reach out!

Greetz,
Josef, on behalf of the OpenEmbedded board

--000000000000c80993060563107c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Howdy!<div><br></div><div><span style=3D"color:rgba(0,0,0,=
0.9);font-family:-apple-system,system-ui,&quot;system-ui&quot;,&quot;Segoe =
UI&quot;,Roboto,&quot;Helvetica Neue&quot;,&quot;Fira Sans&quot;,Ubuntu,Oxy=
gen,&quot;Oxygen Sans&quot;,Cantarell,&quot;Droid Sans&quot;,&quot;Apple Co=
lor Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot=
;Segoe UI Symbol&quot;,&quot;Lucida Grande&quot;,Helvetica,Arial,sans-serif=
;font-size:14px">We are happy to announce this years OEDvM taking place on =
Friday December 1st, 2023.</span><br style=3D"box-sizing:inherit;color:rgba=
(0,0,0,0.9);font-family:-apple-system,system-ui,&quot;system-ui&quot;,&quot=
;Segoe UI&quot;,Roboto,&quot;Helvetica Neue&quot;,&quot;Fira Sans&quot;,Ubu=
ntu,Oxygen,&quot;Oxygen Sans&quot;,Cantarell,&quot;Droid Sans&quot;,&quot;A=
pple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Emoji&quot=
;,&quot;Segoe UI Symbol&quot;,&quot;Lucida Grande&quot;,Helvetica,Arial,san=
s-serif;font-size:14px;line-height:inherit"><br style=3D"box-sizing:inherit=
;color:rgba(0,0,0,0.9);font-family:-apple-system,system-ui,&quot;system-ui&=
quot;,&quot;Segoe UI&quot;,Roboto,&quot;Helvetica Neue&quot;,&quot;Fira San=
s&quot;,Ubuntu,Oxygen,&quot;Oxygen Sans&quot;,Cantarell,&quot;Droid Sans&qu=
ot;,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI=
 Emoji&quot;,&quot;Segoe UI Symbol&quot;,&quot;Lucida Grande&quot;,Helvetic=
a,Arial,sans-serif;font-size:14px;line-height:inherit"><span style=3D"color=
:rgba(0,0,0,0.9);font-family:-apple-system,system-ui,&quot;system-ui&quot;,=
&quot;Segoe UI&quot;,Roboto,&quot;Helvetica Neue&quot;,&quot;Fira Sans&quot=
;,Ubuntu,Oxygen,&quot;Oxygen Sans&quot;,Cantarell,&quot;Droid Sans&quot;,&q=
uot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Emoji=
&quot;,&quot;Segoe UI Symbol&quot;,&quot;Lucida Grande&quot;,Helvetica,Aria=
l,sans-serif;font-size:14px">Bring your topics and challenges for discussio=
n, or just join for the networking.</span><br></div><div><span style=3D"col=
or:rgba(0,0,0,0.9);font-family:-apple-system,system-ui,&quot;system-ui&quot=
;,&quot;Segoe UI&quot;,Roboto,&quot;Helvetica Neue&quot;,&quot;Fira Sans&qu=
ot;,Ubuntu,Oxygen,&quot;Oxygen Sans&quot;,Cantarell,&quot;Droid Sans&quot;,=
&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Emo=
ji&quot;,&quot;Segoe UI Symbol&quot;,&quot;Lucida Grande&quot;,Helvetica,Ar=
ial,sans-serif;font-size:14px"><br></span></div><div><span style=3D"color:r=
gba(0,0,0,0.9);font-family:-apple-system,system-ui,&quot;system-ui&quot;,&q=
uot;Segoe UI&quot;,Roboto,&quot;Helvetica Neue&quot;,&quot;Fira Sans&quot;,=
Ubuntu,Oxygen,&quot;Oxygen Sans&quot;,Cantarell,&quot;Droid Sans&quot;,&quo=
t;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Emoji&q=
uot;,&quot;Segoe UI Symbol&quot;,&quot;Lucida Grande&quot;,Helvetica,Arial,=
sans-serif;font-size:14px">As usual, the main organization will happen thro=
ugh the OpenEmbedded Wiki, with the event page being located at=C2=A0</span=
><a href=3D"https://www.openembedded.org/wiki/OEDvM_2023.12">https://www.op=
enembedded.org/wiki/OEDvM_2023.12<span style=3D"color:rgba(0,0,0,0.9);font-=
family:-apple-system,system-ui,&quot;system-ui&quot;,&quot;Segoe UI&quot;,R=
oboto,&quot;Helvetica Neue&quot;,&quot;Fira Sans&quot;,Ubuntu,Oxygen,&quot;=
Oxygen Sans&quot;,Cantarell,&quot;Droid Sans&quot;,&quot;Apple Color Emoji&=
quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI =
Symbol&quot;,&quot;Lucida Grande&quot;,Helvetica,Arial,sans-serif;font-size=
:14px">=C2=A0</span></a></div><div><br></div><div>The meeting is open to ev=
erybody, and explicitly inviting non-members to join the conversation, and =
possibly the organization.</div><div><br></div><div>If you have any questio=
ns, feel free to reach out!</div><div><br></div><div>Greetz,</div><div>Jose=
f, on behalf of the OpenEmbedded board</div></div>

--000000000000c80993060563107c--

