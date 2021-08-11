Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.6251.1628681564051004169
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Aug 2021 04:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bl0Y0vCJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: jainsaloni0918@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id w13-20020a17090aea0db029017897a5f7bcso4245023pjy.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Aug 2021 04:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UhUfJlbC4MJAAjbY/ySUwt9XLssglwZRL2mq2DtvXlI=;
        b=Bl0Y0vCJpzt+Yq735mf5z72yf2NvIBgP3YT6qGlrkZtuun+ZTRU8srOO9kBvN6A/+y
         gyJDSBEpie/XutcjSRordIdlKkKQLC+0/1ICkp5vDzLPDuDKYsiE410MVLawkzE2yn47
         4tROFSt4OXNbHemdlENguRxUbRlBSHmXJl0R0esGb8azF9sdLylNrbSFp6ow6vvzO/Ee
         /83zguAKCR2V4SDrhPhardK6CujSNLesKWHBnV21VkBwCiqgSroWdgGfCY9y+DhYZANe
         iBHZgczoc8GJHEA7hfLs2V5LTrJpgsrFwh+sPSPG5nw1WXiPiaSyiZrYfG7Ib6vvHS0y
         OI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UhUfJlbC4MJAAjbY/ySUwt9XLssglwZRL2mq2DtvXlI=;
        b=mH+sImrwn7h/AZzfkehsxtAb+qd/KSDGDlhc92BGE/qK+Gap0phUh4lCJi9XN4cZbv
         ClPD47gOef1kfrQF/FGiYj9FJE6a6bwGmM/64c+DaI7A6HmBMXGcfsz4+ab/n68yfuJg
         CXxq9EKjAuPMnEm63mw6rphLDnSRl5qyDip3rX7es7Rz1HmKbTpJ6l+3P2pNS6KOBw0x
         3IeCIcHS3Gt5gj9CQOuYxQ4qnnqdR5vLkOsJfc3iz9gdJmmj8D/m12m7JvDpaeJlpthF
         B6YXNyBff8cHtk3UqIW2VPX2iPsaXs2u/vxKE1Lndc0b+zmNOzS4gkABXO7jO/nmFFyU
         7yYA==
X-Gm-Message-State: AOAM533WIHX/oeRrNs9EES93VRaz0taGSbSMzDEIKwvjdGGzncNKY3xJ
	p24RTkzutbpMgL40jBVD8x7LXQGC7SAUXLkK
X-Google-Smtp-Source: ABdhPJw53KWST2bJJ+JCuXNBDr81saqksObN9w6oWuxC4P7xI0JumI/wduLtnAKQXMF8UdphnrIj2g==
X-Received: by 2002:a17:90a:9314:: with SMTP id p20mr10240881pjo.87.1628681563113;
        Wed, 11 Aug 2021 04:32:43 -0700 (PDT)
Return-Path: <jainsaloni0918@gmail.com>
Received: from localhost.localdomain ([106.76.72.57])
        by smtp.gmail.com with ESMTPSA id m18sm25721750pjq.32.2021.08.11.04.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 04:32:42 -0700 (PDT)
From: "Saloni Jain" <jainsaloni0918@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com,
	otavio@ossystems.com.br
Cc: nisha.parrakat@kpit.com
Subject: [meta-java][dunfell][PATCH v2] xerces-j: Whitelisted CVE-2018-2799
Date: Wed, 11 Aug 2021 07:32:27 -0400
Message-Id: <20210811113227.31942-1-jainsaloni0918@gmail.com>
X-Mailer: git-send-email 2.17.1

Whitelisted below CVE:
CVE-2018-2799:
CVE only applies to some Oracle Java SE and Red Hat
Enterprise Linux versions which is already fixed with
updates and the issue is closed.
Link: https://access.redhat.com/security/cve/CVE-2018-2799
Link: https://bugzilla.redhat.com/show_bug.cgi?id=1567542

Signed-off-by: Saloni Jain <jainsaloni0918@gmail.com>
---
 recipes-core/xerces-j/xerces-j_2.11.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb b/recipes-core/xerces-j/xerces-j_2.11.0.bb
index 98ef32f..f2a4434 100644
--- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
+++ b/recipes-core/xerces-j/xerces-j_2.11.0.bb
@@ -14,6 +14,12 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "http://archive.apache.org/dist/xerces/j/Xerces-J-src.${PV}.tar.gz"
 
+# CVE only applies to some Oracle Java SE and Red Hat Enterprise Linux versions.
+# Already fixed with updates and closed.
+# https://access.redhat.com/security/cve/CVE-2018-2799
+# https://bugzilla.redhat.com/show_bug.cgi?id=1567542
+CVE_CHECK_WHITELIST += "CVE-2018-2799"
+
 S = "${WORKDIR}/xerces-2_11_0"
 
 inherit java-library
-- 
2.17.1

