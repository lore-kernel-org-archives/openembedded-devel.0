Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 919B2CCD1BF
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 15:41:56 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.8094.1761406908543132387
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Oct 2025 08:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FNR6tQiI;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-781014f4e12so38213417b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 08:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761406907; x=1762011707; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUfXyhOHm+TVND1hLi+TRKXQYix1sgLsHOzWdvZh/jM=;
        b=FNR6tQiI9/W8EGnJ4RIwWz5TckzEQyFbbTsIl/Vt+f/ibnsuYQ6uLg7llA+3BYuM5h
         YsolABQhIwud0jCjBDjUVz84aTEPJemR8Gu/kiMy591KcvQ8BstSTgGHMKQd7HdAEd24
         2oJzo/TT7unikU/0YgYZS1h75m+vYg9aaHqPlBskITI4uyF15xg/R+tcWMHwwLaauiZI
         DXhDglTdW7NsSoAAC7CDJHcu2AcBKtRTwyiL5nwCQZ1wm3xN4AOHI2yNXnFrHHDjN+6Q
         qxgYVFlVZxrigQeJ6DioVNZqLvzsBPi4PHKzi0lTBHc0FoVCFquhvwXxVGYLuZbPLgyj
         BP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761406907; x=1762011707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUfXyhOHm+TVND1hLi+TRKXQYix1sgLsHOzWdvZh/jM=;
        b=rWP2coVjz013r+FBTucjR707BgIWcH6v1ZUJLGRXP3+WFpDwI7nsD7lwYnbQ765BK7
         tvg5jDIVwgwV9lluZZV86pVzYfYVulfPQXbCFBZune3MIlef+LjP+BpnXzQ63GIoH2jG
         PIryvWUZ06CvZu75qUEkd5F2Gw4l3eeJxp+Bdw5e0M+kaGlXY96UscgoS/wbGLy+G9Nl
         zmPJRr96x4IH9GAg7eu3PMVhgJj/lePupwMO06kPhIIwBdXeLuM/jGsQIAOiVhOTGtnK
         CrPVzMWS9z79YRj1bUTe254Jtm5GWrZZ11XK8CBV4iDfS5kYxM9ATqtzXCAgyLHS02jY
         XB5g==
X-Gm-Message-State: AOJu0YzmDhD6eCs5mtPJVRt67/3Y2k1L9CPP5XDEtd9gr2Vfc624A7k8
	u+QFUyaHUE9QijVHP7kw2jb+J5PtFfNh5LXsMDkXWbjrviolVdrVINOmaLzNrIBsiQ7XxIAH4sN
	qPD1oJlxWBC2RgWLG3tkLNv2j7CeMlzI=
X-Gm-Gg: ASbGncu3HOwzv6oPBqT+kIZslDrABgvY0xVwIJCHjnsqhL1GUxMz/B4lIy6kdpOLP9t
	YSfvVFKS5Hz1GoyCMOZ55zAHTbWp9TTE5R5Hp+m/zpek/4P4sakwrOLkFdOyjlpxojzPXq0LTFM
	JXPDQowUs4G/1A73ryLcT2nkm2QpXjYElxRNMH2fa6OtBJrW5hE2szjGxRwh/idVwgJUcPlBTAm
	L61zWpjf93N1XQoErElBkWgFfmRvVpQhEYjOJ68V6N2f4+Tq/UcBjo5dg0HFuCBlKPEEO6r8jvS
	x2pCMZa/eBlsHQMc/7PSGL3rD4E6IuaykbcTRxZxlBgXFHKgQ1W8YtD4QadI
X-Google-Smtp-Source: AGHT+IFYV80NsZ9JEgDXbWaGFbpfezOcBVzd0c6+Px2S/EC7ckBUowYFiO1fjcqSnHukC8rxbhaThSmHHsIxzFvSd/g=
X-Received: by 2002:a05:690e:1598:20b0:63e:c25:9706 with SMTP id
 956f58d0204a3-63e160e9792mr23052430d50.2.1761406907542; Sat, 25 Oct 2025
 08:41:47 -0700 (PDT)
MIME-Version: 1.0
References: <1871C22319F83E53.22537@lists.openembedded.org> <6a90839e-0fe3-4b13-809f-1ec40f34c26a@gmail.com>
In-Reply-To: <6a90839e-0fe3-4b13-809f-1ec40f34c26a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Oct 2025 08:41:20 -0700
X-Gm-Features: AS18NWDP_eD5iPM7EhnMd8LuijCw2wxQv3IgkRcvtfvmG3sylxb3QXEC00sDNj4
Message-ID: <CAMKF1soDEfb53LAzV6PuZKL67x6DQi-4LTwTsWobT2B-Xi+MxA@mail.gmail.com>
Subject: Re: [oe] [meta-perl][PATCH 1/5] libnet-dns-perl: upgrade 1.52 -> 1.53
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 15:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121007

On Sat, Oct 25, 2025 at 7:41=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> After this series there are 3 recipes remain the on the PTESTS_PROBLEMS
> list in the meta-perl layer, which I don't intend to touch at this time:
>
> libunix-statgrab: this doesn't compile on my machine (!?)
>
> libhtml-parser-perl: I think this can be made working, but it requires
> HTTP::Headers module, which in turn requires Clone module which in turn
> requires B-COW module which in turn requires... and none of this is in
> the standard layers. Eventually this should be fixed, because some of
> the missing modules are also requirements of the main package.
>
> libxml-libxml-perl: This is a problematic one: the module is not
> compatible with the latest libxml[1], there haven't been any activity
> for over a year, and the maintainer wants to give up the project,
> looking for someone to take it over[2]. Possibly it should be removed or
> disabled... the test failures are real for this recipe (after adding the
> missing dependencies), and fixing doesn't look like a small patch.
>

Thanks for explaining and root cause'ing them. I think it will be good to
add this to recipe or some place, otherwise we will forget when we revisit =
it
this info can be helpful.

> Khem (and everyone rally, who wants to run some tests), if you could
> check when you have time if the fixed tests work for you too, that would
> be helpful. (Otherwise will check and try to fix)

yes, it certainly helps. I run the ptests for all the layers as part
of CI for accepting
patches on master-next.

>
> [1]: https://github.com/shlomif/perl-XML-LibXML/issues/84
> [2]: https://github.com/shlomif/perl-XML-LibXML/issues/91
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121006): https://lists.openembedded.org/g/openembedde=
d-devel/message/121006
> Mute This Topic: https://lists.openembedded.org/mt/115944290/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

