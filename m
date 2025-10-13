Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6ED1CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 17:05:30 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.web11.50507.1760375127188092255
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 10:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dUQxzzUq;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-638d01a8719so4507965d50.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 10:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760375126; x=1760979926; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFFPuDhJC4CqD6vabwBQuNQkNOuF2eBFlbjXkPdy8ao=;
        b=dUQxzzUqdFrPKcGTatgRbaooDnf5DBwfQTda1ibCWGdDgY/U1BaHaIh7uWlxlxs6Ll
         6jj4hOH7Hk3PebBOXEN1Ze7amHUw5Rwkka0s6TlN4QncNYlAx/pYYJrTQeKOLEkAWgVD
         5o6HA5/8a29IrhEbONqDCbEEPgNBP6f857jIQ12hbYbLrFx4bVOUMWQNs2JHw5rwUcqd
         T8PrjL8whFJxuHBjodL05PKjYh3sXaFjqLKHPUwzj/jTav8EJ+0v6mTGXLawl0FocSLb
         eHJ05jh5i+ys7R1GCpg/vHxKFvtego/opXie5mGfGFOdGTH1SHf/1wBtL8BmehRMrbeN
         4t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760375126; x=1760979926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFFPuDhJC4CqD6vabwBQuNQkNOuF2eBFlbjXkPdy8ao=;
        b=Y1rKDF5+aq8G1avrRXfaMBa+M8VqDsj6W/G0wAfCnhOrDjBqZeh9zaZA0T0AxTc/7d
         T4k6MzgXeqA0gA+fqVIs0sW8EboU3Nn+wOMRAl+fDQdhArzJsprmW8MjDVGz2xV06MBh
         iS5xqf41gv+4yz5PdQQ1ytnO+T0X+2am6ySNHH27QPlXpmYMVzlY1wych4sv9xiZdP4M
         ByJgaLHmHOci3FFhQz5HU8NZudxrUx82uw7IF+l1BsQ73cDBB/CNYE6i89Salpb1lTq1
         ozjOzQN2jDRIY5Q5Kfzh9Jfih7iK1ny3syJNzmfbYZ0Z2kiHPMyPzmONOeAH+qpydt9l
         +mwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9TV+M/agXB7xLQL/idm1sDhfH1mgE6XsR4O4quRbCUlyr7kLXsvaZUwgqsdqLRTJyC8TbMAXmVplu53Tb7dGJeuk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzVPpd1e2kzoOZgX9IwprLLP0vmYp9A/L9uys6FNYNjDVVcCEQa
	Bb14JpwxKwAUMAJUUM+E8s1qwk8sczC24WbRaV9+vOXfAvJjAWa1l483Gkjyt0jDRZI3NqmIxxn
	ZX76YuFqqB8zqICrQYtXK9VHoH1N7KCg=
X-Gm-Gg: ASbGncvBxBgDq+0wbqVhEFHAAI0pSjA1U7v2GYorB/sugZMLUdmnxvX18M5cCwtOt0R
	YmoXQnnTPHqrR3eXvKnI5CIwZsEyMc2UjyuHTAzViwP3taXicXTAAtAzC+Ncm+ff29tj29XdHLw
	tsVzZqloMWve2Wnw7AfiHSiwbSC8+Vrjenq/LX3GbfZNnlQuqlfJ0Ql2muG97LwEr+bPY66Sc1u
	Kcr0IwsiPAs/vK15gmXV6YPxNBsDOmzTmdkWfI6zFUItBdijIAUJL1oSDI=
X-Google-Smtp-Source: AGHT+IH9oG5SWUrEJDoM734Ur/m0/pj8mOxJV8LFNaWP//6VuxNbd3Fsz9IKM9JcTPfOwh31yVuGDerNp78+BZ8lEEI=
X-Received: by 2002:a05:690e:d4a:b0:63c:f5a6:f2dc with SMTP id
 956f58d0204a3-63cf5a70856mr7873330d50.62.1760375126083; Mon, 13 Oct 2025
 10:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <0ac1058a-bdcd-4153-a39c-9a40e392c5fd@gmail.com>
 <8195C691-14FE-43C6-9C78-CA6677FB7887@arm.com> <0544c309-ec5e-4009-a960-07891926eb93@gmail.com>
In-Reply-To: <0544c309-ec5e-4009-a960-07891926eb93@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Oct 2025 10:04:59 -0700
X-Gm-Features: AS18NWBb4ZZCGa-RP_0MdNgrUEwjTt8__zwpLo-YeUx4gfORBC4_p4pnQIS_KWE
Message-ID: <CAMKF1so8MPVbNnzRJWiwSYhB19htoZuTzUVGT5YTHe3w_JFFoA@mail.gmail.com>
Subject: Re: [oe] CVE reports for meta-oe
To: skandigraun@gmail.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 17:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120543

On Mon, Oct 13, 2025 at 6:47=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On 10/13/25 15:40, Ross Burton wrote:
> > Hi Gyorgy,
> >
> > On 13 Oct 2025, at 14:35, Gyorgy Sarvari via lists.openembedded.org <sk=
andigraun=3Dgmail.com@lists.openembedded.org> wrote:
> >> For now this is kinda experimental to see if it is useful - I find it
> >> useful for oe-core, and hope it will make sense for meta-oe layers too=
.
> >> I plan to send them weekly until at least the end of November for all
> >> non-EOL branches, and if it proves to be not spam, then will find a wa=
y
> >> to make it happen indefinitely in an automated way.
> > Are these generated with the cve-check tooling?  It=E2=80=99s interesti=
ng how they different slightly from the autobuilder-generated metrics:
> >
> > https://valkyrie.yocto.io/pub/non-release/patchmetrics-meta-oe/
> >
> > (you can click on =E2=80=9Cmaster=E2=80=9D at the top to see the breakd=
own)
> >
> > Ross
> Yes, it comes from the standard cve-checker, with oe-core recipes
> filtered out from the final result - also, didn't know that such a
> report exists for meta-oe.
> Indeed, it is interesting... e.g. I wonder why audiofile CVEs are not
> showing up there.

AB does not test all the layers under meta-openembedded,  only
meta-oe
meta-python
meta-networking
meta-filesystems

are tested, due to compute requirements. thats why you do not see
audiofile there perhaps.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120539): https://lists.openembedded.org/g/openembedde=
d-devel/message/120539
> Mute This Topic: https://lists.openembedded.org/mt/115734227/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

