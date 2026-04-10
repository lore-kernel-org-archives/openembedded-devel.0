Return-Path: <referme@gmx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B359EFB518A
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 11:12:51 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.153710.1775819564777318378
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 04:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=referme@gmx.de header.s=s31663417 header.b=qOdDQ/mf;
 spf=pass (domain: gmx.de, ip: 212.227.17.22, mailfrom: referme@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775819563; x=1776424363; i=referme@gmx.de;
	bh=6VUP/ONI5AZhOccYKC32UVMmyKzZg3gaykRiSkcBl5k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qOdDQ/mfNjvZlIQWyOYhiLlmjYJbyuzv6aSzARpLD619XPtU5gQISUQhVCxbzbOH
	 4JcFxG17g9lFJQVXTswQVgOuRTwlFQQfL+jTQzM0XrNrVab5qpan3EaY004zDi7Nf
	 SzHZ2+JDr5ZSFO5Ge2/OUU6qxgS1WBXiuX9ZUjxF+sTvzUaKkAkO2uhp/7Gk9fKfp
	 aO2a25aelykm9/z09SHsC4/HORt4yGFXAt4JDMhSpai7bNgpOaqeZ9A3tHZ55vRw+
	 NmzPvndq5FUqdCBy6vILCthf8xb0wGK8DQ0b+g/MwpkdTKAGC3UP+UbYvzyautxnl
	 jIRGqQaFUtlmYhEBNw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjS54-1vizlQ2nCE-00qDBC; Fri, 10
 Apr 2026 13:12:42 +0200
Message-ID: <b4b7351f-9a88-446e-bafd-21dd9560ec8e@gmx.de>
Date: Fri, 10 Apr 2026 13:12:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking] [PATCH] dovecot: Fix checksum mismatch
To: openembedded-devel@lists.openembedded.org,
 "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>, martin.jansa@gmail.com
References: <20260410102704.1621-1-wangmy@fujitsu.com>
 <CA+chaQe4OAcr=Wd18C9EYM+9-Y4NVr-Ef9S6saVL=s-UHzvYog@mail.gmail.com>
From: Martin Maurer <referme@gmx.de>
In-Reply-To: <CA+chaQe4OAcr=Wd18C9EYM+9-Y4NVr-Ef9S6saVL=s-UHzvYog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:C/ZA9UevyFRonr+YYlf/gptYc9yeBWw2SuPLbqoeTfFMZu8alFi
 +g35JruWjcDJkCjVPlKw4Y78J6rUxKoCYijOOnuki8dhIlVzxuXjUqARPN5A9wUkBeQZTzD
 WLg2X/E067SdTZ6w963r++VQfrhOOGdlGsRjARvwGT3av3Q63cuwIeCKaQiJju9/XwS5vhb
 0+erobueWS9i5Tt9/RIYQ==
UI-OutboundReport: notjunk:1;M01:P0:6M8oe1/ubdo=;HRPUX0lirxlStmxTL2TZSbHNv+U
 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
 n7cukTdZc4GbqMubgKBImX9FnF2jdhetsuWw=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 11:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126241

Hi,

I don't know what dovecat is at all, but I just found out, that two=20
version 2.4.3 seem to exist:


https://github.com/dovecot/core/releases/download/2.4.3/dovecot-2.4.3.tar.=
gz

sha256:e0b30330fe51e47ecfcf641bc16041184d91bdd0ac3db789b7cef54e3a75ac9b


https://dovecot.org/releases/2.4/dovecot-2.4.3.tar.gz

SHA256: ff0be85228122f250627b19e67505fdb7fb2f72a702ef6bf35f27fce54c072e5

When downloading both and comparing them:

The doc/man directory seem to be different.

When I had looked correctly, all others files seems to be identical.


Perhaps worth to ask the maintainer of dovecat, what is going on...


Best regards,

Martin


Am 10.04.2026 um 12:37 schrieb Martin Jansa via lists.openembedded.org:
> On Fri, Apr 10, 2026 at 12:27=E2=80=AFPM wangmy via lists.openembedded.o=
rg
> <wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>> From: Wang Mingyu <wangmy@fujitsu.com>
>>
>> Update the sha256sum to match the current upstream archive.
> Can you please check what changed in the archive and explain it in the
> commit message?
>
> You might also need to set downloadfilename in SRC_URI to avoid
> reusing old archive from PREMIRROR (and failing because the checksum
> won't match).
>
> In the end we should ask upstream not to re-create the existing
> releases if it was intentionally modified in the first place.
>
> Cheers,
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126240): https://lists.openembedded.org/g/openembedd=
ed-devel/message/126240
> Mute This Topic: https://lists.openembedded.org/mt/118757385/7924060
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
referme@gmx.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

