Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id DE8FA65D4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 11:43:22 +0000 (UTC)
Received: by qkfo3 with SMTP id o3so57621805qkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 03:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:organization;
	bh=+kJJPmYmChiSisu4H4OSuHtG84LJDfHam9dDpF7PKX8=;
	b=bvff57ISNsf8k/nCS0BoHIsJSuFZam2/Dv/6T7K/0CdG1CSeV3xWQnBUFg7UuyITa5
	6z2WR5Xc3spuRGT5Gwy1YD2lAl9BfDlw5ysD2MYiIbXJM/le7+KVVTHD7/CvzesYTOid
	YMVAeTgeNMwu/8LoOnBCTk20wg9OMeEpgLssG45DRVpn5Rjk9UnLiKEjUXe/XRhy4FUA
	sWWEtrlkmyI/EZ5uRsL6J9skdI6WrSU1jke9rnLaoX3gkCuo1aSKmc/+QMxyMmFnoVOH
	lO6+HcvJwvV7hphuMh/o9zHTMyygwTLPHM0sydXsglagDdB9FdtofnTHGliSvFGviSxh
	X0Ew==
X-Received: by 10.55.212.141 with SMTP id s13mr26205157qks.91.1448279003306;
	Mon, 23 Nov 2015 03:43:23 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.174.62])
	by smtp.gmail.com with ESMTPSA id
	d14sm2899365qkb.49.2015.11.23.03.43.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Nov 2015 03:43:22 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Nov 2015 09:44:58 -0200
Message-Id: <1448279098-24980-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-ruby][meta-xfce][PATCH] Move imsettings from meta-ruby to meta-xfce
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
X-List-Received-Date: Mon, 23 Nov 2015 11:43:25 -0000

The imsettings requires xfconf to run, making it dependent of XFCE. It
makes no sense to make meta-ruby dependent of XFCE so we move the
imsettings recipe to meta-xfce and add the meta-ruby dependency there.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-ruby/conf/layer.conf                                               | 2 +-
 meta-xfce/conf/layer.conf                                               | 1 +
 .../imsettings/imsettings/gtk-is-required-by-notify.patch               | 0
 .../multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch      | 0
 .../recipes-extended/imsettings/imsettings_1.6.8.bb                     | 0
 5 files changed, 2 insertions(+), 1 deletion(-)
 rename {meta-ruby => meta-xfce}/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch (100%)
 rename {meta-ruby => meta-xfce}/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch (100%)
 rename {meta-ruby => meta-xfce}/recipes-extended/imsettings/imsettings_1.6.8.bb (100%)

diff --git a/meta-ruby/conf/layer.conf b/meta-ruby/conf/layer.conf
index b053450..b526a5d 100644
--- a/meta-ruby/conf/layer.conf
+++ b/meta-ruby/conf/layer.conf
@@ -12,4 +12,4 @@ BBFILE_PRIORITY_ruby-layer = "7"
 # cause compatibility issues with other layers
 LAYERVERSION_ruby-layer = "1"
 
-LAYERDEPENDS_ruby-layer = "core openembedded-layer xfce-layer"
+LAYERDEPENDS_ruby-layer = "core openembedded-layer"
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 64b1077..778abac 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -17,6 +17,7 @@ LAYERDEPENDS_xfce-layer += "openembedded-layer"
 LAYERDEPENDS_xfce-layer += "gnome-layer"
 LAYERDEPENDS_xfce-layer += "openembedded-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
+LAYERDEPENDS_xfce-layer += "ruby-layer"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   xfce4-session->machine-host \
diff --git a/meta-ruby/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch b/meta-xfce/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
similarity index 100%
rename from meta-ruby/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
rename to meta-xfce/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
diff --git a/meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch b/meta-xfce/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
similarity index 100%
rename from meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
rename to meta-xfce/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
diff --git a/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.6.8.bb
similarity index 100%
rename from meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
rename to meta-xfce/recipes-extended/imsettings/imsettings_1.6.8.bb
-- 
2.1.4


