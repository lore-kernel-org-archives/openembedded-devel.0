Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2337C02191
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 18:03:27 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.14810.1737828199485244184
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 10:03:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gGpC3Sjc;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21c2f1b610dso71868055ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 10:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737828199; x=1738432999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDrdBc0a8Hkn4x/bx5tyDCryJcFvEhd35x3GaNytoMw=;
        b=gGpC3SjcOhATmRdr2G/NvGMrtPD6OdbZJ+nmyOCbLjzrql/HtOWeHWcb7Rn9LUU54d
         BhXWT3PCjnpDKrpND4LhiiDgVwDpL7L//UPpnlbvgvVkt0CoYk+YSvBsoKmruuadTHHm
         yBKMgbIEGHouKy0D0pHvyy05SobGQJfyActgsASIA/pR+zH1dJ+onEcLvuN08QXbgK9F
         WXmFFgYY7hfQ5mFt6x+RT+P3JkvhPuAFh49fs2SrUtXaX8RiJORUn7ElAGOoKU6Jzbzd
         6HHsO8YEULM0GuXe8wXXMmJ7Gm2/wS9wsrFWhBdbKkBEzl4fYC+t6wPGw8In/8r2SCh7
         5Pcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737828199; x=1738432999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDrdBc0a8Hkn4x/bx5tyDCryJcFvEhd35x3GaNytoMw=;
        b=ccklua+60W/nnlGhKAZz7HIwTc8zYvKl2q8wHSsu412MNosU9EKLnzjNl2Ttaz/Ug/
         8znRsPUpeMkbwAtG16o2HGYenkYHGXUpVCysLgHawWFbgY+EZKtlGYZXaxamn5ZaEXWQ
         X0vhTzUAY+qOJXZcOuTVsI9MlEH0Q6qzVu49n3+ZhlXibAks3WVH+7lCbm9RNSZCflpH
         fJvMwQMn0MP/Zu1+iCOAIhiEjVnWBYgc+g4L9BqoIoPui9p6DhjMlUoNevCeOn+9h8m9
         rMuX/kEqaVFNWet3bZ+ojPI4DvLQetRl8ct6soT+uoSs5yrXbtiPNj0+hwIB+DRP0i7K
         HIuQ==
X-Gm-Message-State: AOJu0Yw8ZIM5OMZnZHI8xRjkwvg4JxZ7ujGbRMsM6vPrP8C2iMeo+Uyg
	C3nIgrU0q/MIxc9hApqd++E7wnYqmVGigCpzCxRBeNurUW66MSGAh/LCpQ==
X-Gm-Gg: ASbGncun0io+/yExH7xo9AxNpiX6ztZYh2NFBqWJRkN1Fni/D3QTl4WmQng+sdsg+21
	3/FrVvKAu76lan0t3AajsbkxJztuds+pcCeYHdAqK+O6FRw1vRWVcS20A97YXjCkVdFNYDDgOcU
	HmDcwhRoMgzqeNVCwDVuFwtKBuM4MJM/ez/n5gVK3/TWaJYz63njAJbeaId8p3mqH6YlbwScI5F
	XtVC6COd7TCAzKspp/XU4L3mwMfJKq1Qsr2virNdlEJUuSB3+mIg1Ashw/nSHdXXhjEHkPYQC11
	qwCqplMeeGyawNHln6/QERSfCkU=
X-Google-Smtp-Source: AGHT+IGdqWPFVe9VUTFF5xX9ipPvUA2G/opkKbUUjm7r2aGDymsDtFRieGiDvu29n5swFNLvDfdAxQ==
X-Received: by 2002:a05:6a00:ad8a:b0:725:8b00:167e with SMTP id d2e1a72fcca58-72dafb714eamr47803878b3a.16.1737828198727;
        Sat, 25 Jan 2025 10:03:18 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net ([2601:646:8182:b790:f137:fcfb:97fc:71bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b51e7sm4108906b3a.69.2025.01.25.10.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 10:03:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 09/14] procmail: patch CVE-2017-16844.
Date: Sat, 25 Jan 2025 10:03:03 -0800
Message-ID: <20250125180308.7856-9-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250125180308.7856-1-akuster808@gmail.com>
References: <20250125180308.7856-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 18:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115092

From: Peter Marko <peter.marko@siemens.com>

Take patch from Debian.
https://sources.debian.org/data/main/p/procmail/3.22-26%2Bdeb10u1/debian/patches/30

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3d97f4c13d5f5810659e107f6461f0b63f6fa92a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../procmail/procmail/CVE-2017-16844.patch    | 20 +++++++++++++++++++
 .../recipes-support/procmail/procmail_3.22.bb |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch

diff --git a/meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch b/meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch
new file mode 100644
index 0000000000..6e04989c33
--- /dev/null
+++ b/meta-oe/recipes-support/procmail/procmail/CVE-2017-16844.patch
@@ -0,0 +1,20 @@
+From: Santiago Vila <sanvila@debian.org>
+Subject: Fix heap-based buffer overflow in loadbuf()
+Bug-Debian: http://bugs.debian.org/876511
+X-Debian-version: 3.22-26
+
+CVE: CVE-2017-16844
+Upstream-Status: Inactive-Upstream [lastrelease: 2001]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+--- a/src/formisc.c
++++ b/src/formisc.c
+@@ -103,7 +103,7 @@
+ }
+ 							    /* append to buf */
+ void loadbuf(text,len)const char*const text;const size_t len;
+-{ if(buffilled+len>buflen)			  /* buf can't hold the text */
++{ while(buffilled+len>buflen)			  /* buf can't hold the text */
+      buf=realloc(buf,buflen+=Bsize);
+   tmemmove(buf+buffilled,text,len);buffilled+=len;
+ }
diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index 4806bf5f80..16fcf84dad 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://www.ring.gr.jp/archives/net/mail/${BPN}/${BP}.tar.gz \
     file://from-debian-to-fix-man-file.patch \
     file://man-file-mailstat.1-from-debian.patch \
     file://CVE-2014-3618.patch \
+    file://CVE-2017-16844.patch \
 "
 SRC_URI[md5sum] = "1678ea99b973eb77eda4ecf6acae53f1"
 SRC_URI[sha256sum] = "087c75b34dd33d8b9df5afe9e42801c9395f4bf373a784d9bc97153b0062e117"
-- 
2.43.0


