Return-Path: <jc@vtkloud.com>
Received: from mail-vb0-f45.google.com (mail-vb0-f45.google.com
	[209.85.212.45])
	by mail.openembedded.org (Postfix) with ESMTP id 792A460E7E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2013 17:47:28 +0000 (UTC)
Received: by mail-vb0-f45.google.com with SMTP id e15so4266646vbg.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2013 10:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bXYnjaAwaWa4y1dPwhljP7MNFdYxQpzkXyIfT71BClk=;
	b=Dty+TUs9QKCYew5zCnVQ4VFiveDjQ/rwRStoXCryI4QBhwiDqWsWyp/fTNINltoxay
	GClnsHxkvUxKBctgZOt84UYUk7EN9vN52jgPKaPPWxXUubKuGNU0FdNNkrJ9WTbpZShc
	WZlfZ9s0GCAGqQjXG8SdI+5kjuzs+/ajaWhSP4fyPuUDvPJbUbFKymINdAdtcLslfvJA
	I5NnxQEYX8DVYpu1+NobtkDdDStvS8kgR+ejsieEpCqzTqeVYdX03B9MueetaRgfMFIT
	Z9XxExFZGCsR8mAkGK7VMtp87nqA05VRy+zm8FQj8da7eWZ9UECqwsNOk09mCGzuQ/yy
	JBwQ==
X-Gm-Message-State: ALoCoQlNkB+Lop3ptp8ZQgpNykWK2bSCOEHaAjKyHqJXkStkABT95/f2iiAL9bIn90nC+GEvJdnf
X-Received: by 10.52.116.145 with SMTP id jw17mr959330vdb.54.1379440050154;
	Tue, 17 Sep 2013 10:47:30 -0700 (PDT)
Received: from mba.csail.mit.edu (31-34-121.wireless.csail.mit.edu.
	[128.31.34.121])
	by mx.google.com with ESMTPSA id z4sm25743043vdj.6.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 10:47:29 -0700 (PDT)
From: JC <jc@vtkloud.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Sep 2013 13:47:16 -0400
Message-Id: <1379440036-7538-1-git-send-email-jc@vtkloud.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-multimedia][PATCH] libao: add version 1.1.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Sep 2013 17:47:28 -0000

This is basically a 99% import of Peter Tworek's recipe from tworaz666@gmail.com found in https://github.com/tworaz/oe-tworaz/blob/master/meta-jlime/recipes-support/libao/libao_1.1.0.bb

Signed-off-by: JC <jc@vtkloud.com>
---
 .../recipes-multimedia/libao/libao_1.1.0.bb        | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb

diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
new file mode 100644
index 0000000..08950b5
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
@@ -0,0 +1,23 @@
+SECTION = "multimedia"
+SUMMARY = "Libao is a cross-platform audio library that allows programs to output audio using a simple API on a wide variety of platforms"
+HOMEPAGE = "https://www.xiph.org/ao/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI="http://downloads.xiph.org/releases/ao/${BP}.tar.gz"
+SRC_URI[md5sum] = "2b2508c29bc97e4dc218fa162cf883c8"
+SRC_URI[sha256sum] = "29de5bb9b1726ba890455ef7e562d877df87811febb0d99ee69164b88c171bd4"
+
+inherit autotools
+
+do_install_append () {
+    find "${D}" -name '*.la' -exec rm -f {} +
+}
+
+python populate_packages_prepend () {
+    rootdir = bb.data.expand('${libdir}/ao/plugins-4', d)
+    rootdir_dbg = bb.data.expand('${libdir}/ao/plugins-4/.debug', d)
+    do_split_packages(d, rootdir, '^(.*)\.so$', output_pattern='${BPN}-plugin-%s', description='AO %s plugin')
+    do_split_packages(d, rootdir_dbg, '^(.*)\.so$', output_pattern='${BPN}-plugin-%s-dbg', description='AO %s plugin debug data')
+}
-- 
1.8.1.2


