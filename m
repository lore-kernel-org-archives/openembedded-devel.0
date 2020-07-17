Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web10.13874.1594999262166203098
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jul 2020 08:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P+NgaNBb;
 spf=pass (domain: gmail.com, ip: 209.85.210.68, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f68.google.com with SMTP id 72so7130872otc.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2020 08:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=1EGTSKzI3fYFof+NB/KXcY8ul+InvShsHaeiBVdsGxs=;
        b=P+NgaNBbSnNJ16FzWp29IAScDq2vMiVBgOVPhWXERnQcpd0fU9wHyYZkkYPKPMQE9n
         4yzTB2CFCSRFIv1/VJOAwdgOycfttc4fDDkFWnYBH1uBft/PZD3T4JSE8mJ1IynmSUGQ
         ALh9o1l1WoTN7BX8HBe0iMNAIn2c6uRzYi0VzB9mSr9qe1mttaaix7fjXGUBlZey05AZ
         UbwjZaEX6Ytov5RFBUy5NaRfGdJaUrj74UdGIp0kjLhlokoelSIp1eD2uIQOyAuzFV0m
         4tVNH+Icq/y3jcHLhxmhLh58EtjVDhEm38yIVR0b0LVP+pEUmYFClreVeW1M16XS4Eot
         QiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=1EGTSKzI3fYFof+NB/KXcY8ul+InvShsHaeiBVdsGxs=;
        b=AyjOHRtAzApTYAkWDdHGHvbtvFyrzHBJgHXsvOcNu2cegFgDi7XWIa94jLIjClk+/D
         RcepT3MXWsPb3IJAX2ot6+Sw7g1mp43wMG+xzCpF5cqgE/ibcy+ORtmYz29DyoH2yYMu
         SEuXrbt+p75cA/AXrQ4dkTijboTN+jHKNhGf5Xz9liCjIdTYlK5m1b3TV20YFfrtMdDD
         xBjbCwz2UuH/yysrT55Q/XDdT8j6W/NlloCUOL3RIa/wSytJrEPfw/Cy0DnuBGAUBn8g
         gil/JIlkN9You52xamw2jChX9JHOmP3ugO1yfhxf+/Ajr+qsqwl2mwzc91UhP6+JsaSm
         Cj5g==
X-Gm-Message-State: AOAM533TTfLnRApTcwtH2my+2urjc5jYAOaH/8cEmV8ylgvS7EoFiN3s
	qKammktwUmZLDU/bWiSgDHS9Eq7q+9Q=
X-Google-Smtp-Source: ABdhPJyOPTCSQB0lTYgdV1l3SS0TzLWtAX+xBZNLD2Z1S/lhbq+T3Zz80AWpzZLb+XQkzXyF5J64pg==
X-Received: by 2002:a9d:1928:: with SMTP id j40mr9007022ota.242.1594999261273;
        Fri, 17 Jul 2020 08:21:01 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:b082:650f:a46e:c68d])
        by smtp.gmail.com with ESMTPSA id k126sm1868439oib.52.2020.07.17.08.20.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 08:21:00 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 0/2] dunfell patch review
Date: Fri, 17 Jul 2020 08:20:53 -0700
Message-Id: <cover.1594999160.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Two additional for reveiw. This include reverting the jsoncpp update that may have introduced an abi change.

The following changes since commit 3add820b373564478591e244226704371c1d34d1:

  wireshark: Update to 3.2.5 (2020-07-12 19:20:59 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/dunfell-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/dunfell-nut

Armin Kuster (1):
  Revert "jsoncpp: upgrade 1.9.2 -> 1.9.3"

Ovidiu Panait (1):
  nss: Fix CVE-2020-12399

 .../{jsoncpp_1.9.3.bb => jsoncpp_1.9.2.bb}    |   2 +-
 ...e-a-fixed-length-for-DSA-exponentiat.patch | 110 ++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb     |   1 +
 3 files changed, 112 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.3.bb => jsoncpp_1.9.2.bb} (93%)
 create mode 100644 meta-oe/recipes-support/nss/nss/0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch

-- 
2.17.1

