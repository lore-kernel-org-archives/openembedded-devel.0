Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C205CA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:10:33 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5057.1791839430254657966
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EsHvD7JU;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso553344a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839430; x=1792444230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4H22qeiDu7Wi0/N+SsuWRdiTVMK30xTEL53fVAubwM=;
        b=EsHvD7JU+Xdp7/lt9W1ySK9ufSCpXEhe8TEtGoCppiD2MWY0CgM3OI8KnlXeoMi4w7
         S4kvmKg1kHJb6PVEcOALRQdil2lh4MnOHMuuQ4xEUoBGyAFtTwD2dnpigf5jcY3f5JOr
         NmMF4NeV+/YH80P39cQIgdzYZ2uwZaI146iYadMv3Ol0GHzcs1tMFXlFxTrQGAGUA/cs
         rjNwWBXFyeUHJKI6LF354GYYK52Vq2qGsrpMc8P2RcR7OABe5fLgfmxT1K3VPOrvslNx
         yNsd+LwDUnXqcNzSJasgt0K6kQ9zxoWEoxbe6YEkW2EiKnFiZ/0ofrfsReY2wJ4v8Ucw
         BvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839430; x=1792444230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4H22qeiDu7Wi0/N+SsuWRdiTVMK30xTEL53fVAubwM=;
        b=tE6u13nRi8Bm3RVXwjJhtDg6YrphWzNfCCvNYxOpIRt+pKQG4Sl87GMb5IX042Wb+o
         ZJ+NPMJ6KxsLL+f3f5hByamSwlon8D3yhnTIwB+bQ2MWpwoNaS/uTvR/inVd7T4QbLWB
         OF+mZmGjfpIDu9vsQwlYoZ+Y2sY0ImFfzSnFtau/oFITrEa1AvyMcGc19NPFjX7co6p6
         AGUCvuOBUhJ4k3cPt8pKEqKaoN0oAQo/Q/L5VsKfX0wuJlO9epWo4rDLH/8/L0vGXS+b
         Czs/rgzj+yDFuBvFBsWdior2sd0rneI/HAFE0G3SaJLjPSFnIG/WN/Rvu5DFyW3XDS46
         mI3Q==
X-Gm-Message-State: AFq9FYLS4tOuyfpciMVukYPcCgozmcVsGgPRRa3jLn7hzANNWIFQKR5O
	L2wEppYCWtlY7NrqlAA9UKXdes8DQOOJaoui7yW3IV29VlByx6kfpTwcZlQ67v62
X-Gm-Gg: AYBFou1n0pGiPQjl5sF1F3F5jRKyCTPWAb/96AwGc5w7+5Pw6MgZraxUQyRA2dwylGr
	XHBxfYKKbFExIkNqGBwT9QgOBPp5KDlzZgMz7XZWdavycjFf/NSZGUBGm+MzcM3y/a29BBb4v6s
	PupQ+ggdOaLQDIqwMZjHoWjRP6T5UohFuAw6lilYfgeewfq6ioeP3rC7wT/xV1Zi49gnD3JTM3U
	4ojbyEQDdMeGykANn8Jg4FmbFNFHVgtCWtDFPS5l1QQf2jZVGE8uFDDyEGGl/x/0yFa5Hsbjfjb
	oGE4A82ySQRrXyOmRzyY4p2+I9pRJp6zDSzxdvhlcpgyTxZvVxOAsG6BGOi7r1oUlMwX8ktVdLb
	memEzbu+o6oCyz/FF4jlPKkmVwl+wwqD4KZ1KIbm5waGzoswSjJKFPuTik4WkxTDwGfiTt5rQak
	xKMnvDqVS1NaaRROYpymABmF6LtFgBYeCkOR44c+kF6PAZczkUDW6p591gJhHrnL1keoFfHGRar
	joIW7CkOzlFjv8hPKmU/eNrulUBoKv4OIhjxBU=
X-Received: by 2002:a17:90b:4a45:b0:3a0:50bf:d497 with SMTP id 98e67ed59e1d1-3ab3a2ffb61mr8703423a91.3.1791839429512;
        Mon, 12 Oct 2026 14:10:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:10:29 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 5/43] gpsd: patch CVE-2026-58459
Date: Tue, 13 Oct 2026 10:09:29 +1300
Message-ID: <20261012211009.3352822-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130775

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

