Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E97CC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 09:24:02 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.8162.1645694640731506333
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:24:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=R6Nso8bD;
 spf=pass (domain: mvista.com, ip: 209.85.216.50,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id v4so1481044pjh.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 01:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3EP9gh/tCxUoqq5VGHBKk46jRe81xMc2G9XYIGTNL9Q=;
        b=R6Nso8bDpC/20Focc15Ox2FJ4YWA6tXJgQ5EYv9VW61FcSN7/YGN70+BTENVUwAkxF
         lB1WupnKGcuyDcrlFb6R7NnrS/BryOFyO6Lew5haD85lHbo86VRbjZYM0WkH0SmsO9wz
         vuDwtro2LhMrvqMAQOGHeeaZckNHv5SZ8oW6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3EP9gh/tCxUoqq5VGHBKk46jRe81xMc2G9XYIGTNL9Q=;
        b=q0+EfeVCgF2vvHHJPHOP1JgcnCNiFB5Gt35JKRmRJ6kwffl6g3GdMBoNRIsjQmVQnw
         ezlyVZ1nocw63Cd+1NS7evM/x1dvk+gv+YHXfB6OFD4fpR73Hy9fkOKe659ctxmpjNQI
         U7JHXuDPlgRg9kArKp54mmkvbfpyFBVqGsGyD1rBpCka++hD2uuF+gwEViaZq1Ats76r
         tmscwUfifuxIx6k9qvHWmeQ4tnwcX0My97EQAX+PahrpXI+H2P9ouhHdvO486nFdVRV/
         7Ex9SeGdrQ7w3yEhwTkR6wSotbjp2KSMSur5LxhXeMAfzl95j5/NTJt6TOcCTSXav/ZB
         xg8A==
X-Gm-Message-State: AOAM531Enu54Fi7ohja9sXqIrNibwytG3ZtnM0jt1+iKwNLnUdw6+kR9
	vD9l0Sggf4hfQfsQ/Q1cRs7PSCsNOeFYng==
X-Google-Smtp-Source: 
 ABdhPJzjSDU6lrtHcDYzA7aFO0AYCVKnUgGuIem08jS78l8LW7zwc9uwoWLuapGWfOB7EW+/cdMQ2Q==
X-Received: by 2002:a17:902:76ca:b0:14d:8c80:dbda with SMTP id
 j10-20020a17090276ca00b0014d8c80dbdamr1829763plt.152.1645694640121;
        Thu, 24 Feb 2022 01:24:00 -0800 (PST)
Received: from red (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 c13sm2713147pfi.177.2022.02.24.01.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 01:23:59 -0800 (PST)
Received: by red (sSMTP sendmail emulation); Thu, 24 Feb 2022 04:23:57 -0500
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-java][PATCH 3/5] xerces-j: update variable names
Date: Thu, 24 Feb 2022 04:23:37 -0500
Message-Id: <20220224092339.2711524-4-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220224092339.2711524-1-jpuhlman@mvista.com>
References: <20220224092339.2711524-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 09:24:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95506

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 recipes-core/xerces-j/xerces-j_2.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb b/recipes-core/xerces-j/xerces-j_2.11.0.bb
index fda6fe4..159fc9c 100644
--- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
+++ b/recipes-core/xerces-j/xerces-j_2.11.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://archive.apache.org/dist/xerces/j/Xerces-J-src.${PV}.tar.gz"
 # Already fixed with updates and closed.
 # https://access.redhat.com/security/cve/CVE-2018-2799
 # https://bugzilla.redhat.com/show_bug.cgi?id=1567542
-CVE_CHECK_WHITELIST += "CVE-2018-2799"
+CVE_CHECK_IGNORE += "CVE-2018-2799"
 
 S = "${WORKDIR}/xerces-2_11_0"
 
-- 
2.33.0


