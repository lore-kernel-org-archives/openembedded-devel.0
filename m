Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A843C88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 07:57:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15140.1789371936119764886
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2026 00:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=if4oIy2j;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 260D7601F9
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 07:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38911F000FF
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 07:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789371521;
	bh=KRbs+IXNM/W/kre8zMneDhluD5uCaLangDW3zKbj0x8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=if4oIy2jvRTYzKa0fO4Z0lmDNeKwBGDv2iHV2QgQDcxQRpm6LRpyFw8v+a0b3rFaB
	 SK4AqeOM9ckflLFpnpKZlUJ7FGTJzhyzaENpxPNobmsyPMr8dYPghejFV0yujkZNRp
	 aMUrTkiI4mh8dHGZrxgcHtfeWEE+54j/gPMHydYcUcPLPF1RXgjmi7tweAsw2FSk1w
	 ySMemt1cckrlJnAWkrU9uj7iJZTU9SOypA+7UEt3eWe9a00M3OUxMyxr1+ZjAofpip
	 rzzDpez1xcA7v7IaCMyktAZWrc0MDrxkI8NCMdwPK6XXCSfiUTSlMnCB5Tjrt9xgIL
	 tpC2RJNb/czFw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744eso1278824e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 00:38:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxE/oY42BfV3hMbZjEccYiCiSXivQBEyMWfCjhR7mHqREWSGbQwz87oqw5cvXjgqyIbeM8RNwCATqj0PYrlB/RE0+Q=@lists.openembedded.org
X-Gm-Message-State: AFuF++n0g+KGa4+HZaTOC16YsioRr8MPWXTMoPhZrp+Ry7uLKQDYrn1b
	gnANGuK2sKcqLt2UhxyhjyFRw9kW5MJPUOqIwV4+oZ6iQ1CMwrSV3ZFJJk7QGq4h4ZzhahoS6+v
	LJj3RqBXfeGIzKJTzFZISSM7FDzpm30rrNF6vM/uPQg==
X-Received: by 2002:a05:6512:1107:b0:5b6:183c:5c96 with SMTP id
 2adb3069b0e04-5b8ae69f368mr382289e87.52.1789371520546; Mon, 14 Sep 2026
 00:38:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 03:38:39 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 14 Sep 2026 03:38:39 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMKF1soH4p+tYg5bfWQBmUe-fXS-JPxO09L_H94bkwannL=Thg@mail.gmail.com>
MIME-Version: 1.0
References: <20260911-libgpiod-v1-6-5-handle-disappearing-chips-v3-1-1e9e565dbab6@gmail.com>
 <CAMKF1soH4p+tYg5bfWQBmUe-fXS-JPxO09L_H94bkwannL=Thg@mail.gmail.com>
Date: Mon, 14 Sep 2026 03:38:39 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mfz+iDE6AUuw1DgZMbmx09Ws-ENxAKYWZ_85ScfN0Rvgg@mail.gmail.com>
X-Gm-Features: AcwNN1XDBvTVBaUnanPu3zKl5ejn6fK7P4N6l_2ucxjkkprs6P-6DTKpzOqL9rE
Message-ID: <CAMRc=Mfz+iDE6AUuw1DgZMbmx09Ws-ENxAKYWZ_85ScfN0Rvgg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] libgpiod: handle disappearing chips during iteration for v1.6.x
To: raj.khem@gmail.com
Cc: "Khem Raj via lists.openembedded.org" <raj.khem=gmail.com@lists.openembedded.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, openembedded-devel@lists.openembedded.org, 
	Potin Lai <potin.lai.pt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 07:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130019

On Sat, 12 Sep 2026 07:46:52 +0200, "Khem Raj via
lists.openembedded.org" <raj.khem=3Dgmail.com@lists.openembedded.org>
said:
> On Fri, Sep 11, 2026 at 2:17=E2=80=AFAM Potin Lai <potin.lai.pt@gmail.com=
> wrote:
>
>> +
>> +Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
>> +Link:
>> https://patch.msgid.link/20260908-gpiofind-error-enodev-v1-1-c7756aab956=
8@gmail.com
>> +Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>> +Upstream-Status: Accepted [
>> https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=3D4=
0f18f16f573e6bf091d83cb1677e7386d0b8495
>> ]
>>
>
> Accepted is not a valid status, for details see -
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#p=
atch-upstream-status
>

Sorry my bad. I really thought this was a status I've seen before. In fact:

$ git log | grep "Upstream-Status: Accepted"
    meta-gnome.qa-patches-Upstream-Status: Accepted
[https://gitlab.gnome.org/GNOME/gnome-tweaks/-/commit/dc9701e18775c01d0b69f=
abaa350147f70096da8]'
(/OE/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-tweaks/gnome-t=
weaks/0002-meson-fix-invalid-positional-argument.patch)
    Upstream-Status: Accepted
    Upstream-Status: Accepted
[https://github.com/libesmtp/libESMTP/commit/1c304e7886a08fb56485e41614ff3f=
8685afb59d]
          Upstream-Status: Accepted
[https://github.com/Exiv2/exiv2/pull/1587/commits/e6a0982f7cd9282052b6e3485=
a458d60629ffa0b]
          Upstream-Status: Accepted
[https://github.com/Exiv2/exiv2/pull/1581/commits/6628a69c036df2aa036290e6c=
d71767c159c79ed]
              Upstream-Status: Accepted
[https://github.com/Exiv2/exiv2/commit/f9308839198aca5e68a65194f151a1de9239=
8f54]
          Upstream-Status: Accepted
[https://github.com/Exiv2/exiv2/pull/1523/commits/22ea582c6b74ada30bec3a6b1=
5de3c3e52f2b4da]
          Upstream-Status: Accepted
[https://github.com/Exiv2/exiv2/commit/783b3a6ff15ed6f82a8f8e6c8a6f3b84a9b0=
4d4b]
          Upstream-Status: Accepted
[https://github.com/Exiv2/exiv2/pull/1536/commits/06d2db6e5fd2fcca9c060e95f=
c97f8a5b5d4c22d]
      Upstream-Status: Accepted
[https://github.com/Exiv2/exiv2/commit/0230620e6ea5e2da0911318e07ce6e66d1eb=
df22]

There seem to be some in the git log so maybe used to be a valid one?

Anyway, please keep my R-b after the change.

Bart

