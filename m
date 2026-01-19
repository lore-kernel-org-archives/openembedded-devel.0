Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9B6CA6017
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:39 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31274.1768811317936141646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XoooUkpF;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b75e366866so1120180b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811317; x=1769416117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9kGBsSn2VEdXVOx/Cuy2ZCUAmgWR6dtD1ZdKF2xitg=;
        b=XoooUkpFb32BkapHay8inDQU+3uzC3M++Whk1UmOa89czdsUXTrH8sUvPBvl7q6M49
         SYNqcLPo0UE25buB/lUy1VPtz0wFCOhyF18YL2gwfYoFFHAO47Hsrq95wG/8mcigi5Vk
         det6zt76S1gP8cl4+iPxI910OqXOXjKHhvS5m5h3/vG7xlMYzbJqUi8X1M8LLcu7ZJOS
         gfu2pkssM/SqklQY8pmq6zL9FuSk4hdeEnZon+afilkfqFgIJ1MmB//I65J/5+EC0Cyg
         OPB9lMti/TLbmNzbu4Ga7WQTq5ltDn9W0VYWfTDGDgCkJJRcUbW2JWBR8Zd605qa11g3
         uaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811317; x=1769416117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+9kGBsSn2VEdXVOx/Cuy2ZCUAmgWR6dtD1ZdKF2xitg=;
        b=jaHQnRjR8Rgwo+I6DV9tPH0gP13pLbjdrIHfkckeKX97Tz9XyrxYTRMSZrQDlpNHoD
         Ey+TzCY3nx4hrJN9XpBYjb7C3yIrJb6fgaa07Ip5LhO6k2LamFVHHIfOhDsGcqK5QJG6
         U1xu5jaVKQSCfL/qvBA/mmIv8RZTY/LtqKbm3HtdSaEPDrOtM7wfccyiGueoLXGr7y3Q
         JY3+qlPQ8EFoSXMRs8r0rDE+UcwqWqdeIGi1FHUARk3TmtUiO9TIsFwiaZqzTztXCPwE
         9oHQKION/JuZE1ywels4subMkMH6AJ9onD8gNJKzZ+AcCb8Wm8YDDAxpqsKZEdNoSEP4
         SkbA==
X-Gm-Message-State: AOJu0YwVI9GU3JbIficSEv4Qg+qcwrrfe14AOy4xwYIET+umN2oLryuU
	zsylkcsEs1DG7olmk08TtbyCmRCR2QFZp6JmXEkMLNgaYM0Fy9sc309dDdWckQ==
X-Gm-Gg: AY/fxX7mqTQ/3hac/Wrqkpglhd63o24TPnx3VyvEX+8thmWrch2FOgDqtXTduSbMR7H
	nWguvA3EcUExBWNqrXE96GBCvXpZRKY8/0fLb/QLQLAV43mtgb2PA3RcKCHMt0cWP7gR71x2F4J
	DjL0Bs6TWVhD+8MTDolVzXdgo9J/5gmfP0hswer5M8yAP6WaCrpdQKjVNawffA3adBSaTwcAMGF
	UYLeCb0bc+6FDr3ME7ME+MpxCeD8WZKio8AlOy/QFNxPL3Yz0PFaPu/QwdHkS3eHrXLMvaU5Lp7
	/aITAZyhnGOs2KSOVPaCO18T6R6nPkLEe0rTUyBs+r2n1SRlisQ1FCJLjPT8gpgo8IRasCAOdw9
	fWL6Jf365Llbr2E5eroyLMCRH7f6sJ8A8zzBqgsCVD6klIQR81ifZEKckjRZNHE1o4Tc/UOEfOA
	vciCyKPC4BRDIWkj73aI27HzY=
X-Received: by 2002:a05:6a20:3c90:b0:35f:5fc4:d886 with SMTP id adf61e73a8af0-38dfe6f8676mr10172299637.43.1768811317098;
        Mon, 19 Jan 2026 00:28:37 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:36 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 14/28] vboxguestdrivers: Upgrade to 7.2.4
Date: Mon, 19 Jan 2026 21:27:36 +1300
Message-ID: <20260119082752.4120991-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123608

From: Khem Raj <raj.khem@gmail.com>

This is a maintenance release. The following items were fixed or added:

GUI: Fixed VirtualBox VM Manager crash when host was resuming from sleep (​github:gh-121, ​github:gh-170)
GUI: Updated native language support for Traditional Chinese, Greek, Swedish, Hungarian and Indonesian translations
NAT: Fixed issue when multiple port forwarding rules affected NAT functionality (​github:gh-232)
Linux host and guest: Introduced initial support for kernel 6.18
Linux Guest Additions: Introduced additional fixes for RHEL 9.6 and 9.7 kernels (​github:GH-12)
Windows Guest Additions: Introduced additional fixes for issue when installation was failing in Windows XP SP2 guest (​github:GH-142)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 0ecf2814b207cc25962a3949c8265d856a355ea0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{vboxguestdrivers_7.2.2.bb => vboxguestdrivers_7.2.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.2.2.bb => vboxguestdrivers_7.2.4.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.2.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.4.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.2.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.4.bb
index 9b01964334..117cdc967e 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.2.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.4.bb
@@ -14,7 +14,7 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
 "
-SRC_URI[sha256sum] = "b0e63bfb855327aecf1122cda33390c33734e5ffed72f123f5edf786a8ce1393"
+SRC_URI[sha256sum] = "d281ec981b5f580211a0cedd1b75a1adcb0fbfcbb768d8c2bf4429f4763e8bbd"
 
 S ?= "${UNPACKDIR}/vbox_module"
 S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"

