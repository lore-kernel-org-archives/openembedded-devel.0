Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3603C433FE
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 21:37:34 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.2848.1640036243954941076
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 13:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WAEiuq40;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: claus.stovgaard@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id x21so16477814lfa.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 13:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=4vw//MM3oqRdU9rE6Kk9dqi0Qud2ddal+SaG5Es/Cxs=;
        b=WAEiuq40AOaNrDgAl/0nCSDIGrFABLDWXuZIlkKRi2oIu3Z5Jtj7tsp6bIGbG3T1q5
         zUQOoZRqfW6e+NwX0DM1ITMAtVUK6H5AaLqgoEURIX8BU3x95i++tP3qyzeCX6DI9p7s
         0+SsOEqTDm5FCzMVuZA76Tm7rmzPHC+W+q4F1V4PmjOTQEx9na3MWRKinaai1EGcBwPK
         unhQZ9PSXuffvcf+fv/biy83WraY+4YvhtIdli0sWyhQn/JUWwZcNOCB/OL0ueaq70bV
         VNfJ9IDZX0OioYqySl/33y3C7XePYVXaPihJjlYTZZS/zVpUSkV9YR53zdE5rvvTACpZ
         Y9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=4vw//MM3oqRdU9rE6Kk9dqi0Qud2ddal+SaG5Es/Cxs=;
        b=B7u6+wuLXMfOT/PuoNT5SgEbRWN1Zvy79OFehvaGBkSsllg8O1Fh33uMzWQAwSK/1y
         iHptVLPqN9TwqjAaLvbfe+GGSVq/hni2U4YxCxTqb7MC60CXGyJmQvhj0o4b9MgTxLyd
         0tpyST18zCac3aC33PHo1Qc9VTxBzNOSTkC8yRb27yXTQUCv5c498ulUqknchbZmdQm5
         RfzDMwwcDA7zhZx8+toewaqZ4brZKdovuIkgYMWIQ3pIktHYsqxyOO1ZtwA5ynQRd6mM
         j5oac5IwiBj5MWalm1rA8oJoEwBzFnS20VSszRnuNkLOf5tyxTx5oUQkOOHOENWO+tQU
         WIAg==
X-Gm-Message-State: AOAM532nlZ3MedO5XXCcUJ/1wMampHHDdBMZjsf9dg02zzZG0QYSomCN
	qiA1sWHfGdB2OYT95HRy91U=
X-Google-Smtp-Source: 
 ABdhPJygay0dWHh/gXoArqkJ3acoN9iWKyy9Wn6wc5SBhw0y94cmTLa4Qzg6/X1lpf42aY7EDaRWKQ==
X-Received: by 2002:a05:6512:12c5:: with SMTP id
 p5mr83326lfg.354.1640036242175;
        Mon, 20 Dec 2021 13:37:22 -0800 (PST)
Received: from [192.168.1.70] (2-108-107-206-static.dk.customer.tdc.net.
 [2.108.107.206])
        by smtp.gmail.com with ESMTPSA id
 u4sm2201179lff.17.2021.12.20.13.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 13:37:21 -0800 (PST)
Message-ID: <c27eabd5b0c9c7606367152cc3dc8e3ac7e1dc8e.camel@gmail.com>
Subject: [meta-oe]
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, OpenEmbedded Devel List
	 <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Dec 2021 22:37:21 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Dec 2021 21:37:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94456

Hi Khem

Have 3 commits, I think will be a good match for meta-oe

usbip-tools is the userspace tool from the kernel for controlling
USB/IP.
I started with what Chuck Kamas had done 
https://lists.yoctoproject.org/g/yocto/topic/86249103?p=,,,20,0,0,0::recentpostdate/sticky,,,20,0,0,86249103
But ended up rewriting all the logic inside the recipe, to make it much
simpler. A very nice utility.

Gutenprint - I wrote about that earlier - and thanks for your reply.
I updated to new style of override, but kept the native part in its own
recipe - as the purpose for the native part is only to generate a
header, used by the cross compilation part.

pycups - is for controlling cups from python. Among others also used by
system-config-printer.
https://github.com/OpenPrinting/system-config-printer
A recipe for this is also on the way - it is just not completely ready
for review yet.

Looking forward to feedback on this.

Do you prefer to include patch text in the request-pull?

Regards
Claus Stovgaard


The following changes since commit
de83f98070eeba02f465fe739d9418dd60f749da:

  python3-graphviz: upgrade 0.19 -> 0.19.1 (2021-12-16 08:14:04 -0800)

are available in the Git repository at:

  https://github.com/frosteyes/meta-openembedded.git 

for you to fetch changes up to
2bbf94fc34942ed0665ce8af6e9e4f2850fa4889:

  Add pycups - python bindings for CUPS (2021-12-20 21:59:10 +0100)

----------------------------------------------------------------
Claus Stovgaard (3):
      Added usbip-tools for kernel USB/IP
      Add gutenprint to meta-oe
      Add pycups - python bindings for CUPS

 meta-oe/recipes-devtools/python/python3-pycups_2.0.1.bb      | 19
+++++++++++++++++++
 meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb            | 69
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta-oe/recipes-printing/gutenprint/gutenprint-native_git.bb | 43
+++++++++++++++++++++++++++++++++++++++++++
 meta-oe/recipes-printing/gutenprint/gutenprint.inc           | 23
+++++++++++++++++++++++
 meta-oe/recipes-printing/gutenprint/gutenprint_git.bb        | 47
+++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 201 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python3-
pycups_2.0.1.bb
 create mode 100644 meta-oe/recipes-kernel/usbip-tools/usbip-tools.bb
 create mode 100644 meta-oe/recipes-printing/gutenprint/gutenprint-
native_git.bb
 create mode 100644 meta-oe/recipes-printing/gutenprint/gutenprint.inc
 create mode 100644 meta-oe/recipes-
printing/gutenprint/gutenprint_git.bb



