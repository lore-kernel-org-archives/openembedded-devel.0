Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E81DC001DE
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 19:32:36 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.29575.1690313548244027008
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jul 2023 12:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jvsy1EmT;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: jan.vermaete@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-56661fe27cbso3975389eaf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 12:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690313547; x=1690918347;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wMp1JP4mFE++uWOI5oATNvJKkO1mNdCWulWnXQL41fY=;
        b=jvsy1EmTwQajyDx9kT0Ap4eVizi7Ra5kmSWh4GFwJR5UulEb+oyTAnie7/pIJkcdzn
         RA9HP81oFodPyGUteU0beiSgXpwwS/yd8Wz0aiJx805qCimbPQCfqnnHDLe+krri7Gfz
         do15lJPvC3oT7Msip0L+zCbCZwu1lF2+uqY0+awE883wp3sJSHl4uLV7x0kL0zotmcbz
         6CYpsZEaAuivZ82+Ce6aBvudKKbBZPnlYBAzQVIcMbWiPkjXO9nS8fhNrNprKkTWeDFQ
         DTyW/FWpf5u40gmtO0vDHWkCqUff0J+LRrziqcyOId16nbGRD9mTrEAY/bO7jbzfUwU9
         U88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690313547; x=1690918347;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMp1JP4mFE++uWOI5oATNvJKkO1mNdCWulWnXQL41fY=;
        b=Www628BO22BV9hZoasSL0O78h8NIIOEnEqhgPlRkkC0b++Rmnr+q8XQDTPjSJ2it7r
         82OVyVPPEuSLR9jAuvrUMNYdn740/ZGeB4dLvQl1XN62i0imYdbFgBfmcVRdYbkkmvdM
         V88po0XPcOQLC5s7BlZ/ydsHZG9hVslMLjK1x2j6KTpdPVXI+Ua5LZ+6HexmGi5C4RwM
         cmRAJLd5Xs2Wa6RNAArIL6AtQ2gelyNXANMC0v8970q5dlJ1Cnis5Bf109DKbCPmaHlX
         HFiYLIVuuAvSdlfA/bAQGyvOBB2C5pgSA6iETrIX50gRr3+cBP5ZyE39VuvEqRXPsQeg
         gcQw==
X-Gm-Message-State: ABy/qLZbcKFpyWOKJEwIz3lq1aZDHVUwdnxvufH+eLnOWMK3tCdGoBi6
	E5MIu3cArKLRe5kmGOVocQ0e26Q+Y1nN1oBb7KI7ei05pU0=
X-Google-Smtp-Source: APBJJlGMc7muJ0BZj4TLN4yR7xcgNn9cYAupE7f/GctyKIQ7Ai/z0OBtWt0amaDiRMCCpXc0Rd72jqx2BK0HmxP6b/o=
X-Received: by 2002:a05:6820:293:b0:563:52c2:17db with SMTP id
 q19-20020a056820029300b0056352c217dbmr239289ood.8.1690313547132; Tue, 25 Jul
 2023 12:32:27 -0700 (PDT)
MIME-Version: 1.0
From: jan vermaete <jan.vermaete@gmail.com>
Date: Tue, 25 Jul 2023 21:32:16 +0200
Message-ID: <CABF_=yihTfcaETOZ5vzJ+DBK38GNN=zVEhsTTU01jYYAt7PMCQ@mail.gmail.com>
Subject: ola_git.bb: where should this recipe be placed?
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 19:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104025

Hi,

I have modified the recipe for Open Light Architecture in meta-calaos.

The meta-calaos layer seems to be not maintained.

Open Light Architecture (https://github.com/OpenLightingProject/ola)
seems to be maintained.

It is a service to control dmx512 controllers used in staging and
other lightning solutions.
And I'm using it with a raspberrypi (thanks meta-raspberrypi). But
only a small part of the possibilities of this application is tested
by me.

The DMX512 protocol is open. And OLA also :-)

Where could this recipe belong?
meta-multimedia?  Or not at all under meta-oe?

br
--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

