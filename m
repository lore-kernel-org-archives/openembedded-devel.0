Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id B7FBE7716F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 10:38:42 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id a4so64240885wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 02:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cIPsqIYxDVbbwScXAfV9Qol92DLHUaYfVmvXy1noOI8=;
	b=yhVzvbZ1tmWYDYnsE1JaYE+NpIdx1fQmlg8jvLmZzO8I6yPTxLwh1QWczcSpfZt+Bq
	o7FT528gvc6GPXTCli452KQ1LjuXG2kggJ0BuXQJD/PyNlGteE4uP1eJHAjCm1Hp1FHn
	829fVJINgb4WnQX20VKlysTGgZqlJclVtj5dclW3rIWPR0OW+48iuNPfVSPbOa5AtOyL
	+z7gXjrvUQaKaXvxm7v/Fjic5/RoBCd/fYtFtcueqvXgEIEnmU/w07YOhZdMLVSx5qjI
	CxLA903B2tUFoxuxQ+BKTXPdjJvhKaC73K4iqW943rsu735V78tqUTa8ue41+xL5KbrT
	DYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cIPsqIYxDVbbwScXAfV9Qol92DLHUaYfVmvXy1noOI8=;
	b=Td7U4n1/qgLr6YTE65rcGgQ0SxiLeQi9lETFP62z9sO6M3kcpPsege+OJtiEk59vOw
	JCQ+uJ4N46CZz5bRSHSKTcoA7YSvHzPmXyHQ2wuIJJBphlyStyjjOHOsIduzBH4Ai7LN
	+56ec0LMdc+bx45CdSVIywyYyQ3ZiL0TlPe47eekLq37QGKtTmmYJv5ohMT9ydGAC0zF
	oFHaoHz8a+IG/oKRkH96wocoLGpwSRqdztCtDRXI1PdnvcXjtUFzeMjgQ4uejGdn4wOH
	vq4lW7sPUK99b9FF8SbdCZK4Yf4F9CLdJoVbrOSRh/INVC2b8phbQxnvpCpRlXlCAcMv
	ddUQ==
X-Gm-Message-State: AD7BkJImmnoWoAe88hP/F2NdD4TapYsDBixJQCt6SHBRv2zFqI4496pUPPYGrSPvJqzIAg==
X-Received: by 10.28.173.143 with SMTP id w137mr2514148wme.101.1456483122947; 
	Fri, 26 Feb 2016 02:38:42 -0800 (PST)
Received: from localhost.localdomain (p4FDF16E9.dip0.t-ipconnect.de.
	[79.223.22.233]) by smtp.googlemail.com with ESMTPSA id
	h132sm2291087wmf.9.2016.02.26.02.38.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Feb 2016 02:38:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Feb 2016 11:38:26 +0100
Message-Id: <1456483106-16282-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] plymouth: fix empty plymouth-initrd after oe-core's libexec path transition
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
X-List-Received-Date: Fri, 26 Feb 2016 10:38:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
index 1fb4443..9ca8502 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
@@ -48,7 +48,7 @@ do_install_append() {
 
 PACKAGES =+ "${PN}-initrd ${PN}-set-default-theme"
 
-FILES_${PN}-initrd = "${libdir}/plymouth/plymouth/*"
+FILES_${PN}-initrd = "${libexecdir}/plymouth/*"
 FILES_${PN}-set-default-theme = "${sbindir}/plymouth-set-default-theme"
 
 FILES_${PN} += "${systemd_unitdir}/system/*"
-- 
2.5.0


