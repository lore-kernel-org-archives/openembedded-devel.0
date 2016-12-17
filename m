Return-Path: <joe@deserted.net>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8FCB67743E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 16:04:52 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id c20so5890375itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 08:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NOeTkDu/uHIzxIezb6Zre+RmMLXuyFCSj51yDY5Cq70=;
	b=pJ++eCbUPnccu2bgNg2QGBCPZPhlbRFzVw30GEeCY8V/wmwmLl49WSO0aVWW8ha9ZG
	mALp5ebQ+tlHXHAc+iFQb/UNT3BPQ6pLjUncqn8pIrD+Ev67w0hHageoLDdiAlT3TT0Y
	hE/8VAuQS6tb1PWfuVp+pmQn8baqJMpgNH2hI7r3Kd7y008NI70tXmXYJNMqsMtSYQD8
	gj5Wbf8pQcQRUOAT6ZOisNT5RF9TyljMJV4H2SzTOlM/znxdZXBshGIr+hoHgjLkESab
	n/WaQjJD2EO6wo4XI9rKaLfemPJAuBCA8eBildBP88YXbe3nXhOgZWkl4PjRXmOuS1fz
	/L/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=NOeTkDu/uHIzxIezb6Zre+RmMLXuyFCSj51yDY5Cq70=;
	b=si5jwmmeTqzdm6tkWotEAU+GsGlTvsTUiWVVw4uT72wFJrGQHKyDc/CMcxSEI6o/0C
	kXnFcfB4BOXVHuFkKgwkOAgEMlro76GjSII7Wc3fIYwFGYLjLvM6tYWjMhDu3dJYZB8h
	kA5j4hU+WgBLSv5sxMp+UQRNwnr+hT5qYGDFunFx6Amsa/UHP+OjPBseIrn+gRloZuuy
	7Il645kii12WKxP4C+ksNEh6QXnazuHdabWnpmWPQ7/q9phCNSsFIFh1pYxb6s/bqipR
	ScKt4h8MPR9k93zt2wRPMcLjPPHxGM0GftqqBemmHudApI57DBA3QXWN85+/PVeVKrat
	aRHg==
X-Gm-Message-State: AKaTC016hxajO5Ii7UK/GeSDf0/+r2N5fAcQhMUc59VLutTJNRLoVODoHRbp1bvJgaYC4g==
X-Received: by 10.36.85.5 with SMTP id e5mr8460252itb.42.1481990694427;
	Sat, 17 Dec 2016 08:04:54 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	c36sm3371303itd.18.2016.12.17.08.04.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Dec 2016 08:04:53 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Dec 2016 11:04:55 -0500
Message-Id: <1481990698-15962-8-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
	<1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 07/10] samba: add packages samba-dsdb-modules, samba-testsuite and registry-tools
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
X-List-Received-Date: Sat, 17 Dec 2016 16:04:53 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Inspired by Debian.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index c4b6298..b8d7141 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -154,6 +154,7 @@ do_install_append() {
 }
 
 PACKAGES =+ "${PN}-python ${PN}-pidl \
+             ${PN}-dsdb-modules ${PN}-testsuite registry-tools \
              winbind \
              ${PN}-common ${PN}-base ${PN}-ctdb-tests \
              smbclient"
@@ -210,6 +211,19 @@ FILES_${PN} += "${libdir}/vfs/*.so \
                 ${libdir}/auth/*.so \
 "
 
+FILES_${PN}-dsdb-modules = "${libdir}/samba/ldb"
+
+FILES_${PN}-testsuite = "${bindir}/gentest \
+                         ${bindir}/locktest \
+                         ${bindir}/masktest \
+                         ${bindir}/ndrdump \
+                         ${bindir}/smbtorture"
+
+FILES_registry-tools = "${bindir}/regdiff \
+                        ${bindir}/regpatch \
+                        ${bindir}/regshell \
+                        ${bindir}/regtree"
+
 FILES_winbind = "${sbindir}/winbindd \
                  ${bindir}/wbinfo \
                  ${bindir}/ntlm_auth \
-- 
1.9.1


