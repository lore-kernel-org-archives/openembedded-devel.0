Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 682C777FEC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 16:45:27 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id h22so5178477lfk.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KUC47vuyECrJO1usTLuCiCR7dm1n2qq4f69lXffwGX8=;
	b=SiUG/qtILFydzOocJmWYDH8NT5REHJsnKQT+tKF3vjUuatkwmJuyS/osOFf9QX1EIy
	1e11u+kaavd/FdFJlyVNdYtsUbmJ7KWe7Ygn+JbM8mAG3v78dhwylWPR/nyVi/iB3ZIM
	BcSDRZDiHNC+CgLXzMYB7j9ZgwU/8oh6bkCTTBWH8N5Dlx5701iJ3ydz8hWsS1gu9OcZ
	2FLSl1Evv7X68nTvlPUKa0dsb41uPRoqNWwY1sZ2rFJjVzEpCrVNbJz0AW/u0QzH+3je
	CP+6TiOljPDVjsPEakQlHX3eS2yH22rOLztPT7ePkgahTlqm0laL2pFr2Zd/eIPGogvu
	1GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KUC47vuyECrJO1usTLuCiCR7dm1n2qq4f69lXffwGX8=;
	b=ZN1Q1Q9n4G2u5/HBZxt+7G9LRWWLihkqdmBVjvImgrG9Alnr5fYlhAO1Sap/L4Xv/b
	tsnmJ5lQurKZS9nucZfjgYCjbGUROmENBi18aC1a+PnOczl+W3NPwSnJTJnnDuqIifx3
	2CmF6AvCJ+3vwA394HMbzK/5GqiILRQCryJvc9CnlG3ZDcdLaV7rWYt8xaLPaSUBOR20
	GhKBxel6uj2c2xQIPRrI7JBC2InPEow5wl+FEAOVIjRf09I/K5FLtKPy9okKtc05fXFb
	hWlNlAayPTJyYjsk9dL3KdBqeYZUexHHxOQnjBER9Bg3LASbDFjXaD7DEi5Vl2PUT9/+
	pkQw==
X-Gm-Message-State: AIVw113o0VuXkz3xVqCLb7ezXKW+WYqseapZB4uMcuadn0uLMfqrB/wv
	SMZGOnLX+5VtWu5sJdg=
X-Received: by 10.80.152.194 with SMTP id j60mr3130167edb.98.1499791528775;
	Tue, 11 Jul 2017 09:45:28 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.112]) by smtp.gmail.com with ESMTPSA id
	p19sm1224952eda.15.2017.07.11.09.45.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Jul 2017 09:45:28 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 18:44:37 +0200
Message-Id: <1499791478-2407-8-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
References: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe/meta-perl] [PATCH 7/8] libunicode-linebreak-perl: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jul 2017 16:45:28 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Unicode::LineBreak - UAX #14 Unicode Line Breaking Algorithm.

It's being strongly recommended by po4a.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../libunicode-linebreak-perl_2017.004.bb          | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2017.004.bb

diff --git a/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2017.004.bb b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2017.004.bb
new file mode 100644
index 0000000..5ccb411
--- /dev/null
+++ b/meta-perl/recipes-perl/libunicode/libunicode-linebreak-perl_2017.004.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Unicode::LineBreak - UAX #14 Unicode Line Breaking Algorithm."
+DESCRIPTION = "Unicode::LineBreak performs Line Breaking Algorithm described in Unicode \
+Standard Annex #14 [UAX #14]. East_Asian_Width informative property \
+defined by Annex #11 [UAX #11] will be concerned to determine breaking \
+positions."
+SECTION = "libs"
+
+HOMEPAGE = "http://search.cpan.org/~nezumi/Unicode-LineBreak-${PV}/"
+
+LICENSE = "Artistic-1.0 | GPLv1+"
+LIC_FILES_CHKSUM = "file://README;md5=77241abd74fec561b3f3de1b44c0241b"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/N/NE/NEZUMI/Unicode-LineBreak-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "de7672227922260ac92d20bbad29660b"
+SRC_URI[sha256sum] = "655bc3c4cb60ad0770d97816716cfe322f24e602c70e595f5941dfa02c40cb76"
+
+S = "${WORKDIR}/Unicode-LineBreak-${PV}"
+
+DEPENDS = "libsombok3 libmime-charset-perl"
+
+RDEPENDS_${PN} = "libsombok3 libmime-charset-perl"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


