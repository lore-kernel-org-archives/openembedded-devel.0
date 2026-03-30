Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3EFFB3D07
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:39:19 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47974.1774867154309493692
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a76vBMkO;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so2515476a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867153; x=1775471953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMg7jx0PvCkNbniP6bSOtgo0oukuDjSxj+1X95/lPJQ=;
        b=a76vBMkOZ10830v66TGPI7x0jJF/u4dT6e7HNhyjlN7O4rVso8z3J/NN6yLqMOY4Hu
         SzW9XRGsWISCzMIhUb+6KBitSFWVIXaiAEywRvdedRx7qwIt+UYlvWi4sEffkzij8Gdr
         BxqVMXRpfmalgyEam5M3oj2GeS7WN+/XmDNevWbqeoiD7PEbIr1TvIs0bLOTKSiP5kdQ
         00xfM7NjMnuNSUXq6fHL+FbhTgccOJv6jfll2Qv/87076kJJccHFKmHhp7lUtONDg52V
         9EWZdpfmJFwu5qJVpqs56tdo38o3LJFzgIuit6D9MfaPQvCchv0QP3tdghjyA6R/7E0P
         vl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867153; x=1775471953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aMg7jx0PvCkNbniP6bSOtgo0oukuDjSxj+1X95/lPJQ=;
        b=ZqjhtKKleKufeJBRyaSFfVTHV4k25wplKfA8jOIDXjwp3QZoWrMEg67UEyAmfR7jX4
         vCeSbm4Q/kr8RWp7Hvnahvua2ERkg7tb4Ab3/Uk2cUsR3BRMZBnzBpav5IBMmmtMtkzg
         njL673gLMPDIzCv12m6E/Vzz371m12VsuyHFkun+WbLcxVF3BJ5NMOt74GdYKwSC5QVp
         n3sGTeVB/2utPXwyZ+JU14Kq4tHoj7vtuVUxVX9VcoeTrjmADsibpIQCYolK6FvOwtZV
         Mej3L7C0Ucn+TH9ViSyH1PD4mxkeflStjn9vEi29v2mbZLxzsykeMyDVPoanCaDvOYXj
         WxUQ==
X-Gm-Message-State: AOJu0Yxi7KjtNgvX1YKTBjBaGkbYyR1ez/NYZGwYD3f7mlyLA0O5qKrm
	y3DZuYOpjCC6/2dj89WvMmhfYqlq9sxQvcx6Ki/2y1t80xJVR+FxCJ4ZMbSXPw==
X-Gm-Gg: ATEYQzxq1wWtfPnWoSLNwpJCjRc0iplyXJIUASAf0wJzZSVPv+1cid81j9AVp88FR/H
	oTHYKF6p5Plvf5pi2iEMvFce4GbuDHpr2dPTjdZHPfmejdgPlhexq/XScx8m0AYnXoKlYMt1GC9
	ryZ+hArZkOVR6SOWLMWjmMRuoQeOlMBA5H4zje91e6u9BhkUH6L2u3hKpcHhqQxQ5FVXodH0P1M
	6bXKqpUKbQWI7gyL2S/aRfVR72I56MLoJHNcm/bTsubix2/dVBx7rxFGokL0rDvmGaLajrCG81h
	dgskm1M82wVhNvTH82mHF/iU1Vo43sG+J9K1exZjkUHvuvPLX8QEftfeTm5dCEtdujYbaB/xQHK
	EuMDWNyX4AtJ7dU7S0dUWHz/XUhFk7l9PF9Ka2dMNKL0svOC9dkwvjmsZjfiYIq1QrrzX170W2H
	7DZmqpv/ub2OIOTEUwul3DX8oQ3tt+ARmBt64=
X-Received: by 2002:a17:90b:3d4e:b0:359:f0e1:f8c9 with SMTP id 98e67ed59e1d1-35c2ff50663mr12178179a91.6.1774867153468;
        Mon, 30 Mar 2026 03:39:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 4/19] openldap: upgrade 2.6.12 -> 2.6.13
Date: Mon, 30 Mar 2026 23:38:31 +1300
Message-ID: <20260330103846.3381644-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125847

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit b089df410f7877b4a45e79047e091ea8d3875bc5)

Changelog:
https://git.openldap.org/openldap/openldap/-/blob/OPENLDAP_REL_ENG_2_6_13/CHANGES?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../openldap/{openldap_2.6.12.bb => openldap_2.6.13.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.6.12.bb => openldap_2.6.13.bb} (99%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.12.bb b/meta-oe/recipes-support/openldap/openldap_2.6.13.bb
similarity index 99%
rename from meta-oe/recipes-support/openldap/openldap_2.6.12.bb
rename to meta-oe/recipes-support/openldap/openldap_2.6.13.bb
index beee1b2738..59f20d0f08 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.12.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.13.bb
@@ -21,7 +21,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
 "
 
-SRC_URI[sha256sum] = "1716ad779e85d743694c3e3b05277fb71b6a5eadca43c7a958aa62683b22208e"
+SRC_URI[sha256sum] = "d693b49517a42efb85a1a364a310aed16a53d428d1b46c0d31ef3fba78fcb656"
 
 DEPENDS = "util-linux groff-native"
 

