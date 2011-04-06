Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7MzG-0007x9-KJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 09:17:10 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so887124fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 00:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ZTScvbH80tKHJZbSsJu3NnmdkwQ9Bj/63g0H20f2+40=;
	b=q5nHThuUzxAEMa9ik012nx6hCLjrA47lLEampXdVV2qulTNA8COEqfUikS6cNPZQbX
	T0ONAl4eAPfvxKqCt6FZ/LBBcW7cOuXXen3cHhy5eHu/NaWP0qCuD8g6gsHkrbaZngwl
	qoCJsi0ZcK1rce7tmi5ezuEHbOiPzVORWoeZY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=N/AQXRB+AB2RNJvctv8y6XA4Ts/m8Nw7upi7fROJBaQx08iFxmZB1EIXCzWUXwEoRi
	ORV7fwxxpoeGbeio46KBWsOhDPa/+VEbhDrmN4/k2Ql2hhKspbARLCdugl187do8iulC
	fCx7oUdgRN2bYbW5KlLVfvHyakwn6JczFo8Lc=
Received: by 10.223.27.129 with SMTP id i1mr666069fac.24.1302074106408;
	Wed, 06 Apr 2011 00:15:06 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l2sm80164fam.29.2011.04.06.00.15.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 00:15:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 09:15:04 +0200
Message-Id: <0166832a6bcfdbdfc7c2ea70b00221c7623f9853.1302074016.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302074016.git.Martin.Jansa@gmail.com>
References: <cover.1302074016.git.Martin.Jansa@gmail.com>
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: [PATCH 2/8] ephoto: new svn build recipe
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
X-List-Received-Date: Wed, 06 Apr 2011 07:17:10 -0000

From: Philippe De Swert <philippedeswert@gmail.com>

Signed-off-by: Philippe De Swert <philippedeswert@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/ephoto_svn.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/ephoto_svn.bb

diff --git a/meta-efl/recipes-efl/e17/ephoto_svn.bb b/meta-efl/recipes-efl/e17/ephoto_svn.bb
new file mode 100644
index 0000000..787b110
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/ephoto_svn.bb
@@ -0,0 +1,12 @@
+LICENSE = "MIT CC-BY-SA2.5"
+PV = "0.1.0+svnr${SRCREV}"
+PR = "${INC_PR}.0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=df45d9de58df0b48f515eae8d2421257"
+LIC_FILES_CHKSUM = "file://COPYING.icons;md5=d4e4f10748f3146a089aaa23c9ade59b"
+
+require e-module.inc
+
+DEPENDS += "elementary ethumb ecore eio"
+
+SRCNAME = "${PN}"
-- 
1.7.4.1



