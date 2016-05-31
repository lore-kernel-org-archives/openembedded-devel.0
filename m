Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9A2697716F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 19:15:33 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q62so108780wmg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2016 12:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iphPgkmM2DYw4b24ULTQ452lluvFkYMMw0g2pqaxx+U=;
	b=pUvr3TDcPNjRgktlK9Qrm7eMN8pqHgsRaKom/gZ3DHk0G+qmOrNTNbuW1uW6GWWyOK
	KS2TVi4dFMqpjsHOOVHF9EIeVf7A7u8jzmaoCzFnLkFk+n+jyOXt98Vh82zgnc+ZoLEh
	SbqChn/PA+ZW/WCCj0OxSgiQ3iq5QsuFLF1Jz1OcZfZ7Rc4jHcm38dwksDOSEEijsyKX
	yCnwVgCzZ7luVuO+0ExH3saR7+hjmyLcDJl/xBH7vQ3v5/zhoDEJRvKgFBA+qdUiFGD1
	fILHWaNrKkYiKTka385RfHG10UEX4mTUHuEAulVDENXUB6qyE0QhjlMLnpRj8z6jQ671
	7H6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iphPgkmM2DYw4b24ULTQ452lluvFkYMMw0g2pqaxx+U=;
	b=SJjTOTU5Uo+SPdGtrKf1kcThTzNKW1Oe7DW2Msl7ISLmDEtNWPKHgAGFMUxE4PUlUm
	PJp0estYR18C4gK8HcOsBr7QkrvQsgGMVB/orveegazpFWs1OhlYHqas+qhNHD6UQhO1
	r7qvi4sbhK2DP+hpCLkz+3JBEAs5eb7vFq2rFY9Dct4APx2tK4YvQNiagfiORQPXQlnF
	XIJpNouSjVOpw34TKslkm5E4xzEGHRzE83mJX+IvaMdABbsyEVYPVurBA1in732Y9qJl
	nG9A+SrYSm+KyQfIGFjXql/qmKmWYFFttMUT6Sas2kcEcFsiZthAYQ60CQefag675sTK
	eB5Q==
X-Gm-Message-State: ALyK8tLQlpkgGDQk6es4LK/QWJ6wOew6T8i6XLW1LCdo2v6kj4axmFoPTxM+In6tHrEyiw==
X-Received: by 10.28.96.10 with SMTP id u10mr18860718wmb.93.1464722133656;
	Tue, 31 May 2016 12:15:33 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	b207sm30887444wmb.0.2016.05.31.12.15.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 May 2016 12:15:31 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 May 2016 12:15:20 -0700
Message-Id: <1464722120-6702-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH] plymouth: allow disabling the dracut dep
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
X-List-Received-Date: Tue, 31 May 2016 19:15:35 -0000

From: Christopher Larson <chris_larson@mentor.com>

Add a 'initrd' PACKAGECONFIG to disable emission of the plymouth-initrd
package which includes initramfs files for use by dracut. Disabling this will
avoid the runtime dependency on dracut, which is useful if one doesn't need or
want dracut and doesn't want to pull in meta-initramfs.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
index 9ca8502..922e96b 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
@@ -37,6 +37,8 @@ PACKAGECONFIG_append_x86-64 = " drm"
 
 inherit autotools pkgconfig systemd
 
+PACKAGECONFIG = "initrd"
+PACKAGECONFIG[initrd] = ",,,"
 
 do_install_append() {
 	install -d ${D}${systemd_unitdir}/system
@@ -44,9 +46,14 @@ do_install_append() {
 	install -m 644 ${B}/systemd-units/systemd-ask-password-plymouth.path ${D}${systemd_unitdir}/system
 	# Remove /var/run from package as plymouth will populate it on startup
 	rm -fr "${D}${localstatedir}/run"
+
+	if ! ${@bb.utils.contains('PACKAGECONFIG', 'initrd', 'true', 'false', d)}; then
+		rm -rf "${D}${libexecdir}"
+	fi
 }
 
-PACKAGES =+ "${PN}-initrd ${PN}-set-default-theme"
+PACKAGES =. "${@bb.utils.contains('PACKAGECONFIG', 'initrd', '${PN}-initrd ', '', d)}"
+PACKAGES =+ "${PN}-set-default-theme"
 
 FILES_${PN}-initrd = "${libexecdir}/plymouth/*"
 FILES_${PN}-set-default-theme = "${sbindir}/plymouth-set-default-theme"
-- 
2.8.0


