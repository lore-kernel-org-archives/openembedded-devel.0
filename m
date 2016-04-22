Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 28EDD731D6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 19:49:08 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id n3so41999964wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IrMvRkiMPcHJqp3yi4otNSrfyQpliT+hJtDscdnVKS0=;
	b=rlbINuLB6tQqUD9O4P8g0WGdMdUq2nIrcAZnRRZqFa0eHHjE+/K0xj2BU1xzr8/X8C
	1qNxjPMvmpn6/DUGXkcwruggT+4Cff7/VoNsZRjewvefbYqHQjDCZIO9Z3SAJ6gNP/Eo
	W0VYnabMeraMCe3KK48ZpNLlhGAKXB65Idcj79RlKV1c4hfgTWXtCyWSc3znZdGSK+r7
	6In1/YUIpGwIXxr2tNQgwrGHxmiIQ7JSq55gyJ8twq4nwVgPipvEYUOel2xvDTTaWEeY
	Fu/wb/jeQHkEXXbgX/YCW9TTU6nYqlww9dNnEAZPYKFCYNyyfjDg2G4GvH/UEjRzkgPy
	Sn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IrMvRkiMPcHJqp3yi4otNSrfyQpliT+hJtDscdnVKS0=;
	b=CKRrAfXfaibhGNEjmJVQ3Xm9GijPweUswnFdro7OYqU8tSONsg+VzMSRcG4wZ+WGIy
	WTldNrKq3pIYXkaR67GElyVeyXLRk5OdPC+4a4p9b/LSKGTL4I/fumhk94uudFTbH7Mm
	JrQUaYbMAEBNNiUzJdl+DJ0RFWbUdeU9iEO4wIzovkHJ14anTL2m/rgH6FLDSh6QEdIV
	Xv0dsuwhCxvpmdtkE7yFxvjRusiQMHiLLDRbXJDAh9WxRsjoKeX31Byp+fMG9Ump9A88
	l6Qp0yoil0eKrOSPSaP5zpSm+rYT6LWNPz28C05i5XwY3SrVSz7j+iplTO8um4jg8ayf
	5KWw==
X-Gm-Message-State: AOPr4FWs34yOpuMM5UQXPp9FQscNT/9lqtx+3Jw75plwNGzgABCgyCIyWo1OI8LHxaMrq/Wq
X-Received: by 10.28.51.5 with SMTP id z5mr5879437wmz.101.1461354549227;
	Fri, 22 Apr 2016 12:49:09 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t4sm4875842wmf.8.2016.04.22.12.49.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 12:49:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 20:48:54 +0100
Message-Id: <1461354536-23240-6-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1461354536-23240-1-git-send-email-ross.burton@intel.com>
References: <1461354536-23240-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 6/8] meta-efl: use bb.utils.contains() instead of base_contains()
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
X-List-Received-Date: Fri, 22 Apr 2016 19:49:09 -0000

base_contains() is a compatibility wrapper and may warn in the future, so
replace all instances with bb.utils.contains().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-efl/recipes-efl/e17/e-wm.inc        | 4 ++--
 meta-efl/recipes-efl/efl/entrance_svn.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm.inc b/meta-efl/recipes-efl/e17/e-wm.inc
index 45637f3..444ec89 100644
--- a/meta-efl/recipes-efl/e17/e-wm.inc
+++ b/meta-efl/recipes-efl/e17/e-wm.inc
@@ -7,8 +7,8 @@ SRCNAME = "e"
 inherit e update-alternatives gettext pkgconfig
 S = "${WORKDIR}/${SRCNAME}"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 
diff --git a/meta-efl/recipes-efl/efl/entrance_svn.bb b/meta-efl/recipes-efl/efl/entrance_svn.bb
index 3374737..2888dc8 100644
--- a/meta-efl/recipes-efl/efl/entrance_svn.bb
+++ b/meta-efl/recipes-efl/efl/entrance_svn.bb
@@ -16,7 +16,7 @@ PNBLACKLIST[entrance] ?= "broken: switch to https://git.enlightenment.org/misc/e
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[consolekit] = "--enable-consolekit,--disable-consolekit,consolekit"
 
-EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc ${@base_contains('DISTRO_FEATURES', 'pam', '', '--disable-pam', d)}"
+EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '--disable-pam', d)}"
 
 PR = "r7"
 PV = "0.0.4+svnr${SRCPV}"
-- 
2.8.0.rc3


