Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1F4FA6FF78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 08:48:33 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id q24so7371249lfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 May 2017 01:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=SUHmAB6R9eMaMoYjXDobajDoxt2hBnLuNf2riGp0Dy8=;
	b=FfW4AIuG5I5xcj/NeDLtnNRczP6cCFQBOHy4Y57YrtYtv3IbiapTfz0UC/T/bDUW/X
	H7kd+Eof9phtscM9P9p6UA1h2Er9CEC8m6UZLw+U5DMBwVQAtOnS2RMbiXmGdSFL6ukG
	qU4MSwiW0pfEP8gKP1AeJO0jB40qIaPnCEpklX7mEqebYe4s/eiL+peh2yoxI7Z5goVT
	h7G4sf+Ss1m4x/ToqzDMv+UkP32kwu0f8MFjVmImwLA1rPoKgpVoR/1+YBGCZoQ2pJnv
	HynTcrOVooQfL/kiWI+AjQ1KFqvml9R2dNyhKg/HTtK+4uF7moqQaBbYM1PtN7a7ZXxK
	bkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SUHmAB6R9eMaMoYjXDobajDoxt2hBnLuNf2riGp0Dy8=;
	b=SzJVUplBhQUzNT2JYAjxYyilCQboZB6YVToOL09zPzWo7x0KTn7hN/LkleqxVPDUpE
	oecFRHvKOaeO0yewhPVCcurCUFkoifHtqAihGvFaKpejbn7ArMnmMg8o9slQA8peHTX1
	O4Eu9dCjuXNkQ0HjlnYd8bRh/lg4DP5ZLXPO2hqoZZwFw67AB14b+vP7FHsa+bGG/bbu
	X7FQ/tcH4ONqW4P4/U4pbF35ucEMYfSBkDribUJKB/1YK49gOK5tgTRCSEtTY+aS2BfO
	lnKFDQ4nJETHEbNDrbhEssAPGNB+FnPYZKM7MWX/nnZZgw/xE770IylToGH7GEJFIgDe
	CdmQ==
X-Gm-Message-State: AODbwcAV3yTbYkZxwC0WDLYQ3Yqs9WfKs1r0bZujGkbICCRGPORVgr18
	zDCU4GmaO2x5jQ==
X-Received: by 10.25.23.210 with SMTP id 79mr7767544lfx.158.1495529314267;
	Tue, 23 May 2017 01:48:34 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id s26sm24117ljd.27.2017.05.23.01.48.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 May 2017 01:48:33 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, peter.kjellerstedt@axis.com,
	linussn@axis.com
Date: Tue, 23 May 2017 10:48:30 +0200
Message-Id: <20170523084831.12243-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH 1/2] meson: Suport for c++ cross-compilation
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
X-List-Received-Date: Tue, 23 May 2017 08:48:36 -0000

cpp_args and cpp_link_args must be set on the meson.cross file to
compile c++ applications. Otherwise variables such as the sysroot
are not set correctly and libraries/headers are not found.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/classes/meson.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index e27ed3906e41..c33174a21821 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -61,7 +61,9 @@ pkgconfig = 'pkg-config'
 
 [properties]
 c_args = [${@meson_array('MESON_C_ARGS', d)}]
+cpp_args = [${@meson_array('TOOLCHAIN_OPTIONS', d)}]
 c_link_args = [${@meson_array('TOOLCHAIN_OPTIONS', d)}]
+cpp_link_args = [${@meson_array('TOOLCHAIN_OPTIONS', d)}]
 
 [host_machine]
 system = '${HOST_OS}'
-- 
2.11.0


