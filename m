Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 81D06789F5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:31 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id 61-v6so636114plf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Re4TqT0IDoI3nwdrZm10B4RE2DcBRuYnuTXRzcsAtVM=;
	b=QaNKvTKDFQl7MFWBw/19snAOh0lw5rn6Ix1nl6NDCk+g/9eCz5QH695FOflLlKluhR
	gqCXM/mu9MuKr1IGbx7umW1NZK3a4ETvX28fBL9pv7Msaudv7iAp3APHXzvlaq1KhGHS
	6bXp08jzX2ZXeGY9A42vp1XCuDWI/RghdKLW8LG1stWaOJg9XrbBibXgEU+BjP8rWj1s
	K2a+EPPr7jKrCGcuBngRaxvSmAmdufcoZHxjGTSu0LNyhMMlHIMcla4s4sKDC5rIh2Rk
	eny7+nDWWAetBk8cXteXAcTZlslHM0PeoRIHw3tDq6xRRyfhGI0EdN7xG6IiHrkyc9aW
	cj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Re4TqT0IDoI3nwdrZm10B4RE2DcBRuYnuTXRzcsAtVM=;
	b=fO2QOCl3tbpZOHlg8nI6COd9s4qo8bfKWuI83ATIpZmHotRh5j7iCMs7W4JkUnK3Pc
	3ae6DNgPwBBAQzi1Zpv8m3mCmMgSGNXFh94xJuBzSIHsIsatJZJOtVMch2CEciS2FjCo
	2OJCp4w+thtbaLzqJEUgJrAq6DDh58JcsLykl+n6H0yLHFBAEDIusTVf+HCeqB8qb/Oo
	eFWpuPiXYT8bMH5Cu8SUSyKkrssIRJ76l6DjA7cgwZdQCbD+8PDhT8foy4Rf++kxlL3H
	s4epsd6Zhyw8fSYCBe9YGXNSbBxqeL+2YsjLo7CxBDBpJTmwkMfUypZuGl6+qJf4RFdq
	G+hA==
X-Gm-Message-State: APf1xPD2RcIEzPN/MhYyUbKM/whsj2jtkjNq2BkspGAXV6fknRt0KHQ4
	goy/XD8gsxAhl+8kFXIA32T3cw==
X-Google-Smtp-Source: AG47ELs4ODVIsagdvKfkM0VSxCw/mfZdDUiCLfAPOAoNX6Kh4pT+vpZE31aebZOzo6mcCflPju9fJA==
X-Received: by 2002:a17:902:2b84:: with SMTP id
	l4-v6mr19069186plb.338.1520395412725; 
	Tue, 06 Mar 2018 20:03:32 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:07 -0800
Message-Id: <1520395408-19266-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 04/25] fltk: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:31 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/fltk/fltk.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fltk/fltk.bb b/meta-oe/recipes-support/fltk/fltk.bb
index 6a3d1c9..0d3653b 100644
--- a/meta-oe/recipes-support/fltk/fltk.bb
+++ b/meta-oe/recipes-support/fltk/fltk.bb
@@ -2,7 +2,8 @@ require ${BPN}.inc
 
 DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
 
-inherit binconfig lib_package gtk-icon-cache mime
+inherit distro_features_check binconfig lib_package gtk-icon-cache mime
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0003-CMake-build-Force-shared-libs-with-unsuffixed-names.patch"
 
-- 
2.7.4


