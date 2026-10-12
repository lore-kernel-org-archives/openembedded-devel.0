Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FC5CA9EBD
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:10:33 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3505.1791763827730792302
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lUHocmrD;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4e9e56e9aso305544a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763827; x=1792368627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4H22qeiDu7Wi0/N+SsuWRdiTVMK30xTEL53fVAubwM=;
        b=lUHocmrDIYoegSZMCr8FuqB1KkX95lV7BR09SCXJHG5yWgPpP+incbCjjOvpNL3l5h
         W7Cf1LObXSvQGrOgqJQ8iIAyTZtvuDf0ClC3XPnx0aIlxOrq9bJN1AH8vo1h48ggXW+W
         glqObyIw7apQf4glWW+2EYsqDtZSP4N9ObYN8SdGS1+2bROjdK2Zh06FehOiI2hYiiC+
         Klg9oBYuTo9jNNWrepf1sf1O45oOh/Krn2dEX2c9Y6RVQp41QITtxXzPYdMa6SUazbLJ
         ClLj2jPrQVqjGt0TBXYyjy9gh8viJk+p4X6kARSmZpWSHFsoMPN0etQA6L4y0GACAWTs
         STSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763827; x=1792368627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4H22qeiDu7Wi0/N+SsuWRdiTVMK30xTEL53fVAubwM=;
        b=hzx0zwEhANLEMmuQNyUAUX9iOyC7B16Ap802SX0/e48HlACL9hqPxDQ618QdHwzrgC
         6CVD+egmg3QjaYac5iQQ9Ql3PDMildqkGVNoNmO+5k2IcJYWYbAq7vyQik0s3XoruIB+
         lA0qEgJDbeZUIY9rF+LH1PsrhkjJyKO1TbqxjnCGkZ6Mr/LhCYKyRZgTIiyPtkZTkY/D
         4NxgraD1qQABrx9bTQjFfPZRAIReslrekkEbHs+e7IJLz8fIzjUdvCwWaSuoOpiCF/fO
         jpqBxWBKyF4fRSDCyJMO6a/WQ5w3/EyWBLd4jTcuQFcazysdgWlSHOpjouLLrQ8lHMtj
         SDWQ==
X-Gm-Message-State: AFq9FYIoiPU5Iq12HVJVXdTzmwZHbFfp4neUNdbAy1bqqtkl/28mYo22
	WE1l3qBxviV0VYncRGnzGH5R3p8485QzqKf5hyhO1hmv9CeYoReJoUjrlINewb4FUUI=
X-Gm-Gg: AYBFou2eZyOVUWtFUeY6TPzhC1t8wxMX+h5aeRgeiy/cWF5+ITA5xoWEnn2jQ3kOc+A
	LRD3bHrUS6bmCa4pgP3vnwHukGa0J9Mi5645bo/yX29rQ5+l9XGw9zZEoeDShjDMmZdTnUhoKvC
	17lgURvk6I+6V4pCVVLj6ZRCnWWPa/aZ2P0xVR2i9MXvG47Vl6s74DfNX28mop9ThYkm+b6uEQL
	fw7foFWXpJ/bRNKeI1WF/51fQJNQgvEHYsACE6QxnIYK/ZcH9WrEsqG2HdLwq+WvhPCqRD9uK7G
	/QmwFjBb93xhbwh1XW4bK8MT86oQQtlsMTnmxTJrx+Twr5Bm1keWLnkWN+MYxkp+98mOIvbrG+3
	ryiblRkBXBDzt1f0UMEG0uJxunj1MgFi0cbuw8/va631RMQpThi39qG2VbO/RC4VEu0tQH0kQj7
	UqV7STQVuMQA1E6ND8VFeJianzfRrJ/AYYE3Yh5xuer5CygIvIxI24CG6JHJYdySi1i9oLjKEzb
	+KuTNHARVdN8T8XsRAvHMBS/6j70lXYqRh0qFM=
X-Received: by 2002:a17:90a:d44d:b0:3ab:3675:8ed with SMTP id 98e67ed59e1d1-3ab3a60cebcmr7120505a91.22.1791763826902;
        Sun, 11 Oct 2026 17:10:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:10:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH 5/28] gpsd: patch CVE-2026-58459
Date: Mon, 12 Oct 2026 13:09:43 +1300
Message-ID: <20261012001007.2541673-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130730

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-58459

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 57e1f7d3d255e7b2eb55e9bca152f189ad8cdd09)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gpsd/gpsd/CVE-2026-58459-1.patch          | 48 +++++++++++++++
 .../gpsd/gpsd/CVE-2026-58459-2.patch          | 46 +++++++++++++++
 .../gpsd/gpsd/CVE-2026-58459-3.patch          | 58 +++++++++++++++++++
 .../recipes-navigation/gpsd/gpsd_3.27.5.bb    |  3 +
 4 files changed, 155 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-1.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-2.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-3.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-1.patch b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-1.patch
new file mode 100644
index 00000000000..aec3acdeb26
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-1.patch
@@ -0,0 +1,48 @@
+From 485b793ee3a54865ff9d8efffd2fe9a309666be0 Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Wed, 1 Jul 2026 17:55:57 -0700
+Subject: [PATCH 1/1] clients/gpsprof.py.in: Quote double quotes in title.
+
+Someone could use the double quote to break out of the
+string and add gnuplot commnds.
+
+For issue 404.
+Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>
+
+(cherry picked from commit 5581ba196d826a984fbfaf792b7d58535f9911ce)
+
+CVE: CVE-2026-58459
+Upstream-Status: Backport [https://gitlab.com/gpsd/gpsd/-/commit/5581ba196d826a984fbfaf792b7d58535f9911ce]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ clients/gpsprof.py.in | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
+index 5c18f50ff..261e72665 100644
+--- a/clients/gpsprof.py.in
++++ b/clients/gpsprof.py.in
+@@ -198,6 +198,10 @@ class plotter(object):
+         if 'subtype' in self.device:
+             desc += "\\n%s" % self.device['subtype']
+ 
++        # escape ", and \n, for gnuplot, to not break strings
++        desc = desc.replace('"', '\\042')
++        desc = desc.replace('\n', '')
++
+         return desc
+ 
+     def collect(self, verb, log_fp=None):
+@@ -1262,10 +1266,10 @@ if __name__ == '__main__':
+         # Ship the plot to standard output
+         if not options.title:
+             options.title = plot.whatami()
+-            # escape " for gnuplot
+-            options.title = options.title.replace('"', '\\"')
+         if options.subtitle:
+             options.title += '\\n' + options.subtitle
++        # escape " for gnuplot, to not break strings
++        options.title = options.title.replace('"', '\\042')
+         term_opts = ""
+         truecolor_terms = ['png', 'sixelgd', 'wxt']
+         if options.terminal in truecolor_terms:
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-2.patch b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-2.patch
new file mode 100644
index 00000000000..dd50d276950
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-2.patch
@@ -0,0 +1,46 @@
+From 6031dc96603d5537a650068a2f8d42ef90d9d32d Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Tue, 7 Jul 2026 13:41:54 -0700
+Subject: [PATCH] clients/gpsprof.py.in: Quote back ticks in title.
+
+Someone could use the back tick to break out of the string and add
+gnuplot commnds.
+
+For issue 404.
+Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>
+
+(cherry picked from commit 1a6bb7bcbdf58aa940132e630870af061dc88537)
+
+CVE: CVE-2026-58459
+Upstream-Status: Backport [https://gitlab.com/gpsd/gpsd/-/commit/1a6bb7bcbdf58aa940132e630870af061dc88537]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ clients/gpsprof.py.in | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
+index 261e72665..202214769 100644
+--- a/clients/gpsprof.py.in
++++ b/clients/gpsprof.py.in
+@@ -198,8 +198,9 @@ class plotter(object):
+         if 'subtype' in self.device:
+             desc += "\\n%s" % self.device['subtype']
+ 
+-        # escape ", and \n, for gnuplot, to not break strings
++        # escape ", `, and \n, for gnuplot, to not break strings
+         desc = desc.replace('"', '\\042')
++        desc = desc.replace('`', '\\140')
+         desc = desc.replace('\n', '')
+ 
+         return desc
+@@ -1268,8 +1269,9 @@ if __name__ == '__main__':
+             options.title = plot.whatami()
+         if options.subtitle:
+             options.title += '\\n' + options.subtitle
+-        # escape " for gnuplot, to not break strings
++        # escape ",  and`, for gnuplot, to not break strings
+         options.title = options.title.replace('"', '\\042')
++        options.title = options.title.replace('"', '\\140')
+         term_opts = ""
+         truecolor_terms = ['png', 'sixelgd', 'wxt']
+         if options.terminal in truecolor_terms:
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-3.patch b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-3.patch
new file mode 100644
index 00000000000..a40edfe6d13
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-3.patch
@@ -0,0 +1,58 @@
+From 54484dccf7265e51368eef03d99ea7a370c15e06 Mon Sep 17 00:00:00 2001
+From: "Gary E. Miller" <gem@rellim.com>
+Date: Tue, 7 Jul 2026 14:23:56 -0700
+Subject: [PATCH] clients/gpsprof.py.in: Quote back ticks in title.
+
+Second try.  Also quote "terminal".
+
+Someone could use the back tick to break out of the string and add
+gnuplot commnds.
+
+For issue 404.
+Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>
+
+(cherry picked from commit 4c06658e988f4ced1a7a574ce082a22ef625df56)
+
+CVE: CVE-2026-58459
+Upstream-Status: Backport [https://gitlab.com/gpsd/gpsd/-/commit/4c06658e988f4ced1a7a574ce082a22ef625df56]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ clients/gpsprof.py.in | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
+index 202214769..e91367ee3 100644
+--- a/clients/gpsprof.py.in
++++ b/clients/gpsprof.py.in
+@@ -200,7 +200,7 @@ class plotter(object):
+ 
+         # escape ", `, and \n, for gnuplot, to not break strings
+         desc = desc.replace('"', '\\042')
+-        desc = desc.replace('`', '\\140')
++        desc = desc.replace("\x60", '\\140')
+         desc = desc.replace('\n', '')
+ 
+         return desc
+@@ -1271,13 +1271,19 @@ if __name__ == '__main__':
+             options.title += '\\n' + options.subtitle
+         # escape ",  and`, for gnuplot, to not break strings
+         options.title = options.title.replace('"', '\\042')
+-        options.title = options.title.replace('"', '\\140')
++        options.title = options.title.replace("\x60", '\\140')
+         term_opts = ""
+         truecolor_terms = ['png', 'sixelgd', 'wxt']
+         if options.terminal in truecolor_terms:
+             term_opts = 'truecolor'
+-        sys.stdout.write("set terminal %s size 800,950 %s\n"
+-                         "set termoption enhanced\n"
++
++        # escape ", `, and \n, for gnuplot, to not break strings
++        options.terminal = options.terminal.replace('"', '\\042')
++        options.terminal = options.terminal.replace("\x60", '\\140')
++        options.terminal = options.terminal.replace('\n', '')
++
++        sys.stdout.write('set terminal "%s" size 800,950 %s\n'
++                         'set termoption enhanced\n'
+                          % (options.terminal, term_opts))
+         # double quotes on title so \n is parsed by gnuplot
+         sys.stdout.write('set title noenhanced "%s\\n\\n"\n' % options.title)
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
index fa3df89b272..52d86503a18 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
@@ -8,6 +8,9 @@ BUGTRACKER = "https://gitlab.com/gpsd/gpsd/-/issues"
 HOMEPAGE = "https://gpsd.io/"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
+           file://CVE-2026-58459-1.patch \
+           file://CVE-2026-58459-2.patch \
+           file://CVE-2026-58459-3.patch \
            file://gpsd.init \
            "
 SRC_URI[sha256sum] = "409873f5048462ef1ac413a51ab35caa8b50b31be62b3347bee1cc2994e7c649"

