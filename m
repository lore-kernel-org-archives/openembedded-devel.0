Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U52Dh-0007a6-EE
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Feb 2013 23:51:29 +0100
Received: by mail-ee0-f48.google.com with SMTP id t10so3360365eei.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2013 14:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=/iqOrVtO5tjfqsFmGReT5j+7ES6HcVx9BqHXSIpNAUo=;
	b=IwmvK/1UsrccSWlMDAfaGUyTdrNwgDvoWNDOkPW2cqEIB78jGV/c4FPRT3nDR6YNIZ
	OX4IqWpNK5y8DBEzvbY3ooBP+u2oZeyAjNhiLK6usVbhVq5UD/QaU5GvZajBOYk0RVUt
	KmW8vp0Y5tWsi9pTTQRzwRPbR2/41tBQ01I2keIyqyJohai+Cersg4TsjRuIJ1iUrttR
	wNoXvmCL/0NglvDna3g4RTT7VW2SrT+1eqlJCBwlxYLT8NrOfAFeidbfGTuuOm0jryke
	diRhxTxkUy2+MB2mDYdUcFFOq9nNvAmYgFOKTqxXTOwHnhVXuSdU1dTq+vCdGddtwM7i
	G6sw==
X-Received: by 10.14.224.137 with SMTP id x9mr55234692eep.11.1360622131181;
	Mon, 11 Feb 2013 14:35:31 -0800 (PST)
Received: from localhost.localdomain (p4FDF102E.dip.t-dialin.net.
	[79.223.16.46])
	by mx.google.com with ESMTPS id q5sm64887228eep.11.2013.02.11.14.35.29
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 14:35:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Feb 2013 23:35:09 +0100
Message-Id: <1360622110-15419-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1360622110-15419-1-git-send-email-schnitzeltony@googlemail.com>
References: <1360622110-15419-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: =?UTF-8?B?W21ldGEtb2UgMi8zXSB1cGRhdGUtZm9udHMuYmJjbGFzczogcmVtb3ZlIC0gd2Ugbm93IHVzZSBvZS1jb3JlJ3MgZm9udGNhY2hlLmJiY2xhc3MgU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBNw7xsbGVyIDxzY2huaXR6ZWx0b255QGdvb2dsZW1haWwuY29tPg==?=
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
X-List-Received-Date: Mon, 11 Feb 2013 22:51:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

---
 meta-oe/classes/update-fonts.bbclass |   40 ----------------------------------
 1 files changed, 0 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/classes/update-fonts.bbclass

diff --git a/meta-oe/classes/update-fonts.bbclass b/meta-oe/classes/update-fonts.bbclass
deleted file mode 100644
index db2e814..0000000
--- a/meta-oe/classes/update-fonts.bbclass
+++ /dev/null
@@ -1,40 +0,0 @@
-
-update_fonts_postinst() {
-    if [ -z "$D" ]; then
-        update-fonts
-    fi
-}
-
-# the same but keep it separate for now
-update_fonts_postrm() {
-    if [ -z "$D" ]; then
-        update-fonts
-    fi
-}
-
-python populate_packages_append () {
-    update_fonts_pkgs = d.getVar('UPDATE_FONTS_PACKAGES', True).split()
-
-    for pkg in update_fonts_pkgs:
-        postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
-        if not postinst:
-            postinst = '#!/bin/sh\n'
-        postinst += d.getVar('update_fonts_postinst', True)
-        d.setVar('pkg_postinst_%s' % pkg, postinst)
-
-        postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
-        if not postrm:
-            postrm = '#!/bin/sh\n'
-        postrm += d.getVar('update_fonts_postrm', True)
-        d.setVar('pkg_postrm_%s' % pkg, postrm)
-
-        d.appendVar('RDEPENDS_%s' % pkg, ' font-update-common')
-}
-
-python __anonymous() {
-    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
-        updatefonts_check = d.getVar('UPDATE_FONTS_PACKAGES')
-        if not updatefonts_check:
-            bb_filename = d.getVar('FILE')
-            raise bb.build.FuncFailed, "\n\n\nERROR: %s inherits update-fonts but doesn't set UPDATE_FONTS_PACKAGES" % bb_filename
-}
-- 
1.7.4.4



