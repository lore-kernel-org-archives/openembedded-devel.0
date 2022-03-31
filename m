Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182DAC433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 17:48:38 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.124.1648748917470273774
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 10:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i0eGa2eh;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id v2so132373qtc.5
        for <Openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 10:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=moY0Kw36guHSNUE38qor/FWJ+fFtbnHLGvJzaRALvog=;
        b=i0eGa2ehd43yzBq5ZhDZV1bIMgVDLSvAMM4Q2L23l45/IMj/7KKAbpn8Ki/NmNV8mg
         grO13ZWYo+/FRDeT/VMLy1ng/FWq2pMfH73Fl5X0tJMgWQOpI62mY/doG/Fxt59YB1yj
         KsB02B9Kz0xDuTkh3CRfRijO1saWFnlLCtybIqAgqW0PY+AqgHLFeBKhoMTbRro8EDdn
         IQFgB0hrWTEh+5oG8BhRTVQjDMRmxK1Yle5xcXu8k73JXicFxoLIZiWg0Kp96Ba1zyfr
         J1Y96Tc6sfj7PhItIBdmOGxt3Ke1ufIY+NFoX7ri2HHqwkZycp65em6tmMC6jDatyhVG
         srnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=moY0Kw36guHSNUE38qor/FWJ+fFtbnHLGvJzaRALvog=;
        b=H9JqvUZFBkotIaXBGnUJpicNaj6ns9pQtygZ8EJzn70EmkseMDDKzr4EZubvPzjj33
         +UJuGc6ECVL1ArfHqU0ryG/QZNdMsMDd6XtIiQusKiMRg2he03fxn8INzrD4A+QD//m9
         PVfnoHC9GFotVEbaMTMP6hOKFN5bDuuRYVF3q4n0/qaYkBOVgC9IuX3DxoMuvIqEz8Ha
         Z3Svbjol0dSQKZ0Svj3OHuAZMcJCAYqTKMXMexUVPPRxj1H0cupjGsmTLlmJPmQzRm+u
         dTMbSpW3aWliVVBXZ1IsHBI8gMlZgbxrC3bnD0mxAP0goZS3Aecvc7CQYa4/PMld7PHN
         RuKA==
X-Gm-Message-State: AOAM532qqMIbfykaXMJKRIGR8ZpwQDTi57w41oSwTTrGp4iiS9G4+DKr
	Z6dG/dv99NU5DR7K+cnAILLXpnCsBFIGWCQJdOQApZEH
X-Google-Smtp-Source: 
 ABdhPJzbPX1bIfiOuTnkvXMunuqsoos02aj91A++V0lenvoJtaBK0QUPs+le5ODwryd3RJMl20xCaFGnN3zjhV/JGW0=
X-Received: by 2002:ac8:5a84:0:b0:2e1:4f1d:36fb with SMTP id
 c4-20020ac85a84000000b002e14f1d36fbmr5355913qtc.54.1648748916307; Thu, 31 Mar
 2022 10:48:36 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2022 10:48:10 -0700
Message-ID: 
 <CAMKF1soVjOSJ_op8r9djZD1r0qjxkpA30phUQ20kUaMeR0RKyQ@mail.gmail.com>
Subject: 4.0 release (Kirkstone) branch schedule and maintenance.
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Armin Kuster <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 17:48:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96303

Hello All,

Armin has graciously volunteered to maintain kirkstone stable release
branch for meta-openembedded set of layers. As OE-Core has branched
out for kirkstone, I would like to wait 1 more week for
meta-openembedded to branch out kirkstone to avoid a bit of duplicate
effort. Let me know if you have questions or feedback.

Thank you
-Khem

