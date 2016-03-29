Return-Path: <jobol@koumoul.net>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id A16C865CC3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 08:03:36 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id z68so1042263vkg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 01:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-transfer-encoding;
	bh=O26v95Htqq6o6yQtkI2mlr0W6oiqBhJ/hCoUdG0WjsY=;
	b=GW/aZSwbZwM/7DNGs5a3QB1/E15vxbI9QHlplnQHO97e5tMpa6LYKpvlnYunLnXais
	QvdM/f+UI5JwDgkYpcRIhpqEt73YzE29y1AGcC+1gcLba9QutLmhLyYHBqpnr/29HsJl
	TC8nWT/SLSt411o/x+db462txCBxDRxVTVDk0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-transfer-encoding;
	bh=O26v95Htqq6o6yQtkI2mlr0W6oiqBhJ/hCoUdG0WjsY=;
	b=TEQTXqT1X67nN29Bak7GYVAJ99cW5zukb1A8fktQXpc31RfW8oCgOPs/pb7afrzIsm
	skX1oIsSIgnVlAIMILHmN5nLbdxFYXfjXQeDJPgpiFkyV236ggUFsj3CfKIyl19vMq3B
	RUkIIwsoiChjg1QZoVcQNxRJTWvgGyQ/vtoNggcnf5A6voeMqnTznV9m9iK+QZKgZFX6
	f4LBqr81rZXqMHonGlg3vSYBFrjGNkElzTNa4VVJfAjsB3yfkvlJbUT1dFAvCshNtvYE
	+9p3ZKyNxFLWDT2rlZT+asUy39VLXEP7nv9QjYbLQZfbQjZmLh8uiSJUVdxXb2kmDzms
	LHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to
	:content-transfer-encoding;
	bh=O26v95Htqq6o6yQtkI2mlr0W6oiqBhJ/hCoUdG0WjsY=;
	b=EXsOKcye/nUZ7OSc+x4ScjjODY5ekuhqBnSHNZ73z3C70H+AZ5yx4J5BIYcb3Xgvag
	ZchVWR7rcDZkH5xIBwKQpzrUSJEiJIcJ1IiVsm2to8IEkKn/wQfi41t+QJMLPWitjdKi
	wpFOIZ6GZNj76kwbVuz1VYE+TPWD6NNAp/hsz3KGmWkonswMh0h2MiIlXNwLLH6ZGus5
	a0iOkCPHUuKBfX8jH7R200dF1W3ConBXi4QMQ2/Mw70rTOTJpPyy0lT83d/M+o/N97Up
	yyCONLyT2Rdsirj7fmjuCllI0eh9hz6g4V1e8VmTOfOoB8NhjNts/PRo609xeXRAvBoA
	0uWw==
X-Gm-Message-State: AD7BkJKZidSN85EDpi+zggvtyWNvMGAB4Q9WqlCYbOg57y872r8oSyjsaTz+xgm0sRbSCukdUc70n8M0Qnr/9A==
MIME-Version: 1.0
X-Received: by 10.159.33.172 with SMTP id 41mr459274uac.5.1459238616324; Tue,
	29 Mar 2016 01:03:36 -0700 (PDT)
Reply-To: jose.bollo@iot.bzh
Sender: jobol@koumoul.net
Received: by 10.159.35.143 with HTTP; Tue, 29 Mar 2016 01:03:36 -0700 (PDT)
X-Originating-IP: [2a01:e34:ee5c:ee50:d6be:d9ff:fea3:db03]
In-Reply-To: <20160325103517.GA2555@jama>
References: <1458557959-10500-1-git-send-email-jose.bollo@iot.bzh>
	<20160325103517.GA2555@jama>
Date: Tue, 29 Mar 2016 10:03:36 +0200
X-Google-Sender-Auth: d6Km0Engz8I-hP8o0pD8rFRFEKQ
Message-ID: <CA+LDafBz3dKgTOKFx86Me7L4ZceEAPi8tJP-xcz6NROEZ9PFsQ@mail.gmail.com>
From: =?UTF-8?Q?Jos=C3=A9_Bollo?= <jose.bollo@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libmicrohttp: update to version 0.9.48
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Mar 2016 08:03:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hi Martin, I'm discovering your mail just now.
I'll resubmit it.
Regards
Jos=C3=A9
Jos=C3=A9 Bollo - Senior Software Engineer
www.iot.bzh



2016-03-25 11:35 GMT+01:00 Martin Jansa <martin.jansa@gmail.com>:
> On Mon, Mar 21, 2016 at 11:59:19AM +0100, jose.bollo@iot.bzh wrote:
>> From: Jos=C3=A9 Bollo <jose.bollo@iot.bzh>
>
> Unfortunately I've noticed this only after merging it:
>
> ERROR: libmicrohttpd-0.9.48-r0 do_configure: QA Issue: libmicrohttpd:
> configure was passed unrecognised options: --disable-spdy
> [unknown-configure-option]
>
> Please fix soon with follow-up patch or I'll revert this.
>
>>
>> Change-Id: I33a1acf8360d074a3310f9691ac939fe70a99f3e
>> Signed-off-by: Jos=C3=A9 Bollo <jose.bollo@iot.bzh>
>> ---
>>  .../{libmicrohttpd_0.9.34.bb =3D> libmicrohttpd_0.9.48.bb}             =
 | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.34.bb =
=3D> libmicrohttpd_0.9.48.bb} (86%)
>>
>> diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.=
bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
>> similarity index 86%
>> rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.b=
b
>> rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
>> index e3c833b..6e7ad26 100644
>> --- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
>> +++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.48.bb
>> @@ -6,8 +6,8 @@ SECTION =3D "net"
>>  DEPENDS =3D "libgcrypt gnutls file"
>>
>>  SRC_URI =3D "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
>> -SRC_URI[md5sum] =3D "2947eee13c2c8affb95023a0cb6fda0c"
>> -SRC_URI[sha256sum] =3D "29a2bfd4fd2ddf60c756b8c283291a134898e3cc143843b=
e421a040be1b25a88"
>> +SRC_URI[md5sum] =3D "9c298c890088a91fe0d7ac3fec9d0097"
>> +SRC_URI[sha256sum] =3D "87667e158f2bf8c691a002e256ffe30885d4121a9ee4143=
af0320c47cdf8a2a4"
>>
>>  inherit autotools lib_package
>>
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

