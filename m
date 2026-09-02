Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82416C624D7
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:06:17 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9361.1788343569259195790
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a8Wi74J/;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398b3c37877so1201713a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343569; x=1788948369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCf52Vv0ROM8KrPngRBMy0yj/ddtsp+R8p7u9ll/qp4=;
        b=a8Wi74J/4nQjNEinHp4Wd/+lrs2p1+CQdp+GHml5e45jp2+aOymmu4ZatwgPgCqXgM
         YAs7m88UOXAxmBEA4H91yYg0/62K9YgXhiT6yXAS257NYLEeYU3wW3rUzqzigLOlrN2H
         xlp7XVr3+EaB8d4IXzzxlknpBzflvXZiTm/7TZ5Eo85fEqkAmLgzOfBYL9ogwhI5ifeW
         Rtw9Z/gUz/f1tD9oJFl33YBXiWrjKMHqgygAQcQPP3iiPrIcJWQaweu+XJCH+uti7rJm
         y5rxZElP3SbFX79yGzLUTaFAa6qYRvo7mfQNwk1neqsUdYGXFs3Pn/LotrK2O//XX6QU
         i/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343569; x=1788948369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MCf52Vv0ROM8KrPngRBMy0yj/ddtsp+R8p7u9ll/qp4=;
        b=ZxjTyXr7BojG+s0YbgonD9f1hhayOXl9/goSeqgNfdeX0igdfUq3/YLMm6aYecICOd
         RYqQ9vkJMZnWef8BaCeJlHyrG0VtA4OKOoNhfwXvvWbzdgBtMqAo5wYuPqxumGbwX7Yq
         DpJ7/7uQC+ME3bhKuCPyzbIaWqzvbmePT2mlw7N+vo2l9KCOBpiBgzG0HGsRzO0IdT2o
         QLB3rKRNZsZsuoWzqDa0Ru649Wd2uo0DysEdanB8vLkM2a4CVM9UK0rXnH2N6mQg7Ffo
         j0vwTid8IASw75WUcqONiOss4CwZGdJxsMAz0Nipo/d5C+dgKR0p4geeEgShmi+B5PuE
         bcMA==
X-Gm-Message-State: AFuF++kGXHahjeS+eScSGuWBIEvxcvlQcWJQGsLPJE8mKc03IFfLChI4
	FFtXz8V0pgne1miCvspihuzm311hpwEjpPkh2KaibV/pZyQuPAG09CBwX6xiwU36
X-Gm-Gg: AYBFou288ohcvjfQMVRXWuyHvHkxArM8ylx2RI6FhKafYVLCX0TamKgnuI6m+YA7Zot
	z0NXjb90cxu6URoAVEIW6fXdUp5PWZlqbT2/c7zH18TNt6f0l9lVqUGz/R6escuN4IQmrv+hfYF
	f9bTQwPA/1VdXz9wAnh8uGdYySs0JfsO8moMwUGu3RfPpZ3/joY/OnKg/A6cvqeJawAAwnInCG5
	3JbgndRxCw2o7MUj9JrW0ShNUC6OAQYpxwN3APLn5nziIsCB1VF/C/YCeee9nQ1yQHvCcvaPWJE
	YLgNr8aNo+s0JA4gK0VZZhRvDU6qIghgOvxYOU8NGWQUDg6eUtJKLXdpacCaGZtczLF63pM5jeP
	MLXO+EHumOGvY5SDr0KeGdfwdy8rfio4+aLnSz3UyEF83g1HRp+FFLI/gFtxy/CnV7fEeppWIHQ
	G55cxx9gbWvLtM0OUkQ4kFyz2fShFJgAlas0Z82kLE6XX8oMIRYlQGHBQccPd3aHjcTBtiVTgy
X-Received: by 2002:a17:90b:2687:b0:398:9c0c:7c71 with SMTP id 98e67ed59e1d1-39aee1f9788mr6117996a91.24.1788343568522;
        Wed, 02 Sep 2026 03:06:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:06:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 20/28] gpsd: patch CVE-2026-58459
Date: Wed,  2 Sep 2026 22:05:02 +1200
Message-ID: <20260902100511.2105916-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129651

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-58459

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
index f7ca367fa4..7819dc532d 100644
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

