Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id EE3BE6AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 07:38:38 +0000 (UTC)
Received: by iejt8 with SMTP id t8so58121237iej.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 00:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=pBqlo6AHfdHrRsrd97JnBJqBI7kYOTY0r1Y+4Lcn+Mk=;
	b=tu5lEchmKGcpNshpimlv3mPlUxaagGbVYkRRGgwC6N4FfZLiE8Kc6oDRvKW8SpaaWR
	NBgQb5XnyOJfzJ+KMIVJZKCImSECMiY/65gOJM7MZHhpu74i2zROQyApOH57v83DAZbr
	e6DTH1MjEOaEIkOuGx8iLQTp1WgQS/QqbvMZCsyQrXEMbE7aZPaLWp1PFjc8qEyIJUeA
	s34HBD/uTWZjSrfWYL6S4tvni4ITYzRMvJb41+NPoz1vGgWO+gPfFMYUsgTb08UycAov
	z8g9SpLGjB3uSNjueTfkBCGDk9GNKZAvxQpAFc6vgOjiJKIsQ2StBWbRYLeHG+oOUtYR
	QEGg==
MIME-Version: 1.0
X-Received: by 10.50.122.39 with SMTP id lp7mr14504705igb.24.1428910719833;
	Mon, 13 Apr 2015 00:38:39 -0700 (PDT)
Received: by 10.107.158.133 with HTTP; Mon, 13 Apr 2015 00:38:39 -0700 (PDT)
In-Reply-To: <CAP9ODKq_yN=M8-+Hbjk_NHyTGQ=oVEs=tEEQwkGWghR_LBHLfA@mail.gmail.com>
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
	<CAD0=qkKX-6afKD8H+sD+MrVp3LRspmuieJC8T=R57ktcnJauxw@mail.gmail.com>
	<CAP9ODKq_yN=M8-+Hbjk_NHyTGQ=oVEs=tEEQwkGWghR_LBHLfA@mail.gmail.com>
Date: Mon, 13 Apr 2015 09:38:39 +0200
Message-ID: <CAD0=qkJNOMx5Ubn25Ugrn3fg02cq3kLjNbeV5ZBKsfWtuUXbgA@mail.gmail.com>
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
X-List-Received-Date: Mon, 13 Apr 2015 07:38:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

After a week of testing these recipes, I fixed some issues in the new
recipes. Therefore I just submitted new versions of the patchset.
I removed the patches for uclibc as I'm unable to test it at the
moment. While trying to build it with uclibc, I always got errors with
compiling curl. Unfortunately I don't have the time to fix these
errors at the moment as we use glibc. If one uses uclibc, it may not
work atm.

Mit freundlichen Gr=C3=BC=C3=9Fen,
Sven Ebenfeld


2015-04-07 15:17 GMT+02:00 Otavio Salvador <otavio@ossystems.com.br>:
> On Tue, Apr 7, 2015 at 6:41 AM, Sven Ebenfeld <sven.ebenfeld@gmail.com> w=
rote:
>> I tried some debugging with the old HotSpot, finding that the SIGSEGV
>> appeared in parts of the Assembler Code which got recent patches in
>> IcedTea-Repositories.
>> So I updated the HotSpot-Changeset to 24.80b07 and the Bug disappeared
>> for me. I've pushed my changes to my github repository.
>>
>> I don't know if this is acceptable for you? It's running on my arm
>> target quit well at the moment.
>> If you want, I could create a patchset based on the meta-java
>> repository on yoctoproject.org?!
>
> Sure. If you want, please also cook some clean up patches. Both are
> very welcome additions :)
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

