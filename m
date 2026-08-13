Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31813C5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 10:10:08 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15778.1786615806973250141
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 03:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XtOJ14PX;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6acc74fef22so186932eaf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 03:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786615806; cv=none;
        d=google.com; s=arc-20260327;
        b=L36hicUY5aPFXbAtl0qHLcVYyQUQlZQXkkYzNRWIUQN2uiuHA8oicgcOMhfTZcagqP
         Z4qCXCvA0sr8CiJoZRcA48NfeA1JonwO+3OxwtQ9Dcm7gtO39rCvA8TuTCLaX61tbQG6
         djjnU90gemb/EQf+spXp+KACr3hT9v5DX4PuK2OROFo7BN6O7TUIFTfzkoG5vlIQNUGx
         OSd43jD3+fqmRvF5bi2wyOp9tbappPmJNazUzP/k2gX1QYhdOH0RbKhIKEXOjaoGW2v1
         7O+FXVrx9y4wtmAHqrxR5WjYbNoYjRdub+O/n03pMnVFLv5w/hPzb2LuqW8dm92wm4wP
         CMwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o8vQEzN7qHM5eFfXaZk1Yyj/kGLOXlw9dkCyw3lxXLQ=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=Moya6XzhPEWbZJtw2YPD4viGZk5iY2IGJR5zVpJ8eT6xdNXDRfeymuUDWZ4bmrMRAO
         FhTF6btqv2+IaUZZ2vgN8Q8kVD+s4ulgv52kp+5dtchsZsUPpMdjaInHpAG8Zo49P2i6
         Ck0kCGMfWkJXIKVd6FtPza9AlFucIh8XsE1UTPBD5JiWiHOoVI2evSM7EJtbe5dCt4/L
         reJ+qeWbu1rSaRdntP1J3KcqmjfgN8cq0pOyRj+gSXEYt+vgqr2Mzfi0Q8qW0xs6nq61
         Mqz8RjMcqf34lUHU1sZac5RQ6nWE5iqkrm7cvvZK5DrA1DQDVxXOEf7BTq7UwUmJ4k1d
         SORA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786615806; x=1787220606; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o8vQEzN7qHM5eFfXaZk1Yyj/kGLOXlw9dkCyw3lxXLQ=;
        b=XtOJ14PXvOZelCu0IaHG3w9NJ2gFCyFwYgae6HhYqeNVk0D/qLWKJqcA5QngYRlauz
         tkZQWvYRFs36H2lRV6LmMXm7xMINoEOZ4bap+tAtrewEuJE0iy0wuf2On9PcFaVENs/H
         8klMX05AxXqZ9t1r87UIGKbL7IPtAEvJw6K/B9U9YmOczFrBp1YWOuysaSohI/P6Korz
         BiIDpjezrwwg0+UZs/XY35UhS6c0tdZe0NXWCbbH5YEY23KFQt7iir6ja0l5ONOOo9Ec
         +0t4Rr1EGJzNQIfQLgVReis+SbR7PqSNbWKFOVdTVHe6ICCNHxDAhaIYLfFp8aj9BgtB
         xzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786615806; x=1787220606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8vQEzN7qHM5eFfXaZk1Yyj/kGLOXlw9dkCyw3lxXLQ=;
        b=PlKGKkcXxAjOEXWXqd4O7T4EFchhNrjzW/nauo/A8DHE7JQbvxvTqTfxwcnkPtirdB
         nD4K/tukzine59OuX+KHlFfNMnFDwh8ScpLgjGtOC0c2F3mqOeNz0kWl+F7ICFpp1xHJ
         REpyXviR//4onwz+5V0ADTx0fphxUAWpqBUwJJ6vsaOGnP1hIRgMgcnX+uI3Lok0ZQ2A
         ZFyOLIy35PoWfgoB9dsGk2szLyihWfqKeBUHwRUG1Smw7nMzuvQLMvtKX/nxC3EYyPDQ
         8lbrlM338OCYHbM0qPV972bXAKnHHDIUpP8Hp2azT1uaEaIDwiN4HdvTUFkRzHhKYbtv
         5whw==
X-Gm-Message-State: AOJu0Ywn77HY5mq8x+FjwgC92A2krGwvr0bKsPJkb/KP8WG8OM9JUKcw
	fimM2WPGQgdXhCK3rnuWr0D5C5BMbYuZQBzSbKF9++NmGEprnbnymHvghB+q3lw9uamiTE9QjZZ
	T0uOAnHWQYrguwcOlSIgEGOc8MbzfNds=
X-Gm-Gg: AR+sD11YaDNJ4zn7l/V7uL+CleOCCwuOGDaS/EbGs2dRQ6YZbTPY1QDI4cMWqCU8td9
	3kJkI+ik/CZ6apIe6bMbiTXHFiz1RJqw65nistQbG+e7UIx+NP4/Gjsim/gXL2RyNamx84cvC5N
	2HuDLhO7q5e11nM0ARDQck9P2dn1tu7ox/MM691u3ETn2nipisccFUAc/CB3e2q98yJIqAzxpIT
	YVu1wjvHuQOGVVL9p4xvl1WNDbC9xnKqkBOjkJRwYOzwyt+CJwk7mh0cv8Phrtal4qFjKPduTLv
	+dNUxZap2mFFj5VqH9Lc/qyNiAydo5JrNneeelONWHGW0rIXMOEDjt9dig==
X-Received: by 2002:a05:6820:4de9:b0:69e:4d9d:5a5 with SMTP id
 006d021491bc7-6b0c427b05amr4339983eaf.16.1786615806006; Thu, 13 Aug 2026
 03:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260807070953.2275518-1-ankur.tyagi85@gmail.com>
 <20260807070953.2275518-6-ankur.tyagi85@gmail.com> <CA+s=J=y_bvvoFonaQNb4V2JqTDZoETDpEQL9B=A6tzVAjowpUw@mail.gmail.com>
In-Reply-To: <CA+s=J=y_bvvoFonaQNb4V2JqTDZoETDpEQL9B=A6tzVAjowpUw@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 13 Aug 2026 22:09:55 +1200
X-Gm-Features: AUfX_mxCtQrMAB83ULNNWNnfkfx7eS4N706QkHGnk5Gc6-sQaBctUNoo8F4z_dQ
Message-ID: <CADySD0HNftXbM92=_mXE3pJZ4Mw+BDUi+Mg41z=Bwf1RH9Ne-Q@mail.gmail.com>
Subject: Re: [oe][meta-oe][scarthgap][PATCH 6/6] jsoncpp: upgrade 1.9.5 -> 1.9.7
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 10:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128939

On Thu, Aug 13, 2026 at 5:01=E2=80=AFPM Anuj Mittal
<anuj.mittal@oss.qualcomm.com> wrote:
>
> On Fri, Aug 7, 2026 at 3:10=E2=80=AFPM Ankur Tyagi via lists.openembedded=
.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.6
> > https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.7
>
> This seems to be causing build errors for sysdig:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1719
>
> I didn't check in detail but I remember this version had introduced
> ABI breakage, which was fixed later.

Ok, I'll look into it.

>
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../jsoncpp/{jsoncpp_1.9.5.bb =3D> jsoncpp_1.9.7.bb}              | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.5.bb =3D> jsoncpp=
_1.9.7.bb} (93%)
> >
> > diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb b/meta-o=
e/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
> > similarity index 93%
> > rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb
> > rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
> > index c54dc94666..8194c554da 100644
> > --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.5.bb
> > +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
> > @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d73c165a0=
f9e86a1342f32d19ec5926"
> >
> >  PE =3D "1"
> >
> > -SRCREV =3D "5defb4ed1a4293b8e2bf641e16b156fb9de498cc"
> > +SRCREV =3D "3455302847cf1e4671f1d8f5fa953fd46a7b1404"
> >  SRC_URI =3D "git://github.com/open-source-parsers/jsoncpp;branch=3Dmas=
ter;protocol=3Dhttps"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#128863): https://lists.openembedded.org/g/openembed=
ded-devel/message/128863
> > Mute This Topic: https://lists.openembedded.org/mt/120639193/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[anuj.mittal@oss.qualcomm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

