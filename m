Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.43980.1589814040413035760
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 08:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=pIfAKJAh;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.182, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f182.google.com with SMTP id m11so10385571qka.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 08:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QyMduKnFqk2PLcWrlbIL8x4Jek2MM5cqDMy/kEUtVi4=;
        b=pIfAKJAhDzLH29GmLWkos1xCsVWkOVjgD4zJfmBLGl687gmbdaK5K6hny91H7rPVrh
         i29RDbcANywIz33L3caRP22Xf7j5oP4dP3NtmwFAGE6YOdzk0zlw71mA4wt+lfvVLC4Z
         MffVbUiUXxUUoQ+B29Ep+z/P7+WAQmn8Vp5cOVKqGANqXDy7O0GzvqkQKe7gn7mfRe+7
         Ju2YT3aJBb/6ER8nMkA3ei4KmFDQMSzw3hhwN4EeDfKpCfPBxviK7qXzpQllr/L3u4Ub
         mw7zMSUr60e75f9zKrR8l6Q9U8wqmTx5gPno0CmNkMyEe7seYgju/vNMtYm6fHJFpzuz
         yY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QyMduKnFqk2PLcWrlbIL8x4Jek2MM5cqDMy/kEUtVi4=;
        b=aVr03+M8Rlf1qLee/jjcuHwEliGdw/3GLmiZH2wlGEqSsKmAo5yNOO99TMwhoq+7D7
         Viv1gzYErSUndr0z6Ncb4qGOEPTwufNS/7ERa+U4f6U1ZczCvq0pc8KnzpI0Cb3MV5Wu
         xQuKWo4t0rAp9vCQZX6xlznlaWzIlFj5vt1RcXcQ392SKbOMoAWBe/86wZRvI8fPFnev
         glog/Tlab5DheGg9KigFK38dOMVdc1c5Xdig9rSt0K8If6aDwQ1O+DHzEJkRfMO+7Cz7
         ML3OoH6FzMA94zVKX3y03yJ6g2gioGyu9zW3aRiMVs9mLLxtsjPYJ3pqhdfmwy5dkS5X
         CqKA==
X-Gm-Message-State: AOAM531/wlfZxZvC+JIQIckzybfmaeH6q7tAOnJxn6RlhDOWTN2NeltB
	pDEVWnmRvWSUx1Jd7MqOZm6gTb/IEpM=
X-Google-Smtp-Source: ABdhPJzgkl/weP1YvgcXqlcXRNkpOB0hHk/F+Hw6/BUHVNIHWuZbi3oh2KN89po2pTiMbGEadBjKUA==
X-Received: by 2002:a37:a603:: with SMTP id p3mr15472488qke.133.1589814039004;
        Mon, 18 May 2020 08:00:39 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:7449:1d37:9815:91d1])
        by smtp.gmail.com with ESMTPSA id 4sm897562qky.130.2020.05.18.08.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 08:00:38 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 2/2] python3-watchdog: Add recipe version 0.10.2
Date: Mon, 18 May 2020 12:00:30 -0300
Message-Id: <20200518150030.27799-2-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200518150030.27799-1-domarys.correa@ossystems.com.br>
References: <20200518150030.27799-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-watchdog_0.10.2.bb          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-watchdog_0.10.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_0.10.2.bb b/meta-python/recipes-devtools/python/python3-watchdog_0.10.2.bb
new file mode 100644
index 000000000..93a1c192f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-watchdog_0.10.2.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Filesystem events monitoring"
+DEPENDS = "${PYTHON_PN}-argh"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[sha256sum] = "c560efb643faed5ef28784b2245cf8874f939569717a4a12826a173ac644456b"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = " \
+    ${PYTHON_PN}-argh \
+    ${PYTHON_PN}-pathtools3 \
+    ${PYTHON_PN}-pyyaml \
+    ${PYTHON_PN}-requests \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

