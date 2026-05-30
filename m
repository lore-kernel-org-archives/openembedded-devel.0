Return-Path: <filipe.pires@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09FBCCD5BD0
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 11:54:26 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5332.1780142062376445928
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2026 04:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=r63HKQ12;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: filipe.pires@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso127279035e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 04:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780142061; x=1780746861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h2fchBIllNYqBIBtuCGIrAOW8ubtOqlp7X00C6x2hK8=;
        b=r63HKQ12ivEs+J+mnpr5h9XU8xFQ5fsoEUvEfx78zf8hzfhpxzXVLpfBXoCjr6DSGF
         Z4iS4WVB5CL0jcl84GGlVMQzc6FXDYKL7iBnKZNRB7Gwpr88RIg7PV2sLMLU7XghOVBt
         omOOlo6nnhq/2xssejWn6ZJ1qDPPK4dyx6qjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780142061; x=1780746861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2fchBIllNYqBIBtuCGIrAOW8ubtOqlp7X00C6x2hK8=;
        b=MKe9XQ5Y701Goc92L+190YLxxhx5v4ro8Pl2R+jh+wCllbkpdLqhfkRK4NqGguoueH
         YnS/Y3DWPa29CQJNj9UWuHa0fmdlPgCeA0ldTq4SjFze3I0lEzqPAxcEyh8P7GPzhRce
         VVq/iTYhY5iQrhiYiAlGUWzGkW+qBUhCsXYu7Tl6roFtsyj2o7p+BtTwqRP58tfY7RT5
         kJQGH26aNfvEEf4Qn40tSIlE4sSR4k6UU7b63YeXmSg3ElCDdq2Rb+oKgswbpynnovzt
         6N0U7DfBtlM39kXcRczA9XnGEPVMDwrX91fdG0y0rvQTBmx7fkJUS872uQMc1xHlXVxr
         +8ag==
X-Gm-Message-State: AOJu0YwSTw8KffcF6IMApBdhBuO7jnYqN6vWkFBWhUZm6iEeJMcBeRTb
	6iSA9f9ct80NaJHSZ/06Uk3DEdRcl9FEEqZ6RrP+XspDO88USN6cepgp1W5QgZank2+NWDDyb1m
	ThJ1p1jg=
X-Gm-Gg: Acq92OGrJECxDLUs4aCquKCtzphRj/8BgUgJ37HtAu17KltmX5PLuZJOCuSgsJa9R9c
	Y3FJCbElPM7KSFktb34PA2Hb4sG/81R7CZW6SszRM/E8XXpeqaP9/Hj+DIrJpGuFcD5ofkIJotd
	u8yK8nYbIUF/OLRw8QZealBOsawCFd96y+JQAaJEJ7cYVnQVfafME9j5mAvlXRB+kjUO2qVTIuc
	IfohDjh/leR65CZm8n+q/8sYAUOxO6arwfbHYW+n6FnNZ+R2oTx4DpIemWXId70V/jaSrPIieaW
	4IXIRV6mNS5bLD6O5YW0jlqkMUa2V3A1lv2SDYrMmFk8JtRohuT0zZ9xGpEBe7fXUvGJl0oTn//
	V3y59A3PLbffF+PTxR6MgxuQKCWyBzbwn2KFBYwaJh8YzA/uOKeCbNm1E8yHijHcvBoctux7941
	DJIjQOs8GJ0vbOA0FNEcBcb/9R3WHGtxjWW+rwmkHXAB1I
X-Received: by 2002:a05:600c:3e88:b0:490:4ebc:b80a with SMTP id 5b1f17b1804b1-490a29e443dmr56359825e9.11.1780142060634;
        Sat, 30 May 2026 04:54:20 -0700 (PDT)
Received: from thinkpad.lan ([2001:818:c3da:6c00:a4e3:eb54:80ab:d9ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909cab0e79sm200177475e9.13.2026.05.30.04.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 04:54:20 -0700 (PDT)
From: fpires96 <filipe.pires@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Filipe Pires <filipe.pires@konsulko.com>
Subject: [meta-networking][PATCH] lftp: upgrade 4.9.2 -> 4.9.3
Date: Sat, 30 May 2026 12:53:58 +0100
Message-ID: <20260530115358.3937038-1-filipe.pires@konsulko.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 11:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127297

From: Filipe Pires <filipe.pires@konsulko.com>

---
 .../recipes-connectivity/lftp/{lftp_4.9.2.bb => lftp_4.9.3.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/lftp/{lftp_4.9.2.bb => lftp_4.9.3.bb} (89%)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
similarity index 89%
rename from meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb
rename to meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
index 927916f985..0b1ce1a376 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.9.2.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
@@ -7,8 +7,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2"
-SRC_URI[md5sum] = "42ec1793c386702bc2734ffbc8a5cff1"
-SRC_URI[sha256sum] = "8a07cbf4df09b107fe3fc41d133ee2f6cea6ef4c33ccf06c8448ad058cd96b7e"
+SRC_URI[sha256sum] = "adceaef1bd21a38d07c973233fab603813c431f0a8dcbd23239fa9a41ae17b6e"
 
 inherit autotools gettext pkgconfig
 
-- 
2.49.0


