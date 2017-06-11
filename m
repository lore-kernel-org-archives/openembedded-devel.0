Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 86D2C78204
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 17:21:55 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g76so17313384wrd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 10:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=h3X3FuhPNltm/XJE7UmAXrLk0oB5+KBaeyERfhZqCMM=;
	b=AkQqwjBkBC1GnZPLpLJ/B0jwvfxMrjOy1dUb2TOL6Dn/qFVPr4S+k6uSnCO0TTuA1U
	zJSWpJD4HHJ4tvzUXNI+L20OpNNC8Bvw/hH2EQd2Pk38nVWzIRe+z7dcKeAYGq3hEAqD
	ZSWw7+Ikk8T0nVRjPqlopbAOTYCauJqmQriJGZCiiFQNlUG9abl6tMYLYP4Xsf5YZ1qI
	xcdVjLUvS7GvF7EA8BbJcFTZh+pkv1BxAn/cAQbnLvtokvrps66nZKMXJHjgXwAUtzBj
	0HiJRTUA342stpgzpBmZVL6lCQjt0WFbq6dm0UtNbvKJf8hS2JxaopAXywzyj/dna0vg
	p3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=h3X3FuhPNltm/XJE7UmAXrLk0oB5+KBaeyERfhZqCMM=;
	b=Ej2uNW9D4RM+pwjEA4wXaw8WDs7WE1F1v+iwmd7nOTT5ntJauzOMiRNDg0jvZhvTl8
	86MCQt8fF14uikOvokK47YDAeCkRv8nek4wsO718ygsTkuXVBEMtGbHfYggb/OAU2Y3c
	n2KoPpm5EykXxGZMkhEp4driejIsTAyaD23hIS5pfH8Wk8Lzcs88ovQ0a0bheXNI4NHt
	iWJWNdkQinH/Rx4EY0lAuDs+MBSYjTvsfVc/uVmI8lbjc7dGrdcVZwBiT0RSBltB3Uxr
	8p/39qgxB6iatJ0LyPaevRiB+SNwH9iKi5WY9PV5A5eQiXW7L+QNDb147kynlo7iDglc
	c6Mw==
X-Gm-Message-State: AODbwcDRm0LIoVBYYEgjyysT6UGHS9+jz5FD6KiY61mnpx49pn7lMPBp
	Oq9EsTfLj25Jl6OBw58ndh7Iuc2GIw==
X-Received: by 10.80.137.36 with SMTP id e33mr26380644ede.67.1497201716356;
	Sun, 11 Jun 2017 10:21:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Sun, 11 Jun 2017 10:21:25 -0700 (PDT)
In-Reply-To: <CAGyDALkuRNgu-+JmUuSSKJ-H3pDXs1XiE43q5FJF-bAVhRDZ+Q@mail.gmail.com>
References: <1497194825-16654-1-git-send-email-maryan.pricak@gmail.com>
	<CAMKF1soPKfwffcWP2F72xt1JCtZ+iuUwSwEZ_ka+g0Un54xh-g@mail.gmail.com>
	<CAGyDALkuRNgu-+JmUuSSKJ-H3pDXs1XiE43q5FJF-bAVhRDZ+Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jun 2017 10:21:25 -0700
Message-ID: <CAMKF1spmvg4Xz=X+ZRFPA68K0p9_ZgM=xMLPXOMQDF1Q-3E5Mw@mail.gmail.com>
To: =?UTF-8?B?0JzQsNGAJ9GP0L0g0J/RgNGW0YbQsNC6?= <maryan.pricak@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] hiredis: Add recipe
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
X-List-Received-Date: Sun, 11 Jun 2017 17:21:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 11, 2017 at 9:21 AM, =D0=9C=D0=B0=D1=80'=D1=8F=D0=BD =D0=9F=D1=
=80=D1=96=D1=86=D0=B0=D0=BA <maryan.pricak@gmail.com> wrote:
>
>
> On Sun, Jun 11, 2017 at 7:01 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Sun, Jun 11, 2017 at 8:27 AM, Marian Pritsak <maryan.pricak@gmail.com=
>
>> wrote:
>> > +do_install_prepend() {
>> > +  export PREFIX=3D/usr
>> > +  export INSTALL=3D'cp -r'
>> > +}
>>
>> can you explain why these changes are needed ?
>
>
> By default INSTALL variable in Makefile is equal to 'cp -a', which preser=
ves
> ownership and causes host-user-contamination QA issue.
> And PREFIX defaults to /usr/local.

Thank you. Can you add this information to commit msg and send a new rev ?

