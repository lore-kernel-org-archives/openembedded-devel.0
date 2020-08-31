Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.57944.1598892700059715819
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 09:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iVmavVdl;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id w186so906604pgb.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 09:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lt8Ijq6NGLSDn5XvwdJu+gtHnUvnIUwIxaykySk9G3w=;
        b=iVmavVdl2y5UFsg36StOoJ9W+whunGskioh6XvGrwsCuIq4QEkaZIa6hfc3eHh+UrU
         OhI4QMnhNpzPBpTbs5QkkUHpzhpT1FEz8mIhClQTzUDASx+hG96gn8nv3+HLRni+DI1Z
         TDcDifFuu7Fnb69pQ1lx63lRyIt0ipMhhy/KL2y0NBey/SEu//E+2bGAQydd/RH8nrMU
         +ot/x6Z6GkQP2YzkBRIUErKwRn6GOr81Vvduu10poDLPN/Jxe5mIqXRBMa9FtEnl4vvr
         g4cedkttmK5T7y9guF2ZCIgmtSGbR7AkpJPi+Bam7jCAC0FCsLssE7vodsdRKRpiIM62
         l0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lt8Ijq6NGLSDn5XvwdJu+gtHnUvnIUwIxaykySk9G3w=;
        b=H5qcY0pGx1RVFqm191CZlg1dydfmcg7k4fM3tzkRyEEH/NstyzqgXKbk5ypzpMB+U/
         xItT2nxVGwGv/IiGtnpZF8avX+3vOnrm5oPRMmue6gCmzao88za5crpZ2swjyq5pnm0t
         php2s752TK5b86ntl/HgHlZo9YYDYJ+XUuZtRXZ0Xi4A6c6MqSXy7BwbtULlFvaWtg5k
         1yO1MvlR5rDwnQbskRTTdKtI9BDF1d6sG+8sp5W2+8y+HGWdBwtaY1NYzWtJOtYIAfzJ
         dekWSbif2XN48TZcg9l7XCzsiGqFNrmhmYSWNZ9ziqMe8ftt4heCIeZ+2CGn7ur5J/J/
         7Z2A==
X-Gm-Message-State: AOAM532C1fdvWS1ytuC46CsQXtXkdqi1nUQPD8uCIITm/mi5UjcIMt3p
	ROiOnxWNmkzaZLDg8kYs1mbWfDLU2knt2w==
X-Google-Smtp-Source: ABdhPJxlCI90feRfVhbPZ4Ju9gW8+gTOVsKExAEOO1nJmsNMaXRRH0j2vmDQBpbPCWrkzzJdS+br/A==
X-Received: by 2002:aa7:8010:: with SMTP id j16mr2008460pfi.210.1598892699010;
        Mon, 31 Aug 2020 09:51:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id in12sm115323pjb.29.2020.08.31.09.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 09:51:38 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] lmbench: Use update alternatives for stream
Date: Mon, 31 Aug 2020 09:51:33 -0700
Message-Id: <20200831165136.2817032-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stream is also provided by imagemagick as an alternative

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 7e20b7da65..171ac31ac3 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2 & GPL-2.0-with-lmbench-restriction"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://COPYING-2;md5=8e9aee2ccc75d61d107e43794a25cdf9"
 
-inherit autotools-brokensep
+inherit autotools-brokensep update-alternatives
 
 DEPENDS += "libtirpc"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
@@ -89,3 +89,7 @@ pkg_postinst_${PN} () {
 
 RDEPENDS_${PN} = "perl"
 FILES_${PN} += "${datadir}/lmbench"
+
+ALTERNATIVE_${PN} = "stream"
+ALTERNATIVE_LINK_NAME[stream] = "${bindir}/stream"
+
-- 
2.28.0

