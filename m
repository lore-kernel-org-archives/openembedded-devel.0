Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175C3C19F2B
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 07:01:32 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web09.5306.1659078076471806534
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 00:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=U4wdoITK;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171,
 mailfrom: crg7475@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4LvJMX09W4z9sWr
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 09:01:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1659078072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OY/Ysj04Ws9XPS+zKxLQcW2gS2BJQEBuf7DstXaggvA=;
	b=U4wdoITKaQGmKEAozU1Wyq+fN4gYKoYNNCoIYiWKD+7Jm8QrEpB9f8MGKCUHgnFkL82Gb9
	N3vRGg0fcxys7ft+gZGQZsKGplfeVEW/GpHb0jAAuO6TRm95bL/cz6It3EfGfx0F8x1vuI
	qLS9QiQDdxVE8W+YRYBr6L7XEUx1qiUQTFBgjx+9CokwClcHgzwycKPV6cHghneV1Wj1UP
	2ThEwjFAtHow/Fz5KyE6DcF3hLL+cc57hmqxLVAAl3aonOWJAjzEYyMWeBe7jSSMdW2KwX
	MuAeAakWgD051wOAK0a8CnHSRH99mqKA/8MxNAfYNhpbwv2ZOGg/84LnLJWX/g==
Content-Type: multipart/alternative;
 boundary="------------hQKknqi7STZXNjDtZj5ARO1O"
Message-ID: <6fd39c93-544b-817b-a9d1-667aaba9f70a@mailbox.org>
Date: Fri, 29 Jul 2022 09:01:10 +0200
MIME-Version: 1.0
Subject: Re: [oe] [oe-core][RFC PATCH 1/2] pipewire: fix build
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20220520125313.4115361-1-f_l_k@t-online.de>
 <56b79fce-6f91-8b1a-8d6a-49c176b136@spiteful.org>
 <ae4e1ba5-3951-d552-4648-6930983f8b0b@t-online.de>
From: Carlos Rafael Giani <crg7475@mailbox.org>
In-Reply-To: <ae4e1ba5-3951-d552-4648-6930983f8b0b@t-online.de>
X-MBO-RS-ID: 37d493c894b23ca81af
X-MBO-RS-META: y8nwbakj3ze5cpfuaiay4tpnz38q6156
X-Rspamd-Queue-Id: 4LvJMX09W4z9sWr
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 07:01:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98038

This is a multi-part message in MIME format.
--------------hQKknqi7STZXNjDtZj5ARO1O
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

It is my impression that libsdl2 is built natively for QEMU, and for=20
nothing else, which means that having pipewire-nativesdk would not be=20
necessary..?


On 21.05.22 10:03, Markus Volk wrote:
> I didn't have a specific use case. I was just trying to build libsdl2=20
> identical for target and native. And since libsdl2 can be built for=20
> nativesdk, the consequence would be that pipewire-nativesdk is needed=20
> to be built as well.
>
> Am 21.05.22 um 08:58 schrieb Scott Murray:
>> On Fri, 20 May 2022, Markus Volk wrote:
>>
>>> -after updating to poky master i get issues picking the right udev=20
>>> provider
>>> -add a backport patch to fix libsdl2 build with pipewire enabled
>>> -allow native/nativesdk build
>> [snip]
>>
>> I'm curious what your usecase is for native/nativesdk?=C2=A0 There's n=
o
>> preprocessor or similiar tools in pipewire that I'm aware of.
>>
>> Scott
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97217):https://lists.openembedded.org/g/openembedde=
d-devel/message/97217
> Mute This Topic:https://lists.openembedded.org/mt/91230094/3617253
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  =
[crg7475@mailbox.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------hQKknqi7STZXNjDtZj5ARO1O
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><font face=3D"Helvetica, Arial, sans-serif">It is my impression
        that libsdl2 is built natively for QEMU, and for nothing else,
        which means that having pipewire-nativesdk would not be
        necessary..?</font></p>
    <p><font face=3D"Helvetica, Arial, sans-serif"></font><br>
    </p>
    <div class=3D"moz-cite-prefix">On 21.05.22 10:03, Markus Volk wrote:<=
br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:ae4e1ba5-3951-d552-4648-6930983f8b0b@t-online.de">I
      didn't have a specific use case. I was just trying to build
      libsdl2 identical for target and native. And since libsdl2 can be
      built for nativesdk, the consequence would be that
      pipewire-nativesdk is needed to be built as well.
      <br>
      <br>
      Am 21.05.22 um 08:58 schrieb Scott Murray:
      <br>
      <blockquote type=3D"cite">On Fri, 20 May 2022, Markus Volk wrote:
        <br>
        <br>
        <blockquote type=3D"cite">-after updating to poky master i get
          issues picking the right udev provider
          <br>
          -add a backport patch to fix libsdl2 build with pipewire
          enabled
          <br>
          -allow native/nativesdk build
          <br>
        </blockquote>
        [snip]
        <br>
        <br>
        I'm curious what your usecase is for native/nativesdk?=C2=A0 Ther=
e's
        no
        <br>
        preprocessor or similiar tools in pipewire that I'm aware of.
        <br>
        <br>
        Scott
        <br>
        <br>
      </blockquote>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#97217): <a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://lists.openembedded.org/g/openembedded-devel/message/97217">https://=
lists.openembedded.org/g/openembedded-devel/message/97217</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/91230094/3617253">https://lists.openembedded.org/mt/=
91230094/3617253</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:crg7475@mailbox.org">crg7475@mailbox.org</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------hQKknqi7STZXNjDtZj5ARO1O--

