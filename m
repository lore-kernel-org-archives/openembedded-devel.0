Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id AADE171AAD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 03:57:48 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y68so1705997pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Oct 2016 20:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=kbT/ekFvPv+iblBXUOyjMFOf/FCf9AGumcubmGuz3mo=;
	b=vjwkrL9679fyFehY09Qm3aI2EDs5XBSFfjuFIL3sub/+0NaUX3ZY5ppQZs0mlzbmOO
	ZWZCWA4Ao48DFDLHYd5UNOFFbZUoVRpGNexidRMq0DXJfPaaWlWH6IESm8jDGz0DgGl6
	3NLcC1aLchL8iceZkZiJDVX3rMw5n+X7pAna/G9/Dfl3Es4fIjTTqrj1lS4P09KOS9lL
	LDWjHUI65vc525geM0KIBB94SA0htWoW9NlBEAKatmac62oqP/oDwUWj4LvLhyzWojTg
	rEoTQDApcF73ndb2BQpzrswoMGzrJjcaFR3zJ/tgE1S/F1zSWzFBCi73kwgL2/hdouWA
	fqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kbT/ekFvPv+iblBXUOyjMFOf/FCf9AGumcubmGuz3mo=;
	b=Eq6k2wNqrRWbiyDICLR7CY2rvjDlhF1ri/wEr/unQLjHhoLhkft+t6RFRziaKZOXxq
	cyPZ4rUph16MI7LBQ4WALQNoF4hflDVetuTpd7nHZgMWZdzVCdwGxjf28y3/to4FD28K
	IYVEiA8B3QsZWv9IgVsSgwP7CfKfelFMMWt9CkV7vcM4HGytCtMZmRBP3ctIIVeEuIXG
	oTsCjO0RB/L77ZEGRAzzoPPj+XL5EePchA4tLTrCig4ht4Ni5JtYvOy+thzMCplQvx5M
	kYZqagZTRyyIdo4Kj9ZbknNa+xHrms1zShHCj8royOLVqGljQC1QD+fN3fgTvidqhxRX
	QBsA==
X-Gm-Message-State: ABUngvd7lLGqO7SKTP+tc67LunXqwLQK6UX40fkgBvOHOt/FzCvPBO2WchYK/jRYXfR3Ig==
X-Received: by 10.99.173.75 with SMTP id y11mr38396103pgo.130.1477886268607;
	Sun, 30 Oct 2016 20:57:48 -0700 (PDT)
Received: from akuster-ThinkPad-X240.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:a515:1856:7377:d74f])
	by smtp.gmail.com with ESMTPSA id e6sm32775402pad.0.2016.10.30.20.57.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 30 Oct 2016 20:57:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun, 30 Oct 2016 20:57:46 -0700
Message-Id: <1477886266-2836-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][V2]PATCH] wireshark: install missing header files
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
X-List-Received-Date: Mon, 31 Oct 2016 03:57:48 -0000

Wireshark does not install header files. add install_append
Remove ALLOW_EMPTY & INHIBIT_PACKAGE_DEBUG_SPLIT, they are no longer needed

V2]
add missing libssh and sbc config

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/wireshark/wireshark_2.2.1.bb   | 28 ++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
index a5fb7f6..4e23bae 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
@@ -4,7 +4,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://README.linux;md5=631e077455b7972172eb149195e065b0"
 
-DEPENDS = "pcre expat glib-2.0 sbc"
+DEPENDS = "pcre expat glib-2.0"
 
 SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
@@ -37,13 +37,33 @@ PACKAGECONFIG[lua] = "--with-lua=yes, --with-lua=no, lua"
 PACKAGECONFIG[zlib] = "--with-zlib=yes, --with-zlib=no, zlib"
 PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
 PACKAGECONFIG[plugins] = "--with-plugins=yes, --with-plugins=no"
+PACKAGECONFIG[sbc] = "--with-sbc=yes, --with-sbc=no, sbc"
+
+PACKAGECONFIG[libssh] = "--with-ssh=yes, --with-ssh=no, libssh2"
+
 
 # these next two options require addional layers
 PACKAGECONFIG[c-ares] = "--with-c-ares=yes, --with-c-ares=no, c-ares"
 
 EXTRA_OECONF += "--with-qt=no --enable-tshark --enable-rawshark"
 
-ALLOW_EMPTY_${PN} = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+# Currently wireshark does not install header files
+do_install_append () {
+
+	install -d ${D}/${includedir}/${BPN}
+	install -d ${D}/${includedir}/${BPN}/epan
+	install -d ${D}/${includedir}/${BPN}/epan/crypt
+	install -d ${D}/${includedir}/${BPN}/epan/dfilter
+	install -d ${D}/${includedir}/${BPN}/epan/dissectors
+	install -d ${D}/${includedir}/${BPN}/epan/ftypes
+	install -d ${D}/${includedir}/${BPN}/epan/wmem
 
-FILES_${PN} += "${datadir}*"
+	install config.h ${D}/${includedir}/${BPN}
+	install ${S}/register.h ${D}/${includedir}/${BPN}
+	install -D ${S}/epan/*.h ${D}/${includedir}/${BPN}/epan
+	install -D ${S}/epan/crypt/*.h ${D}/${includedir}/${BPN}/epan/crypt
+	install -D ${S}/epan/dfilter/*.h ${D}/${includedir}/${BPN}/epan/dfilter
+	install -D ${S}/epan/dissectors/*.h ${D}/${includedir}/${BPN}/epan/dissectors
+	install -D ${S}/epan/ftypes/*.h ${D}/${includedir}/${BPN}/epan/ftypes
+	install -D ${S}/epan/wmem/*.h ${D}/${includedir}/${BPN}/epan/wmem
+}
-- 
2.7.4


