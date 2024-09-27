Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103ADCDD1B8
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 14:31:25 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.70313.1727447483316462323
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Sep 2024 07:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QH+Zsyo+;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5d5f24d9df8so1102632eaf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Sep 2024 07:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727447482; x=1728052282; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snJGrjpP66UzLYJ0baYT9HQ8ZjoLl3aBuxan8ElGAoY=;
        b=QH+Zsyo+5im36nKKMKanQdTacXuex2RKArKtfsRy9/7YRFkl6IgqR23AWkMbngL53n
         9tFWBiJX1t5aJrsov5jowJycDl2smMnYw/NT3050s2SEH11KqZd2jYrRu55p4NBs+Ao1
         zCIqljnM+mvCGbBMrBzyKlGBonsihSuw9ajHCxjXwnZ8jUUWQh2iMO1fT4IWWow6CyJx
         CS7l7lDlqbevU4/WiKhgI194t4k/kn7N53wSeiPYvJz2M7xMJJhW4AYO1CNHOuRwNPOG
         DEXcWOEoahenlqTQ8fbI+pwdHWDs8240EoTQWV2LPZhpDmyIZx3M8iDcxcd/eX7rdZeH
         2YaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727447482; x=1728052282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snJGrjpP66UzLYJ0baYT9HQ8ZjoLl3aBuxan8ElGAoY=;
        b=THeXBbhgc/0NmJqWX6wsY3Vu2A+Up1zWc9jaDKtCdDJWRbHb0ZDRPsspzkwZio+p8g
         1uoOKH5b3W92w1ZCRfSnhTb8Wq+zWS5RMK0XsDsFEBHP/H/IXBRkoC1ttLLT251EQI0G
         4UQ+P5l6fgdNfubUblPmmMcoAj7G+8b5GNmmfcObtsjIcd9D/OnvrlPLJCRVbhBWyFCj
         TLSCzIBNZ753zzxuPvCngwFGCBS8XRwqbLzt2TeM0kk071JwPrhunm3lXVMQyM4UfTrV
         K1dsB7Bpp+I8DvKEo7rcAiENpodgzG4G+gSnLaecVWKp6mVq0ewUPOb8kA3VkWJkmdIP
         BVzg==
X-Gm-Message-State: AOJu0Yy0KzORmNeqdbOROCx9GyKI3QjQFiAVYpwdgrT+eb9ne0v1hnmk
	H8YRNtksfKtM56UNwlkcklrf428PcEe38EW33LGe/lXAqHAhwv9nUH2ZvVo7DsV0WfSLoHicXsM
	dokyfrqz4Bv4bQT1bKGQg8+2Mm3Ei9g==
X-Google-Smtp-Source: AGHT+IFKvu1MrFtGivTlGktJtNVW3AlMcmYuI37SJD8pExAUny9c9eYitGH3FDqG3uM0lDhHcBHBVsB0en3Xy3RD7es=
X-Received: by 2002:a05:6870:ac11:b0:261:1aad:2c03 with SMTP id
 586e51a60fabf-28710bd9b60mr2729451fac.43.1727447482514; Fri, 27 Sep 2024
 07:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <CABTo8gBQY3mRhKOatg6P3EYWODN+uSHFdEthpr7YTsa4Nqif6A@mail.gmail.com>
In-Reply-To: <CABTo8gBQY3mRhKOatg6P3EYWODN+uSHFdEthpr7YTsa4Nqif6A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Sep 2024 07:30:55 -0700
Message-ID: <CAMKF1sp8fSGtLfVxTwSj1M7sP+p2-cGJgwuOpyv_1S09xGpi1A@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH] xfce4-panel: upgrade 4.18.3 -> 4.18.4
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Sep 2024 14:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112531

Hi Jason

Thanks for your patches, I appreciate it. I would like to suggest to
send patch itself as email instead of attachment.
I use b4 tools at times to grok the patches from mailing lists and
your patches add double commit messages in resulting
patch which I have to manually edit. In future, it would be good if
you can use git send-email or some such method to post patches to ml

Thanks
-Khem

On Fri, Sep 27, 2024 at 7:07=E2=80=AFAM J. S. via lists.openembedded.org
<schonm=3Dgmail.com@lists.openembedded.org> wrote:
>
> Please find attached a patch to upgrade xfce4-panel from version
> 4.18.3 to  4.18.4.
>
> Thank you,
> Jason Schonberg
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112530): https://lists.openembedded.org/g/openembedde=
d-devel/message/112530
> Mute This Topic: https://lists.openembedded.org/mt/108686790/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

