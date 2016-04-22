Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 993A1731C8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 19:49:10 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id v188so32765080wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ob1KZZBMLETgmWFYhjZNNwgLv7DYJSEjY0vI3Y1Y/eM=;
	b=d5mdr83fQiSmAcJATSs3yIJLivufL7AOibY1WpTqstD2t83tyPQLhe4twyR+hS486j
	FwuG5KyVHi+skZMbYbGNrgLHWvilRxDnwXTjtvbNS8Do+6ZtBcYjDiNMEupEiO3H/dsP
	IIpYbOHWlahZ5koEM81z5pUiFUh08i+Wakfzgb+Ax/9D+hj7MbI7EvrqHMTjHoslEkSG
	YkK+E/C9S2vmue5ncvvputswoYmA2eEYgjxHnoCGiSEnnzsPVTF7RPdhidFT2Orf9u+i
	PaF5H6bypxk6swmzVzFk/oXdsmhrvhVPMnRSdBFO5yqzK5Quw5mYsKyc+iQatY+U4ner
	Ka9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ob1KZZBMLETgmWFYhjZNNwgLv7DYJSEjY0vI3Y1Y/eM=;
	b=H3zdCnb+Hul2P0WSt5+RQ9IdefNah3FD59t9C2kfv87heC3d593CSg3nMVdqqP+0Dd
	O7Yr/p76Km/ZPcAPVaYfJMpTQ6eQ1lYnh8cbSxesBazd9th3MUOr42Bo5krWg9XDHWaS
	15TvPL7m7I2RQqJ4B14dJADVBAp4VDdIZkoVLdbWeRvWTVMBx5UCvTR9hY26PLV/n7qe
	5flspSeF2yCBhwfW3rAz9a8h47YQCdiX8ewZGFW5fODxdlqusgTBEjyYCiDSDGeGZno7
	QjK2CZoO8rzZyqQwdeDLSEEbsEVjpWOYbP0SRgUULAED7arGXc7ebAvjR/wbjYjjbSm2
	GaVA==
X-Gm-Message-State: AOPr4FWtQMNmqjQWQM6QsciDG6xtH1Cn/aEc54FW3UJAp7h6QYbCUaGe1rc6cqbCpbfcs78T
X-Received: by 10.28.228.68 with SMTP id b65mr5479319wmh.47.1461354551197;
	Fri, 22 Apr 2016 12:49:11 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t4sm4875842wmf.8.2016.04.22.12.49.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 12:49:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 20:48:56 +0100
Message-Id: <1461354536-23240-8-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1461354536-23240-1-git-send-email-ross.burton@intel.com>
References: <1461354536-23240-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 8/8] meta-initramfs: use bb.utils.contains() instead of base_contains()
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
X-List-Received-Date: Fri, 22 Apr 2016 19:49:11 -0000

base_contains() is a compatibility wrapper and may warn in the future, so
replace all instances with bb.utils.contains().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index 5a8c6e8..c978263 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -27,7 +27,7 @@ EXTRA_OECONF = "--prefix=${prefix} \
                "
 
 # RDEPEND on systemd optionally
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,,systemd"
 
 EXTRA_OEMAKE += 'libdir=${prefix}/lib'
-- 
2.8.0.rc3


