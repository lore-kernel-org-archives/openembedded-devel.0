Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 764027953B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 16:00:45 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id b129-v6so2792067pga.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 09:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=9DDtAGwi5x4puBhCFQMaoAdO7ulK0tNxit5ZWFv3hRQ=;
	b=XUUAGfEZUQayGvbNG+C3i8q+yp8iZ2aLL0fwViNUe9fZslIilU49WSXn51g9m8EHGY
	XA/uk32A6RbSLjj4GCVfQq+qlVJ+Yz/JTUcrXlsaZzxfL085H4eEZ2qY925NaPtd0D/x
	wwQeI4fyqHRrK+1U7qCpYSFeY23tLU8tJgdrC5/JlowC+qwX0IbdbLf5+LQC5ejjaRNT
	MBtGObgyQsAo40Od+IRgabqCpkkooyzr7L7IGYfsLJCjN2dvOhKrLwwYudoQCSxKx1/w
	XB6LFkUD63wD8Tyxsbo3gQaKuZieV4XE5qBPOAZMg+Jk8gMn/0y48lDP8OGOSXIba85M
	HD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9DDtAGwi5x4puBhCFQMaoAdO7ulK0tNxit5ZWFv3hRQ=;
	b=Gxi9fSNuVRUy9ahLBRzCjK7E6P3wPGJ70T9cmlBbPAepCMDcss9iPxTje47EbsOuUs
	y/iuQ8GHdEsItANe8krJyYAIHImpU4Lp9poatowtwYRuKcTfKA3L/IwmDUjdeUoBwCV/
	xK+KAY8VcQtih5g5G8GSeWq08NZ8i5S3vsFlhTbhotePeCVvqjBzHq025pqbeLEE7UEA
	Jc7pNsgTjLYbs8VDsBiewnfVIci0smH69sRGv1jVAquTkVfiVlCsNR8DfClkGxiAvsPP
	pTn5Z0xqSOSICK4+0WYjltIuTGuNUI1MUrDHLWwSJ9dOvo2/vX6Pxr/HURn7P9iejwZb
	pT6g==
X-Gm-Message-State: AOUpUlFlfLsvBJf58/kbkGXkxFmBX1qH6hLIe+tGCY24Kxkk4KjJ6QMc
	cuUXLS6/a4fMnSTgMpk0njomBSTn/PhT6g==
X-Google-Smtp-Source: AA+uWPzQpNRKCHuhKw3r9O8/oBU/s1VLHDgY////eZeyY4NgiRiOmk1hXRg3vqAQeXeDErUfV5Az+w==
X-Received: by 2002:a17:902:6845:: with SMTP id
	f5-v6mr16038729pln.17.1535040045073; 
	Thu, 23 Aug 2018 09:00:45 -0700 (PDT)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	l70-v6sm1692210pge.36.2018.08.23.09.00.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Aug 2018 09:00:44 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2018 21:30:38 +0530
Message-Id: <1535040038-21101-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][SUMO][resend PATCH] apache2: CVE-2018-1333
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
X-List-Received-Date: Thu, 23 Aug 2018 16:00:45 -0000

* fixes a race condition where aborting streams triggers an
unnecessary timeout.

Affects apache2 2.4.18 to 2.4.30 and apache2 2.4.33

Fixed in apache2 2.4.34

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../recipes-httpd/apache2/apache2-native_2.4.29.bb |  1 +
 .../recipes-httpd/apache2/apache2_2.4.29.bb        |  1 +
 .../apache2/files/CVE-2018-1333.patch              | 44 ++++++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/CVE-2018-1333.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.29.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.29.bb
index 36f073c..e2cbba1 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.29.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.29.bb
@@ -10,6 +10,7 @@ inherit autotools pkgconfig native
 
 SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
+           file://CVE-2018-1333.patch \
           "
 
 S = "${WORKDIR}/httpd-${PV}"
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb
index f0298b9..ddbd76f 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.29.bb
@@ -21,6 +21,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://apache2-volatile.conf \
            file://apache2.service \
            file://volatiles.04_apache2 \
+           file://CVE-2018-1333.patch \
           "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a62b0c7623826ff99766ff13fb9007f8"
diff --git a/meta-webserver/recipes-httpd/apache2/files/CVE-2018-1333.patch b/meta-webserver/recipes-httpd/apache2/files/CVE-2018-1333.patch
new file mode 100644
index 0000000..40d16cf
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
+so that it applies to httpd v2.4.29 code. Similarly done at
+http://svn.apache.org/viewvc/httpd/httpd/trunk/modules/http2/h2_bucket_beam.c?r1=1828879&r2=1828878&pathrev=1828879
+
+CVE: CVE-2018-1333
+Upstream-Status: Backport [https://github.com/icing/mod_h2/commit/83a2e3866918ce6567a683eb4c660688d047ee81]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+
+diff -Naurp httpd-2.4.29_org/modules/http2/h2_bucket_beam.c httpd-2.4.29/modules/http2/h2_bucket_beam.c
+--- httpd-2.4.29_org/modules/http2/h2_bucket_beam.c	2017-10-13 01:37:45.000000000 -0700
++++ httpd-2.4.29/modules/http2/h2_bucket_beam.c	2018-08-23 00:45:53.214181157 -0700
+@@ -549,6 +549,7 @@ static void recv_buffer_cleanup(h2_bucke
+         apr_brigade_destroy(bb);
+         if (bl) enter_yellow(beam, bl);
+         
++        apr_thread_cond_broadcast(beam->change);
+         if (beam->cons_ev_cb) { 
+             beam->cons_ev_cb(beam->cons_ctx, beam);
+         }
+@@ -697,12 +698,10 @@ void h2_beam_abort(h2_bucket_beam *beam)
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
+         apr_thread_cond_broadcast(beam->change);
+         leave_yellow(beam, &bl);
+     }
-- 
2.7.4


