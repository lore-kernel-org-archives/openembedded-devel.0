Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ScvrY-0004PX-1v
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 11:52:12 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so982280eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 02:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=aHy3PmT5kJRQOQIUf+RsP8JOMTiD8yF5zgQdwMYdXTs=;
	b=FMG7nqxsJqewS1pJjSl8mLhx6QAZpnF1vwxCWSpBLwD86+x66tP0SXDmfhTfZRj0uU
	0940VqJ+CuJzPdre6MOzVtttbOYSuSr1ZD3e6geQe9pv/S4t7mHQJ/WM9xujck4dgcNU
	RuOW3E2nB+hH06boQ5V/nbAzGUl976Nd6S/SIFOId8xs3NF7kJV4d4oDoCckL264uIuV
	UfhKzPSFoezf4Y76i+LFdHOpJCRuZx1NBm91Smm3EuiAQcS1U948eTS0xshgJgTjpa0K
	PTV3vFS1rEtC3HJonpVJSsfOHnqN4d0iywtqqqqvvMFYNmZvgSwlx60YRjg8DPX1xnV3
	cRFg==
Received: by 10.14.48.11 with SMTP id u11mr3328471eeb.186.1339148504682;
	Fri, 08 Jun 2012 02:41:44 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id e45sm20241250eeb.6.2012.06.08.02.41.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 02:41:43 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2012 11:40:43 +0200
Message-Id: <1339148443-9467-14-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
References: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkBn3HccbhSHd/fZq5f5NX66GOixN5sXw7LsnuzDfFOo3TXsqHN8DwK/52xlNM1w5KsRCz3
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe][PATCH 14/14] python-numpy : Correct difflib dependency.
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
X-List-Received-Date: Fri, 08 Jun 2012 09:52:12 -0000

From: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>

The previous patch had python-diffutils when it should have been
python-difflib.

Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
index bae624e..e6d8618 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3c42211d73c3faa1026e671dd39883fa"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
 	   file://config.h \
@@ -26,6 +26,6 @@ SRC_URI[md5sum] = "5c7b5349dc3161763f7f366ceb96516b"
 SRC_URI[sha256sum] = "2e7bb84573e5123e07f3c919fd433bc09b78d606252b6b719e385c2a981d8e06"
 
 RDEPENDS_${PN} = "python-unittest \
-                  python-diffutils \
+                  python-difflib \
                   python-pprint \
                  "
-- 
1.7.10



