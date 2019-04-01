Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id E8D817D036
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Apr 2019 13:12:15 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id f22so15081921ita.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2019 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vdXQGkFfjJHL+i3Kgh3Ljbd0OeOJqwMpkRMZqgIEN1k=;
	b=gsDC/95dqUB3qxYGmwtIVsM2GwjWl3CnHYl+SAswTf/ULkgGUt8xqNP0iHQevAe3U5
	mHlgwn1BBb/MsIXrl8jZe0yeJEl/gyIJadFNNJ4iSiVQWXOeUv6PH3PIULboHX+T/AYY
	p4noE7vuJKrEG92rd/PvmOjhrsK/gM+mOGnn7PeCsbgaAiw96CriG1pynBwh+Cy37BUV
	0NPJdH0v2HE7PmK8iZOIDuIegosP//ktFPsj80oSFtbWixloSVGLMkckAxtzvRgBRp/4
	X+txMP7S8/rRPQgtDk5ED+ih/2x9j3Hh+6wOt4KFdW9qNtRJ9q6fEcZ/ApmVL2khag6P
	ka5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vdXQGkFfjJHL+i3Kgh3Ljbd0OeOJqwMpkRMZqgIEN1k=;
	b=ry5q7BcQpGFiAJYJKlO8KbYNw+znimMFY57WSyYA0jLibSRmMsb3mHeZZxIE2ntqp0
	C/Ah80YCswI+SUA5weFeDKEEZuk47YWcjzch8PIF5vXzgKyPl1ou8gWxJRGa7rCZTrKv
	Hxds6HqH9dPk0qovSMnxJfD11VPw4vp6jIfSl9L+Slefl6QjbhpkuFmAJEyv+BNR0Cxy
	7mUBrG2Iz00JMyQbcRZryUktBjTjccRQqRGfd1MjQraGmsNNYZWtWvdaS1hz8Q6CW3B/
	4bibRpDHl6Me5u/nxADznmMUC52msU/TQd3Gv4fjDg1oLjLnmtZDKgybEfF/RiTKbynz
	1a+w==
X-Gm-Message-State: APjAAAXZYpVaCm1k2snhO9LPgO+6i8/Wj7BqkhOwpOBwKpk3z2L7VsAP
	e7jak/Entr8WbCxG+wVYKhCAZ0PFgt6YKKuY2eg=
X-Google-Smtp-Source: APXvYqyFxevlwFOf2tdh3AeGdOHWsxVYBPrWapYgTCD0sPvl+W20KpWzq7O2H/DEMT5me94rnD/daSkAmc1Dbyh9r90=
X-Received: by 2002:a02:9f08:: with SMTP id z8mr19909655jal.6.1554124336890;
	Mon, 01 Apr 2019 06:12:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190401093917.28952-1-costamagnagianfranco@yahoo.it>
	<CAB2nKc_+S3dJBMtCtF080vkcms0j=PgOpDJMn3OYV_GDXzCa=g@mail.gmail.com>
In-Reply-To: <CAB2nKc_+S3dJBMtCtF080vkcms0j=PgOpDJMn3OYV_GDXzCa=g@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Mon, 1 Apr 2019 15:12:05 +0200
Message-ID: <CAATN8PVrHObvgSkbCA2Bjw5iD1Jc2qW+596Q71UO2B_snS4adg@mail.gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libmodbus: start to prefer version 3.1.4, now that even Debian updated testing to it. Upstream declares this version as "very stable", so maybe it is really time to switch to it
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
X-List-Received-Date: Mon, 01 Apr 2019 13:12:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ok, lets send again with a better subject, thanks!

G.

Il giorno lun 1 apr 2019 alle ore 13:04 Vincent Prince <
vincent.prince.fr@gmail.com> ha scritto:

> Hi Gianfranco,
>
> This commit subject seems a bit long ?
> Otherwise, I use 3.1.4 for a while now without any problems, so I agree
> with your patch.
>
> Regards,
> Vincent
>
> Le lun. 1 avr. 2019 =C3=A0 11:39, Gianfranco Costamagna <
> costamagna.gianfranco@gmail.com> a =C3=A9crit :
>
>> ---
>>  meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb
>> b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb
>> index d438a0abc..cc45fa7e2 100644
>> --- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb
>> +++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.1.4.bb
>> @@ -1,7 +1,4 @@
>>  require libmodbus.inc
>>
>> -# Use the stable branch by default
>> -DEFAULT_PREFERENCE =3D "-1"
>> -
>>  SRC_URI[md5sum] =3D "b1a8fd3a40d2db4de51fb0cbcb201806"
>>  SRC_URI[sha256sum] =3D
>> "c8c862b0e9a7ba699a49bc98f62bdffdfafd53a5716c0e162696b4bf108d3637"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

