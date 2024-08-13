Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CA1C52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 08:49:31 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.67566.1723538966553529908
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Aug 2024 01:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=BuACnTTm;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=zuliQ8L0/UX92vmE3/uTRrMd3WIm3+lXKKAMH/EHmx0=; b=BuACnTTmOR2PCuE0EyosIMsZGe
	eJE40zkwon45Lp5cC4Z5V2ERcw4IWW+1O/UFpFCMRGAxhL3RAeOFoneZzLkh0R1EsI/3eNHhVgrDX
	+r0LeIO57mEr0DLRNoxpi7bpKoRa7tDsm4yAoyb7EuN7RyEJsqKuije4WU9uWEc8ABQ+vFzmeOtHr
	kR+ZgWObx+FxzmSOct6XKGE1p0emROXw/rLE/71gU8UBmzU/mUyMzTZ65Nery1Or4HHru9UI/At3w
	H5+jBzs6kinQXhfASATUHVzmNgSMx9PU55stHNXjo8eHjB0hlK+sI7KqKm7B94hthbnM4XPE8+uo9
	4yv4P4xg==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sdnDX-0009gJ-T2; Tue, 13 Aug 2024 10:49:24 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sdnDY-000BIu-0m;
	Tue, 13 Aug 2024 10:49:23 +0200
From: Esben Haabendal <esben@geanix.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] netplan: add missing runtime dependencies
In-Reply-To: <CAMKF1sqEsOQ7F_MYJjah5STHfF-vEHrijELcAuJYnOHw9ApyAQ@mail.gmail.com>
	(Khem Raj's message of "Mon, 12 Aug 2024 11:51:34 -0700")
References: <92f616b010f11891d2814eb526aded1e5dcaac3d.1723456138.git.esben@geanix.com>
	<CAMKF1sqEsOQ7F_MYJjah5STHfF-vEHrijELcAuJYnOHw9ApyAQ@mail.gmail.com>
Date: Tue, 13 Aug 2024 10:49:23 +0200
Message-ID: <874j7oq030.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27365/Mon Aug 12 10:41:53 2024)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 08:49:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111790

"Khem Raj" <raj.khem@gmail.com> writes:

> sadly this did not apply directly on master, but it is needed on
> master so I have to massage it a bit. Please check master-next and see
> if all is ok.

Looking fine, thanks.

/Esben

>
> On Mon, Aug 12, 2024 at 2:52=E2=80=AFAM Esben Haabendal via
> lists.openembedded.org <esben=3Dgeanix.com@lists.openembedded.org>
> wrote:
>>
>> The json module is used in several cli commands.
>>
>> The fcntl module is used in terminal input handling.
>>
>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>> ---
>>  .../meta-python/recipes-connectivity/netplan/netplan_1.0.bb      | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/net=
plan/netplan_1.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivi=
ty/netplan/netplan_1.0.bb
>> index 229414718c06..cf8d6d19e711 100644
>> --- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/ne=
tplan_1.0.bb
>> +++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/ne=
tplan_1.0.bb
>> @@ -34,6 +34,7 @@ EXTRA_OEMESON =3D "-Dunit_testing=3Dfalse"
>>
>>  RDEPENDS:${PN} =3D "python3-core python3-netifaces python3-pyyaml \
>>                    python3-dbus python3-rich python3-cffi \
>> +                  python3-json python3-fcntl \
>>                    util-linux-libuuid libnetplan \
>>                   "
>>
>> --
>> 2.45.2
>>
>>
>>=20
>>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111775): https://lists.openembedded.org/g/openembedde=
d-devel/message/111775
> Mute This Topic: https://lists.openembedded.org/mt/107853740/6239652
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [e=
sben@geanix.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

