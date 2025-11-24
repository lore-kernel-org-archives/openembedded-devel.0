Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C692CCFD313
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 04:52:25 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8944.1763959943799703678
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Nov 2025 20:52:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ta7DGM2+;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78a76afeff6so38032757b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 20:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763959943; x=1764564743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DsJ5fOzb/MSSvzuRC67oDlVtXvvmWFJm7PbXwQPeMTs=;
        b=Ta7DGM2+yxnk3ZS3km2Qvd7cjQITWsKJGF3IJ2CReq2ybZiyUnpP4u2eZnPM3aqeFS
         FmLKi9gr9HHpfoAWwRL5dRql+tfwi4p3VsuQH1Ohf319uAjNTkVzunlhITSVcuxU/qGB
         9fv17o5gd077NCFmAfawVfqV1l4XwW12x3hjwArW+EUfcqmYNEXFbB1jtYtE53jArs26
         jz1xflKUzJxJrez4V7ti5pCPbKrkozVICtqm5JpMWN+HZHWPgEBx/RLtvt0gCBpwjUDR
         Q814Shu/BSsIkSstkVqfoRY5PnCJ1nLTz7oe/8TX6CSw9os+igEBswlaTGjTTGBzlZ6R
         Fm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763959943; x=1764564743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsJ5fOzb/MSSvzuRC67oDlVtXvvmWFJm7PbXwQPeMTs=;
        b=ENcDKyaw8vFpStU4TWSO79bZtmku64OTVtJ9fzPiIeCad86j0l3XUCHwWZEqyaKZaQ
         fDWVpinaRDI1VwvL40ItAoEvhSNCW33NgMPZbbW7DqRvdbmXZNzjAHj5VvRpo9pOOhXQ
         stScOZKX9Upck6ch4JGIqjapBLG1q1irTUsEzCT0tDjmjKEcMWTeKCOqTmbI2CAEDG0e
         N7qnmdfo4NHEVv80gM4iYbb4kav+Cvq2cPxPmPETrT3gEpiL2zRR0c+5N8P4o9ae76Au
         hOrGJfwAfrltS1/sTfA1Wg0PyqLtblu460z+wYaj/cCBMLrSAX2ZYI+HatddnMfOcBs8
         g05A==
X-Gm-Message-State: AOJu0Yy8luh5QZ52JEUuUfdkunB5/bCF87b25ix0J15w6yZ2dKYt9rQu
	nWB42v6g2UCOuFtk9Qcl0atryVPfy0B44LYAqFh61l5fOELMJ9cOVQpope2Zh6O+
X-Gm-Gg: ASbGncshiSvhbkRU6uAEKUOkibxYp2jVLEjkhCLe31I0bv9wzclDagkphnGZIqaIm0M
	H8pXpOfpKm7LojBC/1d3P4p5mtc7sntxjOKTLCERdO2YK6+rNrHn0eH+W/kGhpRTbl3GHlzCY0J
	+EqwV+WPJlQT5tXI+M2iNlrVQBqilabvmsYxYHb0OsWO+Do0GQDNdN/FB9z6UWE07yOOzWpxAmm
	tQrX00aSC1mQi4li4YLducKi+fx4BHhprp75OARfgvzhCqo7jD4E5cZya26ZwttoRa+5MesAmVN
	X8wPROo0yvA79vd3utFZaJ95TgpecHDXk/obJasp3LOmjdFbz07kH5J7U6AWgHei2Qh6Ksyw5VA
	2b6iyh76QoZvaZqZH8YQLVeoot/j+riNEOSxjBrnBveUWekR+RE3ZkNJXb8FJv6hcRlUd4cJLej
	qALYZoSPtUGjh5xYs2iV1hOR6o8GazF6aTqVjQwApGmK9C
X-Google-Smtp-Source: AGHT+IGCVlXPZLY+AIHWbtLYV6ylRIrVFDC38LFCm/ghQrlr6CNBo6z2+wynAAl/QmqSbVEe6aBQBg==
X-Received: by 2002:a05:690c:48c4:b0:784:f14d:6946 with SMTP id 00721157ae682-78a8b558e24mr84924117b3.55.1763959942391;
        Sun, 23 Nov 2025 20:52:22 -0800 (PST)
Received: from localhost.localdomain (71-208-12-78.ftmy.qwest.net. [71.208.12.78])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a799274e7sm41223717b3.32.2025.11.23.20.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 20:52:22 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] gsoap: upgrade 2.8.135 -> 2.8.137
Date: Sun, 23 Nov 2025 23:52:12 -0500
Message-ID: <20251124045212.155631-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 04:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122004

From the changelog.md file:

  Version 2.8.137 (02/21/2025)
  ---
  - Minor update to improve XML entity parsing within limits.

  Version 2.8.136 (01/28/2025)
  ---
  - Updated TLS/SSL demo server and client certificates and keys.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../gsoap/{gsoap_2.8.135.bb => gsoap_2.8.137.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.135.bb => gsoap_2.8.137.bb} (93%)

diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.135.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.137.bb
similarity index 93%
rename from meta-oe/recipes-support/gsoap/gsoap_2.8.135.bb
rename to meta-oe/recipes-support/gsoap/gsoap_2.8.137.bb
index 8ce4f17075..b91187c13f 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.135.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.137.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7eaf5d4df67c0db38549ba3c714a37d6 \
 
 SRC_URI = "https://prdownloads.sourceforge.net/${BPN}2/${BPN}_${PV}.zip \
            file://0001-Provide-strtod_l-signature-on-non-glibc-linux-musl-s.patch"
-SRC_URI[sha256sum] = "b11757e405d55d4674dfbf88c4fa6d7e24155cf64ed8ed578ccad2f2b555e98d"
+SRC_URI[sha256sum] = "a6c9fb9088efd60ad0e983fa83d8440fe128514db22297b5b3f2de302106e55c"
 
 inherit autotools
 
-- 
2.43.0


