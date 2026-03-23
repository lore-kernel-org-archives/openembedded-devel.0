Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F2AF483EC
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 19:51:58 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3783.1774295515813060976
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 12:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OEwTjraU;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d7ebe11bffso3048597a34.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 12:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774295515; cv=none;
        d=google.com; s=arc-20240605;
        b=ShIzBkHRhGDqKUjrjcgwtrg7h5N9kglrb6EeCIYXuj1wmpjR8UUXX5LVnLvDRzEfND
         OpsHeX69mq2w8Lh/PnMgYGiXA95iqD/MHWYE43qQV6GyyMl1GvkZZb7c8a2jobt4KAPd
         sME370FzRJEZONhc60zX+Y4eW4ZdnwJHLukpAncrt4AKfpx3PKjoET6tP4iGhg7DdfPF
         9rDHW8ecIbYfhxHKbcJVKgx0yPueh8UYzsWTDVxUNzXv2ocs3QmMl7vW/5ECoiLWkp/h
         arM2FZuEMuYVSIj6YJFrIzXVrWrL8vWeYUe2bKDcuIChds9Ki+5cXFQV3LF55hoFbsGL
         gNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9vmddBHK8wrLZJf87CFd5XOMr5LfRYMRYfDfpD6i8sc=;
        fh=U2Dan7hfekB9wNyi01PMtyzA+CqyoEK6y+FQAJceQMA=;
        b=RTHk8FLEnytRAukYdGq1MMPx0arMEgmTVTrgiCF9CG2+eSocFi12I0wP8yLfXoQdw/
         /w9ndXgYp6bthHre3ldoDCOJAsO8IaxgoeVt4CuFB8YHSA23LAOa5nxmk5rwY2A4DU3U
         lK6m+4WlvupEoZbLDxVMh2qs/NHT4nk+iYTH2y2yNIOlEsa3l5Anb8EifjH6W1+OG5oA
         72+1sc7Q46E6epY0iBMpHCDzhrVkeBWuJFLZi02nzZMvn0KGR4YVYg8b+bEur6JB6tcs
         1O27g0SEtNX184r/COY6Qt92FPPtvZse5/d2Tv30UIxoxiSG/a8pgP2CYN6le3hqfsVS
         1DSA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774295515; x=1774900315; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vmddBHK8wrLZJf87CFd5XOMr5LfRYMRYfDfpD6i8sc=;
        b=OEwTjraUYbNueL3svdZSUVyrp0udD2cLbBEE0gPvbFpEXdMOJ0BYB23ODtEgnmC/6S
         kNIeuBR/wUDqkAHDoMmkGlXcySZz4++NyJ2YkR2zJeLqBXzhjq8tqF8eyONj23i9BJIF
         IBdSMpNOP7ImROpSSsPrEsBOwCdvbx6Pfl7CqVPzNNtrGWRq4T3tEKuSutn93+cZLiL0
         dljpmiT3VDhBWK0h0lujsX1YKzQuyhtkHbjfNlf8E1dKPHQmpf5+dLSE6PwbXX4Y67T/
         37et4RgQnFx+vHZTgN3oVJuFHEXyPeMjt/EjH0hPW85uhsgoAUYRDBDBwb9Bn0+usU8L
         iWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774295515; x=1774900315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9vmddBHK8wrLZJf87CFd5XOMr5LfRYMRYfDfpD6i8sc=;
        b=XSYHoHcmxSRDiQFxZBiua5JtP+Q9GfzWiQXhF0MqxsGayJIVANqokcuDxSf0cMFN7g
         Ts2LAzgDETAj1CftVj9WgTQxDu4dBroGcy2ckpo7X+OqxgFPnw/IqkwZiiFtdlWfgnqm
         xSjjTCD1Q6PUHOiVhNtYCrmg7uBrwBPmAZLzb3Ys2Jfdj2XHQ5ojVCx4RpzOMrkVftSg
         VdmL8Mu3yGqMTo5JshCFrX+beRv+E5u0NR62+Jj49Qp+D9mdWlI/hqJHpezVhIs+1HZ9
         5wIaqACCTpgPWGusB2xlCVbX4n0mNyKLkzpVC50zrogN1tIWgXvsQ3QpFQ6km8W5wIch
         DoWw==
X-Gm-Message-State: AOJu0YzBCfmsXUUmRBox3kIII9E5nxWJv9QAr+HzUd3GUs/ZEQxXUQ3O
	KPKfAa9aLhe3kN4vH+dvMb/QUsMhrz9N4APSWfP2bTehBIar1njiclcatlB/st1QrTI0dUggkiX
	lPMd3Kk9MF7CpOYosGtr95oAsto+uGrU=
X-Gm-Gg: ATEYQzzURdA8ML1va721ZEU0N+QHjoytph+sFNlh6V/YqlaxErIs342uenX5A6I36L9
	pVl3jxZSUlvnWrUcRmPey3d+xYdR70DjRysZuwB/5RJrGaktvDgsuh0kXKRw6aamdiQfRgCZdh8
	TwJQPgOYfMwj7CoN4YHni6jwZ1QKwQuYp/z4vU1+sQ2ayfge6cSM/Y6gsO3tLWbzgG13HjbPsks
	fZSTKqqzuAkBGc1/2TXJcrADs6cK+BZ0J7+bgsHTBhRgacoLypSDd9QGPWdPgAt8Dnl/b9j2Z5w
	BKWbK22MzvOG8PyU18A=
X-Received: by 2002:a05:6830:2685:b0:7d9:ad90:5670 with SMTP id
 46e09a7af769-7d9ad9062acmr6020606a34.18.1774295515004; Mon, 23 Mar 2026
 12:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260323103724.2341742-1-ankur.tyagi85@gmail.com>
 <20260323103724.2341742-2-ankur.tyagi85@gmail.com> <AS1PR10MB56972570AA535263AE8F173AFD4BA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56972570AA535263AE8F173AFD4BA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 24 Mar 2026 08:51:43 +1300
X-Gm-Features: AaiRm52TjRezW7sAmT0xrVSq3hp0mGnzfNzSJ3PzAjMsERhOvpSI92FvLMfA1Os
Message-ID: <CADySD0H2kJA_DF4NfJ89L+f7HLmf9rj2JUiF_dXadaR-URP_3w@mail.gmail.com>
Subject: Re: [oe][meta-networking][PATCH 2/3] wolfssl: upgrade 5.8.4 -> 5.9.0
To: "Marko, Peter (FT D EU SK BFS1)" <Peter.Marko@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 19:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125527

On Mon, Mar 23, 2026 at 11:55=E2=80=AFPM Marko, Peter (FT D EU SK BFS1)
<Peter.Marko@siemens.com> wrote:
>
>
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Ankur Tyagi via
> > lists.openembedded.org
> > Sent: Monday, March 23, 2026 11:37 AM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > Subject: [oe][meta-networking][PATCH 2/3] wolfssl: upgrade 5.8.4 -> 5.9=
.0
> >
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Conatins many CVE fixes:
> > https://github.com/wolfSSL/wolfssl/releases/tag/v5.9.0-stable
> >
> > Dropped CVE_STATUS for version 5.8.4 specific CVE conflicts.
>
> CVE_STATUS variables were not updated in this patch.

Thanks Peter, sent v2

>
> >
> > Ptests:
> >
> > START: ptest-runner
> > 2026-03-23T10:28
> > BEGIN: /usr/lib/wolfssl/ptest
> > ############ Running Wolfssl Ptest ##########
> > Wolfssl ptest logs are stored in /tmp/wolfss_temp.Y7VEJ2/ptest.log
> > Test script returned: 0
> > unit_test: Success for all configured tests.
> > PASS: Wolfssl
> > DURATION: 130
> > END: /usr/lib/wolfssl/ptest
> > 2026-03-23T10:30
> > STOP: ptest-runner
> > TOTAL: 1 FAIL: 0
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../wolfssl/{wolfssl_5.8.4.bb =3D> wolfssl_5.9.0.bb}              | 2 =
+-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.8.4.bb =
=3D>
> > wolfssl_5.9.0.bb} (97%)
> >
> > diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.4=
.bb b/meta-
> > networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb
> > similarity index 97%
> > rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.4.=
bb
> > rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb
> > index f16c8c1e68..625ee66609 100644
> > --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.4.bb
> > +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb
> > @@ -17,7 +17,7 @@ SRC_URI =3D " \
> >      file://run-ptest \
> >  "
> >
> > -SRCREV =3D "59f4fa568615396fbf381b073b220d1e8d61e4c2"
> > +SRCREV =3D "922d04b3568c6428a9fb905ddee3ef5a68db3108"
> >
> >
> >  inherit autotools ptest

