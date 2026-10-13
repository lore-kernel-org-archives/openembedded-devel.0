Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E14CCC6B0F
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 10:00:39 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3447.1791885636768278674
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 03:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jqp7Y8fc;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1381364a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 03:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885636; x=1792490436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JI5SPv4Mgvuqc1EQWVSgRUqv2OsgGWNzaQr9ubcQptE=;
        b=Jqp7Y8fcZzhxTBBewYfbc1rzFQa4ZD6J0/VWuAcr00TMHz86OqRqfubvxfqo6xQt1M
         suntflDvhy+gTEdO0q4FmFebCCug7zqKfZis5PYzoaQITj0sieN8DBUrbk2tx9vvcyay
         GumeU/y+smi/BLI58cXvvvRYIV0LaiSdUd7mS3kPx0HSugsm9Yjm5Twt5hOxzOtZNN3c
         xGj8z7QXYY+H2S0/faeFWdqvo7PX4pK2Et9RNxkQeSA1TpXpIy75SWg9190itRSifUNn
         2sCJlujsLqxRLPNjOzZAL6ZTna6TymYa28VpQM32+BmFznbpw0zUWUZ9h+099HOqqlIP
         RhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885636; x=1792490436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JI5SPv4Mgvuqc1EQWVSgRUqv2OsgGWNzaQr9ubcQptE=;
        b=kXMXY2jUfxVt4aTkfeXr1psLs0ThzxxmEAdLSt5dPP7HBNSm2fWapA+MVlpyrJggWa
         XVn6v9CdnpQo9Q8GoET9Xk03hhFrdrieQ0v7Jel4yuXNXaE/Rxt52zs8UMVNYNcw+6SV
         iB2SGSFTxbE9U+hCUljxOqwb91VR6gi91Wt7VG21/wl9T0axBNTx+2lvu6j13z78O+Du
         4ILAbx35bocaPlPwfPQ6m/tbhcNwNKO53JLJZfcWCJToX1WwB8hlPCxY0WtJMaXItOPo
         ZWMAIyxhcgB/ph2IABySCjA3fn0zA7xipptfXjbw6qmgW5JE/+LcOJ05yreJBxao8gwR
         JvEg==
X-Gm-Message-State: AFq9FYIsSdWzxjxaNkLz2cq6+vfnrAZBhuwrFnv9iwDtjEnc2mfiZ+cs
	iD0ggL+Z30uD3xTf8deb3rhmmcsHGTsfkXGi7GsZga3Xp/Eh67AeaIdcNBbUGg==
X-Gm-Gg: AYBFou1YMiaLL/w2MoknYH26jHdkFEYCtqGpmILM7lC3fOlq55/GFy/9prU7styjV6I
	519cMUV62BFCNPYwKrxOcs+e15d5T7Yrwu2m280Qve7E26nx8rGd62pFIijoYN1o86XhaPIvG4X
	eEZFdXhXyqU7uV1TAAy6EwHLHvjyT6ugRFG3WeEA8ggfYfWgpvMZnz85vJoRnk69dNggBU52RYG
	Hcc7aAF4G+nQcMTyPurQ+wBI3mQXUVHXd0HgzTje/vfEc8RBTf0gS9o3QUoPow2WY73tInjegH4
	gRXR1doarLSKvBQRQdFbeqrix3OviGagOBOgbd0or9xChL+lZa2efihYL/SgCrdbFoUOxiwJfFZ
	pD8+tt2MYNFM8LSKnpSBW+ylSKAmtlbMN6JYzuBnjFvERKxFELc1MMpPa+LOtw8gfaEE69oKVTN
	zYbZJCfnvUkqZ/1JY5ieseXmuarjvHxVfSsVWQCrZhH/XTeCITLvwtWTkwoVbHh/GhBrwqLIJei
	jTUBIWjnAPuvVjhz7QNUkqdE54fAxV5KN/r3fyI7k0AcQCQHg==
X-Received: by 2002:a17:90b:1d4f:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3ab3a94ffa7mr8903496a91.16.1791885635772;
        Tue, 13 Oct 2026 03:00:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.03.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:00:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 28/28] gpsd: patch CVE-2026-60122
Date: Tue, 13 Oct 2026 22:59:03 +1300
Message-ID: <20261013095903.3544906-28-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 10:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130861

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-60122

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit da527bb6ba21025da9ff5eafc758156d659f6c9f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gpsd/gpsd/CVE-2026-60122.patch            | 45 +++++++++++++++++++
 .../recipes-navigation/gpsd/gpsd_3.27.5.bb    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch
new file mode 100644
index 0000000000..da8fa5f4d2
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch
@@ -0,0 +1,45 @@
+From 50bf98d0240b94bbec6ce06be33cdaf99e2f6214 Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Mon, 20 Jul 2026 20:12:16 -0700
+Subject: [PATCH] clients/gpsprof.py.in: ensure sats.used is boolean.  Issue
+ 406
+
+Prevfent command injection by sates.used.  Force to boolean.
+
+(cherry picked from commit 5a9c44a42136b9bb98d460a8a716e9fd344a8d93)
+
+CVE: CVE-2026-60122
+Upstream-Status: Backport [https://gitlab.com/gpsd/gpsd/-/commit/5a9c44a42136b9bb98d460a8a716e9fd344a8d93]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ clients/gpsprof.py.in | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
+index e91367ee3..07123d417 100644
+--- a/clients/gpsprof.py.in
++++ b/clients/gpsprof.py.in
+@@ -334,8 +334,11 @@ class spaceplot(plotter):
+             # get sat used count
+             sats_used = 0
+             for sat in self.session.satellites:
+-                if sat.used:
++                if sat.used is True:
+                     sats_used += 1
++                else:
++                    # ensure it is boolean.
++                    sat.used = False
+ 
+             if 'altHAE' not in self.session.data:
+                 self.session.data['altHAE'] = gps.NaN
+@@ -783,6 +786,10 @@ class polarplot(plotter):
+                     used += 1
+                     if 'polarunused' == self.name:
+                         continue
++                else:
++                    # ensure it is boolean.
++                    sat['used'] = False;
++
+                 if (('polarused' == self.name and
+                      sat['used'] is False)):
+                     continue
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
index 52d86503a1..2bb70aca46 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
@@ -11,6 +11,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://CVE-2026-58459-1.patch \
            file://CVE-2026-58459-2.patch \
            file://CVE-2026-58459-3.patch \
+           file://CVE-2026-60122.patch \
            file://gpsd.init \
            "
 SRC_URI[sha256sum] = "409873f5048462ef1ac413a51ab35caa8b50b31be62b3347bee1cc2994e7c649"

