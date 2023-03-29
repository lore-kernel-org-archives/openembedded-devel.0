Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CD4C77B60
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 11:28:15 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.22004.1680089285673457433
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Mar 2023 04:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gAs+gEHa;
 spf=pass (domain: konsulko.com, ip: 209.85.208.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f41.google.com with SMTP id h8so61775199ede.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 04:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1680089283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QpsX/QF4DDzp+b7MYUnIjVB4m4ZsZYPdrUk5qC+xtEc=;
        b=gAs+gEHaFehWkEKlV3IQHt/AJHDDQ6Fr0CGu6+NUDyFNgO0jSbR6yreZf1RnX1KOzq
         Lqkr2wGdHp+SS94aJwKluLIwJ0HDAmPn+6AyTVp7+NNrWMnfQwCsSRSNCPa3xU5s2J2Q
         ItBMs8OUF6IPN7JpvYnMreyZrCNucVN0LXZfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680089283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpsX/QF4DDzp+b7MYUnIjVB4m4ZsZYPdrUk5qC+xtEc=;
        b=PvQvonZxeAUM+5MX4PfKXRhGwhplnFZ+LyknKO4n3IL3XSX2VYuaEJV8RRfIxW/Z1I
         MwGgR2HfcEweUWikePX8rBUdaLM/JeAho/HRs0Ku3MSHwDkUkIZJWhsWZeuWnmVzAXaB
         sjexF+2oI2tsy7+3VxLO6CGx7P0dN6nV+hboTmLMNX+DqD3/0B+rOxugIV6uJ5wr3oeO
         8uqrxhlKLgEcMUZbC4UsrC8RsWEvyWeFfp3wEXlk7Dtcd5omstuUGOesZkRRZtLuk6c7
         rM9o7Ggu5fu5/DjG/G0ShCJIhNsj5C2C29jxDqQs4hmDIxYSEgd6GJ782gTEXAN8Yp6U
         rT5g==
X-Gm-Message-State: AAQBX9fZtIXYH211e8nQ3u4H04Pi1M4wPAcLpri+BlZPNNxhB+TGXMRA
	4XAVkJm4AnAqZZB62pKjLH/Z8wLFNESYUZKE8IM=
X-Google-Smtp-Source: AKy350YlhA5k59Gct63IybMyF7eBGIU6SV7rzcO9pCNMemzDaQyuj2SULEa/tQEmyijgmwWvDQG/hw==
X-Received: by 2002:a17:907:c088:b0:931:2f49:c040 with SMTP id st8-20020a170907c08800b009312f49c040mr23876537ejc.51.1680089283656;
        Wed, 29 Mar 2023 04:28:03 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id l16-20020a1709061c5000b00939ad35d521sm11680695ejg.77.2023.03.29.04.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 04:28:03 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 1/2] libpcsc-perl: Add recipe
Date: Wed, 29 Mar 2023 14:27:59 +0300
Message-Id: <20230329112800.495483-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 11:28:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101816

Add Perl Chipcard::PCSC::Card smart card communication library.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../perl/libpcsc-perl_1.4.14.bb               | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.14.bb

diff --git a/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.14.bb b/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.14.bb
new file mode 100644
index 000000000..ff4e1f056
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.14.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Perl interface to the PC/SC smart card library"
+DESCRIPTION = "Perl wrapper to the PC/SC smartcard library (pcsc-lite) \
+together with some small examples. \
+The provided modules are Chipcard::PCSC and Chipcard::PCSC::Card."
+HOMEPAGE = "https://metacpan.org/dist/pcsc-perl"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "https://cpan.metacpan.org/authors/id/W/WH/WHOM/pcsc-perl-${PV}.tar.bz2"
+SRC_URI[md5sum] = "45601505dbb7b27329811ac9bad35fab"
+SRC_URI[sha256sum] = "2722b7e5543e4faf3ba1ec6b29a7dfec6d92be1edec09d0a3191992d4d88c69d"
+
+S = "${WORKDIR}/pcsc-perl-${PV}"
+
+inherit cpan pkgconfig
+
+DEPENDS += "pcsc-lite"
+
+RDEPENDS:${PN} += "perl-module-carp"
+
+BBCLASSEXTEND="native"
-- 
2.30.2


