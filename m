Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 965326FF56
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Oct 2017 01:05:29 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n14so15857978pfh.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Oct 2017 18:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=kZzT+k0Pcvbin5Bwqj+vV9wljyKGwHZOoC1SFUDEOUw=;
	b=ql/GZqDh5TsHbtvvr+Z6bbiuIo+MU/BvexjNujT2P0fYvKGtyH1jhYJxtKcYUSPW/1
	yrUKtk5CRyZx+eDN8phddVxXU3oPcEDuPwvOtN4/u1/RXAD9GqtuFXC2JWmJZUTGY+cJ
	F4rrHlQ0FcoGL9HInAsCuIKoReb23AxKwhbv/Hr0XfbayKK0zIR3peWR2rVgkvc8XeiC
	EozqRKfTEhtW1xF3aG4ZgQK+gVtGmClevqcj166mQea4wjAir+sJchNY7f6SimjXVyJe
	yx4Ff8qPRxMiMlU2nY9w20JMA78EkicCrRffZHXSqyfv4Qkjw+tvkuufS7QfWl/wQVN7
	KYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=kZzT+k0Pcvbin5Bwqj+vV9wljyKGwHZOoC1SFUDEOUw=;
	b=YZ1isJPpd/AfWaJTfau5/Bq74n21IPZjdfpWwmfq87FsCsc4QZCydV4QqkQuQuWC5v
	CvhKwDYfZO2lZiRJRhDJiYh3iv/uxemT2f9iMHGM7tI1NAvc8PBkORTkMty9SpvkDA0p
	422+4c61ichZ9OBXrgD2Ca+4Lq0tY/b3u0umxicuhFVWbbRE0ivozBHXO/lBP5G2x3mb
	BpTknZdeqGIZ23rP/YBVILYJ6nU7YQpUPthFJwug9iAUWwVXzJ7GCxFl6tmYmqEfzyFS
	uKJhoViJd0882ou3GWQj/v4xyQxf1wMcn3Ki3aC0Sm0uohSI00Ga1khRdETHUZ4DIZ3y
	1kQA==
X-Gm-Message-State: AMCzsaUJm0IkGCGD3XmGZT/yEQ1nlF+C6946AKsWNhzWQzBdPfVmGkYL
	91HAH5a/v6NlKBznzy3pbsRGKpvYQGehoxbYpsE=
X-Google-Smtp-Source: ABhQp+RXPVGx1ERgZ6Ar65De/09O9SsZ4CWtL7E+uNtz/2pGyPIyCsFNucG4emEOJW+UDfMlAHXUy8Zss9iJ8V60NpU=
X-Received: by 10.98.166.205 with SMTP id r74mr11546787pfl.285.1508720730529; 
	Sun, 22 Oct 2017 18:05:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Sun, 22 Oct 2017 18:04:59 -0700 (PDT)
In-Reply-To: <CANDbA3coqHx=fEXZrVNyBSsPeTHM5pYNN46LNwXeoheqbOdsCw@mail.gmail.com>
References: <1508274082-5871-1-git-send-email-athoik@gmail.com>
	<1508274082-5871-2-git-send-email-athoik@gmail.com>
	<CAMKF1sqe0QA+pBO3K22ww6NML4Qnv8up86_rCM_jH1MxfxzkOw@mail.gmail.com>
	<CANDbA3coqHx=fEXZrVNyBSsPeTHM5pYNN46LNwXeoheqbOdsCw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 22 Oct 2017 18:04:59 -0700
Message-ID: <CAMKF1spscYsv8azfzKMgHmZFrQvG=SwUzb=zOcOJ4otcqPW2qw@mail.gmail.com>
To: =?UTF-8?B?zpHOuM6xzr3OrM+DzrnOv8+CIM6fzrnOus6/zr3PjM68zr/PhQ==?=
	<athoik@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] smbnetfs: update update 0.5.3a -> 0.6.0
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
X-List-Received-Date: Mon, 23 Oct 2017 01:05:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 22, 2017 at 12:48 AM, =CE=91=CE=B8=CE=B1=CE=BD=CE=AC=CF=83=CE=
=B9=CE=BF=CF=82 =CE=9F=CE=B9=CE=BA=CE=BF=CE=BD=CF=8C=CE=BC=CE=BF=CF=85 <ath=
oik@gmail.com> wrote:
> 2017-10-21 18:29 GMT+03:00 Khem Raj <raj.khem@gmail.com>:
>>
>> This fails to build for musl
>>
>> | ../../git/src/common.c:7:10: fatal error: execinfo.h: No such file
>> or directory
>> |  #include <execinfo.h>
>> |           ^~~~~~~~~~~~
>> | compilation terminated.
>> | make[2]: *** [Makefile:429: smbnetfs-common.o] Error 1
>>
>> you might want to add dependency DEPENDS_append_libc-musl =3D "
>> libexecinfo" and also make sure that -lexecinfo is added to linker
>> cmdline
>>
>
> Hi,
>
> I created a newer revision of the patches with the extra DEPENDS and
> LDFLAGS for execinfo. Tested with musl using instructions from here:
> https://github.com/kraj/meta-musl and build doesn't produce the error
> any more.
>
> If that's fine please cherry-pick also the commit into pyro if
> possible (the revert not required).

Yes this patch is better. Martin please pull this in.

>
> Thanks,
> Athanasios

