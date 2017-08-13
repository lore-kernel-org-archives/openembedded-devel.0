Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 098EB78399
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Aug 2017 16:24:20 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id l64so6868682pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Aug 2017 09:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=CZuw/9q/HVp9pqUxM/S5XoqTx9oiQjH4Y092bHQQGI0=;
	b=uZf+peGVUHcAMMiWNb9q/aNha2dp8I0Hcf+zDORb+ySVwfG/P+AsiHnM+8Q3Pk2GZK
	ouUK3gwOIoEUFqolfznEhP7yUqTMkzrnzOuLC5mO2BSVLLTx8NTPDd/XmXgSZlZfeXsB
	N34foOmXuX/gLQKSpkBBxFHlrhu334qe99EkfGS5gaKbCNmWyKCcd+i34DMaN/Rw6I4C
	iYnHYAy67rkfevD68mIzK8lZM2i3XAsr3kbPhPycfCtwdmKGl6+5lc763tmb2T8CJSAM
	rJmx9dmFgPLtiWThD3TzblRo9+7wMSSYVa1oVNcDOlWQNaIYEOD40TXk/kBdEq2wBoa4
	4/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=CZuw/9q/HVp9pqUxM/S5XoqTx9oiQjH4Y092bHQQGI0=;
	b=F/9lOKcrg5tO0SH4bOZhsWV83jeYF1F1U5y6xToWVpSKCHGXJAYsihMBoH65bnlK24
	fKopNPX4E1ijVIwO/yd2zyF31mXyTjnWUpHrye7Ktktg1wGjRQq4CbfVadKejrd7Qb8Z
	96seLmb2M151Fo0IWJwxvtfet0kITclhWBwNJSc5X6iaXfo+U7WAvwdjrXhCku6hJv+b
	3oiEgDH5ReH5meiQfkXACcqAcBkRP2tt5h34QZRRXErLvshLiVaWZ7GTiLjBWxf1Ed/X
	/6hFzgiXgEy4N4RAdEnR1f+zAMWOqD0ma12GMLXufCvk6WrmxKWRAfZvdR+r2wDPmhHG
	G8Lw==
X-Gm-Message-State: AHYfb5i3drAk/tqJtX/EDweWGt/QZq8AdllNW43oX9Afu51GxZeyD3Ye
	GcdmZ21sG1cbtg==
X-Received: by 10.84.194.228 with SMTP id h91mr24642819pld.46.1502641462137;
	Sun, 13 Aug 2017 09:24:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:ac0b:7f59:5551:152b])
	by smtp.gmail.com with ESMTPSA id
	g1sm10009925pfk.92.2017.08.13.09.24.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Aug 2017 09:24:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun, 13 Aug 2017 09:24:19 -0700
Message-Id: <1502641460-4734-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][master][pyro] 1/2] libmtp: fix build issue
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
X-List-Received-Date: Sun, 13 Aug 2017 16:24:21 -0000

DEBUG: Executing shell function BUILDSPEC
| error: line 109: %package -n mtp-tools: package mtp-tools already exists

Yes, there are two entries in libmtp.spec. Under packages-split, mtp-tools is empty but
libmtp-bin is not.

Removed PKG_${PN}-bin , this alignes how Debian split its packages

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
index b5df8e0..c05ff4e 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
@@ -50,9 +50,6 @@ PACKAGES =+ "libmtp-common libmtp-runtime mtp-tools"
 RDEPENDS_${PN} += "libmtp-common"
 RRECOMMENDS_${PN} += "libmtp-runtime mtp-tools"
 FILES_${PN}-dbg += "${nonarch_base_libdir}/udev/.debug/*"
-PKG_${PN}-bin = "mtp-tools"
-SUMMARY_${PN}-bin = "Tools for communicating with MTP devices"
-DESCRIPTION_${PN}-bin = "${DESCRIPTION}\nThis package contains tools for communicating with MTP devices."
 FILES_libmtp-common = "${nonarch_base_libdir}/udev/rules.d/*"
 SUMMARY_libmtp-common = "The udev rules file for MTP devices"
 FILES_libmtp-runtime = "${nonarch_base_libdir}/udev/mtp-probe"
-- 
2.7.4


