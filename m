Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8795C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 17:57:06 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.19645.1747418217645365879
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 May 2025 10:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XDdCi3Rd;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72c09f8369cso1180211a34.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 10:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747418217; x=1748023017; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/M8VNwCq55Q4C1AFwhYbuiAdDuakI0+uaEIvlzWfyw=;
        b=XDdCi3Rdwsw998O0QEvjkGsr5BFNEnUP9GISA3k+B6fDlHIYqrRJK9QEhgV/D7PLUP
         SNj9cpYf0zORfL0hH+mYq5foEmc2/EYEQYbNCbcwZZNPgf6vkejG6hbkmAnFKE8Y1SGq
         o0md7tRnEgrKTErwb0npfahRq/ortyBD1ff1yKq9OzUBKQ4Hqtt1ac9GjU2on0TXHrho
         iplOdTdjVfB3jcRtOK7V2kRtKKjHICGoQbOqRE/g+EBdl8JtaW54viRSTcA4SwRul8dI
         Lf0gnvi0vLnZe2Ja2BXXmW0WXfN+qKK0VloGIhNpznrgNdqYkodTJVsLax6+srfmjVgJ
         9oiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747418217; x=1748023017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/M8VNwCq55Q4C1AFwhYbuiAdDuakI0+uaEIvlzWfyw=;
        b=rIVo9Zywi5r8k/IP4SA4shZvaKB/nuGQ/pjnd3nIwYFwVR3NKucC3GgJ9WPgBgr9Jm
         ga2svThRiGcJkNid+OVWOfq0GMqAKxhKtUx7PUFem50Dw/AL8MilmLXJ1najNQqIObgc
         JVCdwqlh6G4uiS5h2ObWl7qda8x4LA2jEqNVkE53IwoH7QymPR+mWJPBcaWdVAknTsUY
         OlUnkl6zpZSCvThX9fmm/gheTzLNh+jCZktG2oAvPWz63GZSQmPFkr2dWawIbw2Fnkdf
         L5yhiX7+4is8G8cT4HMSBjeAItz4h/pI0+pu2MV/A0BGght2tSrhJWazNCD8dvRGl+pC
         xe5A==
X-Gm-Message-State: AOJu0YyF1swY7pbzR0w9JWd6dzsxvcqPAxj/8WLVnANcqXeCog1UuDJQ
	KZFhNtR360G0bJyLXU4WEXqSbYZyrvnBaoatQemv3GQF/m2CHfFH6qd1/uvnyuI8MwHOLV9d5xG
	juhIvRFG7sHAjGnauG81EYBUThIuRqjQ=
X-Gm-Gg: ASbGnctlK9IhjIVV/oGtHPzF29kCGvSrV9UHT5onRMQPQu6rsY5ZxLVCRrLk32XaYXQ
	OkOsB4iKsNiXiV+tkcBK5Ak7d253OfACbVZJ0jfwPmXrlfOH7QnQ06uibnbsEXCMx5XXh8YJjU4
	Lr28S2eYRBB25LdpNkO8hh87cMpe+LRNi1
X-Google-Smtp-Source: AGHT+IFDStjf95myTA1IzfmTQxKQq7VQpn3lBXHMmUhVCNofjkWO6XeJNPwNuQkexTIT4Azltrdv04eDqTs990w1hTI=
X-Received: by 2002:a05:6830:660c:b0:72c:404d:dc38 with SMTP id
 46e09a7af769-734f6b6e20dmr2558052a34.17.1747418216825; Fri, 16 May 2025
 10:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250516114435.1936780-1-pkj@axis.com> <CAMKF1sqwaZy-+-nOhF4GQA+KA_CtszOZgg6J8rh4h9nNEdP9gw@mail.gmail.com>
 <DB5PR02MB10213F7B7704CDAFF96B487A3EF93A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213F7B7704CDAFF96B487A3EF93A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 May 2025 10:56:30 -0700
X-Gm-Features: AX0GCFsx-I4y6IqpssqOOz5RCKj61QleyIthzhAt1rBvAgcYX6In1ruczm8Di8I
Message-ID: <CAMKF1spR1_QYQp4SCP4s92zFy4KNrjKfwuN_WDTz2mFEZObCXA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsoup-2.4: Add recipe
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 17:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117437

On Fri, May 16, 2025 at 9:56=E2=80=AFAM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: den 16 maj 2025 18:11
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-oe][PATCH] libsoup-2.4: Add recipe
> >
> > Thanks for the patch, I think before I accept this patch it would be
> > good to take and opportunity to minimize its use in meta-openembedded r=
ecipes
> > I have sent few patches, there are some hard dependencies left to addre=
ss
> >
> >  xfce4-weather-plugin, librest, gstd, libgdata, dleyna-server and dleyn=
a-server
> >
> > All other usecases are either migrated to use libsoup3 or are package
> > configs disabled by default.
>
> Ok. I'll add it to one of our own layers then for now as we still have a
> number of recipes that rely on libsoup-2.4. And inform our developers
> that it is time to update...

Its in master-next and I will wait maybe some more for more fixes
before we get it in to let cleanup happen
I have already sent mine.
>
> //Peter
>

