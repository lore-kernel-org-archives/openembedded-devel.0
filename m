Return-Path: <mickey.happygolucky@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 68F4070018
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 00:59:38 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id l82so1341400ywc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Aug 2017 17:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=arKW8gpYjBft+aqyTDI2F1HQtGzejWGKQ2GzSH6SVp0=;
	b=XIFKwCA2GGK0NciCF4Bzjk9sMgL5cW5x9e0EsGJcxdW+9QVAMg7GeaWe2qQYaYvAFy
	IzKty6xwv76aF9lGJ26j+NxEiD1dHYrj0NaSAiwYYzgXId6UE7bFs5kuYl1eh17WgN/w
	cvLOEjhk+R9uAPKSP5mju7JYW0spnWwtcXlDUmTm151hsXL5eLVQ9wXVyitAIQTffH4d
	M+bnNLvvKJzngsqJTGuOcpYoqQyst/g12hRRAuNCjFx8MKmLMNn76m1YRCxUcvRf+qJl
	hWUgxB/t6rEog2gqlW4MM/505Xc5be5kZ7fcax0Cka9xucRimrmNve7FWWrbPS26MZVq
	RIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=arKW8gpYjBft+aqyTDI2F1HQtGzejWGKQ2GzSH6SVp0=;
	b=Ugf1Q1Hxxd2sjtnNfEy377thvFLdO7OVFp2uVzhvskJcGilZY7/b+hE349PTY/xP3I
	JWI+h7YssfYehQE3ODzAX602KEkwJJhTNZ4CZeqoyEqBp/L9coVCst6Nop2pab3IRsZV
	S6QZ5xbFC+wfp0L64uKhFjl0KxN3tKCRZ18WGNpp+CqYJc542RyxAA23JYglLM1CLftc
	BtPQmGb3CqsVXVGrXTNC+sUmTOnE+3oaO09Msb8PKvJkAwRqvTVeCIDc76j0mlcIAVyu
	Iw0mGL8Ho7vv7TDpgdIl3HOQnJWyyjoYtJPri6fWjrAVs2uBrHo742LWz2l+Qv/uIWhG
	mT/g==
X-Gm-Message-State: AHYfb5jz2WvW48XKLFBmjlFm7T3SrT5jAGfTFURl8bw3+D+3SS8CfG3e
	3E6qXE4X7+3TnvkLx6k=
X-Received: by 10.84.214.23 with SMTP id h23mr2647903pli.321.1502153979369;
	Mon, 07 Aug 2017 17:59:39 -0700 (PDT)
Received: from localhost.localdomain
	([2400:2411:21c1:9d00:b8cb:4f3b:9c01:c505])
	by smtp.gmail.com with ESMTPSA id x25sm89484pfk.80.2017.08.07.17.59.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Aug 2017 17:59:39 -0700 (PDT)
From: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 09:59:14 +0900
Message-Id: <1502153954-2796-7-git-send-email-mickey.happygolucky@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
References: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
Subject: [PATCH 6/6] uim: Fixed a problem that an immodule.cache is not updated appropriately when uim-gtk2.0 or uim-gtk3 was installed.
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
X-List-Received-Date: Tue, 08 Aug 2017 00:59:38 -0000

pkg_postinst_uim-gtk2.0 is not worked. Plus, uim-gtk3 is not supported.
oe-core has gtk-immodule-cache class for update the immodule.cache.
Modified to use the this class instead of pkg_post_uim-gtk2.0 and added support to uim-gtk3.

Signed-off-by: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
---
 meta-oe/recipes-support/uim/uim_1.8.6.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
index 3d6425c..6b04f6e 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -21,7 +21,8 @@ RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0 glibc-utils glibc-gconv-euc-jp
 
 LEAD_SONAME = "libuim.so.1"
 
-inherit autotools pkgconfig gettext qemu
+inherit autotools pkgconfig gettext qemu gtk-immodules-cache
+GTKIMMODULES_PACKAGES = "uim-gtk2.0 uim-gtk3"
 
 EXTRA_OECONF += "--disable-emacs \
     --without-scim \
@@ -120,10 +121,6 @@ pkg_prerm_uim-anthy() {
     fi
 }
 
-pkg_postinst_uim-gtk2.0() {
-    gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
-}
-
 pkg_postinst_uim-skk() {
     if test -n "$D"; then
         ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --register skk --path $D${datadir}/uim
-- 
2.7.4


