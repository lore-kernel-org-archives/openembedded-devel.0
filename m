Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AB8D3E787
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.30596.1730838806234872904
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:33:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PycSW8L0;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e30d821c3e0so6016237276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838805; x=1731443605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wT9mXNEp7dPELe4OQCgoL/qLI6LLIRBFv81Bs1a/fRc=;
        b=PycSW8L0rB+O86TV2Mz2mHcF7GGZ7aMSQD8We7+BXz1U7PPzNEFm/tdaKJ9F+QWFEf
         AXG4SILPVMMMTEgK54zNU5wVd9I9M3s95l6jUKpobl9gVwCe4YFC1mzpp7Krq4V5x3dO
         kxeE1/lhJbxNte2SALVbbrjt/lJUsF9OtxfdetBpQZn4Zo/IkXvRbDn0ESwKkqitr1nm
         o04px6W1gJSFtSeslvopN2lrKmcZ+6Bqq8+mfgzFGKxCMKXJMuukjipKS0i/JR9ukhYA
         JhBIImlQTxNTbact0dMaJIW7ANPQyGMld1/GeD2hkv7qgv7xyzGSdLhqhq/hCnNSVNgR
         QlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838805; x=1731443605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wT9mXNEp7dPELe4OQCgoL/qLI6LLIRBFv81Bs1a/fRc=;
        b=Wil5BuPfhQuShfiSGXXA3Y5pYeS5qiAfSEtcwL3Z7FiqMPcfHnikQ8HrNwhRABFhn7
         v4JU7aNkaYD9gWF9UT6jue0k3cyMq9jpdwOZOm6Wun/N8HXEu9ffZrsfJOIxaI5OffDO
         zQ8ntd4yh+GcKvSwd9xkAzHufrGYRZaHX+zB79BnXsl5XvtrWr1mor8dpEH/x05XFdnx
         r89+9XZkjtmNAHaRiiI/BCdb6AdM1d/3u3wYRto9KSZM6438Y9S6JWHmRP6eKeACIdDm
         8QWadY91k9ptw1QTCWCO5LVASk7w6hlLcwpBUxLbOFCJ6Sh366DmYVYACHfjhxPLGp3P
         m+Og==
X-Gm-Message-State: AOJu0YzCs4pcuNlRWf0YfADZRzoaVMIvQNq5fCcxuv3Grv/IP8ox2CRK
	RxzZTvtlZeZrPIm80x+DVEbOGRn6hj16w9sE9b3WMJmxrpap/OcbHuS/cd9S
X-Google-Smtp-Source: AGHT+IETTFep+MJzK66/2m4El/uTEpQzz6+fLGk/vFT7g+nWMlRBMsysmDtOkC/XrU8bJYGCQGqJog==
X-Received: by 2002:a05:690c:708b:b0:6dd:d709:6f18 with SMTP id 00721157ae682-6ea64be67f5mr188142797b3.39.1730838804940;
        Tue, 05 Nov 2024 12:33:24 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:33:24 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 116/161] frame: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:41 -0500
Message-ID: <20241105202827.3104-116-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113633

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
index bf62e8416..9d905cc22 100644
--- a/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/frame_2.5.0.bb
@@ -17,7 +17,6 @@ SRC_URI = "https://launchpad.net/${BPN}/trunk/v${PV}/+download/${BPN}-${PV}.tar.
 
 UPSTREAM_CHECK_URI = "https://launchpad.net/frame/trunk"
 
-SRC_URI[md5sum] = "02baa941091c5d198cd1623b3ad36e68"
 SRC_URI[sha256sum] = "cfb9ab52cdccd926f1822a457264d0014c7eb9f4600a72626063dd073b26256f"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-- 
2.43.0


