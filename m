Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDEBC433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 00:13:35 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.729.1642119210531546380
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 16:13:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Sodoeryv;
 spf=pass (domain: gmail.com, ip: 209.85.166.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id z17so5087832ilm.3
        for <Openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 16:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=v4x3EDHcqyN6XpRtrpVeuuSMtPs5tsiXufzz9pBokDk=;
        b=SodoeryvK+AfnDJ/OFRJkj2+uRzXApnnSG3elP2EA7yYOQh+FXfhIlPxq15ekIPjMX
         1g3RZyUTiyDE5M03iUFM3657dmscSHn2viRM6MR+iAl8NOOyR8hJMjImqiSlsR/tyOqT
         paYYG+dKXNLj0ckC935a1dydyS6Xt8KsohSxMxfd8Hn5nXU/XezODowZWjNK7wBCPg+s
         3cbusVTBOBD6cz/+fEiWFFYVSQ8beY5iTEZYWDYFlYIk6NJf/9ukD5hpEz3nxkbuy0eR
         jx+Tw6HPQNP6VdriEgfoSTb8ZXDo67tKFVHjYl+FH7atLdDldyXXMzNImlCQlyilPs1E
         Sp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=v4x3EDHcqyN6XpRtrpVeuuSMtPs5tsiXufzz9pBokDk=;
        b=bGu9yAs40bZYcel0RTgYT+GDxOk6DW0YtIKI/5dXjV8GXhjt3wb3fAQal5N26bF4qO
         llcFDhkaU9mVzaUluOHR4k2KKZ7vd1uNUxmi5RUMSE285/scqHmGeRqZWqbbM/stjYL6
         ekFz0YN5wPrj+N+MpGivdClKxvRHRnwEbPhD8jNEzTlEUmSSkgSJEPMjl9Lr3iQNxrPD
         qmIl/FJknhzKTgVVYuvhZ9bzsu/6mScm4T7LVXwGnwuu3WA6omT9ntEvoqagQ35u2cfE
         aXtQ0UlVZi7WoyB0HhYK52lhOQuNEdvoGCo8EEQYYEPvw5qrCalpAs/T1RfF+RcHJBKi
         eACQ==
X-Gm-Message-State: AOAM533BdwkMeSdQxDA4sam3hKXFY4xxivkwxJ8KNFJ3c0c6HZ8FbDlT
	6+o/GY2uYkr7POjhQwKr1bzVlV7qtrJsSSlo2Ry/HKA75Kw=
X-Google-Smtp-Source: 
 ABdhPJx5zWzUKtB/k2yVDM12L97x39qO83OaLAXZprRK86ThCH6B5M3IpwOndAwTaCOpD2t2xV1ieNCyNcQ00pPp1yE=
X-Received: by 2002:a05:6e02:1a0a:: with SMTP id
 s10mr3748778ild.217.1642119209599;
 Thu, 13 Jan 2022 16:13:29 -0800 (PST)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 13 Jan 2022 16:13:18 -0800
Message-ID: 
 <CANx9H-BdfS-uD_zzdi6Cb8P3JF+xt9yPGdAx=WwmjwLn=9WW5Q@mail.gmail.com>
Subject: distutils deprecation: call to arms
To: "openembedded-devel@lists.openembedded.org"
 <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002ac5a505d57fac2a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 00:13:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94813

--0000000000002ac5a505d57fac2a
Content-Type: text/plain; charset="UTF-8"

I have created a wiki to help track the recipes that are using the now
deprecated distutils* classes.

https://www.openembedded.org/wiki/Deprecate_distutils

Please put your name next to one of the recipes and dive in and fix it or
at least add notes about upstream status (we might just mark recipes for
deletion or at least drop from world builds).

--0000000000002ac5a505d57fac2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have created a wiki to help track the recipes that are u=
sing the now deprecated distutils* classes.<div><br></div><div><a href=3D"h=
ttps://www.openembedded.org/wiki/Deprecate_distutils">https://www.openembed=
ded.org/wiki/Deprecate_distutils</a><br></div><div><br></div><div>Please pu=
t your name next to one of the recipes and dive in and fix it or at least a=
dd notes about upstream status (we might just mark recipes for deletion or =
at least drop from world builds).</div></div>

--0000000000002ac5a505d57fac2a--

