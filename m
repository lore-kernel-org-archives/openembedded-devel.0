Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 769C8C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 15:53:51 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.20161.1704815629571029568
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 07:53:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z94zOU0q;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e7ddd999bso3360272e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 07:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704815627; x=1705420427; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QhJ5ozeWKtVJ1vW/WHnAAL9EmqJg0/inPvqjeniSBA=;
        b=Z94zOU0q0WvIjE0qh46+FzHHt/7mnKKygX7tQwHxvdjc0mBxPARO7al0dAwoe9jd6G
         1z9Ddb4RptJ7yHlgLR0E90gda7BsESXEvz50IdOlbPpObeppD/yAYaIiXQqJVCTcqkPR
         W/yUF0cpRzCtoV4H+Rn5IC4BBmFBRewdjEHQHNM4qAoc89LEtsVE0siiIY9KRGHngnoo
         IwGcMitTI4NmOoI77vO3+XOFUpKPW7pFEMJChH8tAn199MmjvmhAGwBomHmvBTS7I0i8
         D7I8s6+q5Xv1PeJ5CDDfyI3jls3T9lPXDSDZSVc/7a7hgue4M5IURPqQKbPS6FilFWro
         PSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704815627; x=1705420427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QhJ5ozeWKtVJ1vW/WHnAAL9EmqJg0/inPvqjeniSBA=;
        b=oXJFrg9T5plZUmzAwWDjb/BWqt3I8WjCtYo+72WSBPZnO7xxHr/BDUhYPIQA3ZkOwr
         NR2/IlB4oOJoEPfmVecDAzwjcalsnDX25c7iP2paNPUWRplWMvjwBZWh2r3EoSejckgh
         u8PSABy+6fkJvsiohADkWHMR9WxLxdpbJ1QDWAfxFR3ceru+VBExYx5df6HGnz8JRGNk
         IfxRzt8JoimtW7RiBsoBY5NKSKcpg2bevZEx9n9hxTPV5MznAQl+bsr6A+0ay0wdTf72
         IJCUwmxIbjd/gHcGPHVBfjNClF7shEcI0LNDfz/neodVF7TSH3U1HWA8rAaHp04a3OMP
         bt4w==
X-Gm-Message-State: AOJu0YyoV8npzG0rjOHC9znolNydTDLzycIjZDqwJ1D7XUAY7snnBYei
	ocHYYWt2bZWIVpzrvSDxKVP+cczr84uB3T4aOsU=
X-Google-Smtp-Source: AGHT+IEDIZYzFjTtBsA9mTUx5qO6znoEnufASEcuOAN930ZJ6ne8Vp9BXJOKQQpcO3wZ+39n+JPAgSZdGUnE+cJXwF4=
X-Received: by 2002:a05:6512:1304:b0:50e:b206:50f6 with SMTP id
 x4-20020a056512130400b0050eb20650f6mr3085850lfu.62.1704815627354; Tue, 09 Jan
 2024 07:53:47 -0800 (PST)
MIME-Version: 1.0
References: <20240105133611.3018041-1-alex@linutronix.de> <20240105133611.3018041-2-alex@linutronix.de>
 <CAMKF1srDmU9h8xP2JGX=6otiRGqVPKr4ZNX00bicU-R=C9ipmQ@mail.gmail.com>
 <CANNYZj8kkMN-dzw2YzXEQ1dTFo3d+Bg5jxSe9VCLDyF=DNFVPg@mail.gmail.com> <CAMKF1sq4Da2ESxyO5vdrqiGfeCYptebHaYU4N0XA5m18wAkPWg@mail.gmail.com>
In-Reply-To: <CAMKF1sq4Da2ESxyO5vdrqiGfeCYptebHaYU4N0XA5m18wAkPWg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Jan 2024 16:53:35 +0100
Message-ID: <CANNYZj8aNPBShQLEjLrdHW5a6GoAStWN7eTsM96qZR9hpUKf-g@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] python3-kivy: update 2.2.1 -> 2.3.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 15:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108202

On Tue, 9 Jan 2024 at 15:57, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Jan 9, 2024 at 1:08=E2=80=AFAM Alexander Kanavin <alex.kanavin@gm=
ail.com> wrote:
> >
> > I think it's clang, so needs to be added to conf/nonclangable.conf?
>
> yes, Although it will be good to report this error upstream, since
> mixing const/non-const types can have
> unintended consequences and result in subtle bugs.

Reported here:
https://github.com/kivy/kivy/issues/8557

Alex

