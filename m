Return-Path: <coding305@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7223C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 07:41:03 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.26125.1660722061528546544
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 00:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B+xbO166;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: coding305@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id kb8so23109338ejc.4
        for <Openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 00:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=ypK6GrtlGz+0WEgga+1le7y4Fzmr0DHutBcGWTaFz6w=;
        b=B+xbO166ol3E87u/GtkrZ3u4OQOniEpQvDMIX29HJ7DDRYlxYRonQXp/13IXSTd2h5
         CAgr/sUbBSzVfl9PJPU9B2kDarUAZrYYmRRhE+wUU5L9yT8veorE1ciNYKeSuSWFHKCK
         Oi2GcrJ9GCntcRPQUYi647b7bSBkdGCkjNZDRVkuir02DCxasEgOaOOeXVQP2D/alk0a
         96jDWypiK60tgPRp0ktwz08a3/6BYNfkyaUWx10n7tfeFq86Gw2ciL3A3laYzcJrwpNM
         zsRJOcWYeS20uKzJQ4qaNi7Q7u0HxB/d8QWoofNATKUjiYD8ehXJ9vGxPnasK3u7Ew9n
         rL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=ypK6GrtlGz+0WEgga+1le7y4Fzmr0DHutBcGWTaFz6w=;
        b=yK6v6RXOoDlYTvMnATdQH9Ip8cP8a3ago69rNVDf01GlVNMqtNT2H01EtefVjVDjrZ
         b7mEnhS2bmr8jWAxaSxxuoDKBH3pJscRdc0mOhGpMW/4dj+GtMhpmJnEnMiCgS3wAAtv
         nSkW6nNeNJBjwC4aDZzRV4cNbDFLjZwsB+I5XE81YrID5KpDROtHrEbea6pFzKYWY7H5
         2ifa0RNMO+zVybtWp6A8sYYPSy4PRutpzBGIWs/ZW49/5ZgB0m/89DYnzByRjW5lX0wt
         6MoV4nmOEcDL5cFFuOmnfCqrAHrUUYmSPNNGUSbcfEOuaw8AReYAkt8/SHSKITn87nF2
         BA5A==
X-Gm-Message-State: ACgBeo1Pnd6TsTUXACth9WsBqcDxdzfPfmcqnddvydm8mh7ElpNB8K/1
	NtMhc/78WNXcYhnb/yECxZM+BDFo7u9nrfHx1XA/5VQVAas=
X-Google-Smtp-Source: 
 AA6agR4VEt8PjQynshQ5yAClaMjq+4q7YQcDAcenC5VwikGpAsn4wzI7RCuovQyYKtaIhnMTZ6lQ+CzEMw5vj4Ilkwc=
X-Received: by 2002:a17:906:5d04:b0:722:f46c:b891 with SMTP id
 g4-20020a1709065d0400b00722f46cb891mr16427297ejt.4.1660722056461; Wed, 17 Aug
 2022 00:40:56 -0700 (PDT)
MIME-Version: 1.0
From: ens ron <coding305@gmail.com>
Date: Wed, 17 Aug 2022 15:40:06 +0000
Message-ID: 
 <CACaVmhdGHhj4UgYsk2YzJiXx89_3iYvvwtqMwhODNuVHeR=_hA@mail.gmail.com>
Subject: How run glibc test suite with OE
To: Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003f026f05e66afcc1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 07:41:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98288

--0000000000003f026f05e66afcc1
Content-Type: text/plain; charset="UTF-8"

Hi,

I wonder if OE is possible to run the glibc testsuite? My target and RAM
and RISCV boards and I run the testsuite with cross-test-ssh.sh script but
there are many issues, I think OpenEmbedded-core can provide host gcc on
target so I can just run `make xcheck`?

Thanks in advance,
Tim

--0000000000003f026f05e66afcc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I wonder if OE is possible to run t=
he glibc testsuite? My target and RAM and RISCV boards and I run the testsu=
ite with=C2=A0cross-test-ssh.sh script but there are many issues, I think O=
penEmbedded-core can provide host gcc on target so I can just run `make xch=
eck`?</div><div><br></div><div>Thanks in advance,</div><div>Tim</div></div>

--0000000000003f026f05e66afcc1--

