Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27CEC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 21:31:28 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.3794.1640899887733873340
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KNB+I4GP;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id i6so13003961pla.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=veZ+jisqo/gieErVQJfug80NRpqbPLq/LOz+uaeZFao=;
        b=KNB+I4GPp+JuoUVNxz+jCla1rsNtgDWYMOtyMNlUsDDnH0cJp7faWdndbiwJLGSTEH
         196sldll876RxBYrTLiCwFMN+8bDCWAOxI1+CHMNeoOBZh/BZWqsvDWa5kcj++DUzZ/+
         xQFG4uF8c88PHRT+xhbOKJ7yVhzKSHs0K1AbSe+rUcWbi72nLQkN+9pVndj4MHhxYMXB
         +Jk9C+Onylv7lYmCz6KyCOqEsw+/jP1ILPVMy2RR7WIFv/MT/2/9MtgM1KH109pLpXeM
         kmRjOXLb4rIljy0WN/cUWyLu11ag0hJKsEBwmH0sgScXJnDT06gsia6XXG1QAeMCblEz
         67yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=veZ+jisqo/gieErVQJfug80NRpqbPLq/LOz+uaeZFao=;
        b=J0jmuFLJWhqRNZtJ8uQV4iReqJt0HrmDzQ3gedzq9MAlpSo3mivwdhX1FzBxZ+TqyK
         eaCMKyKVQOO22/qXaWkk9JzZDhQV9LYJB8keEKf0NSX0j/EjA+WlOWY64pkce6rFvJ6d
         dQBfgfWdTQqlyMObR3Gvos46iVETSS2keEbeE2vtSO7PnDQedEYTR7TMLEVO0WogxPf9
         nZKJ74wP2A/9GPaPinK1jCJmgJLFP+lXjLZqpdM9DamPtl9n4yU24I2BnJ8sfr9sTlMw
         uHxAnOF9Z50QmrJSEj108tl23dI7iad2LDi3+uptaENNUbZyuoZOVlEQZQCY6CEwvko2
         6W9Q==
X-Gm-Message-State: AOAM5329IYD85vA/J7wcLWSSMJxVB6jbImj/xlOorAeS36nK04F+g7Xs
	cKlJw8b1cYs7V75q2e0WcMjGDFDu3Os=
X-Google-Smtp-Source: 
 ABdhPJzWGfZqCrlP40DtHClaIZ8yUkYykEfdDgWs4Rs/FWX0HvTD8bU9D8QW6cUl+ktW7MO+mkAezA==
X-Received: by 2002:a17:90b:4a05:: with SMTP id
 kk5mr40352103pjb.214.1640899886908;
        Thu, 30 Dec 2021 13:31:26 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:a625:8af4:d190:e823])
        by smtp.gmail.com with ESMTPSA id
 t27sm9348384pgm.52.2021.12.30.13.31.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 13:31:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Honister 0/7] Patch review
Date: Thu, 30 Dec 2021 13:31:16 -0800
Message-Id: <cover.1640899794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Dec 2021 21:31:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94569

Please have comments back by Dec 31st.

The following changes since commit ae34f8f8e4f7210e4e86656a5dd9fb9bc1766ce1:

  googletest: Switch branch from master to main (2021-12-18 11:23:46 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/honister-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/honister-nut

Changqing Li (1):
  postgresql: fix CVE-2021-23214,CVE-2021-23222

Trevor Gamblin (1):
  python3-django: upgrade 3.2.5 -> 3.2.10

Yi Zhao (2):
  postfix: upgrade 3.6.2 -> 3.6.3
  openipmi: upgrade 2.0.31 -> 2.0.32

wangmy (1):
  libfile-slurper-perl: upgrade 0.012 -> 0.013

zhengruoqin (2):
  openvpn: upgrade 2.5.4 -> 2.5.5
  libnet-dns-perl: upgrade 1.32 -> 1.33

 .../{postfix_3.6.2.bb => postfix_3.6.3.bb}    |   2 +-
 ...{openipmi_2.0.31.bb => openipmi_2.0.32.bb} |   4 +-
 .../{openvpn_2.5.4.bb => openvpn_2.5.5.bb}    |   2 +-
 .../postgresql/files/CVE-2021-23214.patch     | 116 ++++++++++++++++
 .../postgresql/files/CVE-2021-23222.patch     | 131 ++++++++++++++++++
 .../recipes-dbs/postgresql/postgresql_13.4.bb |   2 +
 ...0.012.bb => libfile-slurper-perl_0.013.bb} |   3 +-
 ...s-perl_1.32.bb => libnet-dns-perl_1.33.bb} |   4 +-
 ...ango_3.2.5.bb => python3-django_3.2.10.bb} |   2 +-
 9 files changed, 257 insertions(+), 9 deletions(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.6.2.bb => postfix_3.6.3.bb} (89%)
 rename meta-networking/recipes-support/openipmi/{openipmi_2.0.31.bb => openipmi_2.0.32.bb} (96%)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.5.4.bb => openvpn_2.5.5.bb} (97%)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2021-23214.patch
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2021-23222.patch
 rename meta-perl/recipes-perl/libfile/{libfile-slurper-perl_0.012.bb => libfile-slurper-perl_0.013.bb} (88%)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.32.bb => libnet-dns-perl_1.33.bb} (93%)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.5.bb => python3-django_3.2.10.bb} (77%)

-- 
2.25.1


