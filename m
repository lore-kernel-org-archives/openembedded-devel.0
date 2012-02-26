Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1ei2-0005PV-51
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Feb 2012 15:04:18 +0100
Received: by eaae1 with SMTP id e1so219661eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Feb 2012 05:55:53 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.33.142 as permitted sender) client-ip=10.213.33.142; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.33.142 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.33.142])
	by 10.213.33.142 with SMTP id h14mr2886616ebd.43.1330264553438
	(num_hops = 1); Sun, 26 Feb 2012 05:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=BB7iimYEKpLkYeNJfwo5jDW9MNFV72kWm4UReexnuvg=;
	b=nj1mLGnlplouBIT0TmsqyroVXK4IlaQnpqCDJ7u+sIyf9OyB+0xBryMO1Fk/KNTUkB
	kkpkaiVhZwaJldUZt/GjnGcZZZ0jabGemYDj/xmRqJmf06on1YXpARvbmOEIK/jPvy6J
	HKcpNuuxQcgHhhwv+XLhPC6wkPZ9v7Wu8L12s=
Received: by 10.213.33.142 with SMTP id h14mr2200339ebd.43.1330264553385;
	Sun, 26 Feb 2012 05:55:53 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z47sm45330445eeh.9.2012.02.26.05.55.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 05:55:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Feb 2012 14:55:45 +0100
Message-Id: <1330264545-16277-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][PATCHv2] xinput-calibrator: disable gtk gui explicitly
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Feb 2012 14:04:18 -0000

* if gtk is autodetected then gtkmm, glibmm, libcairomm-1.0-1,
  libpangomm-1.4-1, libsigc-2.0-0 are pulled to image like here:
  http://git.shr-project.org/git/?p=buildhistory.git;a=blobdiff;f=images/crespo/eglibc/shr-image/installed-package-names.txt;h=83e1a027de80d97421564226685a74298d2a5b80;hp=470b765b53eb6c795dc9dfb9ea5c30ec19d25f64;hb=0ab60c7419522ef527d744bc0ad756124b9d432a;hpb=21fe622ab8fe123a3a45369440eaaa3785be2516

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
index 0c75293..f0e85cf 100644
--- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
+++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=998e238a7638a7446eaeb02398f691fc"
 DEPENDS = "virtual/libx11 libxi"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools
 
@@ -14,6 +14,9 @@ SRC_URI[sha256sum] = "baa4ddca49ec94c27ba4c715bfa26692fec1132103e927213c3169e475
 
 S = "${WORKDIR}/xinput_calibrator-${PV}"
 
+# force native X11 ui as we don't have gtk+ in DEPENDS
+EXTRA_OECONF += "--with-gui=x11"
+
 do_install_append() {
         install -d ${D}${bindir}
         install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
-- 
1.7.8.4



