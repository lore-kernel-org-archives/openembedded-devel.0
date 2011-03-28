Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philippedeswert@gmail.com>) id 1Q4KIj-0001cS-6d
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 23:48:41 +0200
Received: by ewy5 with SMTP id 5so1240460ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Mar 2011 14:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=X9VbIzPcVAN+zSnU1hKCvlK2a4Bjd9mhvKtc8hR3w5M=;
	b=hcjOIIbUfF+u4qy5OHZI68w38122y1my3x/y/R3NkxYfI3I6t/LB7zSEgMLSV5TDf0
	QgCbXc5mhMHutPi9gKUNgxjeNaHibz3PSgnQL2BTE6+KWFWdlliVrN3GnEAKiOeZ67DH
	djW+z8aatkiUV9EOolnSxnxcsXBMv7pQtm4ZM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=cwLJS642WpfmZX+N/JPBlltvWni4MKhm0qyMQtsSK9BG6m9EliHc/gmtfsgz3J//gp
	0BpVjaeE6AdOR1XUlDg/0DwYrTVWNpI7NK2+rTvn3MJ8ewK+WI04VUI5EMf2JZoyGU9b
	vCoFr8q97fUkDrNUIrHb1luPRho7dDGu6utfc=
Received: by 10.213.97.30 with SMTP id j30mr2149034ebn.20.1301348797709;
	Mon, 28 Mar 2011 14:46:37 -0700 (PDT)
Received: from localhost.localdomain (85-156-4-183.elisa-mobile.fi
	[85.156.4.183])
	by mx.google.com with ESMTPS id x54sm3087642eeh.5.2011.03.28.14.46.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Mar 2011 14:46:37 -0700 (PDT)
From: phdeswer <philippedeswert@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Mar 2011 00:45:40 +0300
Message-Id: <1301348740-30018-1-git-send-email-philippedeswert@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] eeze: update to 1.0.1
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
X-List-Received-Date: Mon, 28 Mar 2011 21:48:41 -0000

* Update to 1.0.1
* Contains bugfixes for udev watch/find functions to make sure devices are shown correctly

Signed-off-by: phdeswer <philippedeswert@gmail.com>
---
 recipes/efl1/eeze_1.0.1.bb |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 recipes/efl1/eeze_1.0.1.bb

diff --git a/recipes/efl1/eeze_1.0.1.bb b/recipes/efl1/eeze_1.0.1.bb
new file mode 100644
index 0000000..cc1d721
--- /dev/null
+++ b/recipes/efl1/eeze_1.0.1.bb
@@ -0,0 +1,10 @@
+require eeze.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "\
+  ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
+"
+
+SRC_URI[md5sum] = "e36b5e8ed444c8d13d27fd82d5f71659"
+SRC_URI[sha256sum] = "736470383c33837edd88f417200c5612ca9cc5f400bc48d61fd966fec3fe09d7"
-- 
1.7.2.5



