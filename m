Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824C5C5DF8A
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:26:17 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4902.1787138766886665182
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VE3a3bYc;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso439978a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 04:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787138766; x=1787743566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qKTGsSxKNh5p+Is0bsFJKwuw7/KDWp4SWrl6NztfdnM=;
        b=VE3a3bYc9SmuncoMFFb8kk4KIczJyilO1scc9q1tbRJeoMzP7vxXd9HrCTjkTWb769
         mJSlpLtNvg5GM2idhVscMblm/a51Z9+RKtgOE7ENPLfHtoIg1uatsdcLCJyLu4aCpmSj
         4NFjEyOlV88Wv1umnHK5wzZFvkiq/hB4aUoh1e+Zxl83mthWSWCaAh5h9I+wdunCCVgl
         oaRmLb1bUzIIhjfRWeUhls3tuayOQiAzseXnEFIjt0t92qNaqIzhw+2x0neWDq8nphp6
         oTt75CQzXv3pjSFMTVHFswbZKGCTMUhGXN5WHNxYyXjXa9BVGG0Y4SMxT8W2cqvSqYu0
         By7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138766; x=1787743566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qKTGsSxKNh5p+Is0bsFJKwuw7/KDWp4SWrl6NztfdnM=;
        b=XPxJoDMU8l6zLi1fVTMYbnw5ME7MMf42JadfpNtEGMA20BWINitAbE6N8GTpv+QYif
         TaIjUSd43fT38Eotc39+Mr10AR37VYKjISizEGQVT7b2wvracdA8KeCCqwXO5IUKDMsj
         +UA2Pwjq/ITX9iNAcLIZnY4M6WRahmCmqM5IscdsyZLi6awtvtoFQRb/LixisBdEHLQg
         Y8CHgUM5+xj48CvXjS5DhXmdpY80H7uMjoT7XDSkXizbhhNZtO21X0p0tGEqUgOuPDLd
         JnlAYERnbjlf8P1kuW0rmTfIoY4Refrv7yX1UKMolG29z2jJW3DwlhBfEWYroW0kkWpV
         sMIQ==
X-Gm-Message-State: AFuF++nNgHcDo5HFDk4EsKVKy4x6HvfBLPMFNZEUGfIYw8vJ/7ElicmH
	GT/wvfAYmoOA0RlTv15NpEhUHCCRIvouTP9UyHIS8SCwDbq7rppDrRPcsjXQZg==
X-Gm-Gg: AR+sD114YxUZpTNNPS8+D+MWfwRDUzzNJAnZeptn1VFcYqsKX8VfsV/2fQyGQivO59w
	s3vr+Q71glxQGraQTPEtT3L68CyGWppAr4P70AaV4LrhE6bo/ab7og6YDyJ/dz7l6inQI5SyFht
	bWlg20V1mFElukyiERCm8lnIAt6JpYYupduKkKflOxGRmwfUgvyp7ZPam66GpEEKh7iIdoU1BdL
	Bm2rwzry6XwKlSgxFzHp0tiFg0QqU0uUYR6VbIVVkGNwfQTKvToPIOHjTkelrVF2nTxtsXPWjwu
	cQ53IWLJLQroiKsa3oB3e2VBMTYksvOnlYuDPb/4mWtiCj8jYsgOMP8qhC/Uwyld7Y6F/VzPeKh
	Etn0Wg6dcIaHkncRr/6iLtnT5Ig8MpCW+v/cXhKX9j8SY5Dg0WIj9nLQ69s7933WkfVlZI0vMfK
	hTdW2wt0dEH6H4jhr3uf0wAYm9ukbiFl+a5DaF7t8pieQncOHVpcWLU3I8aIhiwG2KQVj8gPxRU
	A==
X-Received: by 2002:a17:90b:37cb:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-3958046ce9cmr7402191a91.0.1787138765989;
        Wed, 19 Aug 2026 04:26:05 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm5073764eec.11.2026.08.19.04.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:26:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/7] libvncserver: add UPSTREAM_CHECK_GITTAGREGEX
Date: Wed, 19 Aug 2026 23:25:49 +1200
Message-ID: <20260819112553.971109-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819112553.971109-1-ankur.tyagi85@gmail.com>
References: <20260819112553.971109-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129356

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version libvncserver
...
INFO: Current version: 0.9.15
INFO: Latest version: 11
INFO: Latest version's commit: 8bef644d17f62ea6daf7459b863f05de187966fe

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
index 8c6b3f7e14..77612e1626 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.15.bb
@@ -49,6 +49,7 @@ SRC_URI = "git://github.com/LibVNC/libvncserver;branch=master;protocol=https;tag
 "
 SRCREV = "9b54b1ec32731bd23158ca014dc18014db4194c3"
 
+UPSTREAM_CHECK_GITTAGREGEX = "LibVNCServer-(?P<pver>\d+(\.\d+)+)"
 
 EXTRA_OECMAKE = "-DMAKE_INSTALL_LIBDIR=${libdir}"
 

