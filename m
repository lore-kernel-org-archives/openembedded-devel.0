Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2133.1792741153715606988
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 00:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=VS0tOwIp;
 spf=pass (domain: mailbox.org, ip: 80.241.56.172, mailfrom: marek.vasut@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4j9vzK4fQszMlT0;
	Fri, 23 Oct 2026 09:39:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1792741149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4wb1TegvYNiac/dbIVzvt3lMo48gty5CiLa+mUZ7o4c=;
	b=VS0tOwIpAz2/FVXhXgd2VjVHzMUC2qQXudIjtL4KBE15uX1ZWEi+A1Jfsyi8Zf5mvrlRSP
	gIKFGiV2+iJSthoXHfYdYEtM6+t4XjMhK6yFVYbox4wFbH1ZlLswiXQO1am82yoZTYY8Vb
	4urSUoKrfWrMrA18RfqaFTkTldFXjxiVQzxLkDsfQSc8xKkKMc/Oj095fR46jgSkTaBMg6
	Rg7R/XtfaCoAHsKrxZhKD6hDGW0FxQYOXtfuJVZZHYwGK5Ng1ibKemy2RILi8uIlk3cb9h
	oUpgdpPznZ3iIehba+dCFiSrbTBJlY93VDVNKdI6zrlkgrUku+IF3h1zDn9G3A==
Message-ID: <5f1ff7f0-8cc4-47bf-9378-773ad12a6c8e@mailbox.org>
Date: Fri, 23 Oct 2026 09:39:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-filesystems][PATCH] overlayfs-tools: Inhibit tests on
 configure
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 Alexander Kanavin <alex@linutronix.de>, Ankur Tyagi
 <ankur.tyagi85@gmail.com>, Khem Raj <khem.raj@oss.qualcomm.com>
References: <20261021135357.14928-1-marek.vasut@mailbox.org>
 <6f762fe7-ddf1-49bf-96bb-8e1d75f575c8@gmail.com>
 <d1168121-cced-4238-8dee-9c1b1169e484@mailbox.org>
 <5a50bdd9-6d29-4066-82f0-c13811810760@gmail.com>
 <0eba48ad-5c1f-4041-8f8b-c261f18d29d6@mailbox.org>
 <282c4aa2-503e-4d5a-bf52-2434667ccfc6@gmail.com>
 <CAMKF1soxtKk655kfj+2WNeEL9zOgAHcSYCkRqGF0b9UMmkrTjQ@mail.gmail.com>
 <47f17a91-d4bf-4259-8995-531483dd8095@gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <47f17a91-d4bf-4259-8995-531483dd8095@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-MBO-RS-META: k1as5up4d4gs3o6pf8tbknhec37i5pxy
X-MBO-RS-ID: c7088436ebd33c4125d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 07:39:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131356

On 10/23/26 9:07 AM, Vyacheslav Yurkov wrote:

Hello everyone,

>> =C2=A0=C2=A0=C2=A0 Thanks, I guess the container without a `sudo` is t=
he reason
>> =C2=A0=C2=A0=C2=A0 (somehow I
>> =C2=A0=C2=A0=C2=A0 always had it in mines).
>>
>> =C2=A0=C2=A0=C2=A0 If you are OK with this fix
>> =C2=A0=C2=A0=C2=A0 https://github.com/kmxz/overlayfs-tools/pull/34 , w=
e can bump a
>> =C2=A0=C2=A0=C2=A0 revision
>> =C2=A0=C2=A0=C2=A0 after that.

For meta-filesystems/master , bumping the version is fine.
For meta-filesystems/wrynose , a patch would have to be added.
This is fine.

>> This means no ptests=C2=A0?
>>
> Can be added in the recipe via PACKAGECONFIG

Is it possible to test the overlayfs-tools without invoking sudo ?=20
(reading the documentation and the rationale for sudo, I guess not in=20
any performant easy way)
