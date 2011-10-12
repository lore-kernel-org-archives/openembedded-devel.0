Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RDoAC-0001EC-66
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 04:03:20 +0200
Received: by iafi7 with SMTP id i7so7325iaf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 18:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=cvQ/ymz9RYFaHQ5qmdhUzUcNXfRoKD5soINaYBw95aI=;
	b=SJkaeVcegoF4+fSPn7Uain3hW7JHKcsivBqz5a5Ub3Kyd2FANDOM4PLPyhOVPMEdEq
	zqlKwl1xH1XNyOS3yfqS6lqdrUw0LaEHikHCnpOk0yA/m7F0mN97sP//RRzgMjC3cxvW
	gCJ6Rejk6npaAHwJGclNn+6awXxiLmlafyxLU=
Received: by 10.42.153.6 with SMTP id k6mr30714051icw.30.1318384657651;
	Tue, 11 Oct 2011 18:57:37 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id l28sm1449545ibc.3.2011.10.11.18.57.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 18:57:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Oct 2011 18:57:26 -0700
Message-Id: <1318384647-17338-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH 1/2] classes/glx-use-tls.bbclass: Delete
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
X-List-Received-Date: Wed, 12 Oct 2011 02:03:20 -0000

This functionality is now available in oe-core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/classes/glx-use-tls.bbclass |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)
 delete mode 100644 meta-oe/classes/glx-use-tls.bbclass

diff --git a/meta-oe/classes/glx-use-tls.bbclass b/meta-oe/classes/glx-use-tls.bbclass
deleted file mode 100644
index 7530872..0000000
--- a/meta-oe/classes/glx-use-tls.bbclass
+++ /dev/null
@@ -1,7 +0,0 @@
-def get_tls_setting(bb, d):
-    # until we have no prober TLS support in uclibc disable it
-    if bb.data.getVar('TARGET_OS', d, 1).find('uclibc') >= 0 :
-        return ""
-    return "--enable-glx-tls"
-
-EXTRA_OECONF += "${@get_tls_setting(bb, d)}"
-- 
1.7.5.4



