Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SteOd-0006ma-O3
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2012 14:39:27 +0200
Received: by bkcik5 with SMTP id ik5so4914374bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2012 05:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=30m+RdbfmQ329/J2Ejv8BYLfSrhRVlJfCjjXxzzHZIU=;
	b=KN8MliF3V+yqDlueVL3MgczY9LqFmX/OazMBRnbEULomR8nOjPWDztWO5n7hd+nz/3
	YhcvyAO4KmXQwV1yXOwpTQyJ+RFRKYdQy1rtpNYwIqLdoGq12GARY6fOIL0SV2gACDuE
	s11N7o7gqj6YfPXzA3u1UXa40WVJMkU71UbslGit2nm+rUjrwzswxNRyR6qKn4vY8jth
	1PZSCdGfEtk7X9lAgffk34PRoHiBiscJNu3yaUDwdgGEGYs0Jcb2MJaT+p2zIZcIE4oO
	9knnw+DsPDY7M4AtICdEhMVNpNUNpcg7grAmRNIY1BsiyNpWVNr2jPAj6RsXCGIH5VbX
	mvpA==
Received: by 10.204.157.10 with SMTP id z10mr10193563bkw.63.1343132879630;
	Tue, 24 Jul 2012 05:27:59 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id hg13sm10637381bkc.7.2012.07.24.05.27.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 05:27:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jul 2012 14:27:30 +0200
Message-Id: <1343132850-32242-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-xfce] ristretto: add exo to DEPENDS
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
X-List-Received-Date: Tue, 24 Jul 2012 12:39:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

error message was:

| configure:7743: checking for exo-1 >= 0.4.0
| configure:7785: result: not found

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-apps/ristretto/ristretto_0.3.5.bb      |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.3.5.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.3.5.bb
index c139ea5..fec5c46 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.3.5.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.3.5.bb
@@ -3,7 +3,8 @@ HOMEPAGE = "http://goodies.xfce.org/projects/applications/ristretto"
 SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "libexif gtk+ dbus-glib libxfce4ui libxfce4util xfconf cairo"
+PR = "r1"
+DEPENDS = "exo libexif gtk+ dbus-glib libxfce4ui libxfce4util xfconf cairo"
 
 inherit xfce-app
 
-- 
1.7.6.5



