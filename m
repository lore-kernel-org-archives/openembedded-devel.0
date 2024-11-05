Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277CFD2C115
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:01 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.19618.1730817420293876375
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fBVpxAlK;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e2915f00c12so4889575276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817419; x=1731422219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5L7CqzfL6q1qj8g3hnxGVDjIatZJF19khhX210Uabk=;
        b=fBVpxAlKxIMfmIa3uoSFORgBGOqeOlLgbELyliOfoMw9t/uRCKO5hxeyKzQPKh6G2A
         WmybDtS0uu0CvzJlqVhXAvwi8bTkD4p2eGlgt4b8OvUn5pLD2GWM6jQXFmf99OoBbC75
         P84KUNPge6UG/5IVtSEkJnFag1lQWmDcCQpvoyEsqnYYokQlXVmUzM5kVBkXdFlcZDrJ
         PcJpXY3WjcPD2aBvITcnbu01rtG5a2u+TRnpGDMpnDlscj3C2ZcxGpfqAwJ0QHPhlxM5
         5UVtRZdY8ybqvY1wWP7FqlYm/U4Zw2gQt2OS4fkIyTNKzD0l3hoguvEZ/OErdVdmkZMO
         9qTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817419; x=1731422219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5L7CqzfL6q1qj8g3hnxGVDjIatZJF19khhX210Uabk=;
        b=ac/A5Gbbd1liv+I5FUkjcFIBelhWK/557x4DunEu9HRtPPdpVyLE8mPJ643uuKlYVF
         lpN4+ch6rSyG4VQxqXlSBaiJFX4yIUFcKmPrlcQYso0453eZDg1+n8wDx0EwntykjSQM
         l9RqKcPMelu1gW2rHVp9nUzkoBebd6roWPL3S2TFlQPhOpcwzL6PswnPOczcL6YW+vZx
         /jMWkK84l8SXhNJ44ATnBItlS+uluKTxN8+WCV+HUlWdouW9jon2xgXsHajN+zQ1zDAX
         U7EnMG3Tjt+Nyg0T9fLXiDfS5vLnUNok3ZMjJytR3Fw62kVDsKvNzWHY1rJnPTV/li1K
         2j+A==
X-Gm-Message-State: AOJu0YzydBQM0X7memVcP2yKTnkh/G2UtPVED9C1RJo1HDJES0IC1IaM
	wJs6o6RXvb+FscP+fRNAqN5X996VdC+Ck+lK2ltY83MmJ8s83uZLlXGcDw==
X-Google-Smtp-Source: AGHT+IFA+6ck1gyLqIEgQcoRhJ0UrJbaF9qK0GWkzRsqDfCeV77hgSZLu9AeFbJbyxZscBVDZUh5Aw==
X-Received: by 2002:a05:690c:61c9:b0:6e3:31ee:23ab with SMTP id 00721157ae682-6e9d899d1c2mr364433287b3.25.1730817419349;
        Tue, 05 Nov 2024 06:36:59 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 44/90] python3-gunicorn: Add missing rdeps for ptests
Date: Tue,  5 Nov 2024 09:35:09 -0500
Message-ID: <20241105143638.2301245-45-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113462

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb
index 8d825c8651..3c819a934d 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_23.0.0.bb
@@ -11,9 +11,11 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+# python-misc for wsgiref
 RDEPENDS:${PN}-ptest += " \
     python3-eventlet \
     python3-gevent \
+    python3-misc \
     python3-pytest \
     python3-unittest-automake-output \
 "
-- 
2.43.0


