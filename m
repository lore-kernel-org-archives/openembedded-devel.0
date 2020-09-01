Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web12.8343.1598999789300190516
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JseaJclN;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id j11so1277558plk.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 15:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FTvhtCKXbxPN5Y7yzTD0uxoxorZF7vxWOvaKj29NXUo=;
        b=JseaJclNh36ydPY9ydDFrSUpBSGqG1Bg6cIqahDijFmVBFHBq5hcvDNuSk6/MZ2ElL
         O/XOZ9xNAswD5JDDCn+3YNcHS9PfIdysy0L2SrVzcsooY+mY2P7VKUaxxQ6EcloqBU7C
         vQE5yT8jGr0Bz7g6xauzWpwXDfEChF9sQyy+OJhe7cVxZ7KTB+7YdBhtPZ6kcmv3rFvr
         BO4DOCoylkdaWz+4pzHH3zsCxSdWf/agGKV35ZHYSngltvkeSOC2Uqfdd28JwoxKpfH1
         cqKD7q2WqDTKOcwjrNv87vwIqILpB0Am6mBeTFWstDR7yUnwilwVTHHcLHNWklLFBUa8
         SWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FTvhtCKXbxPN5Y7yzTD0uxoxorZF7vxWOvaKj29NXUo=;
        b=oKQiVQ2IXYZTuqa5C3w71eiJ74mN9L6l0PxuT7UrBiC8LuxgmOmKs8gBEuoKu2C+5M
         qZAZDtnpDDoiRIL1VunPmzNk6aUhmv01ZI5G5cnQWKRqJMsWzdVneKVRdRbyDpqe+svn
         P4kkU+laeHvngODtMERKZMwVeFQDRiWDoFlUJJj1KbuscuNam+jvJ9pYsZ8Akfr6rmfO
         bZoC4NRxU6+Pni9D0h+AZ3BGynNcC9J9usi3mvB1RG3vda1/lfEB6FBQfBstUAexGGuF
         cnmJ8ofWXlfjiqGAeq45fI0jI6O6TRAOXHo+jffRNHLGJxZafcX7KEkdt2ScKbYhlxVn
         hHGQ==
X-Gm-Message-State: AOAM5316P00tBQNSPLHOvnuIssm9Qy/pofXQJdWU9muPC7CnCgPWdCOQ
	XfKLH/RyyUlLWCZfiqESByaAXqL+M3Yl6Q==
X-Google-Smtp-Source: ABdhPJyHxKUEq/MnI1fuqJeEIueZsepa7MZMAyAL82z+SQtSQOD3+bTxkst8Y4amNcxBYWkHxh8ulQ==
X-Received: by 2002:a17:902:8bcc:: with SMTP id r12mr3345346plo.314.1598999784276;
        Tue, 01 Sep 2020 15:36:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id q34sm3157964pgl.28.2020.09.01.15.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:36:23 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 09/10] netkit-ftp: Use update-alternatives for ftp
Date: Tue,  1 Sep 2020 15:36:11 -0700
Message-Id: <20200901223612.1386026-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901223612.1386026-1-raj.khem@gmail.com>
References: <20200901223612.1386026-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So it can live with other providers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb            | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
index cf306ec82e..628047eee6 100644
--- a/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb
@@ -16,7 +16,7 @@ SRC_URI[archive.sha256sum] = "61c913299b81a4671ff089aac821329f7db9bc111aa812993d
 SRC_URI[patch31.md5sum] = "93d71e28ce70df69e080c7f90da63cac"
 SRC_URI[patch31.sha256sum] = "4edd46a32d70daa7ba00f0ebf0118dc5d17dff23d6e46aa21a2722be2e22d1c1"
 
-inherit autotools-brokensep
+inherit autotools-brokensep update-alternatives
 
 CLEANBROKEN = "1"
 
@@ -47,3 +47,7 @@ FILES_${PN}-dbg = "${prefix}/src/debug \
             ${bindir}/.debug"
 
 RDEPENDS_${PN} = "readline"
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "ftp"
+ALTERNATIVE_LINK_NAME[ftp] = "${bindir}/ftp"
-- 
2.28.0

