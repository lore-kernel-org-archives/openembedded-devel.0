Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11604.1795690443219052700
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 02:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0ImYWSnI;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: sympthicode@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso3920721f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 02:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795690441; x=1796295241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lfx0AQkRdHUI9a0hDHEx+IvsMxV6qE17NtT/NN6Nq1U=;
        b=0ImYWSnICuUSA9CeV/IT+tZMgkwo8FlcXEd1+iBQaVDI5lJwR6PsEJwnidA9Qj8843
         6NE7Ax/wq4kkPUjBOCKhtZ1oahMrL4rEYXTpaSZlrULR9u71KJ7dsNcNF4Cm19NXV3Ul
         uFE8oZzhhkPAxTVPp9kiTzF2wUZXCjjd6beYQQWExYi1dXEAERIUOMLCJyBLothPrc++
         H8TUi3pg6YDIkuALDI06/m/F7lL14RYqLFAv6xrWHASxuRAk03FIN1n7irC1qUbE92A6
         QSE+UlRzz/9bs9z/QC3+/LZvSgFsXmELuhpNjiW7WzE7Qn9Zjno6vcsTLnOetBHQnAwi
         uphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690441; x=1796295241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfx0AQkRdHUI9a0hDHEx+IvsMxV6qE17NtT/NN6Nq1U=;
        b=v4guPdGeOHx3GvTPy8BqM/X/Widn8PfXvKLuHeKLxYr0tZ69ZXGC7nL7lFMFx4rn9x
         nzIescWk01TyjazCdf/6K8IhYY0I1ARPPTjjLw5WENt2jrlLZJds5tXq+Aohfu+5JOPA
         zrxvSPqejcgOaY7GpJWWc2NbRtviZYxSlG53lqj/UgrXCMynqYdsLSeCWguwdo6VvMvH
         +SZoOF0coPecc2E0x2lvwrqSvTUH/Yo+T+N4i3ttZwWmT9r/BypOj/QCKzOLx2vHJOnM
         +eWm5ZZkT0BhYTqOCsySny3sh+fkHGmYE21DWH4OtP9Ont5Lr7sY4HLhYkPBoRAe122c
         J5+w==
X-Gm-Message-State: APuU4Z+C0Sk6LUjV1CdJ4/OzPVZGxhfEJKqv6dil8BiBy96YEL5pDUYq
	LDn1/1jHKK4wcduOP9fQZa9SXK2NcuFwEH33+u7NeHlZfT+dVOT1rAi+8908tQ==
X-Gm-Gg: AZFdTZe/C6LHh2530Vwf1EQi6ESl/9YSlZTlFEWDlBIA8sM2nRfbTlqKm48g5HMpPyx
	apaRusePY3gyo5pvyqFAB/q1+Rj9HvjhVr9tklWlWvMylosqCrYxoFHhE8CSYwjGkMilDcGIARW
	oCb3cdmUZzu4p/L4cnuLWnAHYVuqumLf1IBiHhctovi3xR4x8qi7kkJj37V4n3Z1i1Vjr8FLCGn
	6yFFg/ligo7YrcGNg4fkK7ajKYj26N6dvGy7cYwtkPZrtQpa0OKLtHSYQ0aPakk1N5XMzWW5cu6
	s0NwvU/+sIl+N3nPVFiqUEn5QdgToWTdJBYfi9NgEZhUzj8fwbdYhcNqkDDTH3hDyutTf8ZMhGx
	1dmXWQze8uAxiqfvy+AIfRfcJUOpFNYGCaZQWERYo14tgimwOSch8pisVMu71xy0VurA3vs0m8s
	pxQaJ3SNzlDD49FSlee07iuju4Xj4Lk/p3QI/G/XPFCBym0VZbSgxDj/r0nyD5R2n0IQSCYJkbl
	hg+ALsN3/AtWAHLAu5t0J4qow7K6doDo+CkcfY/bXoFjXw8klUXawTgl4LZQJYmUevKgTFHvyf8
	JlLFQq4mFIXOQH9yW/LWvQjtOQTfIwqZexO6ZpreiXEQNVRmKFPz7PQnHRzgLaesDfGx3hEcpbC
	oy4hEGt5KDdXy
X-Received: by 2002:a05:6000:29ce:b0:4a4:b2c8:c969 with SMTP id ffacd0b85a97d-4abb0e46a49mr28245979f8f.20.1795690441077;
        Thu, 26 Nov 2026 02:54:01 -0800 (PST)
Return-Path: <sympthicode@gmail.com>
Received: from FLK-9XB2VN4.fortive.net (217.97.73.124.ipv4.supernova.orange.pl. [217.97.73.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm40159971f8f.50.2026.11.26.02.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:54:00 -0800 (PST)
From: Krzysztof Kaszubski <sympthicode@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Krzysztof Kaszubski <sympthicode@gmail.com>
Subject: [meta-oe][PATCH] gpsd: upgrade 3.27.5 -> 3.28
Date: Thu, 26 Nov 2026 11:53:41 +0100
Message-ID: <20261126105356.195062-1-sympthicode@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 10:54:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133089
Content-Type: text/plain; charset="utf-8"

Upgrade gpsd to 3.28. Notably, this release includes upstream commit
8f7a59f7 ("include/gpsd.h: revert shmTime Sec fields back to time_t"),
which restores the 96-byte struct shmTime layout on 32-bit architectures
built with -D_TIME_BITS=64 and fixes SHM compatibility with chrony.

Drop following patches:
* CVE-2026-58459-1.patch
* CVE-2026-58459-2.patch
* CVE-2026-58459-3.patch
* CVE-2026-60122.patch
as they are included in 3.28.

Signed-off-by: Krzysztof Kaszubski <sympthicode@gmail.com>
---
 .../gpsd/gpsd/CVE-2026-58459-1.patch          | 48 ---------------
 .../gpsd/gpsd/CVE-2026-58459-2.patch          | 46 ---------------
 .../gpsd/gpsd/CVE-2026-58459-3.patch          | 58 -------------------
 .../gpsd/gpsd/CVE-2026-60122.patch            | 45 --------------
 .../gpsd/{gpsd_3.27.5.bb => gpsd_3.28.bb}     |  6 +-
 5 files changed, 1 insertion(+), 202 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-1.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-2.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-3.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.27.5.bb => gpsd_3.28.bb} (95%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-1.patch b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-1.patch
deleted file mode 100644
index aec3acdeb2..0000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-1.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 485b793ee3a54865ff9d8efffd2fe9a309666be0 Mon Sep 17 00:00:00 2001
-From: "Gary E. Miller" <gem@rellim.com>
-Date: Wed, 1 Jul 2026 17:55:57 -0700
-Subject: [PATCH 1/1] clients/gpsprof.py.in: Quote double quotes in title.
-
-Someone could use the double quote to break out of the
-string and add gnuplot commnds.
-
-For issue 404.
-Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>
-
-(cherry picked from commit 5581ba196d826a984fbfaf792b7d58535f9911ce)
-
-CVE: CVE-2026-58459
-Upstream-Status: Backport [https://gitlab.com/gpsd/gpsd/-/commit/5581ba196d826a984fbfaf792b7d58535f9911ce]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- clients/gpsprof.py.in | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
-index 5c18f50ff..261e72665 100644
---- a/clients/gpsprof.py.in
-+++ b/clients/gpsprof.py.in
-@@ -198,6 +198,10 @@ class plotter(object):
-         if 'subtype' in self.device:
-             desc += "\\n%s" % self.device['subtype']
- 
-+        # escape ", and \n, for gnuplot, to not break strings
-+        desc = desc.replace('"', '\\042')
-+        desc = desc.replace('\n', '')
-+
-         return desc
- 
-     def collect(self, verb, log_fp=None):
-@@ -1262,10 +1266,10 @@ if __name__ == '__main__':
-         # Ship the plot to standard output
-         if not options.title:
-             options.title = plot.whatami()
--            # escape " for gnuplot
--            options.title = options.title.replace('"', '\\"')
-         if options.subtitle:
-             options.title += '\\n' + options.subtitle
-+        # escape " for gnuplot, to not break strings
-+        options.title = options.title.replace('"', '\\042')
-         term_opts = ""
-         truecolor_terms = ['png', 'sixelgd', 'wxt']
-         if options.terminal in truecolor_terms:
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-2.patch b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-2.patch
deleted file mode 100644
index dd50d27695..0000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-2.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 6031dc96603d5537a650068a2f8d42ef90d9d32d Mon Sep 17 00:00:00 2001
-From: "Gary E. Miller" <gem@rellim.com>
-Date: Tue, 7 Jul 2026 13:41:54 -0700
-Subject: [PATCH] clients/gpsprof.py.in: Quote back ticks in title.
-
-Someone could use the back tick to break out of the string and add
-gnuplot commnds.
-
-For issue 404.
-Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>
-
-(cherry picked from commit 1a6bb7bcbdf58aa940132e630870af061dc88537)
-
-CVE: CVE-2026-58459
-Upstream-Status: Backport [https://gitlab.com/gpsd/gpsd/-/commit/1a6bb7bcbdf58aa940132e630870af061dc88537]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- clients/gpsprof.py.in | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
-index 261e72665..202214769 100644
---- a/clients/gpsprof.py.in
-+++ b/clients/gpsprof.py.in
-@@ -198,8 +198,9 @@ class plotter(object):
-         if 'subtype' in self.device:
-             desc += "\\n%s" % self.device['subtype']
- 
--        # escape ", and \n, for gnuplot, to not break strings
-+        # escape ", `, and \n, for gnuplot, to not break strings
-         desc = desc.replace('"', '\\042')
-+        desc = desc.replace('`', '\\140')
-         desc = desc.replace('\n', '')
- 
-         return desc
-@@ -1268,8 +1269,9 @@ if __name__ == '__main__':
-             options.title = plot.whatami()
-         if options.subtitle:
-             options.title += '\\n' + options.subtitle
--        # escape " for gnuplot, to not break strings
-+        # escape ",  and`, for gnuplot, to not break strings
-         options.title = options.title.replace('"', '\\042')
-+        options.title = options.title.replace('"', '\\140')
-         term_opts = ""
-         truecolor_terms = ['png', 'sixelgd', 'wxt']
-         if options.terminal in truecolor_terms:
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-3.patch b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-3.patch
deleted file mode 100644
index a40edfe6d1..0000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-58459-3.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 54484dccf7265e51368eef03d99ea7a370c15e06 Mon Sep 17 00:00:00 2001
-From: "Gary E. Miller" <gem@rellim.com>
-Date: Tue, 7 Jul 2026 14:23:56 -0700
-Subject: [PATCH] clients/gpsprof.py.in: Quote back ticks in title.
-
-Second try.  Also quote "terminal".
-
-Someone could use the back tick to break out of the string and add
-gnuplot commnds.
-
-For issue 404.
-Reported by: CuB3y0nd, and Wade Sparks <wsparks@vulncheck.com>
-
-(cherry picked from commit 4c06658e988f4ced1a7a574ce082a22ef625df56)
-
-CVE: CVE-2026-58459
-Upstream-Status: Backport [https://gitlab.com/gpsd/gpsd/-/commit/4c06658e988f4ced1a7a574ce082a22ef625df56]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- clients/gpsprof.py.in | 14 ++++++++++----
- 1 file changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
-index 202214769..e91367ee3 100644
---- a/clients/gpsprof.py.in
-+++ b/clients/gpsprof.py.in
-@@ -200,7 +200,7 @@ class plotter(object):
- 
-         # escape ", `, and \n, for gnuplot, to not break strings
-         desc = desc.replace('"', '\\042')
--        desc = desc.replace('`', '\\140')
-+        desc = desc.replace("\x60", '\\140')
-         desc = desc.replace('\n', '')
- 
-         return desc
-@@ -1271,13 +1271,19 @@ if __name__ == '__main__':
-             options.title += '\\n' + options.subtitle
-         # escape ",  and`, for gnuplot, to not break strings
-         options.title = options.title.replace('"', '\\042')
--        options.title = options.title.replace('"', '\\140')
-+        options.title = options.title.replace("\x60", '\\140')
-         term_opts = ""
-         truecolor_terms = ['png', 'sixelgd', 'wxt']
-         if options.terminal in truecolor_terms:
-             term_opts = 'truecolor'
--        sys.stdout.write("set terminal %s size 800,950 %s\n"
--                         "set termoption enhanced\n"
-+
-+        # escape ", `, and \n, for gnuplot, to not break strings
-+        options.terminal = options.terminal.replace('"', '\\042')
-+        options.terminal = options.terminal.replace("\x60", '\\140')
-+        options.terminal = options.terminal.replace('\n', '')
-+
-+        sys.stdout.write('set terminal "%s" size 800,950 %s\n'
-+                         'set termoption enhanced\n'
-                          % (options.terminal, term_opts))
-         # double quotes on title so \n is parsed by gnuplot
-         sys.stdout.write('set title noenhanced "%s\\n\\n"\n' % options.title)
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch b/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch
deleted file mode 100644
index da8fa5f4d2..0000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 50bf98d0240b94bbec6ce06be33cdaf99e2f6214 Mon Sep 17 00:00:00 2001
-From: "Gary E. Miller" <gem@rellim.com>
-Date: Mon, 20 Jul 2026 20:12:16 -0700
-Subject: [PATCH] clients/gpsprof.py.in: ensure sats.used is boolean.  Issue
- 406
-
-Prevfent command injection by sates.used.  Force to boolean.
-
-(cherry picked from commit 5a9c44a42136b9bb98d460a8a716e9fd344a8d93)
-
-CVE: CVE-2026-60122
-Upstream-Status: Backport [https://gitlab.com/gpsd/gpsd/-/commit/5a9c44a42136b9bb98d460a8a716e9fd344a8d93]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- clients/gpsprof.py.in | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/clients/gpsprof.py.in b/clients/gpsprof.py.in
-index e91367ee3..07123d417 100644
---- a/clients/gpsprof.py.in
-+++ b/clients/gpsprof.py.in
-@@ -334,8 +334,11 @@ class spaceplot(plotter):
-             # get sat used count
-             sats_used = 0
-             for sat in self.session.satellites:
--                if sat.used:
-+                if sat.used is True:
-                     sats_used += 1
-+                else:
-+                    # ensure it is boolean.
-+                    sat.used = False
- 
-             if 'altHAE' not in self.session.data:
-                 self.session.data['altHAE'] = gps.NaN
-@@ -783,6 +786,10 @@ class polarplot(plotter):
-                     used += 1
-                     if 'polarunused' == self.name:
-                         continue
-+                else:
-+                    # ensure it is boolean.
-+                    sat['used'] = False;
-+
-                 if (('polarused' == self.name and
-                      sat['used'] is False)):
-                     continue
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.28.bb
similarity index 95%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.28.bb
index 2bb70aca46..2894ceb72c 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.5.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.28.bb
@@ -8,13 +8,9 @@ BUGTRACKER = "https://gitlab.com/gpsd/gpsd/-/issues"
 HOMEPAGE = "https://gpsd.io/"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
-           file://CVE-2026-58459-1.patch \
-           file://CVE-2026-58459-2.patch \
-           file://CVE-2026-58459-3.patch \
-           file://CVE-2026-60122.patch \
            file://gpsd.init \
            "
-SRC_URI[sha256sum] = "409873f5048462ef1ac413a51ab35caa8b50b31be62b3347bee1cc2994e7c649"
+SRC_URI[sha256sum] = "72f7937f36d98fb348e9fa044ad1e72955982ec5938609b18e4ee7c9e04f83f2"
 
 inherit scons update-rc.d python3-dir python3native systemd update-alternatives pkgconfig
 
-- 
2.43.0

