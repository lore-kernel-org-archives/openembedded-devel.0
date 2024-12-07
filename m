Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44DDE7717B
	for <webhook@archiver.kernel.org>; Sat,  7 Dec 2024 11:36:37 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.58441.1733571388886318486
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Dec 2024 03:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OHaD3ccp;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cecbddb574so3396965a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Dec 2024 03:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733571387; x=1734176187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ssXTBXa43FRifpw+PeC3KDIQSxhVbMPy26U8zr0AQ0=;
        b=OHaD3ccpeXqY9g1/TpSWf+BmPaaesOQTDx2aBM1H+/27eNPVpFlhMnzKMwkvgv/ARM
         I3AKVX5C+ZOxFb3i6zY6aUaMjeJcohrMafyzjC1/iYIhSFHp0pjptfYACRXhIFUiohUA
         h87lQRn32Cg2LgVpgbZwWqGlH6UXhoR8evmlZSY6OXAQ+1Nkwn7kFFIgeHKukYlyBvfZ
         w/ql6nKTJGJlsIVzfu3pJ1eC8jDQakkpeM/uMBkCqUz6BNPvSCaaOYlNEW+SKNohX0Qt
         kxXk6kd37v2tQ1LznRJk88J5WFpD8wyB0C6N9v3pgyY3nUf9Yg9WDkRuTObhbeYz9K8b
         KPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733571387; x=1734176187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ssXTBXa43FRifpw+PeC3KDIQSxhVbMPy26U8zr0AQ0=;
        b=ijCyxBdotkML1Tzqekav5HXAhdejEz2//Ljh85H1F7wtcMN++qKfSPatxa9hlIYCwL
         VN91CDxrlO16gWhDReHLz3QMZqeTdBGpHxZgASE10uFYP0DCbx+IzcjY+gCi02EDl++q
         XgpWY1Z93u8Vvje2URDIK2M71TJnKyysWyRyVamOFOlBl+VH0wKNcxFphFY6XEgNl99k
         Du1al2b6HV0xcNf0ZYk69U0zZibtmbcQXc5RtVaC3bf7bAiPUA3sKEzyM64s8TBfP4x8
         +nQS/L31GkWWTgqCLtCZaHpYondppT8u5KFKRFapt88DAAqfIZR2tyl8twCcFEwLN9CM
         3L3Q==
X-Gm-Message-State: AOJu0Yz+piwvnel6eFO3EbttADdA6GtLygIXfB2aLNZ6iagZUhfTpVkL
	KrtqEUUuLDe0I97L7QzUfulzgMFdSGZEdjOnKUUDnVMjVZ/Lcs8JXaaKYw==
X-Gm-Gg: ASbGncvdQ01n1xiua8XWLQGm0HLrIvQCdtpVmfWsSFD18LNWqXtBtHePgpeDBtYjkfH
	XoPsI773FGkuGtZMiGmd4n1vnF5jZeXLNTN3QFIMF4MBv+K1Fx5RpbAFq0Ixu9EHvMvC24ta78u
	YcsBSNRZ86qr6UOyE0sfv1ZQyQ6N89d8wDJOYsu07anx1/OXVAPQ+sm8RrNMm+yDassAGXGy9Gl
	brQdjzWvLBWQ8J+Tbe7JeLtslti+qTwfveIayoYRz/IgVwLmN4DJcXeJDch8p5BYnKjaSuAxOix
	MsBHLw4=
X-Google-Smtp-Source: AGHT+IHm/qQ1+B09wOrI5TU0JCMMiBgXB1B/NZPFyraelsNN338UzLoAHJoMllNpvLZC7ZjDN445xQ==
X-Received: by 2002:a05:6402:51cb:b0:5d3:baa3:28a with SMTP id 4fb4d7f45d1cf-5d3be65a53fmr4696398a12.1.1733571385532;
        Sat, 07 Dec 2024 03:36:25 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e972c1sm370395866b.76.2024.12.07.03.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 03:36:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] openhpi: explicitly disable ov-rest plugin
Date: Sat,  7 Dec 2024 12:36:23 +0100
Message-ID: <20241207113623.3749632-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Dec 2024 11:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114221

* since elfutils upgrade to 0.192 in:
  https://git.openembedded.org/openembedded-core/commit/?id=1d6ac3c811798732e6addc798656bbe104661d77
  json-c is detected in RSS and ov-rest plugin gets enabled, but fails to build:

../../../openhpi-3.8.0/plugins/ov_rest/ov_rest_event.c:78:10: fatal error: amqp_ssl_socket.h: No such file or directory
   78 | #include <amqp_ssl_socket.h>
      |          ^~~~~~~~~~~~~~~~~~~
compilation terminated.

../../../openhpi-3.8.0/plugins/ov_rest/ov_rest_re_discover.c:707:23: error: initialization of 'SaErrorT' {aka 'int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
  707 |         SaErrorT rv = NULL;
      |                       ^~~~

* keep it explicitly disabled as it was disabled before
* add rabbitmq-c dependency for the first issue, the 2nd issue could be
  worked around by:
  # openhpi-3.8.0/plugins/ov_rest/ov_rest_re_discover.c:707:23: error: initialization of 'SaErrorT' {aka 'int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
  CFLAGS += "-Wno-error=int-conversion"
  or better fixed properly by someone actually using this recipe

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
index ac13d7a196..d1e08cd073 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
@@ -66,6 +66,7 @@ PACKAGECONFIG[sysfs] = "--enable-sysfs,--disable-sysfs,sysfsutils,"
 PACKAGECONFIG[libgcrypt] = "--enable-encryption,--disable-encryption,libgcrypt,"
 PACKAGECONFIG[non32bit] = "--enable-non32bit-int,--disable-non32bit-int,,"
 PACKAGECONFIG[snmp-bc] = "--enable-snmp_bc,--disable-snmp_bc"
+PACKAGECONFIG[ov-rest] = "--enable-ov_rest,--disable-ov_rest,curl rabbitmq-c json-c"
 
 export DISTRO
 
-- 
2.47.1


