Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C22CC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:26 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33235.1792042998478813156
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HYw5D900;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2db710396ffso37499405ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792042998; x=1792647798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JnAkwpC7n4kx2MhHw7h7cwwn3nedx3CkYkjxjX88DzY=;
        b=HYw5D9004D6sGB80XL2ASlPvoRS4K4Azo5oxkhLHDhiIs6tlTW0KAgn3XMdKY9uzjh
         ePFU92V16RPWTLvwjj4tw/73fFn9wy51Kld5N4mhTDjLK8FfRz3N1kEIk2/PbMS8qJPn
         7gVDU+Cy1QohXg/GqrBY45xzE7NOgiQOwVbWWndB+qoTheXsBA90j1f7v5rN5NAC43ml
         SjZLErs+Xf9kTe7/7o1FpsbUMJcJuM64/WIvPz2XqXJdp5vKJJCnadUlUutg8p5bOygJ
         0rnisSeX19Lgd0enwUvPIoBHMqLneOzGZ7Eweo6Po3SL1L/+bDvDwii4aOdzTZgHlJWP
         UVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792042998; x=1792647798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JnAkwpC7n4kx2MhHw7h7cwwn3nedx3CkYkjxjX88DzY=;
        b=CzD9SvbTV3S7YsUYJT4dhnTz/fj8JuHslOfxGh7MhmR/qpHYwhczx4JElTsWru9hhe
         r/0Uli4Jw9kebrhNvIHNS3p8zo89xAhXD0kk2E/1T17v/NbNsgyX8Ab7kwDm1XeR/KoH
         f6c+B40ZyClP+lO2pR+ZgQ3x3vzDr82EzIEMCZrLypAjFLU7lsNBXNITaYnG1+nHYB+e
         +GTSIsB2jNvisI0ysRx6JR5miHHvuvXZbEczBue9eyFPXh3qKzYEJ4Jd6PT8aoLw1t78
         axsY9umwr21ldtL6pVXohMVbbMGmfbeIeKsBCswq1LClOllZLza7niY4slEzw2gR6rfU
         7jCA==
X-Gm-Message-State: AFq9FYJfEiruS7mN2Q00thOfa2EUPGzAv4YYaRO//sP7LUUqyGz+S+uk
	+JDe/oMJjszYq0KJmmTobwtUBq3e0TWCtFy5Inaz0R3XrMU1dCfBuYJncWYXMg==
X-Gm-Gg: AYBFou1xILvJK+L1HP8RAw5sUWY1GFmYAGUjlCcM0ty71qbj1VxVUi0NLrdgsX9Esn2
	4t5CvfbxC77zNDaY+pCrU1fGSiMRWQ8/qFl2cvaXTM7eOsM+xwl3VREPvy5xsqNkaZwOay/ww1J
	SqN+R3RYxUGundNaLHgsMgoXQnB0HyxpplXC2j++kCBqMQ/SwBhO8sMQi0IiRh1US1C1kzJ7Zan
	yRfqcshZ5vVMdHifyG5xp1WXAJa/711wOi/ILTmDVLqPKRVMAeUwxWSppDWNX8NMweJFIU6rBAd
	+mXhidMYG146aX3SMlOmvQLRzvBWbLJ17B26zGLuT6lCZqsguhmfnVr0N4gQHKvu/2ImcpNva9e
	tZWH6x0c/Zd//Nv8CVN7vTVSb7CgQ1yS3naWgW7NQtw4/+tim/NPkk2POLKe2EuQHz2nILP3zkm
	BUEsBfXK1s/f+dS1t2E3brUEiPKwlqs79zhJyE7oJVLzSgyKmDqLirfUbxwhjRb2+O+n+6tmwMZ
	xB/+hGBL7ncYUaoQQmXCPfkrw==
X-Received: by 2002:a17:902:c40f:b0:2e8:6540:11b6 with SMTP id d9443c01a7336-2e86540122fmr100751035ad.37.1792042997718;
        Wed, 14 Oct 2026 22:43:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 14/82] gpsd: patch CVE-2026-58459
Date: Thu, 15 Oct 2026 18:41:02 +1300
Message-ID: <a6d9fb02848f57ecd22b86fc12f7e8530dfdd51d.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130934

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
index 0000000000..aec3acdeb2
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
index 0000000000..dd50d27695
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
index 0000000000..a40edfe6d1
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
index fa3df89b27..52d86503a1 100644
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

