Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id CA6FE605F1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2015 09:41:56 +0000 (UTC)
Received: by iggg4 with SMTP id g4so6997249igg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Apr 2015 02:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=rmN9AEz1H3bkWN9TAdFoWrbfSzMsJ1X8npj0f9cdMbE=;
	b=w9UQQgs9VET+7w//ZwI+7KzNWeU7zMjDTo9PtC/70HC7MAAZBg4fkcI47HBqnFvUex
	CPNnMxSvgkiP+q8pkhs/tZSq2pDqzQPl6CYYMKmSaKUoWVsO+EfExmMJvVD1xvdY1TqE
	QOkTDr57zOaYwupnTvQ19C04oR2rbNfXDwMtPYHBe6b82wlH9MmTd7e8xPJ4YQ4Tee1t
	2mxdqfhREYo/XAXgwk9TNGMglKqbIvn6a9YvbXrjcBbptoi9BpKDe+aCvNcv1Jlw4wGE
	iZrbISdwYGaVki2BWMOBj3KZkGv5GZgbqX25RTEo4h2MBX8qfBA9ngh15Z/0rYAyfwSU
	V7yg==
MIME-Version: 1.0
X-Received: by 10.50.43.231 with SMTP id z7mr2277297igl.22.1428399717900; Tue,
	07 Apr 2015 02:41:57 -0700 (PDT)
Received: by 10.107.158.133 with HTTP; Tue, 7 Apr 2015 02:41:57 -0700 (PDT)
In-Reply-To: <CAP9ODKqgAQqCxNg=fWMC6iW1Ks3HDd4c-YroMVOgJ=doTmsWLQ@mail.gmail.com>
References: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>
	<CAEHkU3VM9sWOcBVynfQhesMXsXo5kQDabQuZLypxembQzfdePA@mail.gmail.com>
	<551C4F35.7020001@gmail.com>
	<CAEHkU3Xg=NSPw2gc1rmPLy3RD68BRNK5hczmS5e6tTE9gEBk+A@mail.gmail.com>
	<551DA5BA.3050505@gmail.com>
	<CAP9ODKqazzhOMQtsdKaGhA-1pNQOHNRQ2vvp_uXDtq+gce2gqg@mail.gmail.com>
	<551E4A44.7050708@gmail.com>
	<CAP9ODKr4Xz8_OLD+DKqZ1wxx4c0Rc6bdSDwqLecFnhZa2x5kVg@mail.gmail.com>
	<CAD0=qk+2f1qORQLQzD_r8p_VaF0+mAkVu+E=yz5-zzipf7RHXQ@mail.gmail.com>
	<CAP9ODKqgAQqCxNg=fWMC6iW1Ks3HDd4c-YroMVOgJ=doTmsWLQ@mail.gmail.com>
Date: Tue, 7 Apr 2015 11:41:57 +0200
Message-ID: <CAD0=qkKX-6afKD8H+sD+MrVp3LRspmuieJC8T=R57ktcnJauxw@mail.gmail.com>
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] Trying to update openjdk-7 to icedtea 2.5.4 and jdk75b13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Apr 2015 09:41:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I tried some debugging with the old HotSpot, finding that the SIGSEGV
appeared in parts of the Assembler Code which got recent patches in
IcedTea-Repositories.
So I updated the HotSpot-Changeset to 24.80b07 and the Bug disappeared
for me. I've pushed my changes to my github repository.

I don't know if this is acceptable for you? It's running on my arm
target quit well at the moment.
If you want, I could create a patchset based on the meta-java
repository on yoctoproject.org?!


Mit freundlichen Gr=C3=BC=C3=9Fen,
Sven Ebenfeld


2015-04-04 21:27 GMT+02:00 Otavio Salvador <otavio@ossystems.com.br>:
> On Fri, Apr 3, 2015 at 5:24 PM, Sven Ebenfeld <sven.ebenfeld@gmail.com> w=
rote:
>> Okay, thanks for the reply! I'm going to run it with debug symbols withi=
n
>> the next days.
>> But I have one more question. Icedtea7-native needs xsltproc native. Do =
you
>> know the recipe which is providing it?
>
> commit d5a2a31aaad8f6bdf19860f7a858b10d7dba08b6 (HEAD, pending)
> Author: Otavio Salvador <otavio@ossystems.com.br>
> Date:   Sun Jan 25 23:11:51 2015 -0200
>
>     openjdk-6: Add libxslt-native as dependency
>
>     The build system looks for xsltproc during configure, when bootstrap
>     is required, so we need to have it around. This has been catch when
>     building the recipe in a clean tmp directory.
>
>     Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

