Return-Path: <filipe.pires@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529B3CD5BD5
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 21:27:46 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21260.1780003659095009421
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 May 2026 14:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sBQw5e8H;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: filipe.pires@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4905e190c71so58255895e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 14:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780003657; x=1780608457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1lH/6qqyUzh4fMT3pUld6uAWmPmhnd4yvLmBOwEwVVQ=;
        b=sBQw5e8HSQMTh47p9ZdgPF/mOtBDnMuVctmdrFv6fHcqMBd24/W7JVN51JxMc8o7os
         yAg/GKD59SWJd7JPZof+BVk5C6doK4fpY3i0gdBco4UHXB+3GDim0qbf/UJtZQ6YWNTZ
         Vi+evc3CPhfpb3rPGIk1q4JSEmBbpQEIJRZTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780003657; x=1780608457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lH/6qqyUzh4fMT3pUld6uAWmPmhnd4yvLmBOwEwVVQ=;
        b=T3mI8fqPR1MfCfNtXg8Ne/1dNUs9umbxbB5ADIdLK4ZgIIMq0urEgNxqYBy3ECW1Hw
         pbIRyoPkgJoftRyt91HII0nXJnHQ9n/jd5s4yT/XdWypjlsmCNQTrS8LJ5X2zXuqy6Eq
         gB0aScsg7U0DBDrJpLDrCVI/nDjI5n9gX9r4s6/veiVwc1r9Jh4qcI9shwjaFAaexCjU
         TxyJTt0nRlXnPfGjBfckjMeqXdRoiNJIxIbIHsYZD2ZgpGYrb3fDCEeRkYQoaSATTdPe
         Wt9mSyPEd1k17pD94+x7R2lEyf51zLcQJmhIt22NetaHuLKTK0zYMHpiTvdQI8XjO3gs
         SeKg==
X-Gm-Message-State: AOJu0YyO1FJYJWlAlmWsDX1/PveteC/Bagq/cHNWDpNSgbLKR9FPGvwf
	z+Oea2mI46qyOYrNwxYoyu9lbhAM/tvUUZrDBPKESn1UblERv+bXM+FZc2PGAtPzbFuEwMd6JvO
	9SkCNswg=
X-Gm-Gg: Acq92OFQta/sWTKwDdlnNDEhua7WjgrdO0Iu8RGd67AGgyTe6QMmwbmo6RIjlF2Ns0X
	zlIF8UbCzaQS3rpWTNtx9psH9br2vOfUYJDbn/WrrV6MokHA1yDYsT0ratW7lxL1+4ty+c/ltyj
	9KN0Q2RGEf1NmgVwMfB/gZPqgfETFy9B/CC4DrxgGbhWEud4dQWYbaR6TkcuQVWuoJPdjLwOh3T
	1dpNOEu8E6+mZStJZN5i6OnxBrUNOH7nXN1GjOfCpafUcehhqkGfeKr51PbzpwbgaN/z8BMxMjt
	6cSMJAXYwvMofjU1RTJgjlNnudbFn534LTIdpl+gXTa0T9yeB1VJEkEkL7kep48ukGuzO9lw189
	mEcpD0EurtaBkjD7iZnk+idh7+kotp9+C5yvJHkTSR85t0Q93GKZUA12Uiqv/I0phnZz3dQFYbw
	LrX/qgRCkFjuX34p7rIz4OiJc0PobfdOQSfxsVBL2a+P9N
X-Received: by 2002:a05:600c:4c13:b0:490:b07:5f27 with SMTP id 5b1f17b1804b1-4909c0ba8dfmr1599875e9.24.1780003657163;
        Thu, 28 May 2026 14:27:37 -0700 (PDT)
Received: from thinkpad.lan ([2001:818:c3da:6c00:a4e3:eb54:80ab:d9ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ee2a12a69sm9381034f8f.16.2026.05.28.14.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:27:36 -0700 (PDT)
From: fpires96 <filipe.pires@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Filipe Pires <filipe.pires@konsulko.com>
Subject: [meta-networking][PATCH] igmpproxy: upgrade 0.3 -> 0.4
Date: Thu, 28 May 2026 22:27:34 +0100
Message-ID: <20260528212734.3592826-1-filipe.pires@konsulko.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 21:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127277

From: Filipe Pires <filipe.pires@konsulko.com>

---
 .../igmpproxy/{igmpproxy_0.3.bb => igmpproxy_0.4.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/igmpproxy/{igmpproxy_0.3.bb => igmpproxy_0.4.bb} (74%)

diff --git a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.3.bb b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.4.bb
similarity index 74%
rename from meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.3.bb
rename to meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.4.bb
index e8567ccebf..df1e8f27e1 100644
--- a/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.3.bb
+++ b/meta-networking/recipes-daemons/igmpproxy/igmpproxy_0.4.bb
@@ -5,8 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=432040ff3a55670c1dec0c32b209ad69"
 
 SRC_URI = "https://github.com/pali/igmpproxy/releases/download/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "5565874d9631103109a72452cecb5ce7"
-SRC_URI[sha256sum] = "d1fc244cb2fbbf99f720bda3e841fe59ece9b6919073790b4b892739b1b844eb"
+SRC_URI[sha256sum] = "afa4b75a823b82f71ce99f33eae4e8136b906ae8a5ede5caaad93bac38cdae24"
 
 UPSTREAM_CHECK_URI = "https://github.com/pali/${BPN}/releases"
 
-- 
2.49.0


