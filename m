Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3954F779BD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 20:58:32 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id g2so9533381pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 12:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=LsMLCB64cYy7PG/o38LLg8Z9ZaZ8R00lnMsCheTKt6U=;
	b=h3xW+f16RJE+tixxgrgjvxrsuSSU2vo98cnTkSCvTXGWuQiBEELbLFoXBp9CU5IThB
	awEDFqQLzqrn4NswAPNRHFpqMpX2e9GU6CW5foYScRLFDWgCSikFj0lwy4EGcTGStX8U
	wp6ghlhrBke9uw59ELigt16SQdgbK+deqS63LBJz8Y42Xz3BvvnjhiJjpMhV8W+S7m6L
	twJ0hpcBW3BmDA9gA857grBsaHVXqyt+sKOyenCp/uiaet+YWq2xlT2MjHhbu1E0sn20
	EyI8P93OnVHYlg6kEJgwnBtiwTflg000i7zBkerbqExD0xeYi5MI15NUrLTZQ8LSBE7i
	ITYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=LsMLCB64cYy7PG/o38LLg8Z9ZaZ8R00lnMsCheTKt6U=;
	b=hkHV0QbhM9AmLCKuqBsieY88YCy0NsIdZS2GfJUw1WPFLk0bNG+CDbHWjfX/ho5BdG
	+VnJQUTMYyxVSjz6igdoKvC5B9zrB5XhGx/Fh+lwyvEp24YrJc79bXwBVmH7HAIJiE7G
	lMTJBNlxLTQHhKy4y+IMkelQpvWuwlC+i+Yk6RqK8/uHS1Eb3OOyJiSCsis/vFc8vgcZ
	zsRIcsFsrDZg4IfnxfIAvm56cjs95HvBsGbVnL84+j81LI+RbKMTVoWWbH5y4Zbf46hO
	/g3aonvq0LPn6Xz69oPu9GMEUiDpX0Os1QAROKYiXB2rzbTnYHyehkwVNfgB7H0OWZ3E
	V96w==
X-Gm-Message-State: AMke39ljl9wODjE+LxUHCYX+BjPYJgSxZoglN4Qzxun/V7Oxd2p8JoeOx8ntS+jps8k/sw==
X-Received: by 10.98.205.7 with SMTP id o7mr28700325pfg.171.1489265914196;
	Sat, 11 Mar 2017 12:58:34 -0800 (PST)
Received: from localhost.localdomain ([223.196.115.131])
	by smtp.gmail.com with ESMTPSA id
	y5sm25858639pgy.28.2017.03.11.12.58.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 11 Mar 2017 12:58:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Mar 2017 12:58:30 -0800
Message-Id: <1489265910-8255-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] lvm2: fix bash depends QA issue
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
X-List-Received-Date: Sat, 11 Mar 2017 20:58:33 -0000

WARNING: lvm2-2.02.166-r0 do_package_qa: QA Issue: /etc/init.d/lvm2-monitor contained in package lvm2 requires /bin/bash, but no providers found in RDEPENDS_lvm2? [file-rdeps]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index b25d775..3e79552 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -98,6 +98,7 @@ FILES_libdevmapper-dev = " \
 "
 
 RDEPENDS_${PN}-scripts = "${PN} (= ${EXTENDPKGV}) bash"
+RDEPENDS_${PN} = " bash"
 RDEPENDS_libdevmapper-dev = "libdevmapper (= ${EXTENDPKGV})"
 RRECOMMENDS_${PN} = "${PN}-scripts (= ${EXTENDPKGV})"
 
-- 
2.7.4


