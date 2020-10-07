Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.11480.1602072347521573996
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2020 05:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dresearch-fe-de.20150623.gappssmtp.com header.s=20150623 header.b=0aVngmuP;
 spf=pass (domain: dresearch-fe.de, ip: 209.85.221.47, mailfrom: schuknecht@dresearch-fe.de)
Received: by mail-wr1-f47.google.com with SMTP id g12so1848502wrp.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2020 05:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=LGqwsxu/q0T7yifZ9baN7ehNPOCEe3FWLytqFsE+iek=;
        b=0aVngmuPdXkvyGZFJTJEFgCs1D/MaBIdY78P/LEavfSxBEixugHw4dkxcT2pNosZ0E
         puacJoNdY7yVaO8A1n9gsHAele9wiz7G8bcDSqpiHt2JrWkU7zfjfPZeZBLanEMJ6jyC
         KoXum0hT5H7oRC6cWSYplu9xPgQ5nwlfqgsoFK22D8RjzWQXD2l9iuZvwhG2s3kQpKXW
         cESE+ebikreCBapMrKOm0O7emyXcSws9IE4u2HlupDz+GY+wwWkJe5/KIJrLzHPy3Pj1
         c85OQoTpC+kyzmMi2FN3QtRimEBhzOuYfjdM7u0xj+CZaHgB/Hrjn/KxzQ2Ue6w+lC/D
         yDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=LGqwsxu/q0T7yifZ9baN7ehNPOCEe3FWLytqFsE+iek=;
        b=fhfUZtdhYNZM3J92dxXZqdrAnL5GwfsDuuAChGO0CMYeaRuML4glzoaq2pGcXhFTHl
         Fh/V1UkBcvDSjrinWcp49naWiMTsOStrOB7FfFeMq3Jq+VPhHq8vXQCaHMDeRNy6r3oB
         0WQbTpT3ji+gCELPyBbuo+vTr204hxcLw9pFZekpAsW/Sa6FYhqYoG2DHXw68LoYQpUA
         JbfqVHd5MLisE2pRSk4Wd2HaNUjVwFiZqUn3DH2ROBs9tqxe5e4GRIp7D/M0Rlip2hPI
         6yRU0dNZZiNFXwQ3YWpUjFdtmCqaWxILnZW+M2i4Mm0Bo0m/aquOjKHi13AnFUpcK5xr
         mn3w==
X-Gm-Message-State: AOAM531lzPQgRzlBBCz1w1AOCTJffXrd9t97++/uIBpx+Crd5U+NFBni
	63Rq2rWp8McBsXj6+Gt8dHJe65vVVI5X9sal3sR1QC3zbbR3g7P/
X-Google-Smtp-Source: ABdhPJy8J/1ucaxn9IMFjdxdxncpDrURHIfVxkKAEYrd2aJ9gBdU63uk55tZcYgIHxnBw/lESFwlA8pYyZvRkWMt2oo=
X-Received: by 2002:a5d:4c4c:: with SMTP id n12mr3106637wrt.162.1602072344511;
 Wed, 07 Oct 2020 05:05:44 -0700 (PDT)
MIME-Version: 1.0
From: "Mario Schuknecht" <schuknecht@dresearch-fe.de>
Date: Wed, 7 Oct 2020 14:05:31 +0200
Message-ID: <CAAwVp3s_ubYfKsq4UCbAUHyN5OYMr=0b8CMci8a6_QeDaW4MOQ@mail.gmail.com>
Subject: wireguard-tools systemd service file installation path
To: openembedded-devel@lists.openembedded.org, stefan@agner.ch
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a user question.

Why does the recipe wireguard-tools
http://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb?h=dunfell
install the systemd service file wg-quick@.service to /lib/systemd/
and not to /lib/systemd/system/ as usual?

In my system the file /lib/systemd/wg-quick@.service is not found by
systemd and the service is not executed.

Is there a way to change the installation path or should the
wireguard-tools_1.0.20200319.bb recipe be changed?


Thanks in advance.

Mario
