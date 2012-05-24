Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dasty82@gmail.com>) id 1SXai5-0002q6-8I
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 May 2012 18:16:21 +0200
Received: by wgbdr1 with SMTP id dr1so7590717wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2012 09:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=sqai2uFbseojQW1mxtisA/5cjiboiJUyd4MLkrzOnu0=;
	b=MuNOYs+Ohxq75ylWdJlDLbUW0Cene7J+RBEWo8zzwiWRMjWS/Pu2hlNv1pYAThRalK
	ZSXaBL/sLrjnzl/lIRtvYeBVJsEH65P61zGXCl+k3szgh699v0wVvsBNdMwOL4n9nWMZ
	Tc/2u5ajmITVskUcGqb4L/dAnhoisV6kWJS7DrRIJ5mSV9gXMl8ddvACMwW81MZ+WqQB
	58SwuLyFrTmtFH8YmTCvYTnli6W5zsBWy3/ShCBO4uS4keorOgd1larFXf2+NmOcQdSj
	GIjaQI3xbDX7tCYRrV3Ix3lvmOdecwTuJIH1Ja5eO3xtX7+CYEWlrP2XOKyxWHEya4KA
	ne6A==
Received: by 10.180.80.97 with SMTP id q1mr68297wix.13.1337875570123;
	Thu, 24 May 2012 09:06:10 -0700 (PDT)
Received: from localhost.localdomain
	(83-64-248-68.inzersdorf.xdsl-line.inode.at. [83.64.248.68])
	by mx.google.com with ESMTPS id m1sm48209211wic.6.2012.05.24.09.06.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 May 2012 09:06:09 -0700 (PDT)
Sender: Radek Dostal <dasty82@gmail.com>
From: Radek Dostal <rd@radekdostal.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2012 18:05:43 +0200
Message-Id: <1337875543-28325-1-git-send-email-rd@radekdostal.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Radek Dostal <rd@radekdostal.com>
Subject: [PATCH] ntpd-systemd: ntpd is started with -g parameter
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
X-List-Received-Date: Thu, 24 May 2012 16:16:21 -0000

needed for correct functionality in systems without battery backed RTC

Signed-off-by: Radek Dostal <rd@radekdostal.com>
---
 meta-oe/recipes-support/ntp/files/ntpd.service |    2 +-
 meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/ntp/files/ntpd.service b/meta-oe/recipes-support/ntp/files/ntpd.service
index bd87b1e..0102ef0 100644
--- a/meta-oe/recipes-support/ntp/files/ntpd.service
+++ b/meta-oe/recipes-support/ntp/files/ntpd.service
@@ -5,7 +5,7 @@ After=network.target
 [Service]
 Type=forking
 PIDFile=/run/ntpd.pid
-ExecStart=/usr/bin/ntpd -p /run/ntpd.pid
+ExecStart=/usr/bin/ntpd -g -p /run/ntpd.pid
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
index ece8720..91d93c1 100644
--- a/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
+++ b/meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb
@@ -1,6 +1,6 @@
 require ntp.inc
 
-PR = "r5"
+PR = "r6"
 
 inherit systemd
 
-- 
1.7.5.4



