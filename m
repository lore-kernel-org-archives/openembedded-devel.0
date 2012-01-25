Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1Rq0dO-00030C-Iv
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 12:03:22 +0100
Received: by bkaq10 with SMTP id q10so4059902bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 02:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=w8KjuJB2tjhiAH1o/xpcn8PqGN9LLZ/fuB+0O8cHZT0=;
	b=C8fc/XRg+hzUhMn+Ors8mcilmqjxbU33N6SDKdt4/fNq93aRbIGgit/IT3trPpKSVz
	aTe+sjd6Nq/ptk4IO8OSQZ/CthjmCYkqqoUmje5b6UV8ZVj5brDsRPJ/05VUSOsi8sIA
	2kGmG5W13ms+SA6v9oooB25xIdFvhP3yXyli0=
Received: by 10.204.195.130 with SMTP id ec2mr6903828bkb.106.1327488935888;
	Wed, 25 Jan 2012 02:55:35 -0800 (PST)
Received: from localhost.localdomain (mx2.promwad.com. [195.222.87.218])
	by mx.google.com with ESMTPS id cg2sm37943bkb.12.2012.01.25.02.55.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 02:55:35 -0800 (PST)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.77)
	(envelope-from <jek@jeknote.loshitsa1.net>)
	id 1Rq0Vq-0007KI-D4; Wed, 25 Jan 2012 13:55:34 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 13:55:27 +0300
Message-Id: <1327488928-28127-2-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <1327488928-28127-1-git-send-email-yauhen.kharuzhy@promwad.com>
References: <1327488928-28127-1-git-send-email-yauhen.kharuzhy@promwad.com>
Cc: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
Subject: [PATCH 04/10] Add libnetfilter-conntrack 1.0.0
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
X-List-Received-Date: Wed, 25 Jan 2012 11:03:22 -0000

Add libnetfilter-conntrack 1.0.0 package.
Recipe was taken from the OE-classic and was updated.

Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
---
 .../libnetfilter/libnetfilter-conntrack_0.0.101.bb |   12 ++++++++++++
 .../libnetfilter/libnetfilter-conntrack_1.0.0.bb   |   12 ++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/libnetfilter/libnetfilter-conntrack_0.0.101.bb
 create mode 100644 meta/recipes-support/libnetfilter/libnetfilter-conntrack_1.0.0.bb

diff --git a/meta/recipes-support/libnetfilter/libnetfilter-conntrack_0.0.101.bb b/meta/recipes-support/libnetfilter/libnetfilter-conntrack_0.0.101.bb
new file mode 100644
index 0000000..2debed4
--- /dev/null
+++ b/meta/recipes-support/libnetfilter/libnetfilter-conntrack_0.0.101.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Userspace library providing a programming interface (API) to the in-kernel connection tracking state table"
+LICENSE = "GPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+DEPENDS = "libnfnetlink"
+
+SRC_URI = "http://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2;name=tar"
+SRC_URI[tar.md5sum] = "3c4b4048c914f2694c3ca6de2bb457dc"
+SRC_URI[tar.sha256sum] = "9d2919df3794e1e8f2311ad31949698103061206379b75094cb2bf7851378ab2"
+
+S = "${WORKDIR}/libnetfilter_conntrack-${PV}"
+
+inherit autotools pkgconfig
diff --git a/meta/recipes-support/libnetfilter/libnetfilter-conntrack_1.0.0.bb b/meta/recipes-support/libnetfilter/libnetfilter-conntrack_1.0.0.bb
new file mode 100644
index 0000000..e81fe85
--- /dev/null
+++ b/meta/recipes-support/libnetfilter/libnetfilter-conntrack_1.0.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Userspace library providing a programming interface (API) to the in-kernel connection tracking state table"
+LICENSE = "GPL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+DEPENDS = "libnfnetlink"
+
+SRC_URI = "http://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2;name=tar"
+SRC_URI[tar.md5sum] = "bc4638602d0e8dd144a11e510e2c236b"
+SRC_URI[tar.sha256sum] = "0a09a61ad26a43190a1858cb0391198ae3c952a9bdc4488e63dcb5c59aa3d608"
+
+S = "${WORKDIR}/libnetfilter_conntrack-${PV}"
+
+inherit autotools pkgconfig
-- 
1.7.6.4



