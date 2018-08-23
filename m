Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9043F79567
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 11:21:32 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z25-v6so2420546pgu.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 04:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=3mHwN8TqA7Ok+P9JrNvyOH9Tyj8YY07Z4XlC7L6jDak=;
	b=wDvameo6h0bbWUGo2r1HGfK4L/t6gyIdKF6K4GsFkHLR47eO7GbbA/40LjNvfSQMSt
	X/IJES0yNySsRj9jAWIvSu7KGns/AyQm3SMSkdvSNDZpSp0Up/KrLdfmRNNmsj7PMKhd
	Vy0+j+J4LEvAf5eRd2mT2SG6YtSBXl7pnGMIfiziA2YeHopQYlNs7lQBss3uWsiaf1XO
	+lm7P6rNa1Ks1dHQ1X/XvtVKAi4+NOPbSRvvvL00UMVjzmIXZYOBpL8MErCZWzOvVYCA
	O6sMddgiM4tkIdy6WvIu2rhQWzw2i9+sdL613z4ZmBFBec972N7izysbeLT8+aA/Tv++
	D6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3mHwN8TqA7Ok+P9JrNvyOH9Tyj8YY07Z4XlC7L6jDak=;
	b=Jw9qk9Bf47/yuh9aog8BCiJ5RxQJ54LRdGl0gzvUlfUtzEYLQnBzJ47YzhurQHI97O
	Do+DskBiKnzrqvgcq5Zvay10TyfHssan5JqtoVuldZwbd+x8qkfVvG4GCNjVkJZK6jPr
	piNE0lMwr3Jfii0uTKEU+q6TFF6TZSbNkJshFNW7ep3wQxGJPGnTqdDl9UwSJpProgJ0
	RLO7VGXEz/DjEtwNNxxcLLRaYIucJilD28X9Dp/gEn3NwyBCXIfQCnxcoSDLMw76MqTM
	JY0uEU5GEpelZ5VARJZgfYRLThSJSOJU2MdAIlvfiLR8yPT2gEHKWS4YVl0Ln9uuY2Pr
	Tcmg==
X-Gm-Message-State: AOUpUlFOoMYUIKhgDUzmo3kLlzLV2WC1P39IUBnbv3HKIMl6eoQ4KSeP
	f0FsdeHTT/kx8fVRTjyKcMhyA53Q0e94nQ==
X-Google-Smtp-Source: AA+uWPyxKap4C1/B2IKDblQvR4cMPJK3UT0b6ic0SO9VPHRbsWwdoH0uLeJIjkeRw2AF5Cp7D6xG6A==
X-Received: by 2002:a63:9e0a:: with SMTP id
	s10-v6mr55544352pgd.326.1535023293361; 
	Thu, 23 Aug 2018 04:21:33 -0700 (PDT)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	z5-v6sm5856811pfh.83.2018.08.23.04.21.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Aug 2018 04:21:32 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2018 16:51:22 +0530
Message-Id: <1535023284-8126-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][ROCKO][PATCH] apache2: CVE-2018-1333
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2018 11:21:32 -0000

* fixes a race condition where aborting streams triggers an
 unnecessary timeout.

Affects apache2 2.4.18 to 2.4.30 and apache2 2.4.33

Fixed in apache2 2.4.34

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../recipes-httpd/apache2/apache2-native_2.4.27.bb |  1 +
 .../recipes-httpd/apache2/apache2_2.4.27.bb        |  1 +
 .../apache2/files/CVE-2018-1333.patch              | 44 ++++++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/CVE-2018-1333.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.27.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.27.bb
index 4e893db..dcd3976 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.27.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.27.bb
@@ -10,6 +10,7 @@ inherit autotools pkgconfig native
 
 SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
+           file://CVE-2018-1333.patch \
           "
 
 S = "${WORKDIR}/httpd-${PV}"
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
index 1880867..2803500 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
@@ -21,6 +21,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://apache2-volatile.conf \
            file://apache2.service \
            file://volatiles.04_apache2 \
+           file://CVE-2018-1333.patch \
           "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
diff --git a/meta-webserver/recipes-httpd/apache2/files/CVE-2018-1333.patch b/meta-webserver/recipes-httpd/apache2/files/CVE-2018-1333.patch
new file mode 100644
index 0000000..9cd207c
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/files/CVE-2018-1333.patch
@@ -0,0 +1,44 @@
+From 83a2e3866918ce6567a683eb4c660688d047ee81 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan.eissing@greenbytes.de>
+Date: Wed, 18 Apr 2018 11:55:17 +0200
+Subject: [PATCH]  * fixes a race condition where aborting streams triggers an
+ unnecessary timeout.
+
+Note: Re-factored upstream fix
+https://github.com/icing/mod_h2/commit/83a2e3866918ce6567a683eb4c660688d047ee81,
+so that it applies to httpd v2.4.27 code. Similarly done at
+http://svn.apache.org/viewvc/httpd/httpd/trunk/modules/http2/h2_bucket_beam.c?r1=1828879&r2=1828878&pathrev=1828879
+
+CVE: CVE-2018-1333
+Upstream-Status: Backport [https://github.com/icing/mod_h2/commit/83a2e3866918ce6567a683eb4c660688d047ee81]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+
+diff -Naurp httpd-2.4.27_org/modules/http2/h2_bucket_beam.c httpd-2.4.27/modules/http2/h2_bucket_beam.c
+--- httpd-2.4.27_org/modules/http2/h2_bucket_beam.c	2017-04-21 06:52:05.000000000 -0700
++++ httpd-2.4.27/modules/http2/h2_bucket_beam.c	2018-07-24 23:44:40.888330955 -0700
+@@ -512,6 +512,7 @@ static void recv_buffer_cleanup(h2_bucke
+         apr_brigade_destroy(bb);
+         if (bl) enter_yellow(beam, bl);
+         
++        apr_thread_cond_broadcast(beam->change);
+         if (beam->cons_ev_cb) { 
+             beam->cons_ev_cb(beam->cons_ctx, beam);
+         }
+@@ -685,12 +686,10 @@ void h2_beam_abort(h2_bucket_beam *beam)
+     h2_beam_lock bl;
+     
+     if (enter_yellow(beam, &bl) == APR_SUCCESS) {
+-        if (!beam->aborted) {
+-            beam->aborted = 1;
+-            r_purge_sent(beam);
+-            h2_blist_cleanup(&beam->send_list);
+-            report_consumption(beam, &bl);
+-        }
++        beam->aborted = 1;
++        r_purge_sent(beam);
++        h2_blist_cleanup(&beam->send_list);
++        report_consumption(beam, &bl);
+         if (beam->cond) {
+             apr_thread_cond_broadcast(beam->cond);
+         }
-- 
2.7.4


