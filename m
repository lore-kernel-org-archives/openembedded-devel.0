Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web12.94.1585801568054702092
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 21:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ISpchNZq;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id g15so2279296ilj.10
        for <Openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2020 21:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=JnvGxfCn39XiAi4qbEdxl33hwzBMa+FkeUDuGBBDU68=;
        b=ISpchNZqLkwS84rdK5khKfN+8HXxbV5sjjAyC4FdRu5R9rf97gx0ZKYIcqqEZY/j92
         Zl9PdPfY1Ua2PYgpIWPcgOgZ39Hbv957CqJ52LhQ88EQPoEORvEctmZ63/3T0/SEpZa8
         nH1TRuoZci5jWP4hvQ4DgCmm5/jzzEiL44eqgllTLNScbJZiyb+FdVF1GwpPWnH3G5Nh
         kwOfOO0COjZA3t7JH/c71TYp8bL9t71OhrrKsHMTVFdACrwOGTYJcCujYAr2Mdrz/YqE
         vjE8yyPJoCOpuxTROCPeH2IfhYcKxsrboDnq/2qIsnuI3YywRQia9MqZH+TEoTk/I5O8
         s8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=JnvGxfCn39XiAi4qbEdxl33hwzBMa+FkeUDuGBBDU68=;
        b=UV6XnPboqLRoP1qVeWa/dI5ft7s7sy5UAAXbEPK3z/oq/9NyJOF0xSScdg2W4Aq0/8
         WK+seBgFYXgajoDXG7AzRCCOw8Qrrj735bNsi1xiNVsni/jCNr5hmQ5qmceFeDlBHCNT
         VZtyh/qEaS+M6GBM8bOylnGvEBxt40PUmiKIE240Ug+XlMPFrzoQdC8yFIF6dxlqMW2v
         Sc1tOJQruwSp4cMRD1NSDrC5SDTcyi9jKNuCHgOFIdBNBgBdPBPSYJc6c8suEkuR0Ek9
         WMDDgjMr3a/Z4BKWmkg+mWxBSkmmiJfXjaTXQ9Pr55ioevZKslfrzwHX1lvBG7a+X0AV
         /Fzw==
X-Gm-Message-State: AGi0PuZRrC/HL/Hc2LMcshaP15G9EjXKA0zlv1Y/P3TQjV9GHMVR4yo1
	Im7v6p3lU/sr65OSgMU4w1TdlwiVzts+nzHODOOrhbp4
X-Google-Smtp-Source: APiQypLjCqXILSr8BH+ZtG0f3HK9tNTZvg5UcqazA1ItzKtEIYWMBv1N4Ga5bN6kqXXIXfNZ9hcQ4M8/WdqCIgSVJyg=
X-Received: by 2002:a92:d0d:: with SMTP id 13mr1466641iln.170.1585801567251;
 Wed, 01 Apr 2020 21:26:07 -0700 (PDT)
MIME-Version: 1.0
From: "Tim Orling" <ticotimo@gmail.com>
Date: Wed, 1 Apr 2020 21:25:56 -0700
Message-ID: <CANx9H-AEEPHqpeNXZhkn_154xsysdsFq+wbjc71nCkWAz0=Jww@mail.gmail.com>
Subject: [meta-python] Call to arms, help wanted
To: "openembedded-devel@lists.openembedded.org" <Openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000019b0dc05a2473318"

--00000000000019b0dc05a2473318
Content-Type: text/plain; charset="UTF-8"

Now that python2 support has been dropped, we have no need to maintain the
.inc and .bb files. And in fact, this makes upgrades with devtool more
difficult than it need be.

Please help the layer prepare for the dunfell Yocto Project 3.1 release by
sending patches to merge the .inc and .bb files.

If you are upgrading a recipe in meta-python, please use that opportunity
to also get rid of the .inc files.

We have a limited window before stable release branching will occur, at
which point we will all have to live with the state of things as they are.

Regards,

--Tim

--00000000000019b0dc05a2473318
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Now that python2 support has been dropped, we have no need=
 to maintain the .inc and .bb=C2=A0files. And in fact, this makes upgrades =
with devtool more difficult than it need be.<div><br></div><div>Please help=
 the layer prepare for the dunfell Yocto Project 3.1 release by sending pat=
ches to merge the .inc=C2=A0and .bb=C2=A0files.</div><div><br></div><div>If=
 you are upgrading a recipe in meta-python, please use that opportunity to =
also get rid of the .inc files.</div><div><br></div><div>We have a limited =
window before stable release branching will occur, at which point we will a=
ll have to live with the state of things as they are.</div><div><br></div><=
div>Regards,</div><div><br></div><div>--Tim</div></div>

--00000000000019b0dc05a2473318--
