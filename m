Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id CB0E07F98F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 23:12:46 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b6so13819950wrq.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 15:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Fv5I2GB5lnMXhQaITACbXOjD1wH200O+AXOpn6G0N0w=;
	b=nFSB/vQ6oS9IXbmi9ypCQ6UwRIPs2Obrqai8AHo6D1hXnT/SrPg4r0Ua2nl/JjsKNn
	6n78YvPf6cCLzK+ze6Ox9z/ll4E3KYEV3I40JiD0jTc1t75n39jGuDOuS7li2+zawvvC
	OSVtFvnXIGcw6115/4FN5nwtvjttJRA5oRnr9dc5krnDJ/WTXkHDLWD/NhC76bDaDngO
	o1U/ywq9aYkEYJyD6AWQo+l0Mcpj0RH4cS6iWdcYtHVSetmJBimdL/8ts40FuSpkaw6e
	6H3fc/kiD+AGjsRHt11WsBGcQ8oPy23ig+ZnPw1EvSjKoCee2uXxs/KGJx3Jr8YWQQF1
	3jGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Fv5I2GB5lnMXhQaITACbXOjD1wH200O+AXOpn6G0N0w=;
	b=DRBw8kmLMTL7cPPoiGu2/xy7VUSukLU8V1g7SjPP7pAI5grImyUZvUwdzs16lqZumm
	65dZ3jX4wgqICR9DxUhSu1OyS388ak2w9Rrjiey/QTExxVUyCpsBygITQZWgqCZG6jlY
	Emyq6XOhXIwC6chgisnLcTipCxV/5wP2mK2X4p/qMN5u3ZIzMdYAA67F8+cWUO+7RNi8
	tcvT6qSv/oP4yW3ZZqpx7RI5mdpW0V0kBLGOnI1WfifB2nSV/mJNVWcgvSoeRvLU1gYj
	EMeeCSrSdXh8MyKStF3dcl1L4JyqxvboVhXCWFCrLC+kh/o55Oe0/njWfRfPgCgyU/nc
	fzBw==
X-Gm-Message-State: APjAAAVb382lX7Hi/VVJfkm3BnCXLetmPjMv/znLqNMvdcGvaOWGtusi
	Xz5NGvFVSTM0wpFj8fAMtK+CTlrdTGA=
X-Google-Smtp-Source: APXvYqz9pYb5PpXlprXSvnQbp2sALGCzcLZHc0/pD81RdeHfsezC7mqVMZQDff0RxfWAt5qXkBhGDA==
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr24064515wrs.113.1580166767348; 
	Mon, 27 Jan 2020 15:12:47 -0800 (PST)
Received: from lab-linux-pc.tendawifi.com (cable-static2-2-7.rsnweb.ch.
	[146.185.2.7]) by smtp.gmail.com with ESMTPSA id
	g2sm22252592wrw.76.2020.01.27.15.12.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 15:12:47 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jan 2020 23:12:34 +0000
Message-Id: <20200127231234.26090-1-andrey.z@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python2][PATCH] dnssec-conf: move recipe from oe-core to meta-python2
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
X-List-Received-Date: Mon, 27 Jan 2020 23:12:47 -0000

dnssec-conf did not receive any updates since 2010 and relies heavily on
python2 code base.

Move recipe to this layer, since python2 support has been dropped in
oe-core.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 .../dnssec-conf/dnssec-conf_2.02.bb           | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 recipes-support/dnssec-conf/dnssec-conf_2.02.bb

diff --git a/recipes-support/dnssec-conf/dnssec-conf_2.02.bb b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
new file mode 100644
index 0000000..ca59bd2
--- /dev/null
+++ b/recipes-support/dnssec-conf/dnssec-conf_2.02.bb
@@ -0,0 +1,35 @@
+SUMMARY = "DNSSEC and DLV configuration and priming tool"
+DESCRIPTION = "\
+DNSSEC configuration and priming tool. Keys are required until the root \
+is signed, as well as for local unpublished DNSSEC keys to be preloaded \
+into the recursive nameserver. These DNSSEC configuration files can be \
+directly included in the bind or unbound nameserver configuration files. \
+dnssec-conf includes a commandline configuration client for Bind and \
+Unbound, known DNSSEC keys, URL's to official publication pages of keys, \
+and harvested keys, as well a script to harvest DNSKEY's from DNS. \
+See also: system-config-dnssec"
+HOMEPAGE = "https://github.com/xelerance/dnssec-conf"
+SECTION = "net"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0636e73ff0215e8d672dc4c32c317bb3"
+DEPENDS += "xmlto-native docbook-xml-dtd4-native \
+            docbook-xsl-stylesheets-native libxslt-native"
+
+SRC_URI = "git://github.com/xelerance/dnssec-conf.git"
+SRCREV = "8e799683736b4a7b5e5e78f98fba0a6f48393537"
+
+S = "${WORKDIR}/git"
+
+do_install () {
+    rm -rf ${D}
+    make PREFIX=${prefix} DESTDIR=${D} ETCDIR=${D}${sysconfdir} install
+    # We no longer ship trust anchors. Most of these are in the DLV Registry now.
+    # and it prevents the problem of shipping outdated trust anchors.
+    # For DLV, we ship the ISC DLV Registry key
+    rm -rf ${D}${sysconfdir}/pki/dnssec-keys/harvest/*
+    rm -rf ${D}${sysconfdir}/pki/dnssec-keys/production/reverse/*
+    install -d -m 0755 ${D}${sysconfdir}/sysconfig
+    install -m 0644 packaging/fedora/dnssec.sysconfig ${D}${sysconfdir}/sysconfig/dnssec
+}
+
+RDEPENDS_${PN} = "python"
-- 
2.17.1


