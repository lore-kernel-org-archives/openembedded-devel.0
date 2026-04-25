Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B793EFF8862
	for <webhook@archiver.kernel.org>; Sat, 25 Apr 2026 17:47:21 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2157.1777139234420393369
 for <Openembedded-devel@lists.openembedded.org>;
 Sat, 25 Apr 2026 10:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EEqcBgVd;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-799001d73bdso68673947b3.0
        for <Openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2026 10:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777139233; cv=none;
        d=google.com; s=arc-20240605;
        b=HCTE5nAo/jIdtStWsitdh2WNSiLIjPUbIHncngBwlQhCOV8wmODVjG9YQTU4LtcveN
         4O3y2iABHxXHJKS/IH8lRyACBOGmUnQiiZ1lu/0wHswQRB+NQdbhvM75vL9zqLyFNov1
         TLk3JvLlNtQoyoDEP1hvKua++zNqV45n1V1dgKfNLEDEcWDAoVQ7H4Ah02mA0KUDCBQm
         lgc8x2VWj34r75YaeVggnRyguVDfPPPu9OgK6xWs2iLBGMh9+5S676jxXxZ7Ro89WgiM
         57rjLMC6YpZtN93Am4dlMCRBYBMaOufF8/l4fx3/VydqgFMEEfyBlSFKYMD5LQAr9UV4
         6D4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=fi4SSB6BD5o+VmeBftjK/o4i502kk6h96LLH42Dl1dg=;
        fh=Gyx13FW3K8G4BZqenkCHUXXeuziF4gxmPRIB0P8ip+M=;
        b=Qnvmt8zHPgyMiv4f2uLGJ3HqTsQUmWooKrWPclaLPmGyuYVC5uCm23C9Hxj45EL+4K
         SYwNnrvuDw7ru5WQjbuwGvw0Xl80kLQ3ekeM1xV59khYkFPaQ/cEf0gDWXcIM93+NAw0
         66e2ee0IN16pV1zRP4VGqBiq2H14XSjfT+qV/jW75N9/bUBqqFkowB8a+nNr1AiU0yVF
         V0OgeuE349k7wOlqacDc+hr+auKw94FoxAJFTkLmjXkRXdN4pA9qnTatn3aTIaLGd6me
         QXaKmohvgKRskXAEOlYt2BfNDXdQI6wz3NPCji6ppsR+vy/wojqwSUIF+lW3IrAXDd8p
         ONYg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777139233; x=1777744033; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fi4SSB6BD5o+VmeBftjK/o4i502kk6h96LLH42Dl1dg=;
        b=EEqcBgVdk7aRCw4QcqUHgtIEe8hmlIlwh8KCXziDfxj6345CELEz+PDRQvrKROsx2H
         sxDTD4d4aESgoUfryeOVUy9PIh2srkCIYAfsOyx1UlLrGb3D4sDDT2xJ5i9vBDGv/gie
         aCnOLItnnqVyHcvSeX96WcVPUqlT5JuAWHHkncRU7mhsYVprUfJimg5iBcmsQLMtmxrl
         8uMPshDSghbTSED2njkyBHE5T4M0selq1+5xr0nIMSE862p+U/EhfiJEJqMHIKZcbnZk
         TXhUFLS+1OWllNU5zOUlZWIDOMz6LVaXt9Xn2rm7FwvnRcMRm8H/bnj4cq8fNcNwZT+G
         b0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777139233; x=1777744033;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fi4SSB6BD5o+VmeBftjK/o4i502kk6h96LLH42Dl1dg=;
        b=sq04sTVMQdlgUj/FLyJmVA5EA9O0i8ElQktZ6Nj7I1EA3/T8r9IK713GmUloweA6vx
         HVFFj/aNGV63y6vE1B4jVMZQfsTlnWgaAJbA70DTeOCFG2fVrXN4wdGJ9is81QTv6Civ
         ujDqBp+vhYYrlQqdzkRdlP6tiT5peIZWHqKBwLp3DvYvKlhqh447xlrmQuG5Wjs1NU1H
         IvhHBgR/2CoEKfC7ngO7VE7URJ1YP0u9Dx9RJpdT5zK4Sr0EouRx3yhBryJchEhxcfdO
         Ab097AyoA2a81RlHlVaHmIXRVrKMmy/KoXBxmFpKfH4kqwBVNboNvod6tZ5zVsFFgtp9
         gBgg==
X-Gm-Message-State: AOJu0YxyLSIqtWjJ/1suK/LdlZfbZds8gasrcaTeyXTjDOPxPEQaNMhB
	HJegprfazgongSLq+BLHk311hJoPVkeNtkadf4jYRh298feUXBiZVsMlrSW4IENBmemKmnE5bLi
	ROnFGMTRdccsc9qBLC4qc9O/GMFfNtSZkg8DLHbo=
X-Gm-Gg: AeBDietdRoIc8+obHj5QNmuFNo/VAdtDpQEzl18o31BFlF85TJnOYJ0o4Yl0gVTvswe
	PtEtu99mr+iE8uxhi33yN/rtLzPrMgZVz6MR1pqEj7kx/VcbU4uX0pU/al+NuK+tO46S78v1xaJ
	91Kh3vitPJ2ydV7lluFqlOWSA3b1XhRWGfmNPRdldMEZfu1Urw6rXY9oFUTTu8pBnSd/VJMLSux
	TTyJCB6aRdqNgfphaxy5xfEixfUxKGs2Rc8kQtIhnYIcGE5QOgkoqCKgpAROYeQokhnZczkxrfU
	GqPEmh4ZUJT72QDzyR122hvqZ+6T/M/YtwwcVhn5DNUQajRyUg9/SNp8ZRHccwxvghsW9vewQ0n
	MhKHoy5jK2H0FbHT/YPskH8TaKI6yKzDxS/fFykE23fECOkxkcyDniWq4nEOOw8npfAPZzHz6sa
	yBMF13NHGAth4/ue4=
X-Received: by 2002:a05:690e:1b60:b0:650:12eb:16db with SMTP id
 956f58d0204a3-65310a790a8mr23274404d50.50.1777139233168; Sat, 25 Apr 2026
 10:47:13 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Apr 2026 10:46:46 -0700
X-Gm-Features: AQROBzALZRJt5_B-FQyfWLs4On42Ep8YyH_EcqsX_HUPWcZPSGA4UXgnvRxLg9s
Message-ID: <CAMKF1so=iKQvzr8Hr=6ZxxBcgMU_nocduK3YNTOksqg-qLgQuw@mail.gmail.com>
Subject: meta-openembedded 'wrynose' release
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b5a3bb06504c78ef"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2026 17:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126613

--000000000000b5a3bb06504c78ef
Content-Type: text/plain; charset="UTF-8"

Hello All,

'wrynose' ( yocto 6.0 LTS )  branch for meta-openembedded layers has been
created.

Anuj Mittal has kindly agreed to maintain the wrynose stable branch.

I would like to see the mbedtls 4.x in there but it still needs some work.
At this point, it is not part of the branch but we will see if it makes the
cut.

Please send any patches you would like to see in wrynose release with
appropriate subject prefix '[wrynose]' so help maintainers.

Report any issues and with patches to fix them would be even better  :)

Thank you
-Khem

--000000000000b5a3bb06504c78ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<div><br></div><div>&#39;wrynose&#39; ( yocto 6.=
0 LTS )=C2=A0 branch for meta-openembedded layers has been created.</div><d=
iv><br></div><div>Anuj Mittal has kindly agreed to maintain the wrynose sta=
ble branch.</div><div><br></div><div>I would like to see the mbedtls 4.x in=
 there but it still needs some work. At this point, it is not part of the b=
ranch but we will see if it makes the cut.</div><div><br></div><div>Please =
send any patches you=C2=A0would like to see in wrynose release with</div><d=
iv>appropriate subject prefix &#39;[wrynose]&#39; so help maintainers.</div=
><div><br></div><div>Report any issues and with patches to fix them would b=
e even better=C2=A0 :)</div><div><br></div><div>Thank you</div><div>-Khem</=
div><div><br></div></div>

--000000000000b5a3bb06504c78ef--

