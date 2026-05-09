Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9964BCD3447
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 11:03:54 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10001.1778324633105860404
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 May 2026 04:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pcXDqaNj;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-479d593a0c3so2404090b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 May 2026 04:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778324632; cv=none;
        d=google.com; s=arc-20240605;
        b=FFSpgkREVWAVQ+7WDkF95FbCu9uAgXCfeuQfYwpPVxhOPJDHDvzX3qnsM0O8MQGc4V
         XW/UffD5wq0JyjveDBBvnluhJCdwElCcqRJYb8UqxNmY0x0JhOOoK1a6ebtxRDzltLLV
         pZxdr1LiKpu74TfD/drhN51Gm85/LqJ/WmTZ8/ZW0dpW9Y37CYGHP9UbN2w+qac8K/Mu
         Tdem2QMv8+D0KfdPCKhDtNajmK94MJI/Ih0/Aaa+nI181rhF9bzsc8OzATLINUhzO17r
         5Cy6duq3MO2rEdt6KRznENLPalZ29kPTbbCWESKka4oph8zWR3YwfQW3ZqD1eEu341Q3
         RvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zpGBZ313uZiHAfL6V9xkOWxEAIzQEptYnRopDrTvwGM=;
        fh=o0ygKz6TeiCEPQnL2WulPilytOEk9knOlyCoSlrw7so=;
        b=l26bJs7cEb3OdGNR+vFjL9IAiqr8fe7LSMB6ChGQPxsOcRR7x8J18DB5AWfHRpQ00T
         914LyPkNMKqADTktQdFASUMYZ8OvIpROAHEe5GmGzQmqlCWHHKu/R6qqyh6mJ3RXqqo0
         KAFfVNxbHU7i3LIBfqioma7W+jQ2HrDBmtIxwYA/12YYPu0dRO4LdiEx4dsn6Zkkm8cl
         ojgLryxVivs74rFL+eNKLYpa4iGllk2kL7ouA+IW6wAdPcmJRh1V1DLGMwLfJGj6H4JS
         1rQLUIRVZLXVBmioE4Db4haTAmQKMoK0kG+AF/mTlv9rui1IO23L5uufTUi8nyGeGvaU
         bpHA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778324632; x=1778929432; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpGBZ313uZiHAfL6V9xkOWxEAIzQEptYnRopDrTvwGM=;
        b=pcXDqaNjeeOzHFEH7XMOcSU2Cwz73NUWQGOD3lUfRtqFim/tgytKCDNZpnMIjWR3zJ
         pTkJMqtjAvQssV6AHcP75rJ0Z/qKPsWqJOsfCL2CAq2HvdxMFtg+UI79USVQXJPKhQOW
         T6KYRVPfvb7naJnjX17gSCpFjbf/4r/ogBQgqZ0Ul5+xXhLCPlcWorVeVGuvjEpUZ9tb
         xfWMJy2HZen9aQCkXO0vrlHUXQIuHpszwN2Oou/oCiCm0g/V1qRQgoht3ixk2mv5Og+g
         AGJApCf1GVnjULjKmC6dE+Sz7ehTfEuIisRcJfdGERRlvQUo9nQ5QB6rJfrzt+o34vwT
         x/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778324632; x=1778929432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zpGBZ313uZiHAfL6V9xkOWxEAIzQEptYnRopDrTvwGM=;
        b=NIassZ6EV3Z5sSU4F6muhGVvt8ontqw7z2bGzhcPAxJT9xVJSxzN2dpfPihWer5snc
         lDjfNeZ/cvBCAYBONN6R3KILfffbC2GjyU1gjZzm70Q+St2SNB28NjyLh5szj7XCUzJD
         FKzbpqGjfKPs1eR5NTM7dxPkA137hNQJJjUfwX6sZoZq1zND/4i79lxTSMdncnkw2FeG
         8GBDpWzA2ahvJHIybhZ0DhfMeWj0aAa9jgQVVSXaud1et9u5MPJ/3Zb/vbNulxxdBEP1
         lElGVu25VuQMCHWEws7M4rD63nhQ4wg+V6BUclQPIStW7hZc1ZhvlvRK5RM30W28/2UF
         uIgA==
X-Forwarded-Encrypted: i=1; AFNElJ9QD/+ecFbZBXVcCIthWAwLedzX6GsKpFQEF+264PlD2e7oHaxvBXvEvKsKSA/rbB67Gnd+nodc+mXBYBx3Tlf1rUM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxdIgHQRlbfWI4vj10L5i5c+Ht+4wh7u6tjAHg6jEvCcf8O0PrB
	O1uDUay23x/b4LGhThm+z+r/5XJM3SGZvWinJe7agoXBLjvjvzFireUZcoMbyKBYNgRmLaESWFr
	KMRizUMBOhX3m0N+SCRvrV2WWhpJxLyI=
X-Gm-Gg: AeBDieutqf26rxQERUGWoTO0G/JuE70oZ5UAnp0hRSkTFZfhJ2CN0xV1aB5l2l82Abv
	mP4nodODHEcHBCTa14pvciOQvYQm/glSiTZL1uxoXuIyPWl/EHL3wFLVhP8/2aNLlvomQuTfmfk
	nNd3CqzWC0Tt0JAojBmn0W/ydFHM330J0Tm73mjvZjRFPqr0ir171Po1WpycR3hwuj9BScGf5Ur
	ZMHcrnwZw8brcgnpsb0Csfw6rr7XN5YjLpIZMCY/hlh+IxuFC6QXGYP8o2/G+8XRWiejlM6ZxKG
	tZymQqA3umW4tPwE6sjl
X-Received: by 2002:a05:6808:4fcd:b0:479:40d4:b140 with SMTP id
 5614622812f47-48061c7b1c2mr5556507b6e.21.1778324632242; Sat, 09 May 2026
 04:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260502075925.1861299-1-ankur.tyagi85@gmail.com>
 <c7d17e42-e8bd-4152-a0c2-91b38cb52399@gmail.com> <CADySD0EpRMD709L5uFQf+72ULcokCHWOcJoMtjL4k7Z8BjNjKQ@mail.gmail.com>
 <CAMKF1sq7TTiX-+SgOxtTxCMYt1tLEySeds2Tn08W_zzqcgPaYg@mail.gmail.com>
In-Reply-To: <CAMKF1sq7TTiX-+SgOxtTxCMYt1tLEySeds2Tn08W_zzqcgPaYg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 9 May 2026 23:03:41 +1200
X-Gm-Features: AVHnY4IumqJdv8p2nMdQ5DTyvIo0p3nw-wOlrh-adKZsrmMYMf10OSeN-putVJc
Message-ID: <CADySD0H02TzX9FnBakOwZ6YBG7dQwND=tN6DuUN5iXJJig0_LQ@mail.gmail.com>
Subject: Re: [oe][meta-webserver][PATCH 1/1] nginx: upgrade 1.29.7 -> 1.30.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 09 May 2026 11:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126830

On Fri, May 8, 2026 at 5:37=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Sun, May 3, 2026 at 2:55=E2=80=AFAM Ankur Tyagi via lists.openembedded=
.org <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> On Sat, May 2, 2026 at 8:17=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail=
.com> wrote:
>> >
>> > On 5/2/26 09:59, Ankur Tyagi via lists.openembedded.org wrote:
>> > > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> > >
>> > > 1.30.0 stable version has been released, incorporating new features =
and bug
>> > > fixes from the 1.29.x mainline branch (https://nginx.org/en/CHANGES-=
1.30)
>> > >
>> > > Set v1.30.0 branch as default preference.
>> > >
>> > > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>> > > ---
>> > >  meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb |  5 +++++
>> > >  meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb | 10 ----------
>> > >  meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb |  6 ++++++
>> >
>> >
>> >
>> > I think rather the 1.28 recipe should be deleted with this patch. Odd
>> > versions are mainline/bleeding edge releases, and even versions are
>> > stable ones. AFAIK 1.28 isn't supported anymore with the release of
>> > 1.30. (I'd expect that there will be a 1.31 release in a week or two, =
as
>> > a continuation of the 1.29 series)
>>
>> Since 1.28 was the last stable branch, I suspect the majority of the
>> users will be using it.
>> Until 1.31 is released, I wanted to keep both stable versions to allow
>> time for the transition.
>>
>> Once we add 1.31 support, then IMO it will be appropriate to drop
>> 1.28. Thoughts ?
>
>
> lets just have 1.30 and remove all others. If need be when 1.31 is releas=
ed
> someone needing it should send the patch.
>

I am ok with this approach, sending v2 now.

>>
>> >
>> >
>> >
>> > >  3 files changed, 11 insertions(+), 10 deletions(-)
>> > >  delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.29.7.=
bb
>> > >  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.30.0.=
bb
>> > >
>> > > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/me=
ta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
>> > > index 9872a6de3b..f2b10a5c69 100644
>> > > --- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
>> > > +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
>> > > @@ -5,3 +5,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3dc49537b=
08b14c8b66ad247bb4c4593"
>> > >  SRC_URI[sha256sum] =3D "2c96a946bfb0882a21744ed429770a2123ae1828c7c=
48665092993ddee91a918"
>> > >
>> > >  CVE_STATUS[CVE-2025-53859] =3D "cpe-stable-backport: Fix is include=
d in 1.28.1"
>> > > +
>> > > +# Set DEFAULT_PREFERENCE so that the 1.30.x stable version is built=
 by
>> > > +# default. To build the 1.28.x branch,
>> > > +# PREFERRED_VERSION_nginx =3D "1.28.%" can be added to local.conf
>> > > +DEFAULT_PREFERENCE =3D "-1"
>> > > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/me=
ta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
>> > > deleted file mode 100644
>> > > index 4d884fcbb3..0000000000
>> > > --- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
>> > > +++ /dev/null
>> > > @@ -1,10 +0,0 @@
>> > > -require nginx.inc
>> > > -
>> > > -# 1.28.x branch is the current stable branch, the recommended defau=
lt
>> > > -# 1.29.x is the current mainline branches containing all new featur=
es
>> > > -DEFAULT_PREFERENCE =3D "-1"
>> > > -
>> > > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D79da1c70d587d3a199af9255=
ad393f99"
>> > > -
>> > > -SRC_URI[sha256sum] =3D "673f8fb8c0961c44fbd9410d6161831453609b44063=
d3f2948253fc2b5692139"
>> > > -
>> > > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb b/me=
ta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
>> > > new file mode 100644
>> > > index 0000000000..139fe24dcd
>> > > --- /dev/null
>> > > +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
>> > > @@ -0,0 +1,6 @@
>> > > +require nginx.inc
>> > > +
>> > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D79da1c70d587d3a199af9255=
ad393f99"
>> > > +
>> > > +SRC_URI[sha256sum] =3D "058188c64bf22baecaa72b809a6318a4f9ba623889c=
554feab03f7cb853ab31b"
>> > > +
>> > >
>> > >
>> > >
>> > >
>> > >
>> >
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#126767): https://lists.openembedded.org/g/openembedd=
ed-devel/message/126767
>> Mute This Topic: https://lists.openembedded.org/mt/119112437/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

