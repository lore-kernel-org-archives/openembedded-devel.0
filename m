Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SxoeM-0002TC-CQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2012 02:24:54 +0200
Received: by weyr6 with SMTP id r6so1123970wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 17:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=KCTx0hWrPc/otfmqs428EEEqH7Nk4LCt24SgIigG7s0=;
	b=AIy9sLxkRxiKkm2RmSfj4vzHjgejMXvhVEXS3HgmE5chN3sarjbXDIPLrwI7NGsy/p
	2BKBJUXWv450944MUL3Uf26/SfIP9hJIx8guR2r+XTdvKDtgF1T010JCg3N6lyiQ0BqI
	+4/TpxGYwuGrQrh+Ny5kne9sfGjmy+pw0POyoxWxlHa2PeiNI8+W6s7wGFQWKpgCDmRX
	nvoCO7Y3DWWhNQNlQsTWiIUDk+IBMcizKNgiphYvtEnx+wrph8uFbF5PfmGBWPMrc7pc
	Zs6pOX7Es1EP1B2Iq7h2Mt0RoeaGbC9yXpFnkGzfmHQDiRYw/AH7xQGHa4mzs2YWyvo9
	Rc3A==
Received: by 10.216.243.74 with SMTP id j52mr3024864wer.108.1344125591929;
	Sat, 04 Aug 2012 17:13:11 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0E34.dip.t-dialin.net.
	[91.10.14.52])
	by mx.google.com with ESMTPS id l6sm6430551wiz.4.2012.08.04.17.13.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Aug 2012 17:13:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Aug 2012 02:19:51 +0200
Message-Id: <1344126001-19256-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
References: <1344126001-19256-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-angstrom 06/16] angstrom-task-gnome: remove unused packages
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
X-List-Received-Date: Sun, 05 Aug 2012 00:24:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-angstrom/tasks/angstrom-task-gnome.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-angstrom/tasks/angstrom-task-gnome.bb b/recipes-angstrom/tasks/angstrom-task-gnome.bb
index 9488d1d..54ad693 100644
--- a/recipes-angstrom/tasks/angstrom-task-gnome.bb
+++ b/recipes-angstrom/tasks/angstrom-task-gnome.bb
@@ -9,7 +9,7 @@ inherit task
 # Most of these tasks are arch independant
 PACKAGE_ARCH = "all"
 
-PACKAGES += "task-gnome-cups task-gnome-pulseaudio task-gnome-themes task-gnome-totem task-gnome-xserver-base "
+PACKAGES += "task-gnome-themes task-gnome-xserver-base "
 
 RDEPENDS_task-gnome-themes = " \
   angstrom-gnome-icon-theme-enable \
-- 
1.7.4.4



