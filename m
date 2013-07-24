Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 462656B340
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:14 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id q10so218605eaj.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=mWgTEwLA8e9l8siFCNE+IxON9OUKo6PHCr704cFRbr8=;
	b=IXas9yF3a48gS59hK+Oza4YNl3Lu4WHK59+gVmZo9Ls4MEaOTuWH7xBNaMt/gDD3/6
	8+t+IjdEdG25ECXq+5cpj/gXpjeVkrcFGYyza4pGYOBTwYO+jLs3kaoQujPaOuDyeRFn
	CSkG6pXwgakW5kfPGDgoHL3l76pqgVz4Qr9hdzrg/u1kCTzfE9dTG2VidJCW8PDgg9wn
	LRCPNT5IXTxdiDC9vS1B+L35HkkqiZ/qBY+mJwrfpQoxh/76PSKs99LnqawOMQeKaFA2
	EbN4Agpklt9bdL9r7SfE5Fl/W4DtClbS/6KgBSPwva5Cz8XcJMvq61CjgWEBInfOfQx4
	Eo+A==
X-Received: by 10.14.223.5 with SMTP id u5mr29305043eep.131.1374669674757;
	Wed, 24 Jul 2013 05:41:14 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm65833064eeh.15.2013.07.24.05.41.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:40:59 +0200
Message-Id: <8c11f02982a666a945338da744e23d38708b4b0a.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 15/29] usbmuxd: add PACKAGECONFIG for plist
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:14 -0000

* it's autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
index bb92941..595582a 100644
--- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
@@ -17,3 +17,5 @@ S = "${WORKDIR}/git"
 
 FILES_${PN} += "${base_libdir}/udev/rules.d/"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[plist] = "-DWANT_PLIST=1,-DWANT_PLIST=0,libplist"
-- 
1.8.3.2


