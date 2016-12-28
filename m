Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id F347B719DE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 13:20:17 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id d16so17623856lfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 05:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MrT/vrwrSX0VQBMjTF/Dcb8XGqgJTKaUuKbQBRZHegk=;
	b=GCucHIp1prhWaychFksUFBFlJBkXjHwa3T5rh3Kf7Pv1Rg8idEnlUP3J7fXDUs0t3/
	MLi+J5+HiHX4mEq3vtk+EPUqKm36OiXfg5Dg9sr0uXl4rZepDKjWSZeCwoFODU5uGGtt
	YmPpojdRPe5/08oYe5Wvdxh+lkirx6a6XplSxdXYeTrXWjI4K/meUXuX2MMEZhKQ1kj0
	uNwZL1Da+MLp5lKakZNxUSFnZiDRK7g1D3+nvz/lqadGM6f5lYJE4IUv/6t8vSa74N30
	qRMkO3xQY/XX2ZSZfroNznoA4FHcz8R9n6FOGvFmXQuYdLmae8QPTEaq6bb9A9cPuhv3
	vDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MrT/vrwrSX0VQBMjTF/Dcb8XGqgJTKaUuKbQBRZHegk=;
	b=SdHnrELwhGUwz+7o+E0xZLg/OXZCQRzpTMQu6fUSC3UoucnT7T7GD0GhJUtQ3DBuDn
	uoOytTHkRRYCCtwMKWCx5p82IV2EN4RvWGEufkD2Sadxc/hjbR0Fe/ZWnfMfKZQNQHkF
	YlSglQkiu2/h+iBG9IH5TdA/gbo7PtpZqXfikclQaFQwO7aMhH1+lQz8Srru88LLuw+6
	f2myzfkESmp9Vg8jOrdffXWIio6JV8VXPOPa5U5JBn9I+IKf4JcTxEG+Z1PWXk0yr2Iu
	ogQzS4AnSSnHZqV6+nmrOkYfkdRnZ5nXgF9dEMaTJf94tCOq6TDk5kq1at8EVdRyqvu8
	MQJw==
X-Gm-Message-State: AIkVDXIk4mJ6roL3YlCedB9BFcEbQVWaLlHZiTWGemjwq/rDHgoK9sjggC5PvM47q5wtXQ==
X-Received: by 10.25.196.88 with SMTP id u85mr13458873lff.69.1482931201709;
	Wed, 28 Dec 2016 05:20:01 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	137sm11902825lfz.2.2016.12.28.05.20.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Dec 2016 05:20:00 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: martin.jansa@gmail.com, raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 28 Dec 2016 14:19:54 +0100
Message-Id: <20161228131956.29551-2-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161228131956.29551-1-ricardo.ribalda@gmail.com>
References: <20161228131956.29551-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH 2/4] gflags: Update to 2.2.0
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
X-List-Received-Date: Wed, 28 Dec 2016 13:20:18 -0000

Need to unset REGISTER_INSTALL_PREFIX to avoid:

WARNING: gflags-2.2.0-r0 do_package: QA Issue: gflags: Files/directories
were installed but not shipped in any package:
  /home
  /home/ricardo
  /home/ricardo/.cmake
  /home/ricardo/.cmake/packages
  /home/ricardo/.cmake/packages/gflags
  /home/ricardo/.cmake/packages/gflags/a7fca4708532331c2d656af0fdc8b8b9
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/gflags/{gflags_2.1.2.bb => gflags_2.2.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/gflags/{gflags_2.1.2.bb => gflags_2.2.0.bb} (76%)

diff --git a/meta-oe/recipes-support/gflags/gflags_2.1.2.bb b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
similarity index 76%
rename from meta-oe/recipes-support/gflags/gflags_2.1.2.bb
rename to meta-oe/recipes-support/gflags/gflags_2.2.0.bb
index da82599c7f1c..b9188c3124db 100644
--- a/meta-oe/recipes-support/gflags/gflags_2.1.2.bb
+++ b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
@@ -6,15 +6,15 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
 
 SRC_URI = "https://github.com/gflags/gflags/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "ac432de923f9de1e9780b5254884599f"
-SRC_URI[sha256sum] = "d8331bd0f7367c8afd5fcb5f5e85e96868a00fd24b7276fa5fcee1e5575c2662"
+SRC_URI[md5sum] = "b99048d9ab82d8c56e876fb1456c285e"
+SRC_URI[sha256sum] = "466c36c6508a451734e4f4d76825cf9cd9b8716d2b70ef36479ae40f08271f88"
 S = "${WORKDIR}/${PN}-${PV}/"
 
 FILES_${PN}-dev += "${libdir}/cmake"
 
 inherit cmake
 
-EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON"
+EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF"
 
 PACKAGES =+ "${PN}-bash-completion"
 FILES_${PN}-bash-completion += "${bindir}/gflags_completions.sh"
-- 
2.11.0


