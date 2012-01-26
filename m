Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1RqMih-0006KN-5k
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 11:38:19 +0100
Received: by bkaq10 with SMTP id q10so300873bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2012 02:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=tfNkZFEM7tQGC0HOnJQXI8m0+sMEdy4h20npY6/lCX4=;
	b=s2Kmjfm0sFIodETJS6taS0dHJIBBBDiSTtm/H/qWH33X07Nh2tY9mXW/odEeZ+P2Z5
	ker+d2iTng3raUVyFihz4Be0vI/3nCdKVWFid3+xaOK6G2KyM6dQN4KTMsJQDT7YUy2q
	Vhpo/5O5JxPoKR2AJbFcarzauYqHaMO/Q66mk=
Received: by 10.204.151.218 with SMTP id d26mr662282bkw.64.1327570699698;
	Thu, 26 Jan 2012 01:38:19 -0800 (PST)
Received: from localhost.localdomain (mx2.promwad.com. [195.222.87.218])
	by mx.google.com with ESMTPS id fb7sm7490003bkc.9.2012.01.26.01.38.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 01:38:18 -0800 (PST)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.77)
	(envelope-from <jek@jeknote.loshitsa1.net>)
	id 1RqLmY-00060T-PS; Thu, 26 Jan 2012 12:38:15 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Jan 2012 12:37:37 +0300
Message-Id: <1327570657-23046-1-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <20120126053509.GB5566@sakrah.homelinux.org>
References: <20120126053509.GB5566@sakrah.homelinux.org>
Subject: [PATCH v2] Add libnetfilter-conntrack 1.0.0
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
X-List-Received-Date: Thu, 26 Jan 2012 10:38:19 -0000

Add libnetfilter-conntrack 1.0.0 package.
Recipe was taken from the OE-classic and was updated.

Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
---
 .../libnetfilter/libnetfilter-conntrack_1.0.0.bb   |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/libnetfilter/libnetfilter-conntrack_1.0.0.bb

diff --git a/meta/recipes-support/libnetfilter/libnetfilter-conntrack_1.0.0.bb b/meta/recipes-support/libnetfilter/libnetfilter-conntrack_1.0.0.bb
new file mode 100644
index 0000000..5f27c21
--- /dev/null
+++ b/meta/recipes-support/libnetfilter/libnetfilter-conntrack_1.0.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Userspace library providing a programming interface (API) to the in-kernel connection tracking state table"
+LICENSE = "GPLv2+"
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
1.7.7.6



