Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.997.1612483295685170797
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 16:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mpZ8SY8+;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id e12so2635537pls.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 16:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GXtKppuMd5o9YGRaRSo55e6d0QGvDqU/8o2LoldCC7o=;
        b=mpZ8SY8+q6cMHbXDqW007poeIUOe3Pyy7AMGQx5j4EfS3g1ayJ337rgJ8w0p1tn34H
         zpprP2oxQD74DVDFwqPNhrC8xgrCO/k5xwsioHEv5mSXBg71YZfNPsaCSfDvU1pdeNU2
         1urxe3ForvQFRfetHOzSkp6wUAfC1nHv+zCsm1B+dCd9X7xLVBayD23Yy3D7KMU+ti3k
         kvsZDzlCia+oA7doFafZ2tH4MaRX5EKtRDokdcNJybhXqpd3Ko/VVU9vwjaX3uDv+Mhh
         L7LCl8LftIskKJvzS2nYb3kv0J3RqacAJE/D7kwQeCLTSfNMYPLEWmEMVeJG4fkpXdP9
         7oGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GXtKppuMd5o9YGRaRSo55e6d0QGvDqU/8o2LoldCC7o=;
        b=iMoVCwsFs4jurUGgypKuClixg7w40wiUdc9OvXeaKMZVoEUMBZinB/xdkxkv9YvPkk
         3PcPHpBIskH3oaMxy7oDR7FyFJ2pyl3ok+Gdu0J+yRb0qDhHDnl7COLWkuCCr/mThLAN
         iLplwTms29+o+yRX52jCLJw6emr3SfYSnc8NjsB4e/jt9o8k9g7vdK8+TzNv267ZZfFX
         QafbNzcq9edzBHDSzSKXMVlkJsz2AnQ1r10uPFhyxV4a0aceBzoCJlzsLwDeIrXu1Fv8
         ucbo8nQ/XauGyBiwtaE3xKj2x8SCpVPobxtk8PSq8Wa4k/d1+myCgSGquDmdgaPWkoth
         pS9Q==
X-Gm-Message-State: AOAM532FGnT7L4fg/gmTo6UJfiPaw1PmSKqwUEdRJlfCw+KNNQljH7cG
	kAVb/MOL5C+aB5avX1h6ukdBFNKx5Qzq9A==
X-Google-Smtp-Source: ABdhPJwtp729TLPFMnXCXYWzCyj9AYQat/orYBF0hO75s4AzP3uX3OAv6/41gsiZc1zpbYhIXR7S8Q==
X-Received: by 2002:a17:902:a9ca:b029:e1:b3e:406c with SMTP id b10-20020a170902a9cab02900e10b3e406cmr1434159plr.84.1612483294748;
        Thu, 04 Feb 2021 16:01:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2914])
        by smtp.gmail.com with ESMTPSA id v6sm6330399pjc.57.2021.02.04.16.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 16:01:34 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] gst-shark: Upgrade to 0.7.2
Date: Thu,  4 Feb 2021 16:01:30 -0800
Message-Id: <20210205000131.756936-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix configure errors seen with autotools 2.70+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/gstreamer-1.0/gst-shark_git.bb | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
index d047caef5f..94d05def3e 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
@@ -10,9 +10,9 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad "
 
 SRCBRANCH ?= "master"
 
-PV = "0.6.1"
+PV = "0.7.2"
 
-SRCREV_base = "c41a05cc9e2310c2f73eda4b4f0b4477bf4479c5"
+SRCREV_base = "50e3dbd3b131de2a39d3917576e8f834631ec46b"
 SRCREV_common = "88e512ca7197a45c4114f7fa993108f23245bf50"
 
 SRC_URI = " \
@@ -22,7 +22,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PACKAGECONFIG_CONFARGS = " \
+EXTRA_OECONF += " \
        --disable-graphviz \
        --enable-gtk-doc=no \
 "
@@ -33,8 +33,3 @@ FILES_${PN} += "\
 "
 
 inherit autotools gettext
-
-do_configure() {
-        ${S}/autogen.sh --noconfigure
-        oe_runconf
-}
-- 
2.30.0

