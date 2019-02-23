Return-Path: <tuanhoanganh.dev@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id E5EE67CC0B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Feb 2019 04:25:04 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id n74so1989075pfi.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 20:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JrVaK9AMhZoxjujVTMFiH5taLbDVmGnVbbqlRFnqkxQ=;
	b=RGniKuKk/RJmN77xYC1FYvhXZovP0uUxRQL2LT8R62xdUVEIxLWJTBiPg3GnFaAlzp
	QoQqFekialJg5X6Z4hB8RqQQWBLWePB3pLT4If7WAWJLzQs770Rf9TdFqUQ+NZohvzwj
	pq9ucXUI3SGn3ycNdzLEmP2TW21SQDPmoAaw57iQj2VtMCaKN1hCkSWJ8TomxlB2po4k
	AgxPSVquC6O3xm60DAXBa/2w5L/y1ikm1VHLshrzktNkFEwINzK7FJ/jFJg8HIL5XPDL
	tnaM1vKksT9j2QzqO1CMNQF6GHll11VzrsKXxLUESydLovCgZ0l45EMlxw3MGds/4AJU
	/BhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JrVaK9AMhZoxjujVTMFiH5taLbDVmGnVbbqlRFnqkxQ=;
	b=WUpRun+zyZwoGz79aAC4FJ5ffel0DfhGS4NGpxaPeRWIZiboW1lOboy7p2Oibhg2QH
	/a1n3KjpXRqwKObyrPcjBXxTKBg00hf6glo2d9jrUNUW54C8RaPIPDC5yfHvDXQD6SRA
	0KuUHrLnks6+1edt7mzA70uExxfqxza9HSsMla3meCyi0SVqYpMXTocWah2yMG0T+TJl
	CNfchD2FN8/PlghsbD2TqqFIGGMPMnCkHYhKYXgdcmt7uG4cMkAOjM7r3XqqW0o9Bbsd
	pHI2ZiQ/pgMSMwrghQXI0GBY3ynD+YYwZcxGF9b7u7v7NSdIapfGRRtPnx8a7TqxHFIv
	4AFw==
X-Gm-Message-State: AHQUAuZUfbzHEg8wx0PxzZvWlEHHRem+29AXvuzqb4ld6RTOJ2VHNx27
	JL+6A6ClmtL79jnNopHWuLkyPA3X3wU=
X-Google-Smtp-Source: AHgI3IZ9J9k/mU0c8JhfIRgE35nK//NELkjYZeglnTUNsqJfZ4CqitQ2rYw7nm9oSz0/v+7WATUx6A==
X-Received: by 2002:a63:1a03:: with SMTP id a3mr7304129pga.192.1550895905865; 
	Fri, 22 Feb 2019 20:25:05 -0800 (PST)
Received: from localhost.localdomain ([123.16.252.182])
	by smtp.gmail.com with ESMTPSA id
	k74sm7128249pfb.172.2019.02.22.20.25.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 20:25:05 -0800 (PST)
From: Hoang Anh Tuan <tuanhoanganh.dev@gmail.com>
X-Google-Original-From: Hoang Anh Tuan <tuanha@viosoft.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Feb 2019 11:24:52 +0700
Message-Id: <20190223042452.8704-2-tuanha@viosoft.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190223042452.8704-1-tuanha@viosoft.com>
References: <20190223042452.8704-1-tuanha@viosoft.com>
Subject: [meta-oe][PATCH 2/2] gtkwave: add version 3.3.98
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
X-List-Received-Date: Sat, 23 Feb 2019 04:25:05 -0000

Signed-off-by: Hoang Anh Tuan <tuanha@viosoft.com>
---
 .../gtkwave/gtkwave_3.3.98.bb                 | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
new file mode 100644
index 000000000..60df6f773
--- /dev/null
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
@@ -0,0 +1,19 @@
+SUMMARY = "VCD (Value Change Dump) file waveform viewer"
+DESCRIPTION = "gtkwave is a viewer for VCD (Value Change Dump) files which are usually created by digital circuit simulators. (These files have no connection to video CDs!) "
+HOMEPAGE = "http://gtkwave.sourceforge.net/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
+
+SRC_URI = "http://gtkwave.sourceforge.net/${PN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "eac3073ef381e0c09da33590296ca37f"
+SRC_URI[sha256sum] = "efa6bbbeb3bd54104425a69a2aa0d079bb5c3ecc1c420ba57dcaa1c97c5a22f6"
+
+inherit pkgconfig autotools gettext texinfo
+DEPENDS = "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf glib-2.0"
+RDEPENDS_${PN} = "tk-lib"
+
+EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS} --with-tk=${STAGING_BINDIR_CROSS}"
+
+FILES_${PN} = "${bindir} ${datadir}"
-- 
2.17.1


