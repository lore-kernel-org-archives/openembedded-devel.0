Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7MzK-0007x9-Mp
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 09:17:14 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so887124fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 00:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=5c8IkRntkt0f4Hs1kCKJ1piAlFZ5S23sCDHb+37FEr8=;
	b=QvcO2tjBP8Yp8r0lCcp12i5F4JnvpFko8Xr6oZdjyYpCBHt+9AreVT+fSPlZJKh2sk
	gUtEGsswsP5UILDkgLiAL2LCbXPEZIvzYyTWsm5wG9chJYX/WueCxKM0nCv7/HHn+jtr
	JnAk8A1u+vc5jBG9/QTb2ltUNrXqPRlFNUXl8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=keIGQcjeJw90cldXlDCQTEuS7CYK9OFnT6kKpF+Op074AIItNQPd/DOU/3agRtFRRC
	bCve/DjqlDkr1CwJPwNlPfQaWed1T3plMrJLlINAE646yOCjnaDUHihyLzv49olj2e+q
	KaBJZ0dkPHEVyuTX8ZiQ55PV/IPzGMvsF2yWc=
Received: by 10.223.127.210 with SMTP id h18mr638456fas.79.1302074110542;
	Wed, 06 Apr 2011 00:15:10 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n15sm80010fam.36.2011.04.06.00.15.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 00:15:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 09:15:08 +0200
Message-Id: <d66094d6d39b9a0024a180f72fa6a04d00cd19bf.1302074016.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302074016.git.Martin.Jansa@gmail.com>
References: <cover.1302074016.git.Martin.Jansa@gmail.com>
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: [PATCH 3/8] ephoto: inherit gettext
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
X-List-Received-Date: Wed, 06 Apr 2011 07:17:14 -0000

---
 meta-efl/recipes-efl/e17/ephoto_svn.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/ephoto_svn.bb b/meta-efl/recipes-efl/e17/ephoto_svn.bb
index 787b110..4694398 100644
--- a/meta-efl/recipes-efl/e17/ephoto_svn.bb
+++ b/meta-efl/recipes-efl/e17/ephoto_svn.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING.icons;md5=d4e4f10748f3146a089aaa23c9ade59b"
 
 require e-module.inc
 
+inherit gettext
+
 DEPENDS += "elementary ethumb ecore eio"
 
 SRCNAME = "${PN}"
-- 
1.7.4.1



