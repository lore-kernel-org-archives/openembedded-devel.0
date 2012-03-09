Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S5wyA-0004Gh-52
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 11:22:42 +0100
Received: by wgbdr12 with SMTP id dr12so1231220wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 02:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=pHhcCdYuZuJ20oaUHAHNNf/MqgbKhjdqLNb3v65yVeQ=;
	b=jryw5SZNtO6z7DrdsYz1SXv5taCJQi57S2kYzO9px6hPw1u3M/C6rQlsQqLaodiSPM
	AGw1mJ38rDONVjL9Ma0mVQfwYS2oD9d6rekce6VgW0juo9lzz9QrJ+jdo+jknKGSNK8L
	x6H0UONjvao2gSWeOlv8UHkU238EZ28ygUc+Z76PC62fgQDQQeeh96BmbhY9jk/6QCSK
	DjIQMFEfZpfFziCywWyBcyD1gFnSfcNNVi9uhIvaenAUXYYUH1gPMuOdgPzgNBaj7ii0
	u16fc+BjobeuLMNFHYUp3isuKjmy+lOwAie1DIs+vwaIMVee/O72tyT8/lO75MFquRjT
	1R0A==
Received: by 10.180.82.136 with SMTP id i8mr3252827wiy.19.1331288043249;
	Fri, 09 Mar 2012 02:14:03 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id bg3sm3899212wib.10.2012.03.09.02.14.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 02:14:02 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Mar 2012 11:13:55 +0100
Message-Id: <1331288035-9678-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1331288035-9678-1-git-send-email-schnitzeltony@googlemail.com>
References: <1331288035-9678-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 6/6] lighttpd: inherit systemd / remove unneded systemd code
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
X-List-Received-Date: Fri, 09 Mar 2012 10:22:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../lighttpd/lighttpd_1.4.30.bbappend              |   16 +++++-----------
 1 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
index b914405..5449b1a 100644
--- a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
+++ b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
@@ -1,16 +1,10 @@
 FILESEXTRAPATHS := "${THISDIR}/${PN}"
  
-PRINC = "1"
+PRINC = "2"
 
-SRC_URI += "file://lighttpd.service"
-
-do_install_append() {
-	install -d ${D}${base_libdir}/systemd/systemd/
-	install -m 0644 ${WORKDIR}/lighttpd.service ${D}${base_libdir}/systemd/systemd/
+inherit systemd
 
-	install -d ${D}${base_libdir}/systemd/systemd/multi-user.target.wants
-	ln -sf ../lighttpd.service ${D}${base_libdir}/systemd/systemd/multi-user.target.wants
-}
-
-FILES_${PN} += "${base_libdir}/systemd"
+SRC_URI += "file://lighttpd.service"
 
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "lighttpd.service"
-- 
1.7.6.4



