Return-Path: <fede@evolware.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EADC433FE
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 14:13:59 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.6393.1665065619808113394
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Oct 2022 07:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CPBea+zK;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: fede.evol@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id kg6so4838226ejc.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Oct 2022 07:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=48vh2WSKBsVBP4QY+rCW7dPWFKoIJ0s6lNnTvL79g+Q=;
        b=CPBea+zKExG+kOb8SeJIn871sROMdPTLJdcnX6X3Cfe4HaR1fj26yxFnET0xhm1/5M
         olo+Ha6v0UI7LjS+krs/gT7NBiLYyUqLSyS+uKf1wq4a+J/M/teXixUuXVGA/2J1m4G+
         I1AcCPgLCbGS3YcoNqTk/ytzwdxNpDk+s7IRDdoFkzGNGSwPn/wgX4zc5Sxn8Dqa/FiY
         iC9pBwO2wvOtCJ0kOsjd2J92jMgy9WlPw0n+IcXv3JpyZMjDNqNjARgqEJDVNorQgZdW
         DSICjQ3bgIGCnH4SRE6rvf7rgrGPHpcZDOLhQv0nfW2lLyGKiH5DnSlfalraoylRJmYM
         6/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48vh2WSKBsVBP4QY+rCW7dPWFKoIJ0s6lNnTvL79g+Q=;
        b=wNET+kxwbyr1Hrkw0VrJegS0OAcNbWuaOKeL2/GWJ/hXllysAj8kdL12FcU9FZ5o1I
         fcC9wpcBwrsq+/m/Z9bqGcY0c4pI2bfPsAXGg7HQ/vg0jNkotMiZWZaCBfiSpRuMs5TM
         kDOCOpRKfMN5buIeFLMfcJh51K1XALHUiZUpxSCUa6G5yMmRH0XBpHInnNAyitUm+Ddi
         9lSNftYPPCA9hbiI0SPhylVGcPlWYb5WW39VUzdsXDcIA0Z5zsokmwM24n6FvJkxiptP
         8qaFLgL1dDsB3okp9ODqGZW14R9xJuHL12qLg/G0Ql+LJRwJvCFobwAtas3G6WCrFPMy
         1RJQ==
X-Gm-Message-State: ACrzQf0W7WrDYf14f4ZKDqmM3Ila5JeZu7SXLgXNh+CsvqLptKqzUpD4
	AjX5zYRyRBftEyubbLOCbTnfMQtdw3GGjw==
X-Google-Smtp-Source: 
 AMsMyM7Ycih4+zVthr4w4wVpCV8iTiWsX+rSFzSTBwxjtkZdnCbqFKPZaL7QTDaht3Ndf7m9Ko2c9A==
X-Received: by 2002:a17:907:760b:b0:78d:b8f:8b8 with SMTP id
 jx11-20020a170907760b00b0078d0b8f08b8mr57763ejc.468.1665065636664;
        Thu, 06 Oct 2022 07:13:56 -0700 (PDT)
Received: from interzone.fritz.box ([2a02:2455:e61:4a00:c805:5e99:7773:8f9e])
        by smtp.gmail.com with ESMTPSA id
 bq3-20020a170906d0c300b00741383c1c5bsm10440799ejb.196.2022.10.06.07.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:13:56 -0700 (PDT)
Sender: Federico Pellegrin <fede.evol@gmail.com>
From: Federico Pellegrin <fede@evolware.org>
To: openembedded-devel@lists.openembedded.org
Cc: Federico Pellegrin <fede@evolware.org>
Subject: [meta-networking][PATCH 1/1] chrony: correct parameter to configure
 to disable readline usage
Date: Thu,  6 Oct 2022 16:13:47 +0200
Message-Id: <20221006141347.17151-1-fede@evolware.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Oct 2022 14:13:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99081

The correct parameter to disable readline usage is --disable-readline
and not --without-readline.

See also chrony source at:
https://github.com/mlichvar/chrony/blob/master/configure#L110

Signed-off-by: Federico Pellegrin <fede@evolware.org>
---
 meta-networking/recipes-support/chrony/chrony_4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.3.bb b/meta-networking/recipes-support/chrony/chrony_4.3.bb
index 6617164e3..d0e2c4b54 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.3.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.3.bb
@@ -70,7 +70,7 @@ USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '--sys
 PACKAGECONFIG ??= "editline \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
-PACKAGECONFIG[readline] = "--without-editline,--without-readline,readline"
+PACKAGECONFIG[readline] = "--without-editline,--disable-readline,readline"
 PACKAGECONFIG[editline] = ",--without-editline,libedit"
 PACKAGECONFIG[sechash] = "--without-tomcrypt,--disable-sechash,nss"
 PACKAGECONFIG[privdrop] = "--with-libcap,--disable-privdrop --without-libcap,libcap"
-- 
2.37.3


