Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6427CEE021D
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 04:57:49 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.14331.1694753860356747745
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Sep 2023 21:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout06.t-online.de (Postfix) with SMTP id AAAAF11513;
	Fri, 15 Sep 2023 06:57:38 +0200 (CEST)
Received: from [192.168.178.62] ([79.219.231.62]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qh0tb-32INMW0; Fri, 15 Sep 2023 06:57:35 +0200
Date: Fri, 15 Sep 2023 06:57:40 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH] libdca: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <4GG01S.WYK7K8R9MZ9J2@t-online.de>
In-Reply-To: <CAMKF1spKNX7YOrEbApJLi2KxD0hCKRJrMwAo3LYTer4G5ouh6A@mail.gmail.com>
References: <20230914154206.2143189-1-f_l_k@t-online.de>
	<CAMKF1srwzjtOq1vxfhMcEsb1YQmFbMbRidfcYT=tW6CRYck6hg@mail.gmail.com>
	<4RHZ0S.429LO849YY5W1@t-online.de>
	<CAMKF1spKNX7YOrEbApJLi2KxD0hCKRJrMwAo3LYTer4G5ouh6A@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-M9TJkGqFLBC+q/tte7ov"
X-TOI-EXPURGATEID: 150726::1694753855-99E88904-F8F22C21/0/0 CLEAN NORMAL
X-TOI-MSGID: a251978c-dbb3-49c6-bf80-b30188e3bc54
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Sep 2023 04:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104883

--=-M9TJkGqFLBC+q/tte7ov
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

After further testing I found out that gstreamer can also support dts=20
if you use the gstreamer-libav plugin, since ffmpeg has dcadec code=20
built in. Less lightweight than building the gstreamer-plugin-dts with=20
libdca, but more feature complete. So in the meantime there is no real=20
reason to use libdca anymore. I'll send an updated patch if you still=20
want to add it, but probably this recipe can just be left out.

On Thu, Sep 14 2023 at 09:56:53 AM -07:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
> On Thu, Sep 14, 2023 at 9:28=E2=80=AFAM Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  On Thu, Sep 14 2023 at 09:14:26 AM -07:00:00, Khem Raj=20
>> <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> wrote:
>>=20
>>  if we change it into $(LN_S)f libdca.a=20
>> "$(DESTDIR)$(libdir)/libdts.a" Then it becomes relative and can be=20
>> submitted upstream as well.
>>=20
>>=20
>>  This change has already been requested some years ago:
>>  <https://code.videolan.org/videolan/libdca/-/issues/3>
>>=20
>>  Anyway, the static lib isn't built by default so this would add a=20
>> broken symlink to the package I guess ?
>=20
> That would be a separate problem and the target creating this symlink
> should depend on static lib generation target.
> but as such, It would be good to use the upstream proposed revert.


--=-M9TJkGqFLBC+q/tte7ov
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">After further testing I found out that =
gstreamer can also support dts if you use the gstreamer-libav plugin, since=
 ffmpeg has dcadec code built in. Less lightweight than building the gstrea=
mer-plugin-dts with libdca, but more feature complete. So in the meantime t=
here is no real reason to use libdca anymore. I'll send an updated patch if=
 you still want to add it, but probably this recipe can just be left out.</=
div><div id=3D"geary-quote" dir=3D"auto"><br>On Thu, Sep 14 2023 at 09:56:5=
3 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote t=
ype=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">=
On Thu, Sep 14, 2023 at 9:28=E2=80=AFAM Markus Volk &lt;<a href=3D"mailto:f=
_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 On Thu, Sep 14 2023 at 09:14:26 AM -07:00:00, Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:

 if we change it into $(LN_S)f libdca.a "$(DESTDIR)$(libdir)/libdts.a" Then=
 it becomes relative and can be submitted upstream as well.


 This change has already been requested some years ago:
 <a href=3D"https://code.videolan.org/videolan/libdca/-/issues/3">https://c=
ode.videolan.org/videolan/libdca/-/issues/3</a>

 Anyway, the static lib isn't built by default so this would add a broken s=
ymlink to the package I guess ?
</blockquote>
That would be a separate problem and the target creating this symlink
should depend on static lib generation target.
but as such, It would be good to use the upstream proposed revert.
</div></blockquote></div>
--=-M9TJkGqFLBC+q/tte7ov--


