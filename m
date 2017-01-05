Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C716671A92
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 17:11:44 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l2so72337469wml.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2017 09:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Oqu9uFuEg4Kwhj1bI4SxBVs7VUxVPvO52atVCYNLdqE=;
	b=KM7tXAE3skLbFVgyXFcyDG4JpduWlukogtWv1u/yZFGTNxN2AGbrTMAKVzMZZSeCNq
	2c7wV9Bgv8wyIAA7hlussBk0FeWVKHLls1kpAFsCaBnc22BsoWHztFxbQbjqHFhIYhI4
	V9fC9CwP2hmqxLnkhsrckpJXeAIyCZ4Y81osJdAjJKqdPWjXRwnAeIQVppu3mFEaBiV2
	clL5LSR7fWS9bF9ZNKeTEbVreaRvrSGrJ5OqpSCD3CV888NKveKV1LCY0umQN9CFzp0B
	+zbFLpMAbDkAGIxT2kfAKTAcOjMtBgPtFrKgX638QcTpUYF0zhO1YcagsDt06SMH3PCn
	lttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Oqu9uFuEg4Kwhj1bI4SxBVs7VUxVPvO52atVCYNLdqE=;
	b=VgSiur0I27iq3G40+UhRMHzTt2bvaktSWfvEZZHRT8wAx4ZuaNO6acyjLVebRxYjtj
	4a1H3N5tBIe6AZs00yksG5IbP3gVxpvT0YNajWomrc1cwJlekkGN6anbfW1HcfPyJPW7
	+aXVwtRVi0ykGaftMAstW5JsTlhRrQhEknhKQk/1YQLhfUODUvWOxGpKZ3HbPb+uyoyg
	rg14KoM/Z/nrCgiK/vNBQW1TLCUFqkT4weje1dHzdkVyew5ZhBFvSx/iG4+Z+uwdUyMn
	z3WVAseCXHIywlQ4S+JjZKfhDzG29Lev7ccop4v7sEWhDXRYClICio+r7GHueCOQ4zXJ
	bkKQ==
X-Gm-Message-State: AIkVDXKF3uAN7oNU9psGJmQXGearVoxnmosGTs0ctsWDRslv3laJJBm24idgp4JeT9u9Pw==
X-Received: by 10.28.8.202 with SMTP id 193mr58893241wmi.101.1483636304497;
	Thu, 05 Jan 2017 09:11:44 -0800 (PST)
Received: from localhost.localdomain (p579F79CC.dip0.t-ipconnect.de.
	[87.159.121.204]) by smtp.googlemail.com with ESMTPSA id
	81sm101153107wmw.7.2017.01.05.09.11.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jan 2017 09:11:43 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2017 18:11:21 +0100
Message-Id: <1483636284-6351-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1483636284-6351-1-git-send-email-schnitzeltony@googlemail.com>
References: <1483636284-6351-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/8] pangomm: update 2.36.0 -> 2.40.1
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
X-List-Received-Date: Thu, 05 Jan 2017 17:11:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-graphics/pango/{pangomm_2.36.0.bb => pangomm_2.40.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/pango/{pangomm_2.36.0.bb => pangomm_2.40.1.bb} (81%)

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.36.0.bb b/meta-oe/recipes-graphics/pango/pangomm_2.40.1.bb
similarity index 81%
rename from meta-oe/recipes-graphics/pango/pangomm_2.36.0.bb
rename to meta-oe/recipes-graphics/pango/pangomm_2.40.1.bb
index f738153..7ff7b20 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.36.0.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.40.1.bb
@@ -9,8 +9,8 @@ DEPENDS = "mm-common cairomm glibmm pango"
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/pangomm/${SHRT_VER}/pangomm-${PV}.tar.xz"
-SRC_URI[md5sum] = "62910723211d86ab825b666b479871c9"
-SRC_URI[sha256sum] = "a8d96952c708d7726bed260d693cece554f8f00e48b97cccfbf4f5690b6821f0"
+SRC_URI[md5sum] = "874eadd9434613dbacf0272c82c3ac23"
+SRC_URI[sha256sum] = "9762ee2a2d5781be6797448d4dd2383ce14907159b30bc12bf6b08e7227be3af"
 
 inherit autotools pkgconfig
 
-- 
2.5.5


