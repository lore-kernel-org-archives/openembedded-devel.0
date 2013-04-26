Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nicolas.dechesne@linaro.org>) id 1UVphf-0007OO-GS
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 22:57:26 +0200
Received: by mail-we0-f172.google.com with SMTP id r3so3835399wey.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 13:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=zcakTOCrZNkLZkoz+HcRokFiWH+r6TTBqNfW4J1wpX0=;
	b=EkMB4x5U12AWrmxiYTucYkHaxxo4/GrLKC5kEZMD2ZEYqXWwXBxvczTWYWEAcZijuU
	oRyV6qGD3T4moUxByFYrqiN29psVeDJoBJReux8F+7O3pan7c9cSbm4Q5ltWpgnag0oa
	CDAiFyqWLwvUcU4kpqe5IJ6DNkkpdaw6n/d8PLY+9vvoE2LK/yq4bQj8UzivxbyzsUkX
	n5d7tR1mD8RtCC3Gx6vq4bUj+Iv5cGyy1U1NWUbSbQufKKbeV5w8n9/QQ3CiJw6q3Jt7
	gKIlJ4EtjTa68X+4MbZWqlmMtvU0U4u6dXLIA1uCPLZwNlzk972vyAdt70fzKjCSpuWk
	OwAA==
X-Received: by 10.194.89.234 with SMTP id br10mr27054886wjb.43.1367008766109; 
	Fri, 26 Apr 2013 13:39:26 -0700 (PDT)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPSA id a9sm6069980wiv.0.2013.04.26.13.39.24
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 13:39:25 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Apr 2013 22:39:17 +0200
Message-Id: <1367008757-18667-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 1.8.1.2
X-Gm-Message-State: ALoCoQkRfv+NqUTY3+oENVcariAbKI9XL6wIC9cO9DY4rCf7e+ahGFcSmjOlR2wtAowb8nq/VgOv
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH] smartmontools: import from OE classic
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
X-List-Received-Date: Fri, 26 Apr 2013 20:57:38 -0000

Import smartmontools recipe from OE classic, and updated to upstream v5.40.

Also added cosmetic changes in the recipe: INC_PR support and homepage.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/recipes-support/smartmontools/smartmontools.inc     | 10 ++++++++++
 meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb |  5 +++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-support/smartmontools/smartmontools.inc
 create mode 100644 meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb

diff --git a/meta-oe/recipes-support/smartmontools/smartmontools.inc b/meta-oe/recipes-support/smartmontools/smartmontools.inc
new file mode 100644
index 0000000..6f23055
--- /dev/null
+++ b/meta-oe/recipes-support/smartmontools/smartmontools.inc
@@ -0,0 +1,10 @@
+SECTION = "console/utils"
+DESCRIPTION = "Control and monitor storage systems using S.M.A.R.T."
+HOMEPAGE = "http://smartmontools.sourceforge.net/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+INC_PR = "r1"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz"
+
+inherit autotools
diff --git a/meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb b/meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb
new file mode 100644
index 0000000..93dc4db
--- /dev/null
+++ b/meta-oe/recipes-support/smartmontools/smartmontools_5.40.bb
@@ -0,0 +1,5 @@
+require smartmontools.inc
+PR = "${INC_PR}.1"
+
+SRC_URI[md5sum] = "0f0be0239914ad87830a4fff594bda5b"
+SRC_URI[sha256sum] = "2a68ed20d5d6bd198e1aa6bf0b6037f0f216e3b14da022115244f1af9d248bfd"
-- 
1.8.1.2



