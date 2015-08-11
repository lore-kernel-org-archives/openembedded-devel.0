Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id B7A0B76932
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:58:23 +0000 (UTC)
Received: by wibhh20 with SMTP id hh20so182966218wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=ZO+HsnT/lFi/yCyKKvWloS1ifTy3w3UkNQnh/CbXSlM=;
	b=wFLEoe3a8Q80FECcWLgu/QDCI8Vzclm/hjVTCqt7LGki5AQaKGeyfTj8w1nlmL8Zo9
	hNFYENpaw3/GGF0PSbTyoQMn3vX7RwM/99tCT3fMqJVDw1cmTqCcczB+F1O8NwReNTUY
	hchIUozxnj6kg072b5HoMwwO2TgQuDVx2qSJ9iGUJAUDFegMXS0Nd8qZ0WOKz00xT8KZ
	BmDXAs1kceUWnulEIYx5p6Bp6e5DVquueek8CJca5csIg9ZDHcE2dRaNy7kxfWKQd1GV
	wy52nsnXiv++3SQpG/z2lI+wKHmmhKYW6jKOSKH/FcJti6fR08IIE4Q/n8svBtB6aAga
	QirQ==
X-Received: by 10.194.78.143 with SMTP id b15mr58853449wjx.88.1439279903375;
	Tue, 11 Aug 2015 00:58:23 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-29.hsi12.unitymediagroup.de. [109.91.251.29])
	by smtp.googlemail.com with ESMTPSA id
	fs8sm2124773wib.0.2015.08.11.00.58.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 00:58:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:57:35 +0200
Message-Id: <1439279859-1815-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 13/17] rodent-icon-theme: initial add 5.0
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
X-List-Received-Date: Tue, 11 Aug 2015 07:58:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

note that ${SOURCEFORGE_MIRROR} in SRC_URI did not work

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb    | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb

diff --git a/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb b/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb
new file mode 100644
index 0000000..130e032
--- /dev/null
+++ b/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Rodent-icon-theme (was xfce4-icon-theme) is a svg icon theme"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+inherit allarch autotools gtk-icon-cache
+
+SRC_URI = "http://sourceforge.net/projects/xffm/files/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "4b097d344a160d6497c6498985c8df15"
+SRC_URI[sha256sum] = "6ed00d16faa1f55b3bb7b13862de1d7f5cfd978b93e42487ded21595d0dbe208"
+
+FILES_${PN} += "${datadir}/icons"
-- 
2.1.0


