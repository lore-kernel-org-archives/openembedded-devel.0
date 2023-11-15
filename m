Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BDAC072A2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 16:56:38 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.18496.1700067396062864282
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 08:56:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=JV9uxe2I;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32fdd0774d9so4405007f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 08:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700067394; x=1700672194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i+OEwUPkc49Cj5yiHsPTC67EwgC9c6X/zAaKKiPKchs=;
        b=JV9uxe2IKgO2Cr0rdXvEt3jeDdCHQmtxuign2hVYwlO86DKW2VqBxavp151iYoTB6G
         FgMZ4QMnXn2Ep6jrX1wqixIH5FykGHQxifLya5EA+9hA0t0YATNm/16/l5a0EQ3B0HV3
         Nf1tJA8EqBISTxqAtAtUmbYjIdwjb6Yz8V3FTLvkUZ1vN9D7tmNwspkalu4rROixe3Vs
         WA+jWClfmvtj6Px1VBxLLssiau7F2OceE9laTJvRakV/MQnHre33CjIMnsruvXfltb32
         KH+u0NfrlZDcuN/ieOe6Iq+FzBMVD+VOLLi07z4TbdYvYD+AA63/aQIAGTgCDs4QLkT+
         iuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700067394; x=1700672194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+OEwUPkc49Cj5yiHsPTC67EwgC9c6X/zAaKKiPKchs=;
        b=DiqHVVl8QS6r0MusVZ3LYqmU6BVUVBvWltOA4QnJ2ir4rk2K+s2CTQZxxXgyeb7RVl
         U+TR+RQHdvOLNygn+t8IiqRR5T21JEyioSg+9G+8lfkoVxBYvhqwulYNXR2BfhXaa+xD
         BOKyXuTWh70ZRkAnHUvZRZkTMM+cK9SiRH7HAk9TpzHaXzCemMqrNzGg7Ri/QbKKSsue
         LdM8L4v15B61oYC29ArmPI+dke6oVWT1k0PjIgPX7Bt4Ya+qhul6gVqRrfA5Vvv4HzTY
         Nzdb7gSK3+y5pxfDymbWjAwIlQfxejAm+VJ7JDa7M/WgLC4CWPzmM9Kf9YlsctySLWDM
         KYEw==
X-Gm-Message-State: AOJu0Yz8l1Zb1Ijv3cFcJsFx3V2jWVX1waTE7xTstng31RK2elrxJcJt
	QobhUGWOUQgOjFlxqrm/p1/0XkfK9rjz9/G+ea8=
X-Google-Smtp-Source: AGHT+IEPtbSE3GuL90DdxwU4mTMqniOFboQ9Yt41kwvJbbWh55CQr+pHq8wTcMNN7YWEEqMmz7Hh6g==
X-Received: by 2002:a05:6000:4020:b0:32f:8064:86c0 with SMTP id cp32-20020a056000402000b0032f806486c0mr13860171wrb.12.1700067394230;
        Wed, 15 Nov 2023 08:56:34 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id p6-20020adfe606000000b0032d2f09d991sm10928530wrm.33.2023.11.15.08.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 08:56:34 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-webserver][PATCH] static-id: add missing netdata group
Date: Wed, 15 Nov 2023 17:56:27 +0100
Message-Id: <20231115165627.2225562-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 16:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106765

The netdata recipe does want to create a netdata group. So add it to the
static id for the reproducibility tests.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-webserver/files/static-group-meta-webserver  | 1 +
 meta-webserver/files/static-passwd-meta-webserver | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/files/static-group-meta-webserver

diff --git a/meta-webserver/files/static-group-meta-webserver b/meta-webserver/files/static-group-meta-webserver
new file mode 100644
index 000000000..811980c05
--- /dev/null
+++ b/meta-webserver/files/static-group-meta-webserver
@@ -0,0 +1 @@
+netdata:x:691
diff --git a/meta-webserver/files/static-passwd-meta-webserver b/meta-webserver/files/static-passwd-meta-webserver
index 028cf8d94..231d458ab 100644
--- a/meta-webserver/files/static-passwd-meta-webserver
+++ b/meta-webserver/files/static-passwd-meta-webserver
@@ -1,2 +1,2 @@
 www:x:690:nogroup::/:/bin/nologin
-netdata:x:691:nogroup::/:/bin/nologin
\ No newline at end of file
+netdata:x:691:691::/:/bin/nologin
-- 
2.30.2


