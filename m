Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 24DAA770D8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2016 12:03:14 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x83so14966808wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Aug 2016 05:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ij307Wqfl0AFa39IWsEkfRBG3gK701AmcbGbZlIU970=;
	b=zpm+jcp89KuwiDRA+BQep9bmHSSICuVvNYEOwsdh91CDDRJ56RDMUTX4mX73BV5Ewv
	GJcwIV0Zu93nbMbUwFsRGhChWQLUaoGX9vcN/Y8TyWsBXoMbwEAGjZHtH3ANyHI5p1B2
	nU5tmdCNS6Xx4It8uRZKvQG7oMawSv6GiPCAgruCsowcu/umJo/mrnd8bGv82H73lwee
	/ay7LfhJhNyjppM3jgK/nctzNkS4jn12nmoKcMXaWbdylG6k1K5MZk5vbtqcgBxAXQl/
	6uikvRxLue73u9VKprO3cr8CkBoSf2P1AfWre7e1kwLzAkt+S6hc1vneFsnMvQ/C/YDM
	nmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ij307Wqfl0AFa39IWsEkfRBG3gK701AmcbGbZlIU970=;
	b=Qw3mADVxmRfBXkbMRJX2TKPoknMRveB8+g566H/7TJPoV0z0ezmB0UiR3NhzsxnSOy
	plk5NpZa1F5UsN9cE0XbZAyiNOZt7FKyloC2Cfh04MATPKrkIM6llBnRDzDmcSRLhoJN
	1PfRz6OzmQGq+iwKa+QLyKnpiH61MZY0lSx6R3ZcLus+dgplO5ACRgDyKQTM0nwKLNF2
	4QueLkd+I+pmyem37Rq4JjXMSov+XU07tZPyyLUAPfIkpCoTVzLIwUM2WUDHmdLhUJi7
	lXMwILrYbz0f8VLvF28XO5N9haweLvUSKWh66Qd19lprtHneWxqld5T/+G5Nwk6/cIwM
	Gjsw==
X-Gm-Message-State: AEkooutrxM+O0PEV3BZt09tbpPDKWUNfiulE85+eXVN7IoRADcTPYCCZgAs4SVrBqut6yg==
X-Received: by 10.194.15.130 with SMTP id x2mr84090627wjc.122.1470657795073;
	Mon, 08 Aug 2016 05:03:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	w129sm23396640wmd.9.2016.08.08.05.03.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Aug 2016 05:03:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Aug 2016 14:03:10 +0200
Message-Id: <20160808120310.22277-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160808115112.jhhfu6wqmwbv5qzh@jama>
References: <20160808115112.jhhfu6wqmwbv5qzh@jama>
Cc: "fan.xin" <fan.xin@jp.fujitsu.com>
Subject: [meta-oe][PATCH] qpdf: add new recipe
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
X-List-Received-Date: Mon, 08 Aug 2016 12:03:15 -0000

From: "fan.xin" <fan.xin@jp.fujitsu.com>

QPDF is a command-line program that does structural,
content-preserving transformation on PDF files.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/qpdf/qpdf_6.0.0.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-extended/qpdf/qpdf_6.0.0.bb

diff --git a/meta-oe/recipes-extended/qpdf/qpdf_6.0.0.bb b/meta-oe/recipes-extended/qpdf/qpdf_6.0.0.bb
new file mode 100644
index 0000000..cec1d5c
--- /dev/null
+++ b/meta-oe/recipes-extended/qpdf/qpdf_6.0.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "CLI for structural, content-preserving transformations on PDF files"
+DESCRIPTION = "QPDF is capable of creating linearized files and encrypted files. It is also capable of \
+converting PDF files with object streams to files with no compressed objects or to generate object streams \
+from files that don't have them. QPDF also supports a special mode designed to allow you to edit the content \
+of PDF files in a text editor."
+HOMEPAGE = "http://qpdf.sourceforge.net/"
+
+DEPENDS = "libpcre zlib"
+
+LICENSE = "Artistic-2.0"
+LIC_FILES_CHKSUM = "file://Artistic-2.0;md5=7806296b9fae874361e6fb10072b7ee3"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}.tar.gz"
+SRC_URI[md5sum] = "e014bd3ecf1c4d1a520bbc14d84ac20e"
+SRC_URI[sha256sum] = "a9fdc7e94d38fcd3831f37b6e0fe36492bf79aa6d54f8f66062cf7f9c4155233"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--with-random=/dev/urandom"
+
+do_configure_prepend() {
+    sh ${S}/autogen.sh
+}
-- 
2.9.2


