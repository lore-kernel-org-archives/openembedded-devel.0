Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id C3F7465CBF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2016 15:46:51 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l68so169726419wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2016 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OuqaNUc1tQuDxnDJAoP9PSzvPxU32fo+AKQpr8yQAro=;
	b=POCYJBMql0lnnf07nudvXbqVt/o899+yD2dHXdCB0nlOmsyZFjes0dbiNhtN3Vg5md
	eCGIRMpAfkwBOzsbCLrCOezHBUIwwLnPH+NHheBZGGHu9lGApRN/06v6jzQuA+YP9xSL
	P+MaZ87UtEBeSiC97Mx3yFq0pCpMUjDbW796LOnOdlfgoB4iGlOzgCAtEk6XUmy6cPjd
	DafgvECheW73OvPE4icYL4nc6pNM31hHAJbF2WkXzN1BT43KM+pnQYs034Zh/QNo5p6X
	wo3BFQdv+3EmC2vX4si0TRTZVEfMJMYzuHnxx7dvJNzk0Zx64GK9TVhrmYaUuFSpKgLx
	XMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OuqaNUc1tQuDxnDJAoP9PSzvPxU32fo+AKQpr8yQAro=;
	b=XI4LuNG3YSiMoADZy1Vh0yHZeNSFYsdkWA4x5hvPwxlLMHcFTHEysRFMymnT7wImaX
	IgF9eaoGtzzYYs6X+O/YkrQ95ZRo2Ls567W3dz83JMUz3n2Trb5B3TpnbSytHVqN7jQk
	Xlu6Dpsdlqh4Rf0YqeaS03NTfamacsI9/2jEGnNmL3mT5mlw4S6I5zQcXtz+jk6w+A9t
	OdPC5difAv8ciEYeFDuJTdlJNtTCVA+E1E1dLXl/5Lhl6a/rfVOkIMIAhxwcGjL+OMKM
	TPA52Vn9ilghYA92Jhq7Us/pwwv8IHG7ZLns4eSGdf1iyMvpZpRpmozCmKfsZUj+882W
	4PSQ==
X-Gm-Message-State: AD7BkJK3NajmUylTVV6i9J2N+QqykM1nvCxAufeV7+TmCE/4E9v7dRMCZ2jXzARiM/cskA==
X-Received: by 10.194.22.97 with SMTP id c1mr37230221wjf.19.1458661611092;
	Tue, 22 Mar 2016 08:46:51 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	g3sm30911365wjw.31.2016.03.22.08.46.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Mar 2016 08:46:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2016 16:49:13 +0100
Message-Id: <1458661753-21040-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH][meta-oe] ltp-ddt: blacklist
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
X-List-Received-Date: Tue, 22 Mar 2016 15:46:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
index d028e88..62117b1 100644
--- a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
+++ b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
@@ -92,3 +92,6 @@ do_install() {
 addtask make_scripts before do_compile
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 do_make_scripts[deptask] = "do_populate_sysroot"
+
+# http://errors.yoctoproject.org/Errors/Details/56327/
+PNBLACKLIST[ltp-ddt] ?= "BROKEN: fails since last autotools.bbclass changes"
-- 
2.7.3


