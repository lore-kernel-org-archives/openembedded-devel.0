Return-Path: <joe@deserted.net>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id DACC573731
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 15:41:48 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id h15so36417813igd.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2015 07:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=P+TdFUvbfRt+BUAX9/Cely9Jv14UBgQo9llGxFKwydw=;
	b=a+a+WABrsLrGha9K9wlXmvVzhcNfhQXVnK68VnRyQFRcCs+WD6haSJEhxwjv2uPWuW
	HbPAnQSGYgojBMyDSSPxSVabXBTcpYDdM2Gq4dLpbK7dlr6p5/57K51x262pkPNLnEpo
	jkBaKgetm7c27Cy0CPqvYJmt7lcVquYKHG0GwwW8RjC6ZdfFtWTkPC8wdS7oPxJB4NbF
	UyEqXiL7TdR1mGW0dhkuOE13yY5Q3Fu8bTSeqIkHZptmToFFSm6OKb9IuMIzKys/Mkhv
	hi8gxCAqkCNEivbm8/GaneZgZ8XEBxLdcTGaJ2RgZ6tKij9i/ws1t+eqkPzUNOvOnHYQ
	x2Jg==
X-Gm-Message-State: ALoCoQnCPMSOGjQkWyeFT9MI8d6n83YRkPI+YW98ALdgp8+UOWHqF7ObBWGRTU5VI6DUok68wuFG
X-Received: by 10.107.47.90 with SMTP id j87mr5051523ioo.33.1424878909602;
	Wed, 25 Feb 2015 07:41:49 -0800 (PST)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250]) by mx.google.com with ESMTPSA id
	184sm16360487ion.14.2015.02.25.07.41.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Feb 2015 07:41:48 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Feb 2015 10:42:47 -0500
Message-Id: <1424878967-17755-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] ptpd: use pkgconfig
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
X-List-Received-Date: Wed, 25 Feb 2015 15:41:50 -0000

pcap-config should not be used for determining how to build against
libpcap in a yocto environment.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---

ptpd will still fail to build unless libpcap has a suitable pkgconfig entry, but
at least one option for providing such is under discussion now, so this will
make things no worse in the short term and will automagically repair things in
the long term.

-J.

 .../ptpd/ptpd/ptpd-use-pkgconfig.patch             | 35 ++++++++++++++++++++++
 .../recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb         |  3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/ptpd/ptpd/ptpd-use-pkgconfig.patch

diff --git a/meta-networking/recipes-daemons/ptpd/ptpd/ptpd-use-pkgconfig.patch b/meta-networking/recipes-daemons/ptpd/ptpd/ptpd-use-pkgconfig.patch
new file mode 100644
index 0000000..e4578dd
--- /dev/null
+++ b/meta-networking/recipes-daemons/ptpd/ptpd/ptpd-use-pkgconfig.patch
@@ -0,0 +1,35 @@
+From 4c850b92a1cf8cfa19677c66bcde2edfab1a4490 Mon Sep 17 00:00:00 2001
+From: Joe MacDonald <joe_macdonald@mentor.com>
+Date: Tue, 24 Feb 2015 23:02:14 -0500
+Subject: [PATCH] ptpd: use pkgconfig
+
+Yocto uses pkg-config for libpcap, rather than pcap-config, so use that
+instead as the source for libs and cflags.
+
+Upstream-status: Inappropriate [ embedded specific ]
+
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index dc9541f..288f547 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -112,10 +112,10 @@ case "$try_pcap" in
+  yes)
+     case "$PATH_PCAP_CONFIG" in
+      /*)
+-	PCAP_LIBS=`$PATH_PCAP_CONFIG --libs`
++	PCAP_LIBS=`$PATH_PCAP_CONFIG --libs libpcap`
+ 	AC_SUBST([PCAP_LIBS])
+ 	# Separate CPPFLAGS and CFLAGS
+-	foo=`$PATH_PCAP_CONFIG --cflags`
++	foo=`$PATH_PCAP_CONFIG --cflags libpcap`
+ 	PCAP_CPPFLAGS=
+ 	PCAP_CFLAGS=
+ 	for i in $foo; do
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
index 50cdc7f..0dcfc1f 100644
--- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1-rc2.bb
@@ -23,6 +23,7 @@ def get_sub(d):
 
 SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${@get_sub(d)}/ptpd-${PV}.tar.gz \
            file://ptpd-add-dpaa-etsec-support.patch \
+           file://ptpd-use-pkgconfig.patch \
            file://ptpd.service \
            file://ptpd.conf \
 "
@@ -34,7 +35,7 @@ S = "${WORKDIR}/ptpd-${PV}"
 
 EXTRA_OEMAKE = ""
 
-EXTRA_OECONF += "--disable-snmp"
+EXTRA_OECONF += "--disable-snmp --with-pcap-config=pkg-config"
 
 do_install() {
     install -d ${D}${bindir} ${D}${mandir}/man8
-- 
1.9.1


