Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 728186ADA3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2013 13:29:09 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id ey16so1467540wid.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2013 06:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=oBKN3xu5EkMRKA6mT7IXOpUnCS0baf7rmx8adM1JtSc=;
	b=nIINA4QcRmLlyO0K8n+EuKwCCDnOpqpgd4+f/LdK6QhUNSnDfZqPXUKhNMNBxT+qM0
	HQlzxq2Sb72ZqpmBC1OZhTI+T6qRzPOTAuYn4D/H1h9uCj+Hn0CO2wVFRaFvhGQH2KYN
	QQ7Fr0ZhVeb+HMdpSQ/0leYvhYsfVSJUI+Rv2GtVXjLCKQHML3l3Hj1yXIIU+yvun6n/
	R3hydp17ybIx+Al9K8nEY5HzRrTOrumy7iHr6hsvSOuiE8jBvL3ZdDbpvp8Os1OSEKQj
	vkOB7/ESud9v4bBZZ+w23wzfJvCCOhFm3Gd90N5z9GiH1/AUVfyAcWOZSHS+mUHV4E+b
	VkAw==
X-Received: by 10.180.187.234 with SMTP id fv10mr1637253wic.29.1371907750061; 
	Sat, 22 Jun 2013 06:29:10 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id nj19sm4038847wic.1.2013.06.22.06.29.08
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 22 Jun 2013 06:29:09 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jun 2013 14:28:39 +0100
Message-Id: <1371907719-8868-7-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1371907719-8868-1-git-send-email-paul@paulbarker.me.uk>
References: <1371907719-8868-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-oe, meta-multimedia, meta-efl][PATCH RFC 6/6] enjoy: replace ENTERPRISE_DISTRO with PACKAGECONFIG options
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
X-List-Received-Date: Sat, 22 Jun 2013 13:29:09 -0000

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-efl/recipes-efl/e17/enjoy_svn.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb
index bdbe471..2e1a8a2 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
@@ -1,11 +1,10 @@
 DESCRIPTION = "Enjoy music player"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-DEPENDS = "evas ecore edje elementary emotion lightmediascanner edbus2"
+DEPENDS = "evas ecore edje elementary emotion lightmediascanner edbus2 gst-plugins-good"
 SRCREV = "${EFL_SRCREV}"
 PV = "0.0+svnr${SRCPV}"
 
-DEPENDS += "gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly', d)}"
 
 #1st needed for all formats
 #2nd needed for mp3 playback
@@ -14,7 +13,6 @@ DEPENDS += "gst-plugins-good ${@base_conditional('ENTERPRISE_DISTRO', '1', '', '
 #5th needed binary to create db
 RDEPENDS_${PN} += "\
        gst-plugins-base-typefindfunctions gst-plugins-base-playbin gst-plugins-base-volume gst-plugins-base-decodebin2 gst-plugins-good-autodetect \
-       ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'gst-plugins-ugly-mad gst-plugins-good-id3demux', d)} \
        gst-plugins-base-ogg gst-plugins-base-ivorbisdec \
        gst-plugins-good-flac \
        lightmediascanner-test \
@@ -35,6 +33,9 @@ EXTRA_OECONF = "\
     --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
 "
 
+PACKAGECONFIG[mad] = ",,gst-plugins-ugly,gst-plugins-ugly-mad"
+PACKAGECONFIG[id3demux] = ",,,gst-plugins-good-id3demux"
+
 do_configure_prepend() {
     autopoint || touch config.rpath
 }
-- 
1.8.3.1


