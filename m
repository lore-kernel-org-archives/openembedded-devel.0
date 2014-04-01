Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id B52696F9FC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:22 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id x48so6441042wes.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FnCRKQt4udx1VqYsX23SIjQvY+oJRriLRrO85DLQQPo=;
	b=QEsiReP+qjKxj8zO8hl9wscQoKZSXnQdPj9sgmcaEaK3gXU0EJ71xMET3+sY8qNtbB
	DjSIgC4XCm6u8u/5kE63JcqUBakuTMVkmak5tCjCVCChnvR7ScwByhTwSaA8vizdaery
	Q+s8U9aLDFvvBOELRRP/HXK5lBwYLax2hMnSHFgvJa1eqaXEVkQvCirGvqsJxzv6cvmk
	vH6B4DnSTaYm61QVMSj3VHVp6JQSzkVHuenC9c7m8EGf7H7bx3VtLK+53oVrW7TjK8Bb
	HCEEQMWJCecDCRoEZnTeAd6SYCFxOlP9oT1i+uPWyufRP62ZFZLbfz6dHYsTTKPP9x8n
	DzIg==
X-Received: by 10.194.81.98 with SMTP id z2mr24305655wjx.12.1396372463093;
	Tue, 01 Apr 2014 10:14:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a4sm41865466eep.12.2014.04.01.10.14.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:20 +0200
Message-Id: <1396372434-10710-12-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 12/46] freerdp: move to nonworking
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:23 -0000

* until this is resolved:
  freerdp-1.0.2+gitrAUTOINC+f311acaffb: freerdp: Files/directories were installed but not shipped
  /usr/usr
  /usr/usr/lib
  /usr/usr/lib/freerdp
  /usr/usr/lib/freerdp/printer.so
  /usr/usr/lib/freerdp/rdpsnd.so
  /usr/usr/lib/freerdp/rail.so
  /usr/usr/lib/freerdp/rdpdr.so
  /usr/usr/lib/freerdp/audin_alsa.so
  /usr/usr/lib/freerdp/rdpsnd_pulse.so
  /usr/usr/lib/freerdp/rdpdbg.so
  /usr/usr/lib/freerdp/audin.so
  /usr/usr/lib/freerdp/scard.so
  /usr/usr/lib/freerdp/audin_pulse.so
  /usr/usr/lib/freerdp/tsmf_alsa.so
  /usr/usr/lib/freerdp/tsmf.so
  /usr/usr/lib/freerdp/cliprdr.so
  /usr/usr/lib/freerdp/parallel.so
  /usr/usr/lib/freerdp/rdpsnd_alsa.so
  /usr/usr/lib/freerdp/drdynvc.so
  /usr/usr/lib/freerdp/tsmf_pulse.so
  /usr/usr/lib/freerdp/serial.so
  /usr/usr/lib/freerdp/disk.so
  /usr/usr/lib/freerdp/.debug
  /usr/usr/lib/freerdp/.debug/printer.so
  /usr/usr/lib/freerdp/.debug/rail.so
  /usr/usr/lib/freerdp/.debug/rdpsnd.so
  /usr/usr/lib/freerdp/.debug/rdpdr.so
  /usr/usr/lib/freerdp/.debug/audin_alsa.so
  /usr/usr/lib/freerdp/.debug/rdpsnd_pulse.so
  /usr/usr/lib/freerdp/.debug/rdpdbg.so
  /usr/usr/lib/freerdp/.debug/audin.so
  /usr/usr/lib/freerdp/.debug/scard.so
  /usr/usr/lib/freerdp/.debug/audin_pulse.so
  /usr/usr/lib/freerdp/.debug/tsmf_alsa.so
  /usr/usr/lib/freerdp/.debug/tsmf.so
  /usr/usr/lib/freerdp/.debug/cliprdr.so
  /usr/usr/lib/freerdp/.debug/rdpsnd_alsa.so
  /usr/usr/lib/freerdp/.debug/parallel.so
  /usr/usr/lib/freerdp/.debug/drdynvc.so
  /usr/usr/lib/freerdp/.debug/tsmf_pulse.so
  /usr/usr/lib/freerdp/.debug/serial.so
  /usr/usr/lib/freerdp/.debug/disk.so

* I've reported it mutiple times and nobody seems to care enough
  to fix that, so maybe it's not used by anybody

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/{ => nonworking}/freerdp/freerdp.inc    | 0
 meta-oe/recipes-support/{ => nonworking}/freerdp/freerdp_git.bb | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-support/{ => nonworking}/freerdp/freerdp.inc (100%)
 rename meta-oe/recipes-support/{ => nonworking}/freerdp/freerdp_git.bb (100%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/nonworking/freerdp/freerdp.inc
similarity index 100%
rename from meta-oe/recipes-support/freerdp/freerdp.inc
rename to meta-oe/recipes-support/nonworking/freerdp/freerdp.inc
diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/nonworking/freerdp/freerdp_git.bb
similarity index 100%
rename from meta-oe/recipes-support/freerdp/freerdp_git.bb
rename to meta-oe/recipes-support/nonworking/freerdp/freerdp_git.bb
-- 
1.9.1


