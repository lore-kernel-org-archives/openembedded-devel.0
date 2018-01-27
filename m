Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 808FA78855
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:43 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a88so1444938pfe.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=er/EyKpDG+atcSJj+WYr0LhGZci6Bf85vH9mWUWA3Aw=;
	b=hMGTpRwEhk28xsyuEC/FViDclA4IrsHRTFyRJnesuuUN303OqwDPgAWG7if4oLgbur
	qcGPHlzrCT3XLhWFLFpHzfKiAb1Fci/raHnSRejxyOwMgf273upd88LTClf7SEsi5zgy
	f6fK/EHLUPXDSdWTbKcKa56gD5COtiAjVQupPITXIlIIYun85wAAj/7zCI6uJBjpgDZu
	LzmZl3SF+8D93JvrXIZadT56dxY/AqVnz+Ix0MCpdVfj5vnH7D/6Vgt90VAAf/rrSF7E
	6g0uQiDVi6OZa0MSjE4biogkJvpRTKwnbv0znAfhKi+4yXLEDuLuI/WggNDgDtG/G2zt
	EiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=er/EyKpDG+atcSJj+WYr0LhGZci6Bf85vH9mWUWA3Aw=;
	b=dP+jw4a5YxSdjjie0KDjKsB2KHk4NI9OG5gmNrIu6NcSjSbi4N2DnqtafY4N+qHH5B
	GqKwHlxyf21WyFzP+PNEokCyHXJHf1X0u7ntdxZmgXNUcA4mjAeq4UEq/W0YMmtpTTQt
	TJstp/A9YcdBorvquCLd2evL/JHerHm04PODUejPhLMZ12XwL5GuGN9o5vO5uCucDPk9
	JDJRZpm58Ac8RENC+nr+UiPKdcnsd5GvJYhzLeklabCYkG3RMfc8t5hBdj5sIVHL0Mj1
	bTyfzZE1+bXvpT/Y1Ev37G0Nm0Is0tq+4R+AvJez0yFVGKmN1iTH+jDQqGcdgq/x1MQs
	6i4w==
X-Gm-Message-State: AKwxyteD4QxvDF0wQ+EAmZFXyLoKtvMP1UpXq+q+Otd8JJTRXBdFIRsp
	3xqf52cf8qwPIwWaHhGv7tA=
X-Google-Smtp-Source: AH8x224zcTDRHvtO7swnir273nvN5qZvOPX03RXPr3x8ru/3THZBg82rVy3welhloghl15PxzuHtPA==
X-Received: by 10.98.150.213 with SMTP id s82mr21126950pfk.10.1517023485207;
	Fri, 26 Jan 2018 19:24:45 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:04 -0800
Message-Id: <2a5d1690ae0ff48b0fcb504c241dff9a12f6c3b1.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 04/36] libreport: fix Nothing RPROVIDES 'lib32-python3-libreport'
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:43 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

While multilib enabled, if other recipe RDEPENDS python3-libreport,
it failed with:
...
ERROR: Nothing RPROVIDES 'lib32-python3-libreport'
...

Do not use python3-${PN} could fix the issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
(cherry picked from commit 5d6d21e98ed594809169d2b2f6964e90a3369a96)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/libreport/libreport_2.9.2.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb b/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
index 2fdfd7d..525437b 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
@@ -26,7 +26,7 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 
 inherit gettext autotools python3native pkgconfig
 
-RDEPENDS_${PN}-python3 += "${PN}"
+RDEPENDS_python3-libreport += "${PN}"
 
 do_patch[prefuncs] += "do_gen_version"
 do_gen_version() {
@@ -34,9 +34,9 @@ do_gen_version() {
     ./gen-version
 }
 
-PACKAGES += "python3-${PN}"
+PACKAGES += "python3-libreport"
 
 FILES_${PN} += "${datadir}/*"
 FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug"
-FILES_python3-${PN} = "${PYTHON_SITEPACKAGES_DIR}/*"
+FILES_python3-libreport = "${PYTHON_SITEPACKAGES_DIR}/*"
 
-- 
2.7.4


