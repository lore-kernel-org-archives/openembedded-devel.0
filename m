Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc6k-0006Vo-A0
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:24:19 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so352488eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=aHy3PmT5kJRQOQIUf+RsP8JOMTiD8yF5zgQdwMYdXTs=;
	b=oJok6Wp/1LGh8ROmZhbaie9Sl2+WJME6nsv6JnKmi+bjkreb0Bq01mhoqLIIvxucVW
	GHU3Y6StQWRPXR/EPILsLZ+hD+DWbh0bNPaUZyEjIJvqNp6grQbbD2jZODlw0u0ynQgb
	YsBb8daO5k64doogNauvqaA/1TpJnO+aYVbv+QM+b97EuzDdp0+7SRzZRvPfhomx+8VB
	npz4KBkryXlUPlZ7MzJ+AjuHdncTr7VPvVW1ZBZcKZUPmRNvKz6khPm04tGOK6Ccsq0n
	7/RE+aFSbUZjZnCI1ZalZMVYiozXK+fbfS+d9CZPdYVS+7+DHn9cFXMa0NwrmyQrEHWq
	M3+Q==
Received: by 10.14.95.65 with SMTP id o41mr87950eef.41.1342170784902;
	Fri, 13 Jul 2012 02:13:04 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id x52sm23163893eea.11.2012.07.13.02.13.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:13:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:12:00 +0200
Message-Id: <1342170730-14982-14-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkAvCE2OQOQFuoZas+1t4FOTV0loialgOLpgUpK7xcS+iJV4wh6SCQAtpyyGT+LEm/UZx2p
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe 14/24] python-numpy : Correct difflib dependency.
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
X-List-Received-Date: Fri, 13 Jul 2012 09:24:21 -0000

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



