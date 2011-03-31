Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philippedeswert@gmail.com>) id 1Q5NsZ-00089q-Oe
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 21:50:04 +0200
Received: by ewy5 with SMTP id 5so814692ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 12:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=wyPG7XGxEuZu7ELG4TKkY5Oc7LP7oPzFeGniKcDrc6A=;
	b=tOHuzpgUamx9pcyb34MiNE1YrXO0aUB5aW6B5Yp1Rfr8wOLSJcu012Hlqka+w/YetY
	83gs9TQJ6EzZuZYZteqOORXXC5ky1SUgcyo6XrlQ95tusl0X7jKtHvFyT/csLHYYHPpM
	vgtY42iQbgGewGTBPZhLROYFAzBpKRhj0/8C8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=B6UGUd5FpxRGe18aPN1tL4SwnXrnhwd/pF9IsmNao4M1ABUpIxU/Agfz8H9YA3uIea
	HOdrRo137/0BOwbH+hDhsAkaxI/p6G7aFhPlsu4a3bZ4+KTCUHMAGA34CNuDVaQxWdcA
	oxRx+vQ0C/g2S1A2sBgUv3t/83kc2JVd5mZzE=
Received: by 10.213.22.142 with SMTP id n14mr1327593ebb.149.1301600861543;
	Thu, 31 Mar 2011 12:47:41 -0700 (PDT)
Received: from localhost.localdomain (a83-245-252-47.elisa-laajakaista.fi
	[83.245.252.47])
	by mx.google.com with ESMTPS id x54sm935982eeh.12.2011.03.31.12.47.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 12:47:40 -0700 (PDT)
From: Philippe De Swert <philippedeswert@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 22:46:53 +0300
Message-Id: <1301600813-32334-1-git-send-email-philippedeswert@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH [2/2]] ephoto: new recipe. Depends on eio
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
X-List-Received-Date: Thu, 31 Mar 2011 19:50:04 -0000

Signed-off-by: Philippe De Swert <philippedeswert@gmail.com>
---
 recipes/e17/ephoto_svn.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 recipes/e17/ephoto_svn.bb

diff --git a/recipes/e17/ephoto_svn.bb b/recipes/e17/ephoto_svn.bb
new file mode 100644
index 0000000..c2c744a
--- /dev/null
+++ b/recipes/e17/ephoto_svn.bb
@@ -0,0 +1,11 @@
+LICENSE = "MIT"
+PV = "0.0.1+svnr${SRCREV}"
+PR = "${INC_PR}.0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=df45d9de58df0b48f515eae8d2421257"
+
+require e-module.inc
+
+DEPENDS += "elementary ethumb ecore eio"
+
+SRCNAME = "${PN}"
-- 
1.7.2.5



