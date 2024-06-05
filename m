Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E45C27C5E
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 12:26:47 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.13934.1717590399042029183
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jun 2024 05:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=g5c+2mGZ;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.221.44, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-35e0f4e1821so4612099f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 05:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1717590397; x=1718195197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=weKhZfOqqDyjFmbZyMY6zeMkhXcyJRQ+I1etQeeIra4=;
        b=g5c+2mGZoYaVb2UZiKSngH+zHTJQFKpWXSah1vCsLFP3uMWFjTBlkqMhcaHveSV5Mb
         8aAb56+3UslpTNM4TXsBs/sxQ1NmyWEXjyVlO7oQ8KohMrBMw8H8YRg6++ubkkI//ZTG
         /Itsq5py5HwoTb5sUZzbzqzhyVrNK1VgvDlstB1VLI5HQxrYT8CYpr2STJwzxP+6U/Pf
         /GWzk113KDnW8QXQXt15NIqIAqJDIsJWnmLAxFqpwsbnlL0e4arMj1KMs7XNSUDqj97/
         0oAUBgy6TnbvHlCLpmWjGZwnHjbAaXjYz9t4TudnuFFoI6cYOq1iYJo5l+TCPcL3K1ZF
         wDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717590397; x=1718195197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=weKhZfOqqDyjFmbZyMY6zeMkhXcyJRQ+I1etQeeIra4=;
        b=shBk/uk08W50/gw4LjWraSACNhW55AdyzPhmW8U/65AP6iZiD72dbW/eaZHH3b1FQy
         SgCtlh3fAmsyfdIwP0F1SX3lHEVCmNNl+ODqtUeeGCEP+V0JdkUqsDXIE5Q56dkQ4i8e
         zvm/d20y8XnJztVuKO6tEdqoJ7r6njk8RPexINhJsHsyWNJBxrJCGwQKBa8s0eEQ0HC9
         o+T80sG/DrTrX9wiT+mbXIwJefLjZvZtBRILuC5WHr7PVbvW2Z1XYe30tbrUWfriYrI3
         oU5bOW4jK6X35LbXPhIsGpStKCwmpmTs/mCaSWBIg89I3ljQDv5Km1P8xkEswco9w250
         D5KQ==
X-Gm-Message-State: AOJu0YyQMP0NPNfWfkTNWpBCfrnmJE0d8LZqxhntVifMOoiyOZe9kfNS
	zpsT22tCXpSY6WskXZ0kler39wx3I2lWWrC3S66VkmGO8Cz1jQQVMWEUyndB1O6+Y/uB2JOlKSX
	QcK/fve13CHk/PqvrL+vEAwnxW6GG+SlU4Av0hzq0v7Xywc3nLkzgTE9aCKtlkYDWJ/wmn2Hqhv
	wYjli87RDq8g==
X-Google-Smtp-Source: AGHT+IGGEy/CbQC7ADMrDg3bY3IvUaGzSCfjeEmaLs5NNdXYMtK1VGLHZpIgB0bzsbCMm+WdGvZFWg==
X-Received: by 2002:adf:ee46:0:b0:357:7070:529 with SMTP id ffacd0b85a97d-35e8406898cmr1932090f8f.12.1717590397176;
        Wed, 05 Jun 2024 05:26:37 -0700 (PDT)
Received: from localhost (dslb-002-205-022-096.002.205.pools.vodafone-ip.de. [2.205.22.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0e84sm14493950f8f.13.2024.06.05.05.26.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 05:26:36 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] frr: update 9.1 to 10.0
Date: Wed,  5 Jun 2024 14:26:31 +0200
Message-ID: <20240605122631.17962-1-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 12:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110703

Update FRR from version 9.1 to newest 10.0.

Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
 .../recipes-protocols/frr/{frr_9.1.bb =3D> frr_10.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/frr/{frr_9.1.bb =3D> frr_10.0.bb}=
 (98%)

diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.bb b/meta-networ=
king/recipes-protocols/frr/frr_10.0.bb
similarity index 98%
rename from meta-networking/recipes-protocols/frr/frr_9.1.bb
rename to meta-networking/recipes-protocols/frr/frr_10.0.bb
index b1c9153becf2..bdc359667a7e 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.0.bb
@@ -10,12 +10,12 @@ LIC_FILES_CHKSUM =3D "file://doc/licenses/GPL-2.0;md5=
=3Db234ee4d69f5fce4486a80fdaf4a
                     file://doc/licenses/LGPL-2.1;md5=3D4fbd65380cdd2559510=
79008b364516c"
=20
=20
-SRC_URI =3D "git://github.com/FRRouting/frr.git;protocol=3Dhttps;branch=3D=
stable/9.1 \
+SRC_URI =3D "git://github.com/FRRouting/frr.git;protocol=3Dhttps;branch=3D=
stable/10.0 \
            file://frr.pam \
            file://0001-zebra-Mimic-GNU-basename-API-for-non-glibc-library-=
e.patch \
            "
=20
-SRCREV =3D "ca2d6f0f1e000951224a18973cc1827f7f5215b5"
+SRCREV =3D "03a143cd49ed1b190cb38f48a31ef4d71fa01a02"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "frr-(?P<pver>\d+(\.\d+)+)$"
=20
--=20
2.45.1


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294


