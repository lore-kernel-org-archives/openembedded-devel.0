Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6378.1793258141991574528
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 00:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20260707.gappssmtp.com header.s=20260707 header.b=QD2jdd0m;
 spf=neutral (domain: theyoctojester.info, ip: 74.125.82.169, mailfrom: jester@theyoctojester.info)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a315ed211so584057eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 00:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793258141; cv=none;
        d=google.com; s=arc-20260327;
        b=drz8PLG4Nn+BlmTyacJOrpKgpQVHN9sEVdNgejAoM3Icd+uEzy9Z26+rmGLocjzbsu
         xIW19spTLpG1YkB9PDcmDLCICWVgE7je3nlfISE/D0r5zG2fyM/DtqoxdYrMWaxSWBpq
         WCwiX3pmDXNWNwQs+qRX0EU8NhuK1oRfBDd4823/WmIHpyDBCYadSDl9bnvyMG0Q3mMp
         7hVEAjwhe2qKUmHWNTHkD+oYt+au8y1InYIGxp/NvvVndCQQIIWUsPwkymGsQr1ktyN5
         5HEjy/ntzb3KLvgcGDfQd+iWUN36UccMF7x7zQlfOp7zjIBMpgi1QhSwtMF1maX16BdS
         KTnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=hZxDfDIuv9MgEufTO2unosVvVwKlKdpRX0TWP9b6zNc=;
        fh=seeTcAB5Qco7brNdmmTkYEEU8TknrMuGMWQs+Vx4x9E=;
        b=WVPRXO28jjhhccgeQVtdYUouoMGQ9OlIbVC2BVcgumi+r/303zGGHduGfqueZAXNUK
         GROC3+tNUVzvpcoNd/uVGAzwoc2QaWJMs3RSSAzd9NAFUdQTJ4ql4izS3d2PdGg3gj+5
         KPA4nOoi5ZMR5tsdBU3BQck+QUs92DeflXrUzm7cZRWhfS7R3WRcKOC2ejiGrKgwvO4E
         guZ/+Gs5+NeHdoueSOQBlSNk33N6LgFnMw4MvNlGNQmdJPv9qUW2LLZ4XJrf4o9gp8Xj
         TqPjdZrtTjWK++tCOy1vkLEusyPJlr8Hn5/uleVwBrIo8/9Y44njVA+qj0ysUwbewZY9
         TcHA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20260707.gappssmtp.com; s=20260707; t=1793258141; x=1793862941; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hZxDfDIuv9MgEufTO2unosVvVwKlKdpRX0TWP9b6zNc=;
        b=QD2jdd0mDSYrrG1ufMqXyAz8GAXXSgK83iXpD1BR10dliBvvckPOXbo1FSBRqdOIvd
         qFMKN9ogU53tBtv8fsKUW3plIr+w51M8w9yjtl8bFSSdBAA5ksh6tTcTLGZBqe13kUo2
         DnKMUU5rLIemYeIoFah3DU4Z6M4blEqs+wD42Ji1LvEo6/NqEx1wfV7Lc54xaTwLk49z
         1IuO/40b7eSoZxKBDElcqAA4vODQBBAaxDu5BsAKE03Wkfl/Sx2GSzvI33Aclp4WEXvK
         QNVktZPVnKmM35bozVu+Tjqy9Aub+tDIx47jOM9DudO1XGtIJCqTE/nEZOmkVoP5aCnJ
         sRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793258141; x=1793862941;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hZxDfDIuv9MgEufTO2unosVvVwKlKdpRX0TWP9b6zNc=;
        b=l6YVkLtE+t9z1o+78bc6Go3utQTLhdXslASJrtUh0gZqS8iV3OhA2Jk+UYv1xX83gV
         M7FST4fhMHrenewYPpOuzYzybMqh+gyG5q4i5mzWJsUZbXmOjp5dVjOXA/+KDhkxFV4X
         BK04QNLMHBIFUaSULqd4hPkvCj2AJsHtLgypB4Bgn02Y+0Cq66NfyZydbYHcWXV5Q+ac
         D/QiZ2eH+ROcbN4fjtnZrkhzmInq6a+TNMMYqnFtM1oIEieMv3/OFMUKgir4sjJd6fue
         URYW6qf4GWiThR5e27nP67I0Vz8Ve/4cBEBGld0SD8BxXptZ/VwtzwuNbi90olavRmkD
         Hblg==
X-Forwarded-Encrypted: i=1; AKwUvBxk6dmUUWuWGSXx/Fpno3DcA14C4LPKOSvQWehby/3cNf9Y73XNayM4NwZZrA87MPt7Htaz7uGgjzBgZFGjR8E9O6U=@lists.openembedded.org
X-Gm-Message-State: AFq9FYIrC2tc8WEQklYAgNJIk6/Ay8mwcopUwyQstukz0J5B3SstQD8v
	wUc2Sbgh3a9lCSUDPKQHZIzSLzGYJ9sJUrR5fFuv1g+IsJa3esx90pT2po4ueX8NEYircGhVNMJ
	ysGFNpA/gzc/6+EgbMm0MS/x3NAe3CjWo6I8dkT1MDW5u9u5JLiUuW5EHmA==
X-Gm-Gg: AYBFou0O1A+N/t9sHo1WNHn+g/hwAywYHISIN+tTG/5Gg1kv150UJpS7eYfHiNNI5QZ
	+gFyGm2LKJ7wrKmEPcwr2YTTBS9N9JBlzTs6+KhxwbknWAHa41DLwWyEAiij9Igvw/oHQJZLVf2
	Yd5O9SWOIuWoTDv86jXg9Sv29Jzl9kPn/37hLWrI3Qh0o9Txt9uGDHfbbnRIldvM9ovNoHG7liH
	8Hfur+v4xqzMXHUpCVi7IDHdOrwjFTn9Zr4JX546wf68WBkL83L3U4bx8/eZkNcckF/5jhEMQBE
	p3zFJvMyRk/K79GZMb29gMjQ+zIUnHRjqO4mZdm6MTmcugW2VQW2Euwuayzufn6+NmS313mO1SQ
	/E33Oh3qvGmALgbDUw4o8XXZAdWiAj0amcqjJlTNMwUtbbeQekZEw2nVb7cVhwxqVbr0Xts0Zat
	w/H7E/ipKOFUVvyE94zcxj
X-Received: by 2002:a05:7300:7aa7:b0:359:fb64:11d7 with SMTP id
 5a478bee46e88-36a2fe8578amr2433458eec.11.1793258140955; Thu, 29 Oct 2026
 00:15:40 -0700 (PDT)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Thu, 29 Oct 2026 08:15:14 +0100
X-Gm-Features: AclHuK8dAGreQ0uhIsCfVfsWrSo4kT4A4MWOJFJY99_BlMByixxvMM1rOP4O7xM
Message-ID: <CAEt6Nwq=_BWSu+UCVS2zYMOHbKaNa5OM0RXZ5gcaonJpowYzvw@mail.gmail.com>
Subject: Yocto Project Summit 2026.12 CFP, closes after Halloween weekend!
To: Josef Holzmayr <jester@theyoctojester.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Bcc: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 07:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131642

Hi all,

Quick reminder: the CFP for Yocto Project Virtual Summit 2026.12 (Dec
1=E2=80=933, 12=E2=80=9318:00 UTC) wraps up Monday, Nov 2nd, 23:59 UTC, rig=
ht after
you've finished spooking (and stuffing yourself with candy). If you've
been hiding a talk idea on security/CRA, YP & AI, reproducibility,
containers, DevOps, or just something you've built with the Yocto
toolbox that doesn't involve trickery, now's the time.

Submit here: https://pretalx.com/yocto-project-summit-2026-12/cfp

Tricks are forbidden, treats are encouraged.

Greetz,
Josef (on behalf of the usual event pumpkinheads)
