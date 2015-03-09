Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7668673996
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2015 19:21:22 +0000 (UTC)
Received: by qgdz60 with SMTP id z60so31129473qgd.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2015 12:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=cxf9ZMmpRAaBOQ48/0gRDeqbmhxoqOA1r42E+Tcr7j8=;
	b=i3P8LU1WsAuD8Ov65TAudc+SPK4XWltqYimFXQisb2IKf9wRK9JjnHG6xcPCfc/moq
	g7fBwJS2RetnnagFMMPOWusYuJCwhWzPdVLmqbLr2a1CsxFIRS+f9lKcyjyhMQKNY4Hy
	YOJ/oU9sB1QHOljqWMwckXGdj45i3pWKe595GuIlW8ARG8Gjvrwogb248n9NKiHZTk9l
	12sgbfzcyId7yzZ2ppTpBXm26eDOkMklebLELqrEy5dCvelDWRaUT2IhsZ1amCXT/x+m
	7grYnrQtPNzmoR4nupEaSHmM0ypIXgCBS5mytfUdsqhcRrI5z64giVa6koSCrjgvYxDX
	tVGQ==
X-Received: by 10.140.27.129 with SMTP id 1mr35907600qgx.64.1425928884083;
	Mon, 09 Mar 2015 12:21:24 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-10-241.ronkva.east.verizon.net.
	[71.171.10.241])
	by mx.google.com with ESMTPSA id 22sm12141195qgj.49.2015.03.09.12.21.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Mar 2015 12:21:20 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Mar 2015 15:21:14 -0400
Message-Id: <1425928875-29697-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH 1/2] sip: Split python into a new package for runtime support.
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
X-List-Received-Date: Mon, 09 Mar 2015 19:21:25 -0000

The package is named python-sip for backwards compatibility.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-extended/sip/sip_4.16.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sip/sip_4.16.4.bb b/meta-oe/recipes-extended/sip/sip_4.16.4.bb
index 607ace6..780ccdc 100644
--- a/meta-oe/recipes-extended/sip/sip_4.16.4.bb
+++ b/meta-oe/recipes-extended/sip/sip_4.16.4.bb
@@ -14,6 +14,8 @@ SRC_URI[sha256sum] = "ceda443fc5e129e67a067e2cd7b73ff037f8b10b50e407baa2b1d9f219
 
 BBCLASSEXTEND = "native"
 
+PACKAGES += "python-sip"
+
 inherit qmake2 python-dir pythonnative distro_features_check
 # depends on qt4-x11-free
 REQUIRED_DISTRO_FEATURES = "x11"
@@ -47,6 +49,6 @@ do_install() {
     oe_runmake install
 }
 
-FILES_${PN} += "${libdir}/${PYTHON_DIR}/site-packages/"
+FILES_python-${PN} = "${libdir}/${PYTHON_DIR}/site-packages/"
 FILES_${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug"
 
-- 
2.1.0


