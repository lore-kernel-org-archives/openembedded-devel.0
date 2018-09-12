Return-Path: <3u4OZWwgJAAwmn3q45uo8mAy0.o0y@flex--abrestic.bounces.google.com>
Received: from mail-vk1-f202.google.com (mail-vk1-f202.google.com
	[209.85.221.202])
	by mail.openembedded.org (Postfix) with ESMTP id 1B012796FB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 21:23:06 +0000 (UTC)
Received: by mail-vk1-f202.google.com with SMTP id d189-v6so263843vka.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 14:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=Qht5j2mVl+E2y08DgO3PhR7n55yuAdrsd84C7fpUb7s=;
	b=MFj4d51OW7H3NLcxXHpXuqZ/m4uraamqq2LbomQKYXaw9DcM17UbsmxTjvVAOI2Hcz
	sc8kBRYzKjrbFbziguoFb5GNHOOC2oU/b8+xsCm3uVfuzrpXA/UmKJkE0snrGbRFhuEi
	F46mN9UfyeYsWX9r9qfAjwKhodlMQANoEBeDtriYJsdrRsS4DET7jYicbhfLPZDxKO+1
	1ZR+N/B7tn92PztLzOByLwUwLBD9I80o+BnQcc7zQrHI1qEbUiiArENiDmgAMzCY0o92
	xOLA7rgW2af5ZupjD77vRIAqvN8w+j4UMFE9/n1fti70U5ABPQnIKb3BD3xhBo22UbNf
	chrQ==
X-Gm-Message-State: APzg51BODsNuCRyHDq5QoxDiqf4rHqLVeyqiGQmRBIs5RvSH2Kn6qTKW
	Em+M2D5355fY96U4bMUz6IoP52N5GugqS2K4AbQ7QI7mlRrtbLO0YpJNbaYydRCb5D5Iwc9DO8F
	S/O60NXxu+cwveDpATVGxFRPW/5W3HxnGleNLLRovdVnOyDuih9HEA0GBD3ScAXV+lhYnAtSd3l
	kvT5+Tc57MWequSQ==
X-Google-Smtp-Source: ANB0VdauoKOsOBoLla2GZVcBlDecRvErPK3bmgmpzgFEcvnHe3zG+OHNA12wNBC6m3EaB7MuN72v1/OrLrjB2g==
X-Received: by 2002:a67:37cc:: with SMTP id j73-v6mr711712vsi.29.1536787387786;
	Wed, 12 Sep 2018 14:23:07 -0700 (PDT)
Date: Wed, 12 Sep 2018 14:22:55 -0700
Message-Id: <20180912212255.194513-1-abrestic@waymo.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.19.0.rc2.392.g5ba43deb5a-goog
From: Andrew Bresticker <abrestic@waymo.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libdevmapper: Install dmsetup
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
X-List-Received-Date: Wed, 12 Sep 2018 21:23:07 -0000
Content-Type: text/plain; charset="UTF-8"

Commit 6aa1dd223a140 ("lvm2/libdevmapper: fix invoking lvcreate failed")
accidentally removed installation of dmsetup as part of the libdevmapper
recipe. Add it back by explicitly installing it in do_install().

Signed-off-by: Andrew Bresticker <abrestic@waymo.com>
---
 meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
index f3f11ef64..26af3275d 100644
--- a/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
+++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.02.180.bb
@@ -9,6 +9,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' -C libdm install
+    oe_runmake 'DESTDIR=${D}' -C tools install_device-mapper
 }
 
 RRECOMMENDS_${PN}_append_class-target = " lvm2-udevrules"
-- 
2.19.0.rc2.392.g5ba43deb5a-goog


