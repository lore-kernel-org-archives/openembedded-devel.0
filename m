Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E734C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 00:28:53 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web08.4103.1647563331665819714
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 17:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout04.t-online.de (Postfix) with SMTP id D4D90D75;
	Fri, 18 Mar 2022 01:28:49 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.192]) by fwd72.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nV0Tx-0hxLij0; Fri, 18 Mar 2022 01:28:41 +0100
Message-ID: <90005800-5da8-41a3-d61a-9c644e7cea4e@t-online.de>
Date: Fri, 18 Mar 2022 01:28:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-oe][PATCHv2] perfetto: initial add commit
Content-Language: en-US
From: Markus Volk <f_l_k@t-online.de>
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20220317165929.527418-1-f_l_k@t-online.de>
 <CAAnfSTvFTEDAnHETjQX99vPNRq6fxcZdyB_93kcdpjbEeXzZhg@mail.gmail.com>
 <16DD4EF6721B8F23.17931@lists.openembedded.org>
In-Reply-To: <16DD4EF6721B8F23.17931@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1647563321-0000B7AB-88C28C93/0/0 CLEAN NORMAL
X-TOI-MSGID: 91cb909c-8af3-4800-9b7a-ca67e26ba0bb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Mar 2022 00:28:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96050


>
>> YUCK.=C2=A0 What is this installing and why can't that be done via DEP=
ENDS
>> and SRC_URI?=C2=A0 This breaks offline builds and source archiving.
>>
>> Ross

By the way, as I was playing around with Perfetto, I stumbled across this=
:

| INFO:root:Downloading=20
/home/flk/build/poky/build-rock/tmp/work/cortexa72-cortexa53-crypto-poky-=
linux/perfetto/24.2-r0/git/buildtools/libbacktrace.zip=20
from=20
https://storage.googleapis.com/perfetto/libbacktrace-177940370e4a6b2509e9=
2a0aaa9749184e64af43.zip
| curl: (77) error setting certificate file:=20
/home/flk/build/poky/build-rock/tmp/work/x86_64-linux/curl-native/7.82.0-=
r0/recipe-sysroot-native/etc/ssl/certs/ca-certificates.crt

This could be fixed in curl.bb by adding ca-certifiicates as a dependency=
:

PACKAGECONFIG[openssl] =3D "--with-openssl,--without-openssl,openssl=20
ca-certificates"

but wouldn't this also be needed for gnutls? Or should it be added to=20
DEPENDS ?


