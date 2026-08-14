Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C123BC5DF74
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:00 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24520.1786747611145593606
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ancnJ8yR;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1395683a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747610; x=1787352410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8SgptUaPW4ZsnjjOSxgdE70cbycZnsi7hEpIWY5Tsek=;
        b=ancnJ8yRt584EGqvITAPE6ofiK5eRhyWvyminH9dFTj8SbwpcvOOKC2CWCiMcs0Klg
         FTEudxYuZV0dB8SQ6ARbCBIs8iGSUq6jUlKlKrLr454mNWkgnKgH3eetPIf4scCRCmTB
         dwKM3Evt/Hc2tHlVE6Xp2zBPIFU/97Eq2Ao20Tx4a6lYxfz0d8Z3QL75vmYUzwMpmqXc
         7G3WoTELDIXodbz32+at2JZ3QGE08Lz4N2Owz8bnJhXDLL6xu5qjsZ/y+JBznlw/ffhl
         0jaRMnauVR9CnKw+wiDaz2t1Fnt96wp57qyQhb4fX1K1Un8SeFdzH7lQVMIlRkDve/ek
         d9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747610; x=1787352410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8SgptUaPW4ZsnjjOSxgdE70cbycZnsi7hEpIWY5Tsek=;
        b=iKRRuCY5X1+FYW/D+CxBZU1nzainsrdm198xq8/SU70SUqtNfsrfMJaMgP+XgCXGi3
         qSZJHVuLdNoupXLo0bBLNddJLZW6A6LWZUQp1MRfI+04enkXeDWPKHQAxFsW6F2V+rSP
         UFS0TisD2AZJlCl3QhE62lw6SilWxSPyzh+MPSqEHK+OM308BtY9uAo33EqnLIlSECkd
         4rJyk1Kg3axdckuUd2sOo7X1HjTBxNTbkLvOtbxwu8wvmaU8QbM8mTQVgUYu1JNx86TE
         DEf9rVSztqMPevYTNznvprDHP1XxVRmDu1cbq0OqKQbEDrESbhcXbR8IgvJ6e7pStO+A
         e88Q==
X-Gm-Message-State: AOJu0Yw4FHCV5w6nynFhn9oySLwu1srPjuL74b6aQCIA+fSHmhqzB7Eg
	5S1HXrpQxcj2kDAAdphpoC1weY/1f2/rJIiD47BSR7tf/DOjXu0ZC2edaAGmIVWg
X-Gm-Gg: AR+sD118daGyUgDgR13hn7fyrR2dfG1oyZ79CMr9ZZqTAAxvYMfoiSlUGtriE2nfVcc
	125NJ9flqgZh92ULnajijqSP7yNJ6y6kqkZiguR9vTSGzcYIYr982PJTWBqhVqTln77HW4OHCXQ
	b2h6BrpyneOTS5tzelMwZo0+XPRSlnswqjn6VkC4RdMULxFJgdIVOQQGe2hiGZHbxsNK2UiErqe
	LVH38LJlXlU7uCWxoRe1Oc0kXdus5NBKa2bCcBnIwpe+8DgboSn/NF2omOggzYT9zYJI7t7VrZg
	rzjUIyRn76P4PE6sjqH+ABVgnn2HYSU0BODmDOvO0Vu/yMmd6uK9JS0SkiT7n4ugnw+FKd+wUKh
	4oj2mvMmhMXJs3ltDNR6qcmhAn5hd3vOz5WGlXnfez32mCU3teCy1pn+rG8NFgZQArOtBEHt6f9
	tc4NjNmUMuHX8OHt6aEDPJmIkGDGammPkBDlPEt7kgDlN7hCh+TxKj0kY2iVRLeteLwU4dIqHcV
	WTOaOxLFBrdE+Srq/w8DG+NU71DOPLHSBkOJ7CjilEIKRjqvboY74URFO+mijSHGhFULhxHSMQ8
	Vp7PXat/YyTx90ewulG9jv9UlxG8KnopXcxDfLu5PKCuPN52PMpBntJloIC1+IEtAD/S/pFIVrj
	ZwOk3O7QF8bcdwJn1DD4RCrrfFbWTMBI9MlDPiVtno87MQWmx2L6gBvRJ
X-Received: by 2002:a17:90b:4a89:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-3933b714d58mr9644545a91.4.1786747610277;
        Fri, 14 Aug 2026 15:46:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 061/109] rtorrent: upgrade 0.16.12 -> 0.16.19
Date: Fri, 14 Aug 2026 15:44:47 -0700
Message-ID: <20260814224539.1523174-61-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129125

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../rtorrent/{rtorrent_0.16.12.bb => rtorrent_0.16.19.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.16.12.bb => rtorrent_0.16.19.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.12.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.19.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.12.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.19.bb
index 135f7b1665..29c5805916 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.12.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.19.bb
@@ -7,7 +7,7 @@ DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurse
 
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "088bf40bdfe0ba23bab22c17f3bcc89a9b1a97de"
+SRCREV = "247ae7621a7d2596a7f3df69e417b0835b5409cb"
 
 inherit autotools pkgconfig
 

