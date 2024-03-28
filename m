Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DA1CD11DD
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 16:29:45 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.965.1711643379144472523
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 09:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=X0NGTM6S;
 spf=pass (domain: konsulko.com, ip: 209.85.215.196, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-5e4613f2b56so774394a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 09:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1711643378; x=1712248178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SqTsLZkNv0V6cGdYAheWWcLA6yehhxuxwc/SxyyPhfU=;
        b=X0NGTM6SLdnVzgdj7mepK1t1HYUyrIYGEaP346kovsX2cvCWRCWzDXIGitt9CJp0mk
         xnD8Mx8vPBKbZ8XsHtLjtTG3HbGRRyEU0ppiSBnhhe740cy9+Afje0cjcI1k8ou53VCE
         cVt7wdYi08HxbXQUc5J+9T4F1HP5mmmYk7fhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643378; x=1712248178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqTsLZkNv0V6cGdYAheWWcLA6yehhxuxwc/SxyyPhfU=;
        b=B5+z6VaE/xjSbuPGyy1AFC6qxXHTPUXMU+RVNPqkF5YlTxJ90QS5eZAMpabOfmomkW
         Jpj+fCWZ9BrkFofeTBCaG5oLjvZ0yMg3vJY1JSgAtLYnjwdpS1tgenZvfsOfuGr5Acva
         NBOS/6+5OPecF39dj4PMUlpSkcsoakCd/ys/BYrcYIdfknefb07KYgtGmzYBaLW9fcon
         1uV1+a6Pqcxmp5kWQmW3e2288Og4ef3qmIs1aHT5sKKlyLW8qGmq8Ys5nV9icPM1u6eu
         J/YbXpxVkuFqHBP5WbLck6Gxi/mHFdl3hHKtSsSf6/lPS2RclgbNDK0wx+Ul2tCQneiw
         u40w==
X-Gm-Message-State: AOJu0YwK0U5Z0uKK2EOUSH0+etygicum6c8lhEVUROlKA5z9V769DKrW
	+lEzZj39mwmcAlz3x6rHxgabiVriJBkJHQcmRoTjJJuANYbA1J9J5CJDk65Lmck1IK+Prucp8a/
	gCVcTIK/o
X-Google-Smtp-Source: AGHT+IH+3LzghlsNxf22M6muUCBC9eCKpcP6yGdDkBC0eyVcssLkJ9D6aX6OiF3Ha+vDwUJL/6Cjbg==
X-Received: by 2002:a05:6a20:1e52:b0:1a3:5c61:159 with SMTP id cy18-20020a056a201e5200b001a35c610159mr3127895pzb.53.1711643377774;
        Thu, 28 Mar 2024 09:29:37 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:6ae3:9cc1:54c1:30c])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903245200b001e09322cd01sm1807213pls.45.2024.03.28.09.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:29:37 -0700 (PDT)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-perl][PATCH] liberror-perl: move recipe from oe-core
Date: Thu, 28 Mar 2024 09:28:50 -0700
Message-Id: <20240328162849.1523339-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 16:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109675

While this package is deprecated by the upstream maintainer,
we do not know if there are any users in the wider OpenEmbedded
ecosystem, so move the recipe from oe-core to meta-perl.

[YOCTO #15461]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../include/ptest-packagelists-meta-perl.inc  |  1 +
 .../liberror/liberror-perl_0.17029.bb         | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index 29a2b2e66..842f817f1 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -11,6 +11,7 @@ PTESTS_FAST_META_PERL = "\
     libcgi-perl \
     libcrypt-openssl-random-perl \
     libdigest-hmac-perl \
+    liberror-perl \
     libextutils-config-perl \
     libextutils-installpaths-perl \
     libhtml-tagset-perl \
diff --git a/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb b/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
new file mode 100644
index 000000000..e54bb11cc
--- /dev/null
+++ b/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
@@ -0,0 +1,48 @@
+SUMMARY = "Error - Error/exception handling in an OO-ish way"
+DESCRIPTION = "The Error package provides two interfaces. Firstly \
+Error provides a procedural interface to exception handling. \
+Secondly Error is a base class for errors/exceptions that can \
+either be thrown, for subsequent catch, or can simply be recorded."
+HOMEPAGE = "https://github.com/shlomif/perl-error.pm"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8f3499d09ee74a050c0319391ff9d100"
+
+
+DEPENDS += "perl"
+
+RDEPENDS:${PN} += " \
+    perl-module-carp \
+    perl-module-exporter \
+    perl-module-scalar-util \
+    perl-module-overload \
+    perl-module-strict \
+    perl-module-vars \
+    perl-module-warnings \
+"
+
+RDEPENDS:${PN}-ptest += " \
+    perl-module-base \
+    perl-module-file-spec \
+    perl-module-io-handle \
+    perl-module-ipc-open3 \
+    perl-module-lib \
+    perl-module-test-more \
+"
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "6732b1c6207e4a9a3e2987c88368039a"
+SRC_URI[sha256sum] = "1a23f7913032aed6d4b68321373a3899ca66590f4727391a091ec19c95bf7adc"
+
+S = "${WORKDIR}/Error-${PV}"
+
+inherit cpan ptest-perl
+
+do_install:prepend() {
+	# test requires "-T" (taint) command line option
+	rm -rf ${B}/t/pod-coverage.t
+}
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


