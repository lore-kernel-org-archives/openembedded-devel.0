Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D77C433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 19:58:31 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.1417.1643399909842271349
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 11:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g/D+YUxf;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: festevam@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id p12so11950627edq.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 11:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2vEoRk5Z89I0Q/E0Bnzg87X3eYHQJzJ9VJ7+ebDbb/A=;
        b=g/D+YUxfkJTDYrx2sRpavJX8V24k1/0zZY1ctQJqLfFug056A7Y6OyVemfXenfWbbK
         zT3ql+kvQclyyKl4nPZ7Pg6dkPAQ9dtVp0ebK/WLdxJjiLUitc5wEjFvfrVs6uZboogs
         987P1RlRngvFtmTMHaK6J2tTono4EHNxgLnUZ1lHlg1YYnu/hXDcRDPjuVuSzKmN+ymG
         /wFv2jeFyeZsdRh6Ybm0bRTgZFO5lirvXCiygyEN+ssQt6HrGeIHJQhIvAgNnz5bKvJb
         +r3bCzEKxPFb2jzhj+hkAotbj9xUnksszcltMZZjk620DJhPflxExQYFl/8gms7vPIGo
         BLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2vEoRk5Z89I0Q/E0Bnzg87X3eYHQJzJ9VJ7+ebDbb/A=;
        b=PpPK/GJpCMs9MQKDmhGamU8gul0IIS3AP/hzkb3JG2IE7pL0a15sGJ+mBZeRVfKDwd
         prQ8ZA49829tGAgszb+o6X4huFrxKItJOCn1EQbq8mCEbjpoXZVmw2gyPSgVsj9cfPcp
         y9XGtH1RWEaWzdgIWRCAqMEtisMtFCVtduTuv5iKKcFwglYjZyXVJ33mpFF3T2e/YSUf
         zsppBm+q9dMxhMqI+rR9uqPyf6ATUacyyd/OBe5KNOiTSwqSry6aQkCX7Xy0LShwO3x8
         bFh+BIBH8d+dwrTsqcXM/g2fZ4vYih86bP1ngNy3Tf+S8JA9MeorUpKcWucjI+QIE86v
         zpgA==
X-Gm-Message-State: AOAM531kkVNdhcHe0BI0Vfg+akBloFuSpZdp0jCWCb/0I0/zt8FHpkIU
	opGdTWDGQ+Q1hC9ETSDF9k0rHaZyVfZ4od3Kb4g=
X-Google-Smtp-Source: 
 ABdhPJwXDUFX5FRo/TKTUI4G18wBs8JeBXWrcsOcVkwPjmUyskAfc0fK/tIZDUSpTsRivppCmPMDc2XHSobxt/yJ0VA=
X-Received: by 2002:a05:6402:2548:: with SMTP id
 l8mr9650618edb.77.1643399908218;
 Fri, 28 Jan 2022 11:58:28 -0800 (PST)
MIME-Version: 1.0
References: <20220127230607.35740-1-festevam@gmail.com>
 <d204889ebaf04514b6ec2863a5104052@axis.com>
 <CAOMZO5DmubmJmVgTwVdkVBOc8h7+Ep7C2n0eRSKbhDMj9TimTA@mail.gmail.com>
 <CAMKF1sr+tUripPnYtWz+2xcwAqJq4QMYYkE82nobkw8i=N3bHg@mail.gmail.com>
 <afd084404e704b268d2f6c6adb104bc3@axis.com>
In-Reply-To: <afd084404e704b268d2f6c6adb104bc3@axis.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 28 Jan 2022 16:58:16 -0300
Message-ID: 
 <CAOMZO5By95LJ5z3e5+ykd-V9DuuKBd0xj83ixxZRtUreqEy=KQ@mail.gmail.com>
Subject: Re: [oe] [PATCH v3 meta-oe] rtc-tools: Add a recipe
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Khem Raj <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "hs@denx.de" <hs@denx.de>,
	"openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
	"otavio.salvador@ossystems.com.br" <otavio.salvador@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 19:58:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95163

Hi Peter,

On Fri, Jan 28, 2022 at 3:36 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:

> @Fabio: Are you sure you built with the correct version of the recipe and=
 Makefile when you got the error about GNU_HASH? Because it should work (an=
d I=E2=80=99ve verified that the files I built have the GNU_HASH and I neve=
r built with the TARGET_CC_ARCH line in the recipe).

You are right. I rebuilt without the TARGET_CC_ARCH line in the recipe
and it builds fine.

I have sent v4 without this line.

Thanks for your help, really appreciate it.

