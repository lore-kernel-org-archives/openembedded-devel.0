Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D00C433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Dec 2021 19:13:03 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.173.1640373182291530967
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Dec 2021 11:13:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=C8kfDaDS;
 spf=pass (domain: mvista.com, ip: 209.85.216.42,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pj1-f42.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso9059842pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Dec 2021 11:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NiJKliAFXN3kl0SwgayDg1D8+dCGWmcN/1vxcF6dMTk=;
        b=C8kfDaDSa67lGvh81BXZHVUVEGsFxGvPdsa9H68lcVXIlHRm7FMmrFjcPbbAp5OsFr
         3dNevD/QSt4kIumjJ6KJmFUM9489yc5Qz7mx18bxZ9UOm5lhFpdAxbpq94QOREBADK6Y
         w0e6kBdSoTEYg0aBkJOATEh57kQTjzfPe5dsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NiJKliAFXN3kl0SwgayDg1D8+dCGWmcN/1vxcF6dMTk=;
        b=mPR9Z7cQznG5exs1WRhSFhTEPt7JPFJrBPYfclZAriFbm9jsXcJHDPzMQLEDMxv27Q
         KGNmR5QBrkz1ade7y+OmKiUrR7ftwvs9Fwmw69eGO5+/8eGQDhM0CK+w8lYpdPgPTvf4
         p6qtfSrB5fSErQoaqgj+x1cHX48xjjl9oxSquSWz2Xln3T0PbLrZmHtKeAtMHatVMrT0
         oGgcpaDtT+lE/iM7qlnwqF+A87sFUTbtd8WtXM+Nr/4JnmRljNjayXeFEBbG89taqtRY
         CVzLprIqtVs97Lp/B9qKoK4u/t+VJYtcYJXitv8ILRPuqe5I5Vw/X6VHRzIMB9jkxsTW
         ufAw==
X-Gm-Message-State: AOAM533G18VZUg0hvJtRf+3EvT738cGkXguvtc4bcoTrGPSU8idYi3HN
	s4UvakBP423ATd8UHgakJjPDue2XWZV27Q==
X-Google-Smtp-Source: 
 ABdhPJywOu2ioki28gHc0J5hGNhsHys/WN/DapnlPDDYx+RwJiM19L6uwPUFDvmIOQbnfUUpeeGLUQ==
X-Received: by 2002:a17:903:2343:b0:149:3d87:c792 with SMTP id
 c3-20020a170903234300b001493d87c792mr7819679plh.72.1640373181505;
        Fri, 24 Dec 2021 11:13:01 -0800 (PST)
Received: from blue (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 mv1sm12130401pjb.23.2021.12.24.11.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 11:13:01 -0800 (PST)
Received: by blue (sSMTP sendmail emulation); Fri, 24 Dec 2021 11:12:58 -0800
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-multimedia][PATCH] cdrkit: remove ${PN} from ${PN}-dev RDEPENDS
Date: Fri, 24 Dec 2021 11:12:55 -0800
Message-Id: <20211224191256.2395160-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Dec 2021 19:13:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94495

If you add -dev packages to an image, as in an
sdk, ${PN}-dev is pulled in, which depends on ${PN}
which no longer exists in the new package layout.

Error:
 Problem: conflicting requests
  - nothing provides cdrkit = 1.1.11-r0.1 needed by cdrkit-dev-1.1.11-r0.1.corei7_64
(try to add '--skip-broken' to skip uninstallable packages)

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index c89204062..e9841e483 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -23,6 +23,8 @@ inherit cmake
 DEPENDS = "libcap file bzip2"
 RDEPENDS:dirsplit = "perl"
 
+RDEPENDS:${PN}-dev = ""
+
 PACKAGES =+ "dirsplit genisoimage icedax wodim"
 
 FILES:dirsplit = " \
-- 
2.31.1


