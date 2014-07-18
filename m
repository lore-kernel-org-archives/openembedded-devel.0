Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id C1EE66FE41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 14:58:04 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id q58so4814113wes.32
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 07:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QLSm7JrvdGTyZkmdLfbyZA9A4nRb+57/wK+6vZhKePw=;
	b=TFKc1TMPX2IFxR02rNCFc0aeJcjuLv9IkmazBkF+Y6P4+1xvz44NoLxdgAII97vyWS
	NEwmn3wdo40KMeQR1ikE8XGhmhNaxOLfj35rgf43ES7R4yOzb60KMPn4gADgISpwgORv
	1NBGnHKBw0zb3NM9j+H7p18faYmOw9C5nOPiVJ6bO3cyAO6EAYrvrgM0kfV9huK3Dqg0
	CNz9hYjvmEK+wjDJFPxFAhiGGy3R7zAY57GTeovUf2OOIOdjxDWhUPt1vYa+I0TNXMiy
	bY87KQK7XUy57XZpdo9P6syLrvKXa+ZYuPdu/VsK083ZQTLKd5BnTfNc1svQG0xUFA3h
	qpUA==
X-Gm-Message-State: ALoCoQlo54Ev3bJ+MSVXpvwMXwfCLJad8Vu0aLAn1oQhVWPM0LavdexK8Akn1PPUni3qZrzEtX5K
X-Received: by 10.180.76.132 with SMTP id k4mr8567111wiw.1.1405695485312;
	Fri, 18 Jul 2014 07:58:05 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	i12sm14784816wjr.32.2014.07.18.07.58.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jul 2014 07:58:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 15:57:57 +0100
Message-Id: <1405695477-16040-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][meta-oe] daemonize: fix out of tree builds and configure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jul 2014 14:58:11 -0000

daemonize ships it's own hand-coded config.h.in, so exclude autoheader from
do_configure().

Also out-of-tree builds are broken so bump the SRC_REV to the next commit, where
they were fixed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-support/daemonize/daemonize_git.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/daemonize/daemonize_git.bb b/meta-oe/recipes-support/daemonize/daemonize_git.bb
index 57dc15b..8b1591c 100644
--- a/meta-oe/recipes-support/daemonize/daemonize_git.bb
+++ b/meta-oe/recipes-support/daemonize/daemonize_git.bb
@@ -6,7 +6,9 @@ PV = "1.7.3+git${SRCPV}"
 
 inherit autotools
 
-SRCREV = "93788682a4749d8b577ce6549d6d3dd6df166ba4"
+SRCREV = "a4ac64a243af91dc434b7a3915f43482d528a2b1"
 SRC_URI = "git://github.com/bmc/daemonize.git"
 
 S = "${WORKDIR}/git"
+
+EXTRA_AUTORECONF += "--exclude=autoheader"
-- 
1.7.10.4


